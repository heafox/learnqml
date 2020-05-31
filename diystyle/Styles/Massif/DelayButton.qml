import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.impl 2.12
import QtQuick.Templates 2.12 as T
import QtGraphicalEffects 1.0
import Styles 1.0

T.DelayButton {
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

    transition: Transition {
        NumberAnimation {
            duration: control.delay * (control.pressed ? 1.0 - control.progress : 0.3 * control.progress)
        }
    }

    contentItem: Text {
        text: control.text
        font: control.font
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
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
        implicitWidth: 48
        implicitHeight: 32

        width: parent.width
        height: parent.height
        radius: 3
        color: {
            if (!control.enabled)
                return Style.dim;

            if (control.down) {
                if (control.checked)
                    return Style.blend(Style.accent, Style.highlight, 0.4);

                return Style.highlight;
            }

            if (control.checked) {
                if (control.visualFocus || control.hovered)
                    return Style.blend(Style.accent, Style.focus, 0.3);

                return Style.accent;
            }

            if (control.visualFocus || control.hovered)
                return Style.focus;

            if (control.flat)
                return "transparent";

            return Style.button;
        }

        PaddedRectangle {
            width: parent.width * control.progress
            height: parent.height
            radius: parent.radius
            color: Style.accent
        }

        layer.enabled: control.enabled && !control.flat
        layer.effect: DropShadow {
            verticalOffset: control.down || control.checked ? 0 : 2
            horizontalOffset: control.down || control.checked ? 0 : 1
            color: Style.shadow
            samples: control.down || control.checked ? 6 : 12
        }
    }
}
