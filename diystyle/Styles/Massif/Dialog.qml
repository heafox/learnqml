import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.impl 2.12
import QtQuick.Templates 2.12 as T
import QtGraphicalEffects 1.0
import Styles 1.0

T.Dialog {
    id: control

    implicitWidth: Math.max(background ? background.implicitWidth : 0,
                            header && header.visible ? header.implicitWidth : 0,
                            footer && footer.visible ? footer.implicitWidth : 0,
                            contentWidth > 0 ? contentWidth + leftPadding + rightPadding : 0)
    implicitHeight: Math.max(background ? background.implicitHeight : 0,
                             (header && header.visible ? header.implicitHeight + spacing : 0)
                             + (footer && footer.visible ? footer.implicitHeight + spacing : 0)
                             + (contentHeight > 0 ? contentHeight + topPadding + bottomPadding : 0))

    padding: 30
    topPadding: header.visible ? 8 : padding
    bottomPadding: footer.visible ? 8 : padding

    header: Label {
        padding: 12
        visible: control.title
        elide: Label.ElideRight
        font.bold: true
        font.pixelSize: 16
        color: Style.accent
        text: control.title
    }

    footer: DialogButtonBox {
        visible: count > 0
    }

    background: Rectangle {
        radius: 3

        gradient: BackgroundGradient {
            color: Style.dialog
            stopColor: darken(Style.dialog, 0.02)
        }

        layer.enabled: true
        layer.effect: DropShadow {
            verticalOffset: 8
            color: Style.shadow
            samples: 48
        }
    }

    T.Overlay.modal: Rectangle {
        color: Style.shadow
        Behavior on opacity { NumberAnimation { duration: 200 } }
    }

    T.Overlay.modeless: Rectangle {
        color: Style.shadow
        Behavior on opacity { NumberAnimation { duration: 200 } }
    }

    enter: Transition {
        // grow_fade_in
        NumberAnimation {
            property: "scale"
            from: 0.9
            to: 1.0
            easing.type: Easing.OutQuint
            duration: 220
        }

        NumberAnimation {
            property: "opacity"
            from: 0.0
            to: 1.0
            easing.type: Easing.OutCubic
            duration: 150
        }
    }

    exit: Transition {
        // shrink_fade_out
        NumberAnimation {
            property: "scale"
            from: 1.0
            to: 0.9
            easing.type: Easing.OutQuint
            duration: 220
        }

        NumberAnimation {
            property: "opacity"
            from: 1.0
            to: 0.0
            easing.type: Easing.OutCubic
            duration: 150
        }
    }
}
