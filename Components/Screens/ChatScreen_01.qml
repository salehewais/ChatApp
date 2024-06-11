import QtQuick
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
            iconDir: '../../Assets/bill.jpg'
            onClicked: {
                var loader = chatMainScreen.parent
                loader.sourceComponent = loader.parent.chatListScreen
            }
        }
        Rectangle{
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
            iconDir: '../../Assets/Ellon.jpg'
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
    }
}

