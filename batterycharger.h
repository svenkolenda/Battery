#ifndef BATTERYCHARGER_H
#define BATTERYCHARGER_H

#include <QObject>

class BatteryCharger : public QObject
{
    Q_OBJECT
    Q_PROPERTY(double initialCharge READ initialCharge NOTIFY initialChargeChanged)
    Q_PROPERTY(double chargingCycles READ chargingCycles NOTIFY chargingCyclesChanged)

public:
    explicit BatteryCharger(QObject *parent = nullptr);

    double chargingCycles() const
    {
        return m_chargingCycles;
    }

    double initialCharge() const
    {
        return m_initialCharge;
    }
    Q_INVOKABLE  void setCharge(double newCharge);
    Q_INVOKABLE  void reset();

public slots:

signals:

    void chargingCyclesChanged(double chargingCycles);

    void initialChargeChanged(double initialCharge);

private:

    double m_chargingCycles;
    double m_initialCharge;
    double m_oldCharge;
};

#endif // BATTERYCHARGER_H
