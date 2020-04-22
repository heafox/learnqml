import QtQuick 2.12
import QtQuick.Templates 2.12 as T
import Styles 1.0

T.GroupBox {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            contentWidth + leftPadding + rightPadding,
                            implicitLabelWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             contentHeight + topPadding + bottomPadding)

    spacing: 3
    padding: 10
    topPadding: padding + (label && label.implicitWidth > 0 ? label.implicitHeight + spacing : 0)

    label: Text {
        x: control.spacing
        width: control.availableWidth

        text: control.title
        font: control.font
        color: control.enabled ? Style.text : Style.hint
        elide: Text.ElideRight
        verticalAlignment: Text.AlignVCenter
    }

    background: Rectangle {
        y: control.topPadding - control.bottomPadding
        width: parent.width
        height: parent.height - control.topPadding + control.bottomPadding

        radius: 3
        color: "transparent"
        border.color: Style.hint
    }
}
