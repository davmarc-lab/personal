pragma Singleton
pragma ComponentBehavior: Bound

import QtQuick

import Quickshell
import Quickshell.Services.Notifications

Singleton {
    id: root
    property list<Notif> notifications: []

    property NotificationServer server: NotificationServer {
        id: notifServer

        bodySupported: true
        actionsSupported: true
        keepOnReload: true

        bodyMarkupSupported: false
        persistenceSupported: false

        onNotification: function (notif) {
            notif.tracked = true;
            root.notifications.push(notifComp.createObject(root, {
                notification: notif
            }));
        }
    }

    function clearAll() {
        root.notifications = [];
        for (var notif of root.notifications) {
            notif.clear();
        }
    }

    component Notif: QtObject {
        id: notif

        required property Notification notification

        readonly property string summary: notification.summary

        function clear() {
            notification.dismiss();
        }
    }

    Component {
        id: notifComp

        Notif {}
    }
}
