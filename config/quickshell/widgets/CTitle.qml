import qs.common

CText {
    property bool subtitle: false
    font.pointSize: subtitle ? Settings.fontSubTitle : Settings.fontTitle
    font.preferShaping: true
}
