import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.impl 2.12
import QtQuick.Templates 2.12 as T
import QtQuick.Window 2.12
import QtGraphicalEffects 1.0
import Styles 1.0

T.ComboBox {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding,
                             implicitIndicatorHeight + topPadding + bottomPadding)

    leftPadding: padding + (!control.mirrored || !indicator || !indicator.visible ? 0 : indicator.width + spacing)
    rightPadding: padding + (control.mirrored || !indicator || !indicator.visible ? 0 : indicator.width + spacing)

    delegate: ItemDelegate {
        width: parent.width
        height: 32
        highlighted: control.highlightedIndex === index
        hoverEnabled: control.hoverEnabled
        text: control.textRole
              ? (Array.isArray(control.model)
                 ? modelData[control.textRole]
                 : model[control.textRole])
              : modelData
    }

    indicator: ColorImage {
        x: control.mirrored ? control.padding : control.width - width - control.padding
        y: control.topPadding + (control.availableHeight - height) / 2
        color: control.enabled ? Style.indicator : Style.indicatorDisabled
        source: "Images/DropIndicator.svg"
    }

    contentItem: T.TextField {
        padding: 6
        leftPadding: control.editable ? 2 : control.mirrored ? 0 : 6
        rightPadding: control.editable ? 2 : control.mirrored ? 6 : 0

        text: control.editable ? control.editText : control.displayText

        enabled: control.editable
        autoScroll: control.editable
        readOnly: control.down
        inputMethodHints: control.inputMethodHints
        validator: control.validator

        font: control.font
        color: control.enabled ? Style.text : Style.hint
        selectionColor: Style.accent
        selectedTextColor: Style.text
        verticalAlignment: TextInput.AlignVCenter
    }

    background: Rectangle {
        implicitWidth: 100
        implicitHeight: 32

        width: parent.width
        height: parent.height
        radius: 3
        gradient: BackgroundGradient {
            enabled: control.enabled && !control.editable && !control.flat
            color: {
                if (!control.enabled)
                    return Style.dim

                if (control.down)
                    return Style.highlight

                if (control.visualFocus || control.hovered)
                    return Style.focus

                if (control.editable)
                    return "transparent"

                return Style.button
            }
        }

        layer.enabled: control.enabled && !control.editable && !control.flat
        layer.effect: DropShadow {
            verticalOffset: control.down ? 1 : 2
            color: Style.shadow
            samples: control.down ? 6 : 12
        }

        Rectangle {
            visible: control.editable
            x: 1
            y: parent.height - height
            width: parent.width - 2
            height: control.activeFocus ? 2 : 1
            color: {
                if (!control.enabled)
                    return Style.hint

                if (control.activeFocus)
                    return Style.accent

                return Style.text
            }
        }
    }

    popup: T.Popup {
        y: control.height
        width: control.width
        height: Math.min(contentItem.implicitHeight,
                         Math.min(300, control.Window.height - topMargin - bottomMargin))
        transformOrigin: Item.Top
        topMargin: 12
        bottomMargin: 12

        contentItem: ListView {
            clip: true
            implicitHeight: contentHeight
            model: control.delegateModel
            currentIndex: control.highlightedIndex

            T.ScrollIndicator.vertical: ScrollIndicator { }
        }

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

        background: Rectangle {
            radius: 3
            color: Style.background

            layer.enabled: true
            layer.effect: DropShadow {
                verticalOffset: 3
                color: Style.shadow
                samples: 12
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
}
