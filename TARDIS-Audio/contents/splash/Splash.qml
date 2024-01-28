import QtQuick 2.5
import QtMultimedia 5.15

Image {
    id: root
    source: "images/background.jpg"

    property int stage

    onStageChanged: {
        if (stage == 1) {
            introAnimation.running = true
        }
    }

    Item {
        id: content
        anchors.fill: parent
        opacity: 0
        TextMetrics {
            id: units
            text: "M"
            property int gridUnit: boundingRect.height
            property int largeSpacing: units.gridUnit
            property int smallSpacing: Math.max(2, gridUnit/4)
        }

       Audio {

        id: soundPlayer

        source: "sound/tardis.mp3"

    }

        Image {
            id: logo
            property real size: units.gridUnit * 12
            anchors.centerIn: parent
            source: "images/tardis3.png"
            sourceSize.width: 1000
            sourceSize.height: 1000

            ParallelAnimation {
                running: true

                ScaleAnimator {
                    target: logo
                    from: 0
                    to: 1
                    duration: 700
                }

                SequentialAnimation {
                    loops: Animation.Infinite

                    OpacityAnimator {
                        target: logo
                        from: 0.5
                        to: 1
                        duration: 1200
                    }
                    OpacityAnimator {
                        target: logo
                        from: 1
                        to: 0.5
                        duration: 1200
                    }
                }
            }
        }


    }

    OpacityAnimator {
        id: introAnimation
        running: false
        target: content
        from: 0
        to: 1
        duration: 1000
        easing.type: Easing.InOutQuad
    }

    Component.onCompleted: {

        soundPlayer.play()

    }
}
