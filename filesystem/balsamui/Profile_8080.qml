import QtQuick
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
    }