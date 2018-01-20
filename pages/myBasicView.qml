import QtQuick 2.0
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
Pane {
    ColumnLayout {
        anchors.fill: parent

        GroupBox {
            title: qsTr("Controls")
            Layout.fillWidth: true

            ColumnLayout{
                anchors.fill: parent

                RowLayout {
                    anchors.fill: parent

                    Button {
                        text: "log"
                        onClicked: function(){
                            console.log("123")

                        }
                    }
                }
            }
        }// end GroupBox

        GroupBox {
            title: qsTr("Views")
            Layout.fillWidth: true
            Layout.fillHeight: true
            Rectangle{
                anchors.fill: parent

                color: "red"
            }
        }// end GroupBox
    }
}
