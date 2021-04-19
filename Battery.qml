import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0




ColumnLayout{
    id: colLay

    property double currentCharge
    property bool charging
    onCurrentChargeChanged: {
        fillAnimation.to = (batteryBorder.height - 2*batteryBorder.border.width) * currentCharge;
        fillAnimation.start();
        if(currentCharge > 0.4){
            batteryFill.color = "green";
        }else if (currentCharge >0.2){
            batteryFill.color = "yellow";
        }else{
            batteryFill.color = "red";
        }
    }


    spacing: 0

    Rectangle{
        id: batterytop
        width: parent.width *0.2; height: parent.height *0.05
        Layout.alignment: Qt.AlignHCenter
        color: "black"

    }
    Rectangle{
        id: batteryBorder
        height: parent.height - batterytop.height
        Layout.fillWidth: true
        Layout.alignment: Qt.AlignBottom | Qt.AlignHCenter
        border.color: "black"
        border.width: 5

        Rectangle{
            id: batteryFill
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: batteryBorder.bottom
            anchors.bottomMargin: batteryBorder.border.width
            anchors.leftMargin: batteryBorder.border.width
            width: parent.width - batteryBorder.border.width *2

            NumberAnimation {
                id: fillAnimation
                target: batteryFill
                property: "height"
                duration: 2000
                to: (batteryBorder.height - 2*batteryBorder.border.width) * currentCharge
                onRunningChanged: {if(fillAnimation.running == true){charging= true}else{charging = false};}
            }
        }
    }
}
