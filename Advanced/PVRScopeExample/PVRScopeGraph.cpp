/******************************************************************************

 @File         PVRScopeGraph.cpp

 @Title        

 @Version      

 @Copyright    Copyright (c) Imagination Technologies Limited.

 @Platform     

 @Description  

******************************************************************************/
#include "PVRScope.h"
#include "PVRScopeGraph.h"
#include <math.h>
#include <string.h>
/****************************************************************************
** Defines
****************************************************************************/

/****************************************************************************
** Structures
****************************************************************************/

/****************************************************************************
** Constants
****************************************************************************/

/****************************************************************************
** Code
****************************************************************************/
CPVRScopeGraph::CPVRScopeGraph()
{
	m_fPixelW = 0.0f;
	m_fGraphH = 0.0f;
	m_nActiveGroup = (unsigned int)0-2;
	m_nActiveGroupSelect = 0;
	m_nCounterNum  = 0;
	m_bActiveGroupChanged = true;
	m_pGraphCounters = 0;

	m_nUpdateInterval = 0;
	m_nUpdateIntervalCounter = 0;

	const EPVRScopeInitCode ePVRScopeInitCode = PVRScopeInitialise(&m_pPVRScopeData);
	if(ePVRScopeInitCodeOk != ePVRScopeInitCode)
	{
		m_pPVRScopeData = 0;
	}

	if(m_pPVRScopeData)
	{
		PVRScopeGetCounters(m_pPVRScopeData, &m_nCounterNum, &m_pCounters, &m_sReading);
		m_pPVRScopeAPIData = APIInit();

		if(!m_pPVRScopeAPIData)
		{
			PVRScopeDeInitialise(&m_pPVRScopeData, &m_pCounters, &m_sReading);
			return;
		}

		m_pGraphCounters = new SPVRGraphCounter[m_nCounterNum];

		position(320, 240, 0, 0, 320, 240);
	}
}

CPVRScopeGraph::~CPVRScopeGraph()
{
	if(m_pPVRScopeData)
	{
		APIShutdown(&m_pPVRScopeAPIData);

		PVRScopeDeInitialise(&m_pPVRScopeData, &m_pCounters, &m_sReading);
	}

	if(m_pGraphCounters)
	{
		for(unsigned int i = 0; i < m_nCounterNum; ++i)
			delete[] m_pGraphCounters[i].pfValueCB;

		delete[] m_pGraphCounters;
		m_pGraphCounters = 0;
	}
}

void CPVRScopeGraph::Ping(const unsigned int nTimeUS)
{
	if(m_pPVRScopeData)
	{
		unsigned int nGroupSelect;
		unsigned int i;
		unsigned int ui32ValueCnt;

		if(++m_nUpdateIntervalCounter >= m_nUpdateInterval)
		{
			if(!m_bActiveGroupChanged)
			{
				nGroupSelect = 0xffffffff;
			}
			else
			{
				nGroupSelect = m_nActiveGroupSelect;
				m_bActiveGroupChanged = false;
			}

			if(PVRScopeReadCountersThenSetGroup(m_pPVRScopeData, &m_sReading, nTimeUS, nGroupSelect))
			{
				m_nUpdateIntervalCounter = 0;

				if(m_nActiveGroup != m_sReading.nReadingActiveGroup)
				{
					m_nActiveGroup = m_sReading.nReadingActiveGroup;

					// zero the buffers for all the counters becoming enabled
					for(i = 0; i < m_nCounterNum; ++i)
					{
						if(m_pCounters[i].nGroup == m_nActiveGroup || m_pCounters[i].nGroup == 0xffffffff)
						{
							m_pGraphCounters[i].nWritePosCB = 0;
							memset(m_pGraphCounters[i].pfValueCB, 0, sizeof(*m_pGraphCounters[i].pfValueCB) * m_nSizeCB);
						}
					}
				}

				ui32ValueCnt = m_sReading.nValueCnt;

				// Write the counter value to the buffer
				unsigned int ui32Index = 0;

				for(i = 0; i < m_nCounterNum && ui32Index < ui32ValueCnt; ++i)
				{
					if(m_pCounters[i].nGroup == m_nActiveGroup || m_pCounters[i].nGroup == 0xffffffff)
					{
						if(m_pGraphCounters[i].nWritePosCB >= m_nSizeCB)
							m_pGraphCounters[i].nWritePosCB = 0;

						m_pGraphCounters[i].pfValueCB[m_pGraphCounters[i].nWritePosCB++] = m_sReading.pfValueBuf[ui32Index++];
					}
				}
			}
		}

		APIRender(m_pPVRScopeAPIData);
	}
}

