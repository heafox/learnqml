import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Templates 2.12 as T
import QtQuick.Window 2.12
import QtGraphicalEffects 1.0
import Styles 1.0

T.Menu {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            contentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             contentHeight + topPadding + bottomPadding)

    margins: 0
    topPadding: 8
    bottomPadding: 8

    transformOrigin: !cascade ? Item.Top : (mirrored ? Item.TopRight : Item.TopLeft)

    delegate: MenuItem { }

    enter: Transition {
        // grow_fade_in
        NumberAnimation { property: "scale"; from: 0.9; to: 1.0; easing.type: Easing.OutQuint; duration: 220 }
        NumberAnimation { property: "opacity"; from: 0.0; to: 1.0; easing.type: Easing.OutCubic; duration: 150 }
    }

    exit: Transition {
        // shrink_fade_out
        NumberAnimation { property: "scale"; from: 1.0; to: 0.9; easing.type: Easing.OutQuint; duration: 220 }
        NumberAnimation { property: "opacity"; from: 1.0; to: 0.0; easing.type: Easing.OutCubic; duration: 150 }
    }

    contentItem: ListView {
        implicitHeight: Math.min(contentHeight, 300)

        model: control.contentModel
        interactive: Window.window ? contentHeight > Window.window.height : false
        clip: true
        currentIndex: control.currentIndex

        ScrollIndicator.vertical: ScrollIndicator {}
    }

    background: Rectangle {
        implicitWidth: 180
        implicitHeight: 32

        radius: 3
        color: Style.dialog

        layer.enabled: true
        layer.effect: DropShadow {
            verticalOffset: 4
            color: Style.shadow
            samples: 32
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
}
