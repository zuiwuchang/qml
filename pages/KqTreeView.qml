import QtQuick 2.0
import QtQuick.Controls 1.4

ScrollView{
    id:thisView

    property var keys: null

    Component.onCompleted: {
        console.log("ok")
    }
    Rectangle {
    width: thisView.width
    height: thisView.height
          ListModel {

              id: fruitModel

              ListElement {
                  name: "1234567890Apple"
                  cost: 2.45
                  attributes: [
                      ListElement { description: "Core" },
                      ListElement { description: "Deciduous" }
                  ]
              }
              ListElement {
                  name: "Orange"
                  cost: 3.25
                  attributes: [
                      ListElement { description: "Citrus" }
                  ]
              }
              ListElement {
                  name: "Banana"
                  cost: 1.95
                  attributes: [
                      ListElement { description: "Tropical" },
                      ListElement { description: "Seedless" }
                  ]
              }
          }

          Component {
              id: fruitDelegate
              Row {
                  spacing: 10
                  Text { text: name }
                  Text { text: '$' + cost }
              }
          }

      }

    ListView {
        anchors.fill: parent
        model: fruitModel
        delegate: fruitDelegate
    }
}