void CPVRScopeGraph::ShowCounter(unsigned int nCounter, bool bShow)
{
	 if(nCounter < m_nCounterNum)
		 m_pGraphCounters[nCounter].bShow = bShow;
}

bool CPVRScopeGraph::IsCounterShown(unsigned int nCounter) const
{
	return m_pGraphCounters && nCounter < m_nCounterNum ? m_pGraphCounters[nCounter].bShow : false;
}

bool CPVRScopeGraph::IsCounterBeingDrawn(unsigned int nCounter) const
{
	if(nCounter < m_nCounterNum && (m_pCounters[nCounter].nGroup == m_nActiveGroup || m_pCounters[nCounter].nGroup == 0xffffffff))
		return true;

	return false;
}

float CPVRScopeGraph::GetMaximumOfData(unsigned int nCounter)
{
	float fMaximum = 0.0f;

	if(nCounter < m_nCounterNum && m_pGraphCounters[nCounter].pfValueCB)
	{
		for(unsigned int i = 0; i < m_nSizeCB; ++i)
		{
			if(m_pGraphCounters[nCounter].pfValueCB[i] > fMaximum)
				fMaximum = (float) m_pGraphCounters[nCounter].pfValueCB[i];
		}
	}

	return fMaximum;
}

float CPVRScopeGraph::GetMaximum(unsigned int nCounter)
{
	if(nCounter < m_nCounterNum)
	{
		return m_pGraphCounters[nCounter].fMaximum;
	}

	return 0.0f;
}

void CPVRScopeGraph::SetMaximum(unsigned int nCounter, float fMaximum)
{
	if(nCounter < m_nCounterNum)
		m_pGraphCounters[nCounter].fMaximum = fMaximum;
}

bool CPVRScopeGraph::SetActiveGroup(const unsigned int nActiveGroup)
{
	if(m_nActiveGroupSelect == nActiveGroup)
		return true;

	for(unsigned int i = 0; i < m_nCounterNum; ++i)
	{
		if(m_pCounters[i].nGroup == nActiveGroup) // Is it a valid group
		{
			m_nActiveGroupSelect = nActiveGroup;
			m_bActiveGroupChanged = true;
			return true;
		}
	}

	return false;
}

const char *CPVRScopeGraph::GetCounterName(const unsigned int i) const
{
	if(i >= m_nCounterNum)
		return "";

	return m_pCounters[i].pszName;
}

int CPVRScopeGraph::GetCounterGroup(const unsigned int i) const
{
	if(i >= m_nCounterNum)
		return 0xffffffff;

	return m_pCounters[i].nGroup;
}

void CPVRScopeGraph::position(
	const unsigned int nViewportW, const unsigned int nViewportH,
	const unsigned int nGraphX, const unsigned int nGraphY,
	const unsigned int nGraphW, const unsigned int nGraphH)
{
	if(m_pPVRScopeData && m_pGraphCounters)
	{
		m_nSizeCB = nGraphW;

		float fPixelW = 2 * 1.0f / nViewportW;
		float fGraphH = 2 * (float)nGraphH / nViewportH;

		if(fPixelW != m_fPixelW || fGraphH != m_fGraphH)
		{
			m_fPixelW = 2 * 1.0f / nViewportW;
			m_fGraphH = 2 * (float)nGraphH / nViewportH;

			for(unsigned int i = 0; i < m_nCounterNum; ++i)
			{
				delete[] m_pGraphCounters[i].pfValueCB;
				m_pGraphCounters[i].pfValueCB = new float[m_nSizeCB];
				memset(m_pGraphCounters[i].pfValueCB, 0, sizeof(*m_pGraphCounters[i].pfValueCB) * m_nSizeCB);
				m_pGraphCounters[i].nWritePosCB = 0;

				m_pGraphCounters[i].fColour[0] = (float) (sin((float) i) + 1.0f) * 0.3f;
				m_pGraphCounters[i].fColour[1] = (float) (cos((float) i) + 1.0f) * 0.3f;
				m_pGraphCounters[i].fColour[2] = (float) (tan((float) i) + 1.0f) * 0.3f;
			}
		}

		m_fX = 2 * ((float)nGraphX / nViewportW) - 1;
		m_fY = 2 * ((float)nGraphY / nViewportH) - 1;

		APISize(m_pPVRScopeAPIData, nViewportW, nViewportH);
	}
}

void CPVRScopeGraph::SetUpdateInterval(const unsigned int nUpdateInverval)
{
	m_nUpdateInterval = nUpdateInverval;
}

/*****************************************************************************
 End of file (PVRScopeGraph.cpp)
*****************************************************************************/

