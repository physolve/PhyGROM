import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Material

ApplicationWindow {
    id: window
    width: 1600
    height: 1000 //750
    // x: Screen.width / 2 - width / 2
    // y: Screen.height / 2 - height / 2
    visible: true
    title: "PhyGrom"

    RowLayout {
        anchors.fill: parent

        Grom {
            id: grom
            Layout.minimumWidth: 900
            Layout.fillHeight: true
        }
        DataTool {
            id: dataTool
            Layout.preferredWidth: 600
            Layout.leftMargin: 50
            Layout.fillHeight: true
        }
        
    }

    // Rectangle {
    //     id: root
    //     anchors.fill: parent
    //     color: "white"
    //     border.color: "black"
    //     border.width: 10
    //     RowLayout {
    //         id: data
    //         spacing: 50
    //         anchors.fill: parent
    //         anchors.bottomMargin: 100
    //         Text {
    //             Layout.alignment: Qt.AlignHCenter
    //             font.pointSize: 40
    //             text: `Давление ${backend.data.curPres.toPrecision(5)} бар`   
    //         }
    //         Text {
    //             Layout.alignment: Qt.AlignHCenter
    //             font.pointSize: 40
    //             text: `Температура ${backend.data.curTemp.toPrecision(5)} °C`   
    //         }
    //     }
    //     RoundButton {
    //         anchors.bottom: parent.bottom
    //         anchors.horizontalCenter: parent.horizontalCenter
    //         anchors.bottomMargin: 100 
    //         height: 50
    //         width: 50
    //         opacity: 0.7
    //         background: Rectangle {
    //             radius: parent.radius
    //             color: backend.controllerConnected ? "green" : "red"
    //             border.color: "black"
    //             border.width: 1
    //         }
    //     }
    // }
}
