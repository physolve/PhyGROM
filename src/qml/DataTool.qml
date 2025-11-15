import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Page {
    id: root
    anchors.margins: 100

    header: Item {
        height: 200

        RowLayout {
            spacing: 50
            anchors.fill: parent
            anchors.leftMargin: 50
            anchors.rightMargin: 50

            Button {
                Layout.alignment: Qt.AlignLeft
                Layout.preferredHeight: 50
                Layout.preferredWidth: 150
                background: Rectangle {
                    radius: height/2
                    color: "#ddcdba"
                }

                font.pixelSize: 30
                font.bold: Font.Medium
                text: "Rec "

                onClicked: {
                    layout.currentIndex = 0
                }
            }

            Button {
                Layout.alignment: Qt.AlignLeft
                Layout.preferredHeight: 50
                Layout.preferredWidth: 150
                background: Rectangle {
                    radius: height/2
                    color: "#ddcdba"
                }

                font.pixelSize: 30
                font.bold: Font.Medium
                text: "Graph "

                onClicked: {
                    layout.currentIndex = 1
                }
            }

            Item {
                Layout.fillWidth: true
            }
        }
    }

    contentItem: StackLayout {
        id: layout

        GridLayout {
            id: recInfo
            Layout.fillHeight: true
            Layout.fillWidth: true
            columns: 2
            rows: 5

            columnSpacing: 5

            Repeater {
                model: 10
                Rectangle {
                    Layout.preferredWidth: index % 2 == 0 ? 100 : 300 
                    Layout.fillHeight: true
                    color: "lightgray"
                    border.color: "black"
                    border.width: 2
                    Text {
                        anchors.centerIn: parent
                        text: "Item " + (index + 1)
                    }
                }
            }
        }

        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            color: "transparent"
            border.color: "black"
            border.width: 2
        }

    }

    footer: Item {
        height: 100
    }
}
