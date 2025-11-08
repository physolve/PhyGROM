#pragma once
#include <string>

#include <windows.h>
#include "../win_icp/USBIO_CSWrapper.h"
#pragma comment(lib, "ICPDAS_USBIO.lib")

// #include <QString>
// #include <QElapsedTimer>

class ControllerBase {
public:
    ControllerBase(std::string name = "unknown");
    virtual ~ControllerBase();
    bool isConnected();
protected:
    std::string m_name;
    bool m_connected;
};

class IcpAICtrl : public ControllerBase {
public:
    IcpAICtrl(std::string name = "unknown");
    virtual ~IcpAICtrl();
    // bool connect() override;
    void setTypeCodeToChannels();
    int initUSBAI();
    std::pair<float, float> getData();
private:
    // std::unique_ptr<ICPDAS_USBIO> USB_AI;
    ICPDAS_USBIO* USB_AI;
    // ControllerData
};

