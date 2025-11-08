#include "controllerbase.h"

#define _WINSOCKAPI_
#include <windows.h>
#include <QDebug>

ControllerBase::ControllerBase(std::string name) : m_name(name), m_connected(false) {

}

ControllerBase::~ControllerBase() {

}

bool ControllerBase::isConnected() {

    return m_connected;
}

IcpAICtrl::IcpAICtrl(std::string name) : ControllerBase(name) {
    
}

IcpAICtrl::~IcpAICtrl() {
    if(USB_AI) {
        CloseDevice(USB_AI);
        USB_AI = nullptr;
    }
}

int IcpAICtrl::initUSBAI() {
    int iErrCode;
    WORD wFWer;
    BYTE bySupIOMask, total_ai, byDeviceNickName[32], byDeviceSN[32];

    USB_AI = CreateInstance();

    if(ERR_NO_ERR != (iErrCode = OpenDevice(USB_AI, USB2019, 1))) {
        char szMessage[10];
        qDebug() << QString("OpenDevice error [%1]").arg(iErrCode);
        CloseDevice(USB_AI);
        USB_AI = nullptr;
        m_connected = false;
        return -1;
    }

    GetSupportIOMask(USB_AI, &bySupIOMask);
    GetDeviceNickName(USB_AI, byDeviceNickName);
    GetDeviceSN(USB_AI, byDeviceSN);

    GetAITotal(USB_AI, &total_ai);

    m_connected = true;
    return 0;
}

void IcpAICtrl::setTypeCodeToChannels() {
    int iErrCode;
    if(ERR_NO_ERR != (iErrCode = AI_SetTypeCode(USB_AI, 0, 0x09))) {
        qDebug() << QString::number(iErrCode);
    }
    if(ERR_NO_ERR != (iErrCode = AI_SetTypeCode(USB_AI, 2, 0x0F))) {
        qDebug() << QString::number(iErrCode);
    }
    qDebug() << "DONE";
}

std::pair<float, float> IcpAICtrl::getData() {
    int iErrCode;
    float o_fAIValue[USBIO_AI_MAX_CHANNEL];
    if(ERR_NO_ERR != (iErrCode = AI_ReadValueAnalog(USB_AI, o_fAIValue))) {
        qDebug() << QString::number(iErrCode);
        m_connected = false;
        qDebug() << "NOT READ ";
        return {0, 0};
    } 
    return {o_fAIValue[0],o_fAIValue[2]};
} 