import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12

ApplicationWindow {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("Tabs")

    Canvas {
        id: mycanvas
        width: window.width
        height: window.height
        onPaint: {
            var ctx = getContext("2d");

            ctx.fillStyle = Qt.rgba(0, 0, 0, 1);
            ctx.strokeStyle = Qt.rgba(0, 0, 0, 1);
            ctx.lineWidth = 1;

            ctx.fillText("123", 10, 10);
            //ctx.fillRect(10, 10, 100, 100);

            ctx.beginPath();
            
            ctx.moveTo(100, 100);
            ctx.lineTo(200, 100);

            ctx.moveTo(200 + 60, 100);
            ctx.arc(200 + 30, 100, 30, 0, 3.1415926, true);
            
            ctx.stroke();

            ctx.save();
            ctx.beginPath();
            ctx.lineWidth = 5 + Math.random() * 10;
            var lastX = width * Math.random();
            var lastY = height * Math.random();
            ctx.moveTo(lastX, lastY);
            lastX = width * Math.random();
            lastY = height * Math.random();
            ctx.bezierCurveTo(width * Math.random(), height * Math.random(), width * Math.random(), height * Math.random(), lastX, lastY);
            var hue = hue + 10 * Math.random();
            ctx.strokeStyle = 'hsl(' + hue + ', 50%, 50%)';
            ctx.shadowColor = 'white';
            ctx.shadowBlur = 10;
            ctx.stroke();
            ctx.restore();
        }
    }
}
