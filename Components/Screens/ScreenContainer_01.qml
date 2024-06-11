import QtQuick
import QtQuick.Controls 2.0
import QtQuick.Window
import Buttons 1.0
import Contact 1.0
Rectangle{
    id:screenContainer
    anchors.fill: parent
    color:'transparent'
    property Component chatScreen
    property Component settingScreen
    property Component chatListScreen
    Loader{
        id:mainLoader
        anchors.fill: parent
        sourceComponent:chatListScreen
    }
}
