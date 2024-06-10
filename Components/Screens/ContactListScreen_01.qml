import QtQuick
import QtQuick.Window
import Buttons 1.0
import Screens 1.0
import Contact 1.0

Component {
    id: mainComponent
    Rectangle {
        ChatScrren{
            id:chatScreen
        }

        anchors.fill: parent
        color: 'transparent'
        ListModel {
            id:listModel
            ListElement {imageIcon: "../../Assets/bill.jpg";contactName:'Bill Gets'}
            ListElement {imageIcon: "../../Assets/Ellon.jpg";contactName:'Ellon Mask'}
        }
        ListView {
            id:listView
            anchors.fill: parent
            model: listModel
            delegate: ContactRow{
                iconImge: imageIcon
                contactNameText:contactName
                onClicked: {
                    mainLoader.sourceComponent = chatScreen
                }
            }
            clip: true
            spacing : 3
            focus: true
        }
    }
}
