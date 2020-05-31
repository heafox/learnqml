import QtQuick 2.12
import QtQuick.Templates 2.12 as T
import QtQuick.Controls 2.12
import QtQuick.Controls.impl 2.12
import Styles 1.0

T.SpinBox {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            contentItem.implicitWidth +
                            up.implicitIndicatorWidth +
                            down.implicitIndicatorWidth)
    implicitHeight: Math.max(implicitContentHeight + topPadding + bottomPadding,
                             implicitBackgroundHeight,
                             up.implicitIndicatorHeight,
                             down.implicitIndicatorHeight)

    spacing: 6
    leftPadding: (control.mirrored ? (up.indicator ? up.indicator.width : 0) : (down.indicator ? down.indicator.width : 0))
    rightPadding: (control.mirrored ? (down.indicator ? down.indicator.width : 0) : (up.indicator ? up.indicator.width : 0))

    validator: IntValidator {
        locale: control.locale.name
        bottom: Math.min(control.from, control.to)
        top: Math.max(control.from, control.to)
    }

    contentItem: TextInput {
        text: control.displayText

        font: control.font
        color: enabled ? Style.text : Style.hint
        selectionColor: Style.accent
        selectedTextColor: Style.text
        horizontalAlignment: Qt.AlignHCenter
        verticalAlignment: Qt.AlignVCenter

        readOnly: !control.editable
        validator: control.validator
        inputMethodHints: control.inputMethodHints
    }

    up.indicator: Rectangle {
        x: control.mirrored ? 0 : parent.width - width
        implicitWidth: 40
        implicitHeight: 40
        height: parent.height
        width: height
        color: {
            if (!control.enabled)
                return Style.dim

            if (control.checked || control.highlighted)
                return Style.accent

            if (control.down)
                return Style.highlight

            if (control.visualFocus || control.hovered)
                return Style.focus

            return Style.button
        }

        Rectangle {
            x: (parent.width - width) / 2
            y: (parent.height - height) / 2
            width: Math.min(parent.width / 3, parent.height / 3)
            height: 2
            color: enabled ? Style.text : Style.hint
        }
        Rectangle {
            x: (parent.width - width) / 2
            y: (parent.height - height) / 2
            width: 2
            height: Math.min(parent.width / 3, parent.height / 3)
            color: enabled ? Style.text : Style.hint
        }
    }

    down.indicator: Rectangle {
        x: control.mirrored ? parent.width - width : 0
        implicitWidth: 40
        implicitHeight: 40
        height: parent.height
        width: height
        color: {
            if (!control.enabled)
                return Style.dim

            if (control.checked || control.highlighted)
                return Style.accent

            if (control.down)
                return Style.highlight

            if (control.visualFocus || control.hovered)
                return Style.focus

            return Style.button
        }

        Rectangle {
            x: (parent.width - width) / 2
            y: (parent.height - height) / 2
            width: parent.width / 3
            height: 2
            color: enabled ? Style.text : Style.hint
        }
    }

    background: Item {
        implicitWidth: 140
        implicitHeight: 32

        Rectangle {
            x: parent.width / 2 - width / 2
            y: parent.y + parent.height - height - control.bottomPadding / 2
            width: control.availableWidth
            height: control.activeFocus ? 2 : 1
            color: control.activeFocus ? Style.accent : Style.hint
        }
    }
}
