import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.impl 2.12
import QtQuick.Templates 2.12 as T
import QtGraphicalEffects 1.0
import Styles 1.0

T.ToolButton {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding)

    padding: 6
    spacing: 3

    icon.width: 16
    icon.height: 16
    icon.color: {
        if (!control.enabled)
            return Style.hint;

        if (control.checked)
            return Style.primary;

        if (control.highlighted)
            return Style.accent;

        return Style.text;
    }

    contentItem: IconLabel {
        spacing: control.spacing
        mirrored: control.mirrored
        display: control.display

        icon: control.icon
        text: control.text
        font: control.font
        color: {
            if (!control.enabled)
                return Style.hint;

            if (control.checked)
                return Style.primary;

            if (control.highlighted)
                return Style.accent;

            return Style.text;
        }
    }

    background: Rectangle {
        implicitWidth: 32
        implicitHeight: 32

        readonly property bool square: control.contentItem.width <= control.contentItem.height

        width: parent.width
        height: parent.height
        radius: square ? width / 2 : 3

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
