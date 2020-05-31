#ifndef HOMEPAGECONTROLLER_H
#define HOMEPAGECONTROLLER_H

#include <QObject>

class HomePageController : public QObject
{
    Q_OBJECT
public:
    explicit HomePageController(QObject *parent = nullptr);

signals:

public slots:
    void onButtonClicked();
};

#endif // HOMEPAGECONTROLLER_H
