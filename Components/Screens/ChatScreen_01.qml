import QtQuick
import QtQuick.Layouts 1.0
import QtQuick.Controls 2.0
import QtQuick.Window
import Buttons 1.0
import Contact 1.0
import QtQml.Models 2.15


Rectangle {
    id:chatMainScreen
    property string contactImage: ""
    property string contactName: ""
    anchors.fill: parent
    color: 'green'
    Rectangle{
        id:topToolBar
        color:'blue'
        anchors{
            left: parent.left
            right: parent.right
        }
        height:50
        IconButton{
            id:returnArrow
            iconDir: '../../Assets/arrow.png'
            onClicked: {
                var loader = chatMainScreen.parent
                loader.sourceComponent = loader.parent.chatListScreen
            }
        }
        Rectangle{
            id:imageContainer
            anchors{
                right: nameContact.left
                rightMargin: 5
                verticalCenter: parent.verticalCenter
            }
            color:'red'
            width:40
            height: 40
            radius: 50
            Image{
                id:contactImageRemix
                source: contactImage
                anchors.fill: parent
            }
        }

        Text {
            id: nameContact
            text: contactName
            font.family: "Segoe Print"
            font.bold: true
            font.pointSize: 16
            verticalAlignment: Text.AlignVCenter
            styleColor: "#511414"
            horizontalAlignment: Text.AlignHCenter
            anchors{
                horizontalCenter: parent.horizontalCenter
                verticalCenter: parent.verticalCenter
            }
        }
        IconButton{
            id:optionsDots
            iconDir: '../../Assets/menudots.png'
            anchors{
                right: parent.right
            }
        }
    }
    Rectangle{
        id:chatList
        color:'black'
        anchors{
            top:topToolBar.bottom
            left:chatMainScreen.left
            right: chatMainScreen.right
            bottom: chatMainScreen.bottom
        }
        ListModel {
            id: listModel
            ListElement { name: "Item 1"; sentByMe: 0}
            ListElement { name: "Item 2"; sentByMe: 1}
        }
        ListView {
            id: listView
            anchors{
                top: parent.top
                bottom: pane.top
            }
            width:parent.width
            clip: true
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.margins: pane.leftPadding + messageField.leftPadding
            displayMarginBeginning: 40
            displayMarginEnd: 40
            verticalLayoutDirection: ListView.BottomToTop
            spacing: 12
            model: listModel
            delegate: Row {
//                readonly property bool sentByMe: sentByMe
                anchors.right: sentByMe ? listView.contentItem.right : undefined
                spacing: 6
                Rectangle {
                    id: avatar
                    width: height
                    height: parent.height
                    color: "grey"
                    visible: !sentByMe
                    radius: 20
                }

                Rectangle {
                    width: 80
                    height: 30
                    radius:5
                    color: sentByMe ? "lightgrey" : "steelblue"
                    Label {
                        anchors.centerIn: parent
                        text: name
                        color: sentByMe ? "black" : "white"
                    }
                }
            }

            ScrollBar.vertical: ScrollBar {}
        }
        Pane {
            id: pane
            Layout.fillWidth: true
            Layout.fillHeight: false
            anchors{
                bottom: parent.bottom
                bottomMargin: 80
            }
            height: 70
            width:parent.width
            background: Rectangle{
                id:paneBackGround
                color:'#FFC090'
            }

            RowLayout {
                width: parent.width
                TextArea {
                    id: messageField
                    Layout.fillWidth: true
                    placeholderText: qsTr("Compose message")
                    wrapMode: TextArea.Wrap
                }

                Button {
                    id: sendButton
                    text: qsTr("Send")
//                    enabled: messageField.length > 0
                    Layout.fillWidth: false
                    onClicked: {
//                        listModel.append({ name: "Saleh" })
                        listModel.insert(0, { name: "Saleh", sentByMe: 1 })
                    }
                }
            }
        }

    }
}

