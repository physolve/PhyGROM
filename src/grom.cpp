#include "grom.h"

#include <QDebug>
#include <QQmlContext>
#include <QTimer>

Grom::Grom(int &argc, char **argv) : QGuiApplication(argc, argv), analogController("Pressure") {
    icpAiController();
    initGUI();

    presVals.scaleA = 3.125;
    presVals.scaleB = -12.5;

    timer = new QTimer(this);
    connect(timer, &QTimer::timeout, this, &Grom::timeEvent);
    timer->setInterval(1000);
    timer->start();
}

Grom::~Grom() {
    if(timer->isActive()) {
        timer->stop();
    }
    delete timer;
}

void Grom::icpAiController() {
    analogController.initUSBAI();
}

void Grom::initGUI() {
    QString applicationName = "PhyGrom";

    m_engine.addImportPath(":/");
    const QUrl url("qrc:/PhyGROM/qml/main.qml");
    QObject::connect(
        &m_engine, &QQmlApplicationEngine::objectCreated, this,
        [url](QObject *obj, const QUrl &objUrl) {
            if(!obj && url == objUrl) QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection
    );
    m_engine.rootContext()->setContextProperty("backend", this);
    m_engine.load(url);
}

void Grom::timeEvent() {
    if(analogController.isConnected()) {
        readData();
    }
    emit connectedChanged();
}

void Grom::readData() {
    const auto& val = analogController.getData();

    const double resistance = 0.24; // mOmh

    presVals.addData(val.first / resistance);
    tempVals.addData(val.second);

    m_lastData.m_curPres = presVals.getCurValue();
    m_lastData.m_curTemp = tempVals.getCurValue();

    logdata.writeData(tempVals.getCurValue(), presVals.getCurValue());

    emit dataUpdated();
}

DataPoints Grom::getData() {
    return m_lastData;
}

bool Grom::getConnected() {
    return analogController.isConnected();
}