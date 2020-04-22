import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.impl 2.12
import QtQuick.Templates 2.12 as T
import QtGraphicalEffects 1.0
import Styles 1.0

T.Tumbler {
    id: control
    implicitWidth: 60
    implicitHeight: 200

    delegate: Text {
        text: modelData
        color: Style.text
        font: control.font
        opacity: (1.0 - Math.abs(Tumbler.displacement) / (control.visibleItemCount / 2)) * (control.enabled ? 1 : 0.6)
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }

    contentItem: TumblerView {
        model: control.model
        delegate: control.delegate
        path: Path {
            startX: contentItem.width / 2
            startY: -contentItem.delegateHeight / 2
            PathLine {
                x: contentItem.width / 2
                y: (control.visibleItemCount + 1) * contentItem.delegateHeight - contentItem.delegateHeight / 2
            }
        }

        property real delegateHeight: control.availableHeight / control.visibleItemCount
    }
}
