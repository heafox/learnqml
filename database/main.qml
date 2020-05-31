import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import Model 1.0

ApplicationWindow {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("Tabs")

    Component.onCompleted: {
        movieModel.create();

        var list = movieModel.get();
        for (var i = 0; i < list.length; i++) {
            movies.append(list[i]);
        }
    }

    MovieModel {
        id: movieModel
    }

    ListModel {
        id: movies
    }

    ColumnLayout {
        anchors.fill: parent

        Label {
            Layout.preferredHeight: 40
            text: qsTr("Movies")
        }

        ListView {
            Layout.fillWidth: true
            Layout.fillHeight: true
            model: movies

            delegate: ItemDelegate {
                contentItem: RowLayout {
                    Label {
                        text: title
                    }

                    Label {
                        text: director
                    }

                    Label {
                        text: rating
                    }
                }
            }
        }
    }
}
