#pragma once

#include <QTimer>
#include <QElapsedTimer>

class LogData : public QObject
{
	Q_OBJECT

    Q_PROPERTY (int logTimerSeconds READ getLogTimerSeconds WRITE setLogTimerSeconds NOTIFY logTimerSecondsChanged)
    Q_PROPERTY (QString logPath READ getLogPath WRITE setLogPath NOTIFY logPathChanged)

public:
	LogData(QObject *parent = 0);
	~LogData();
    void startLog();
    void writeData(double temp, double pres);
    void setLogTimerSeconds(int seconds);
    int getLogTimerSeconds();

signals:
    void logTimerSecondsChanged();

private slots:
    void programmLog();

private:
    QElapsedTimer m_programmTime;
    QString m_filePath;

    QTimer* m_logTimer;
    QString m_customPath;
};