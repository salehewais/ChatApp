import QtQuick
import QtQuick.Layouts 1.0
import QtQuick.Controls 2.0
import QtQuick.Window
import Buttons 1.0
import Contact 1.0

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
            model: [1,2,3,4,5,6,7,8,9]
            delegate: Row {
                readonly property bool sentByMe: index % 2 == 0
                anchors.right: sentByMe ? listView.contentItem.right : undefined
                spacing: 6

                Rectangle {
                    id: avatar
                    width: height
                    height: parent.height
                    color: "grey"
                    visible: !sentByMe
                }

                Rectangle {
                    width: 80
                    height: 40
                    color: sentByMe ? "lightgrey" : "steelblue"
                    Label {
                        anchors.centerIn: parent
                        text: index
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
                    enabled: messageField.length > 0
                    Layout.fillWidth: false
                }
            }
        }

    }
}

