#ifndef MYCLASS_H
#define MYCLASS_H

#include <QObject>

class MyClass : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged)

public:
    explicit MyClass(QObject *parent = nullptr);

    QString name() const;
    void setName(const QString &name);

signals:
    void nameChanged(const QString &name);

public slots:
    void open();

private:
    QString m_name;
};

#endif // MYCLASS_H
