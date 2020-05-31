#include "mainwindow.h"

#include <QApplication>
#include <QQmlEngine>
#include "homepagecontroller.h"

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);

    qmlRegisterType<HomePageController>("PageController", 1, 0, "HomePageController");

    MainWindow w;
    w.show();

    return a.exec();
}
