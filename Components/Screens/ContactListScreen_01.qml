import QtQuick
import QtQuick.Window
import Buttons 1.0
import Screens 1.0
import Contact 1.0

Rectangle {
    id: mainComponent
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
                var component = mainComponent.parent.parent.chatScreen
                var loader = mainComponent.parent
                loader.sourceComponent = component
                loader.item.contactImage = imageIcon
                loader.item.contactName = contactName
            }
        }
        clip: true
        spacing : 3
        focus: true
    }
}
