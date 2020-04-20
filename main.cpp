#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QIcon>
#include <QSqlDatabase>
#include <QDebug>
#include "serialdriver.h"
#include "moviemodel.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    qmlRegisterType<SerialDriver>("Serial", 1, 0, "SerialDriver");
    qmlRegisterType<MovieModel>("Model", 1, 0, "MovieModel");

    QGuiApplication app(argc, argv);

    QIcon::setThemeName("mytheme");

    QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName("customdb");
    bool ok = db.open();
    if (!ok) {
        qDebug() << "Open database failed!";
    }

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
