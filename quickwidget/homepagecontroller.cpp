#include "homepagecontroller.h"
#include <QDebug>

HomePageController::HomePageController(QObject *parent)
    : QObject(parent)
{

}

void HomePageController::onButtonClicked()
{
    qDebug() << "onButtonClicked";
}
