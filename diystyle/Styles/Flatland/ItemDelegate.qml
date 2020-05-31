import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.impl 2.12
import QtQuick.Templates 2.12 as T
import Styles 1.0

T.ItemDelegate {
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

    contentItem: IconLabel {
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
        implicitHeight: 40

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
