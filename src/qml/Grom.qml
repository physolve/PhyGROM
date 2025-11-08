import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Pane {
    id: root
    anchors.fill: parent
    anchors.margins: 100
    anchors.leftMargin: 200
    anchors.rightMargin: 200
    // padding: 100 
    // horizontalPadding: 400
    
    // here will be picture of Grom
    // source: Vacuum_scheme_with_VAC.png
    background: Item {

        Image {
            height: parent.height
            fillMode: Image.PreserveAspectFit
            source: "qrc:/PhyGROM/qml/img/Vacuum_scheme_with_VAC.png"
        }
    }

    contentItem: Item {
        id: content
        anchors.fill: parent

        Rectangle {
            x: 250
            y: 20
            border.color: "black"
            border.width: 2
            width: 100
            height: 30
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
