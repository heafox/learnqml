import QtQuick 2.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.0
import "Pages"

Item {
    id: control
    implicitWidth: 1080
    implicitHeight: 1920

    property int currentIndex: 0
    property var currentItem: homePage

    Behavior on opacity { PropertyAnimation {} }

    Loader {
        id: homePage
        anchors.fill: parent
        active: true
        asynchronous: true
        sourceComponent: HomePage {
            onInputNumber: control.showRecordPage()
            onInputPassword: control.showDialPage()
        }
    }

    Loader {
        id: dialPage
        anchors.fill: parent
        active: false
        asynchronous: true
        sourceComponent: DialPage {
            onInputFace: control.showHomePage()
        }
    }

    Loader {
        id: recordPage
        anchors.fill: parent
        active: false
        asynchronous: true
        sourceComponent: RecordPage { }
    }

    onCurrentIndexChanged: {
        currentItem.visible = false;

        currentItem = getItem(currentIndex);

        currentItem.active = true;
        currentItem.visible = true;
    }

    function getItem(index) {
        switch (index) {
        case 0: return homePage;
        case 1: return dialPage;
        case 2: return recordPage;
        default: break;
        }
        return null;
    }

    function showHomePage() { currentIndex = 0; }
    function showDialPage() { currentIndex = 1; }
    function showRecordPage() { currentIndex = 2; }
}
