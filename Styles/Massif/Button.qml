import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.impl 2.12
import QtQuick.Templates 2.12 as T
import QtGraphicalEffects 1.0
import Styles 1.0

T.Button {
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
        implicitWidth: 58
        implicitHeight: 32

        radius: 3
        gradient: BackgroundGradient {
            enabled: control.enabled && !control.flat
            color: {
                if (!control.enabled)
                    return Style.dim;

                if (control.down) {
                    if (control.checked)
                        return Palette.blend(Style.accent, Style.highlight, 0.4);

                    return Style.highlight;
                }

                if (control.checked) {
                    if (control.visualFocus || control.hovered)
                        return Palette.blend(Style.accent, Style.focus, 0.3);

                    return Style.accent;
                }

                if (control.visualFocus || control.hovered)
                    return Style.focus;

                if (control.flat)
                    return "transparent";

                return Style.button;
            }
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
