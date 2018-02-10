import QtQuick 2.0

Loader {
    anchors.fill: parent;

    default property list<ContentCondition> conditions;
    property string defaultSource: "";
    property string defaultPortrait: "";
    property string defaultLandscape: "";

    onWidthChanged: updateSource();
    Component.onCompleted: updateSource();

    function updateSource() {
        var orientation = (width > height) ? Qt.LandscapeOrientation : Qt.PortraitOrientation;

        for (var i = 0; i < conditions.length; i++) {
            var cond = conditions[i];
            if (width < cond.minimumWidth) {
                continue;
            }
            if (height < cond.minimumHeight) {
                continue;
            }
            if (cond.orientation !== Qt.PrimaryOrientation && cond.orientation !== orientation) {
                continue;
            }

            if (cond.source.length > 0) {
                source = cond.source;
                return;
            }
        }

        if (orientation === Qt.LandscapeOrientation) {
            if (defaultLandscape.length > 0) {
                source = defaultLandscape;
                return;
            }
        } else if (orientation === Qt.PortraitOrientation) {
            if (defaultPortrait.length > 0) {
                source = defaultPortrait;
                return;
            }
        }

        source = defaultSource;
    }
}
