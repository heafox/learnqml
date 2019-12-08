#include "myclass.h"
#include <QDebug>

MyClass::MyClass(QObject *parent) : QObject(parent)
{

}

QString MyClass::name() const
{
    return m_name;
}

void MyClass::setName(const QString &name)
{
    if (m_name != name) {
        m_name = name;
        emit nameChanged(m_name);
    }
}

void MyClass::open()
{
    qDebug() << "open";
}
