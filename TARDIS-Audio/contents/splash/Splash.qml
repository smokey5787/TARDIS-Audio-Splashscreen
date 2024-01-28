import QtQuick 2.5
import QtMultimedia 5.15

Item {
    id: root
    width: 1000
    height: 1000
    visible: true

    property int stage: 0

    onStageChanged: {
        if (stage === 1) {
            introAnimation.running = true
        }
    }

    Image {
        id: backgroundImage
        source: "images/background.jpg"
        anchors.fill: parent
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
