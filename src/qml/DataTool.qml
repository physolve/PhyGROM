import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Page {
    id: root
    background: Rectangle {
        border.color: "black"
        border.width: 2
    }
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
        anchors.fill: parent
        anchors.topMargin: parent.header.height
        anchors.leftMargin: 25
        GridLayout {
            id: recInfo
            Layout.fillHeight: true
            
            Layout.leftMargin: 100
            Layout.rightMargin: 100
            columns: 2
            rows: 5

            columnSpacing: 15

            Text {
                Layout.preferredHeight: 35
                Layout.preferredWidth: 120
                font.pixelSize: 20
                text: "Record frequency, s"
            }

            ComboBox {
                Layout.preferredHeight: 50
                Layout.preferredWidth: 100
                model: [1, 3, 5, 10, 30]
                editable: true
                font.pixelSize: 20
            }

            Button {
                Layout.alignment: Qt.AlignLeft
                Layout.preferredHeight: 35
                Layout.preferredWidth: 100
                background: Rectangle {
                    radius: height/2
                    color: "#ddcdba"
                }

                font.pixelSize: 20
                font.bold: Font.Medium
                text: "New"

                onClicked: {
                    layout.currentIndex = 1
                }
            }

            TextField {
                Layout.preferredHeight: 50
                Layout.preferredWidth: 250
                font.pixelSize: 20
                verticalAlignment: Text.AlignVCenter
                placeholderText: "File path"
            }

            // Repeater {
            //     model: 6
            //     Rectangle {
            //         Layout.preferredWidth: index % 2 == 0 ? 75 : 150
            //         Layout.preferredHeight: 25
            //         color: "lightgray"
            //         border.color: "black"
            //         border.width: 2
            //         Text {
            //             anchors.centerIn: parent
            //             text: "Item " + (index + 1)
            //         }
            //     }
            // }
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
