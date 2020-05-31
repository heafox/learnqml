import QtQuick 2.0
import QtQuick.Controls 2.5
import PageController 1.0

Item {
    HomePageController {
        id: controller
    }

    Button {
        text: qsTr("Button")
        onClicked: controller.onButtonClicked()
    }
}
