#pragma once

#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include <QVariant>

#include "controllers/controllerbase.h"
#include "logdata.h"

struct DataPoints {
    Q_GADGET
    Q_PROPERTY(float curPres MEMBER m_curPres)
    Q_PROPERTY(float curTemp MEMBER m_curTemp)
public:
    float m_curPres = 0;
    float m_curTemp = 0;
};

class DataContainer {
    void scaleData(double data) { curValue = scaleA*data + scaleB; };
    double curValue;
public:
    float scaleA = 1;
    float scaleB = 1;
    void addData(double data) { scaleData(data); };
    double getCurValue() const { return curValue; } ; 
};

class Grom : public QGuiApplication {
    Q_OBJECT
    Q_PROPERTY (DataPoints data READ getData NOTIFY dataUpdated)
    Q_PROPERTY (bool controllerConnected READ getConnected NOTIFY connectedChanged)
public:
    Grom(int &argc, char **argvm);
    ~Grom();
    Q_INVOKABLE void readData();
    DataPoints getData();
    bool getConnected();
signals:
    void dataUpdated();
    void connectedChanged();

private slots:
    void timeEvent();

private:
    void icpAiController();
    void initGUI();

    IcpAICtrl analogController;
    QQmlApplicationEngine m_engine;
    DataPoints m_lastData;

    DataContainer presVals;
    DataContainer tempVals;

    QTimer* timer;

    LogData logData;

};
