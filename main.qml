import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import Costumcomponent 1.0

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Battery")

    BatteryCharger{
        id:charger

    }

    RowLayout{
        anchors.centerIn: parent
        width: 400; height: 200
        spacing: 10
        Battery{
            id: bat
            height: 200; width: 160
            Layout.alignment: Qt.AlignRight | Qt.AlignHCenter
            currentCharge: charger.initialCharge
        }

        ColumnLayout{
            TextField{
                id:texCharge
                onAccepted: {
                    if(parseFloat(text) > 1.0){
                        bat.currentCharge = 1.0;
                        charger.setCharge(1);
                    }else if (parseFloat(text) > 0){
                        bat.currentCharge = parseFloat(text); charger.setCharge(parseFloat(text));
                    }else{
                        bat.currentCharge = 0;
                        charger.setCharge(0);
                    }
                }
            }
            RowLayout{
                Button{
                    id: setButton
                    text : "Set charge"
                    onClicked:{
                        if(parseFloat(texCharge.text) > 1.0){
                            bat.currentCharge = 1.0;
                            charger.setCharge(1);
                        }else if (parseFloat(texCharge.text) > 0){
                            bat.currentCharge = parseFloat(texCharge.text); charger.setCharge(parseFloat(texCharge.text));
                        }else{
                            bat.currentCharge = 0;
                            charger.setCharge(0);
                        }
                    }
                }
                Button{
                    text: "Reset"
                    onClicked: {
                        charger.reset();
                        texCharge.text = "";
                        bat.currentCharge = charger.initialCharge;8
                    }
                }
            }
            Text {
                id: cyclesText
                text: "Charging Cycles:" + charger.chargingCycles
            }
        }
    }
}
