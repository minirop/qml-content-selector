# qml-content-selector
Item whose content changes based on its dimentions

## Configuration
* clone this repository.
* add `<path to this repo>/qml` to `QML_IMPORT_PATH` in the .pro file of your project.
* Call `QQmlEngine::addImportPath("<path to this repo>/qml")` before loading any QML file.
* Enjoy!
  
If you want to ship an application using this module, you can simply copy the `qml` file to your project and add the .qml files to its .qrc file.

## Usage
`import pro.qmake.selector 1.0`  
  
The main component is `ContentSelector`, it's the item that will *receive* the content to show.  
`ContentCondition` is a non-visual item that has values to be checked and the first one that matches will have its `source` property to by used by the `ContentSelector`.  
If nothing matches, one of the default properties will be used (`defaultPortrait`, `defaultLandscape` or `defaultSource`).

## ContentSelector
**conditions**: contains all its `ContentCondition`s.  
**defaultPortrait**: will be use if set and in portrait mode and no other source has been used.  
**defaultLandscape**: will be use if set and in landscape mode and no other source has been used.  
**defaultSource**: will be use if any other source is used.  

## ContentCondition
**source**: path to the QML file.  
**minimumHeight**: the minimum height of the component to be a match (default: 0).  
**minimumWidth**: the minimum width of the component to be a match (default: 0).  
**orientation**: the orientation to match (`Qt.PortraitOrientation` or `Qt.LandscapeOrientation`).
