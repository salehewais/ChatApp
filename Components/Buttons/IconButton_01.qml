import QtQuick 2.15

Rectangle{
    id:iconButtonMain
    color: "#DDDDDD"
    signal clicked
    opacity: mouseButton.containsMouse ? 0.8 : 1
    property string iconDir: ""
    height: 50
    width: 50
    radius: 5
    Image {
        id: iconButton
        anchors.fill: parent
        source: iconDir
    }
    MouseArea{
        id:mouseButton
        anchors.fill: parent
        onClicked: {
            iconButtonMain.clicked();
        }
        hoverEnabled: true
        cursorShape: containsMouse ? Qt.PointingHandCursor : Qt.ArrowCursor

    }
}
