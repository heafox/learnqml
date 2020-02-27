#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QIcon>
#include "serialdriver.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    qmlRegisterType<SerialDriver>("Serial", 1, 0, "SerialDriver");

    QGuiApplication app(argc, argv);

    QIcon::setThemeName("mytheme");

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
