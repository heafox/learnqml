import QtQuick 2.12
import QtQuick.Templates 2.12 as T
import QtQuick.Controls 2.12
import QtQuick.Controls.impl 2.12
import Styles 1.0

T.CheckBox {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding,
                             implicitIndicatorHeight + topPadding + bottomPadding)

    padding: 6
    spacing: 6

    indicator: CheckIndicator {
        x: text ? (control.mirrored ? control.width - width - control.rightPadding : control.leftPadding)
                : control.leftPadding + (control.availableWidth - width) / 2
        y: control.topPadding + (control.availableHeight - height) / 2
        control: control
    }

    contentItem: Text {
        leftPadding: control.indicator && !control.mirrored ? control.indicator.width + control.spacing : 0
        rightPadding: control.indicator && control.mirrored ? control.indicator.width + control.spacing : 0

        elide: Text.ElideRight
        verticalAlignment: Text.AlignVCenter

        text: control.text
        font: control.font
        color: control.enabled ? Style.text : Style.hint
    }

    background: Rectangle {
        implicitHeight: 32

        color: {
            if (!control.enabled)
                return "transparent"

            if (control.visualFocus)
                return Style.focus

            return "transparent"
        }
    }
}
