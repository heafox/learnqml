#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QDebug>
#include "serialdriver.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    qmlRegisterType<SerialDriver>("Serial", 1, 0, "SerialDriver");

    QQmlApplicationEngine engine;

    // Add the ':/' in the resource file to the QML import path.
    engine.addImportPath(":/");

    const QUrl url(QStringLiteral("qrc:/main.qml"));

    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);

    engine.load(url);

    return app.exec();
}
