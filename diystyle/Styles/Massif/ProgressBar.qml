import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.impl 2.12
import QtQuick.Templates 2.12 as T
import Styles 1.0

T.ProgressBar {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding)

    contentItem: ProgressBarImpl {
        implicitHeight: 4

        scale: control.mirrored ? -1 : 1
        color: Style.accent
        progress: control.position
        indeterminate: control.visible && control.indeterminate
    }

    background: Rectangle {
        implicitWidth: 180
        implicitHeight: 4
        y: (control.height - height) / 2
        height: 4

        color: Style.button
    }
}
