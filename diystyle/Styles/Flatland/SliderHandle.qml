import QtQuick 2.12
import QtQuick.Templates 2.12 as T
import Styles 1.0

Item {
    id: root
    implicitWidth: initialSize
    implicitHeight: initialSize

    property real value: 0
    property bool handleHasFocus: false
    property bool handlePressed: false
    property bool handleHovered: false
    readonly property int initialSize: 13
    readonly property var control: parent

    Rectangle {
        id: handleRect
        width: parent.width
        height: parent.height
        radius: width / 2
        color: Style.accent
        scale: root.handlePressed ? 1.5 : 1

        Behavior on scale {
            NumberAnimation {
                duration: 250
            }
        }
    }
}
