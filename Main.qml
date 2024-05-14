import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtCore
import QtQuick3D
import QtQuick3D.Helpers
import modules.FileIO

ApplicationWindow {
    title: qsTr("Flex 3D")
    visible: true
    width: 800
    height: 640
    x: 0
    y: 0

    property string validQmlFile: `import QtQuick
    import QtQuick3D

    Node {
    id: node

    PrincipledMaterial {
    id: defaultMaterial_material
    objectName: "DefaultMaterial"
    }

    Node {
    id: _STL_BINARY_
    objectName: "<STL_BINARY>"
    Model {
    id: model
    source: "meshes/node3.mesh"
    materials: [
    defaultMaterial_material
    ]
    }
    }
    }`

    property string invalidQmlFile: `import QtQuick
    import QtQuick3D

    Node {
    id: node

    PrincipledMaterial {
    id: defaultMaterial_material
    objectName: "DefaultMaterial"
    }

    Node {
    id: _STL_BINARY_
    objectName: "<STL_BINARY>"
    Model {
    id: model
    source: ""
    materials: [
    defaultMaterial_material
    ]
    }
    }
    }`

    FileIO {
        id: fileIO
    }

    Item {
        z: 1
        anchors.top: parent.top
        anchors.left: parent.left
        Row {

            Button {
                text: "1.Write valid qml file"
                onClicked: {
                    fileIO.saveFile(SOURCE_DIR + "/filesystem/balsamui",
                                    "Profile_8080.qml", validQmlFile)
                }
            }

            Button {
                text: "2.Load Loader3D"
                onClicked: {
                    loader_3d.source = "file:///" + SOURCE_DIR
                            + "/filesystem/balsamui/Profile_8080.qml"
                }
            }

            Button {
                text: "3.Unoad Loader3D"
                onClicked: {
                    loader_3d.source = ""
                }
            }

            Button {
                text: "4.Write invalid qml file"
                onClicked: {
                    fileIO.saveFile(SOURCE_DIR + "/filesystem/balsamui",
                                    "Profile_8080.qml", invalidQmlFile)
                }
            }

            Button {
                text: "5.Load Loader3D"
                onClicked: {
                    loader_3d.source = "file:///" + SOURCE_DIR
                            + "/filesystem/balsamui/Profile_8080.qml"
                }
            }
        }
    }

    View3D {
        anchors.fill: parent

        environment: SceneEnvironment {
            clearColor: "#FFFFFF"
            backgroundMode: SceneEnvironment.Color
            antialiasingMode: SceneEnvironment.MSAA
            antialiasingQuality: SceneEnvironment.High
        }

        camera: cameraNode

        PerspectiveCamera {
            id: cameraNode
            z: 500
        }

        Node {
            id: originNode

            DirectionalLight {
                eulerRotation: Qt.vector3d(-135, -110, 0)
                brightness: 1
            }

            SpotLight {
                position: Qt.vector3d(0, 500, 600)
                eulerRotation.x: -45
                brightness: 30
            }

            AxisHelper {
                id: worldAxes
                enableXYGrid: false
                enableXZGrid: true
                enableYZGrid: false
            }

            Model {
                source: "#Sphere"
                scale: Qt.vector3d(2.0, 1.0, 1.0)
                materials: DefaultMaterial {
                    diffuseColor: Qt.rgba(0.0, 1.0, 0.1, 1.0)
                }
            }

            Loader3D {
                id: loader_3d
                scale: Qt.vector3d(1.0, 1.0, 1.0)
                source: ""
                //asynchronous: true
                //visible: status == Loader3D.Ready
            }
        }

        OrbitCameraController {
            anchors.fill: parent
            origin: originNode
            camera: cameraNode
            xInvert: true
            yInvert: false
        }
    }
}
