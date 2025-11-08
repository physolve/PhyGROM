#pragma once

#include <QTimer>
#include <QElapsedTimer>

class LogData : public QObject
{
	Q_OBJECT

public:
	LogData(QObject *parent = 0);
	~LogData();
    // void startLog();
// private slots:
//     void programmLog();
    void writeData(double temp, double pres);

private:
    QElapsedTimer m_programmTime;
    // QTimer* m_logTimer;

    QString m_filePath;
};