import QtQuick 2.15
import Buttons 1.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
Rectangle{
    id:rowContactMain
    width: listView.width
    height: 50
    signal clicked
    property string iconImge: ""
    property string contactNameText: ""
    color:'#7FB77E'
    RowLayout{
        id:rowComponent
        anchors.fill: parent
        IconButton{
            id:iconImage
            iconDir: iconImge
        }
        Text {
            id: nameContact
            text: contactNameText
            font.family: "Segoe Print"
            font.bold: true
            font.pointSize: 16
            verticalAlignment: Text.AlignVCenter
            styleColor: "#511414"
            horizontalAlignment: Text.AlignHCenter
        }
        MouseArea{
            id:mouseContact
            onClicked: {
                rowContactMain.clicked();
            }
        }
        Layout.alignment: Qt.AlignHCenter
    }
    Component.onCompleted: {
        mouseContact.anchors.fill = mouseContact.parent
    }
}
