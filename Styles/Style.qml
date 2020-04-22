pragma Singleton

import QtQuick 2.12
import Qt.labs.settings 1.0

QtObject {
    //category: "Style"

    property color accent: "#FF2196F3"
    property color primary: "#FFFFFFFF"
    property color background: "#FFFAFAFA"
    property color dialog: "#FFFFFFFF"
    property color shadow: "#88303030"

    property color text: "#DD000000"
    property color hint: "#50000000"

    property color delegate: background
    property color indicator: "#AA000000"

    property color dim: "#FFF0F0F0"
    property color button: "#FFF0F0F0"
    property color focus: "#FFE6E6E6"
    property color highlight: "#FFDCDCDC"
}
