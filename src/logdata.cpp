#include "logdata.h"
#include <QDir>
#include <QFile>
LogData::LogData(QObject* parent) : QObject(parent), m_logTimer(new QTimer)
{
    QDir dir("data");
    if (!dir.exists())
        dir.mkpath("data");
    QFile file;
    m_filePath = dir.filePath(QString("log-%1.log").arg(QDate::currentDate().toString()));
    file.setFileName(m_filePath);
    if (!file.open(QIODevice::ReadWrite))
        return;
    QString line;
    QString header = "Время\tТемп\tДавл";
    QTextStream in(&file);
    line = in.readLine();
    if (line != header) {
        QTextStream head(&file);
        head << header << "\n";
    }
    file.close();

    m_logTimer->setInterval(1000);
    connect(m_logTimer, &QTimer::timeout, this, &LogData::programmLog);

    m_programmTime.start();

    // создание файла
    // запись запуск отдельно
}

LogData::~LogData(){
    if(m_logTimer->isActive()) m_logTimer->stop();
    delete m_logTimer;
}

void LogData::setLogTimerSeconds(int seconds) {
    m_logTimer->setInterval(seconds*1000);
    emit logTimerSecondsChanged();
}

int LogData::getLogTimerSeconds() {
    return m_logTimer->interval()/1000;
}

void LogData::programmLog() {
    // writeData
    // separate log from path from ui
}

void LogData::writeData(double temp, double pres) {
    QFile file(m_filePath);
    if (!file.open(QIODevice::Append | QIODevice::Text))
        return;
    QTextStream out(&file);
    
    const auto &c_time = m_programmTime.elapsed()/1000.0;

    QString line;
    // line+= QTime::currentTime().toString() + "\t";
    line+= QString::number(c_time) + "\t";
    line+= QString::number(temp, 'g', 4) + "\t";
    line+= QString::number(pres, 'g', 4) + "\t";
    
    out << line << "\n";
}