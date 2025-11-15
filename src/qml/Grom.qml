import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Pane {
    id: root
    // anchors.fill: parent
    height: 1000
    width: 1600
    anchors.margins: 100
    anchors.leftMargin: 200
    anchors.rightMargin: 200
    // padding: 100 
    // horizontalPadding: 400
    implicitHeight: 900
    // here will be picture of Grom
    // source: Vacuum_scheme_with_VAC.png
    background: Item {

        Image {
            height: 900
            fillMode: Image.PreserveAspectFit
            source: "qrc:/PhyGROM/qml/img/Vacuum_scheme_with_VAC.png"
        }
    }

    contentItem: Item {
        id: content
        anchors.fill: parent

        Rectangle {
            x: 365-1
            y: 55-1
            color: "transparent"
            border.color: "yellow"
            border.width: 2
            width: 150
            height: 55
            radius: height/4

            Text {
                anchors.centerIn: parent
                font.pointSize: 30
                text: backend.data.curPres.toPrecision(5)
            }
        }

        Rectangle {
            x: 97
            y: 358
            color: "transparent"
            border.color: "yellow"
            border.width: 2
            width: 150
            height: 55
            radius: height/4

            Text {
                anchors.centerIn: parent
                font.pointSize: 30
                text: backend.data.curTemp.toPrecision(5)
            }
        }

        Rectangle {
            x: 513
            y: 562
            color: "transparent"
            border.color: "yellow"
            border.width: 2
            width: 192
            height: 56
            radius: height/4

            Text {
                anchors.centerIn: parent
                font.pointSize: 30
                text: backend.data.curTemp.toPrecision(5) // to vac
            }
        }

    }
    
    // GridView {
    //     id: elements
    //     anchors.fill: parent
    //     cellHeight: 34
    //     cellWidth: 102
    //     model: parent.height*parent.width/(cellHeight*cellWidth)
    //     delegate: Rectangle {
    //         width: elements.cellWidth
    //         height: elements.cellHeight
    //         color: "transparent"
    //         border.color: "black"
    //         border.width: 1
    //     }
    // }
}
