#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickTextDocument>
#include <QTextOption>
#include <QQuickStyle>
#include <QQmlContext>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);


    QQmlApplicationEngine engine;
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.rootContext()->setContextProperty("SOURCE_DIR", QString(SOURCE_DIR));
    engine.loadFromModule("Template3D", "Main");

    return app.exec();
}
