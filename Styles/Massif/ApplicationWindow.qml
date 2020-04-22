import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Templates 2.12 as T
import Styles 1.0

T.ApplicationWindow {

    color: Style.background

    overlay.modal: Rectangle {
        color: Style.shadow
        Behavior on opacity { NumberAnimation { duration: 200 } }
    }

    overlay.modeless: Rectangle {
        color: Style.shadow
        Behavior on opacity { NumberAnimation { duration: 200 } }
    }
}
