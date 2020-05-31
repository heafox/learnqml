#include "serialdriver.h"
#include <QDebug>

SerialDriver::SerialDriver(QObject *parent)
    : QObject(parent)
{
    connect(&m_serial, &QSerialPort::readyRead,
            [this]() {
        auto data = m_serial.readAll();
        if (data == "ok") {
            emit finished(true);
        } else {
            emit finished(false);
        }
    });
}

bool SerialDriver::open(const QString& port, int baudrate)
{
    m_serial.setPortName(port);
    m_serial.setBaudRate(baudrate);

    return m_serial.open(QIODevice::ReadWrite);
}

void SerialDriver::login()
{
    m_serial.write("login");
}

void SerialDriver::logout()
{
    m_serial.write("logout");
}
