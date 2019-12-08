#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "CollageGroupListModel.h"
#include "myclass.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    qmlRegisterType<CollageGroupListModel>("Collage", 1, 0, "CollageGroupListModel");
    qmlRegisterType<MyClass>("MyClass", 1, 0, "MyClass");

    QGuiApplication app(argc, argv);

    CollageGroupListModel collages;

    for (int i = 0; i < 20; i++) {
        CollageGroup group;
        group.setId(i);
        group.setName(QString("name%1").arg(i));
        collages.append(group);
    }

    QQmlApplicationEngine engine;

    // Add the ':/' in the resource file to the QML import path.
    engine.addImportPath(":/");
    engine.rootContext()->setContextProperty("collages", &collages);

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
