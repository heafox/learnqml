import QtQuick 2.12
import QtQuick.Templates 2.12 as T
import Styles 1.0

T.Label {
    id: control

    color: control.enabled ? Style.text : Style.hint
    linkColor: Style.accent
}
