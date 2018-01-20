import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0
import QtQuick.Controls.Universal 2.0
import Qt.labs.settings 1.0

ApplicationWindow {
    id:window
    visible: true
    width: 640
    height: 480
    title: qsTr("qml ui")

    property string pageTitle:qsTr("main")

    //工具欄
    header: ToolBar {
        Material.foreground: "white"
        RowLayout {
                    spacing: 20
                    anchors.fill: parent

                    ToolButton {
                        contentItem: Image {
                            fillMode: Image.Pad
                            horizontalAlignment: Image.AlignHCenter
                            verticalAlignment: Image.AlignVCenter
                            source: stackView.depth > 1 ? "qrc:/images/back.png" : "qrc:/images/drawer.png"
                        }
                        onClicked: {
                            if (stackView.depth > 1) {
                                stackView.pop()
                                listView.currentIndex = -1
                            } else {
                                drawer.open()
                            }
                        }
                    }

                    Label {
                        id: titleLabel
                        text: listView.currentItem ? listView.currentItem.text : window.pageTitle
                        font.pixelSize: 20
                        elide: Label.ElideRight
                        horizontalAlignment: Qt.AlignHCenter
                        verticalAlignment: Qt.AlignVCenter
                        Layout.fillWidth: true
                    }
                    //右 菜單
                    ToolButton {
                        contentItem: Image {
                            fillMode: Image.Pad
                            horizontalAlignment: Image.AlignHCenter
                            verticalAlignment: Image.AlignVCenter
                            source: "qrc:/images/menu.png"
                        }
                        onClicked: optionsMenu.open()

                        Menu {
                            id: optionsMenu
                            x: parent.width - width
                            transformOrigin: Menu.TopRight

                            MenuItem {
                                text: qsTr("About")
                                onTriggered: aboutDialog.open()
                            }
                        }
                    }
                }
    }

    //左側 抽屜
    Drawer{
        id: drawer
        width: Math.min(window.width, window.height) / 3 * 2
        height: window.height
        dragMargin: stackView.depth > 1 ? 0 : undefined

        ListView {
                    id: listView
                    currentIndex: -1
                    anchors.fill: parent

                    delegate: ItemDelegate {
                        width: parent.width
                        text: model.title
                        highlighted: ListView.isCurrentItem
                        onClicked: {
                            if (listView.currentIndex != index) {
                                listView.currentIndex = index
                                stackView.push(model.source)
                            }
                            drawer.close()
                        }
                    }
                    model: ListModel {
                        ListElement {
                            title: qsTr("TreeView")
                            source: "pages/myTreeView.qml"
                        }
                    }
                    ScrollIndicator.vertical: ScrollIndicator { }
        }
    }
    //主顯示 頁面
    StackView{
        id: stackView
        anchors.fill: parent
        initialItem: "pages/myTreeView.qml"
    }
}
