pragma Singleton

import QtQuick

import Quickshell
import Quickshell.Services.Notifications

Singleton {
    id: root
    property ListModel notifications: ListModel {}

    property NotificationServer server: NotificationServer {
        id: notifServer

        bodySupported: true
        actionsSupported: true
        keepOnReload: true

        bodyMarkupSupported: false
        persistenceSupported: false

        onNotification: function (notif) {
            console.log(notif.summary);
            root.addNotification(notif);
        }
    }

    function addNotification(notif: Notification) {
        notifications.insert(0, {
            "summary": notif.body
        });
    }
}
