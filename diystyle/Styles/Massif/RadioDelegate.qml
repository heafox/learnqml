import QtQuick 2.12
import QtQuick.Templates 2.12 as T
import QtQuick.Controls 2.12
import QtQuick.Controls.impl 2.12
import Styles 1.0

T.RadioDelegate {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding,
                             implicitIndicatorHeight + topPadding + bottomPadding)

    padding: 6
    spacing: 3

    icon.width: 16
    icon.height: 16
    icon.color: control.enabled ? Style.text : Style.hint

    indicator: RadioIndicator {
        x: text ? (control.mirrored ? control.leftPadding : control.width - width - control.rightPadding)
                : control.leftPadding + (control.availableWidth - width) / 2
        y: control.topPadding + (control.availableHeight - height) / 2
        control: control
    }

    contentItem: IconLabel {
        leftPadding: !control.mirrored ? 0 : control.indicator.width + control.spacing
        rightPadding: control.mirrored ? 0 : control.indicator.width + control.spacing

        spacing: control.spacing
        mirrored: control.mirrored
        display: control.display
        alignment: control.display === IconLabel.IconOnly ||
                   control.display === IconLabel.TextUnderIcon
                   ? Qt.AlignCenter : Qt.AlignLeft

        icon: control.icon
        text: control.text
        font: control.font
        color: control.enabled ? Style.text : Style.hint
    }

    background: Rectangle {
        implicitWidth: 180
        implicitHeight: 32

        color: {
            if (!control.enabled)
                return "transparent"

            if (control.checked || control.highlighted || control.down)
                return Style.highlight

            if (control.visualFocus || control.hovered)
                return Style.focus

            return "transparent"
        }
    }
}
