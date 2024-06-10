import QtQuick
import QtQuick.Window
import Buttons 1.0
import Screens 1.0
import Contact 1.0

Window {
    width: 410
    height: 590
    visible: true
    title: qsTr("ChatApp")
    color:'#627254'
    Loader{
        id:mainLoader
        width: parent.width
        height: parent.height - toolBar.height
    }
    Rectangle{
        id:toolBar
        height: 80
        width: parent.width
        color:"#76885B"
        anchors.bottom: parent.bottom

        ContactListScreen{
            id:contactList
        }

        IconButton{
            id:chatIcon
            iconDir:'../../Assets/chatbutton.png'
            anchors{
                verticalCenter: parent.verticalCenter
                left: parent.left
                leftMargin: 80
            }
            onClicked: {
                mainLoader.sourceComponent = contactList
            }
        }
        IconButton{
            id:settingIcon
            iconDir:'../../Assets/settingbutton.png'
            anchors{
                verticalCenter: parent.verticalCenter
                right: parent.right
                rightMargin: 80
            }
        }
    }


}
