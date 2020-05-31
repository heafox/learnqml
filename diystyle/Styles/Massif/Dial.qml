import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.impl 2.12
import QtQuick.Templates 2.12 as T
import Styles 1.0

T.Dial {
    id: control

    implicitWidth: 100
    implicitHeight: 100

    background: DialImpl {
        width: control.availableWidth
        height: control.availableHeight
        progress: control.position
        opacity: control.enabled ? 1 : 0.3
        color: control.enabled ? Style.indicator : Style.hint
    }

    handle: ColorImage {
        x: background.x + background.width / 2 - handle.width / 2
        y: background.y + background.height / 2 - handle.height / 2
        width: 14
        height: 10
        color: control.enabled ? Style.indicator : Style.hint
        source: "Images/DialIndicator.png"
        antialiasing: true
        opacity: control.enabled ? 1 : 0.3
        transform: [
            Translate {
                y: -Math.min(background.width, background.height) * 0.4 + handle.height / 2
            },
            Rotation {
                angle: control.angle
                origin.x: handle.width / 2
                origin.y: handle.height / 2
            }
        ]
    }
}
