import QtQuick 2.11

Gradient {
    id: gradient

    function darken(color, val) {
        return Qt.rgba(color.r - val, color.g - val, color.b - val, color.a)
    }

    property bool enabled: true
    property color color
    property color stopColor: darken(color, 0.1)

    GradientStop {
        position: 0.0
        color: gradient.color
    }

    GradientStop {
        position: 1.0
        color: gradient.enabled ? gradient.stopColor : gradient.color
    }
}
