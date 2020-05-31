#ifndef SERIALDRIVER_H
#define SERIALDRIVER_H

#include <QObject>
#include <QSerialPort>

class SerialDriver : public QObject
{
    Q_OBJECT
public:
    explicit SerialDriver(QObject *parent = nullptr);

signals:
    void finished(bool ok);

public slots:
    bool open(const QString &port, int baudrate);

    void login();
    void logout();

private:
    QSerialPort m_serial;
};

#endif // SERIALDRIVER_H
