import QtQuick 2.12
import QtQuick.Templates 2.12 as T
import QtQuick.Controls 2.12
import QtQuick.Controls.impl 2.12
import Styles 1.0

T.MenuItem {
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

    indicator: CheckIndicator {
        x: text ? (control.mirrored ? control.width - width - control.rightPadding : control.leftPadding) : control.leftPadding + (control.availableWidth - width) / 2
        y: control.topPadding + (control.availableHeight - height) / 2
        visible: control.checkable
        control: control
    }

    arrow: ColorImage {
        x: control.mirrored ? control.padding : control.width - width - control.padding
        y: control.topPadding + (control.availableHeight - height) / 2

        visible: control.subMenu
        mirror: control.mirrored
        color: control.enabled ? Style.text : Style.hint
        source: "Images/ArrowIndicator.svg"
    }

    contentItem: IconLabel {
        readonly property real arrowPadding: control.subMenu && control.arrow ? control.arrow.width + control.spacing : 0
        readonly property real indicatorPadding: control.checkable && control.indicator ? control.indicator.width + control.spacing : 0
        leftPadding: !control.mirrored ? indicatorPadding : arrowPadding
        rightPadding: control.mirrored ? indicatorPadding : arrowPadding

        spacing: control.spacing
        mirrored: control.mirrored
        display: control.display
        alignment: Qt.AlignLeft

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
