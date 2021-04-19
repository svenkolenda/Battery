#include "batterycharger.h"
#include <QDebug>

BatteryCharger::BatteryCharger(QObject *parent) : QObject(parent)
{
    m_initialCharge = 0.8;
    m_chargingCycles = 0;
    m_oldCharge = 0.8;
}

void BatteryCharger::setCharge(double newCharge)
{
    qDebug() << newCharge;
    if(m_oldCharge >= newCharge){
        m_oldCharge = newCharge;
        return;
    }
    double diff = newCharge - m_oldCharge;
    double oldChargingCycles = m_chargingCycles;
    m_chargingCycles = oldChargingCycles + diff;
    m_oldCharge = newCharge;
    emit chargingCyclesChanged(m_chargingCycles);
    return;
}

void BatteryCharger::reset()
{

    m_oldCharge = m_initialCharge;
    setCharge(m_oldCharge);
    m_chargingCycles = 0;
    emit chargingCyclesChanged(m_chargingCycles);
}
