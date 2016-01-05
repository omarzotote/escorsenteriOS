//
//  NotifcationsManager.swift
//  Escorsenter
//
//  Created by En Calientes Mac 2 on 10/11/15.
//  Copyright (c) 2015 En Calientes Labs. All rights reserved.
//

import Foundation

public class NotificationsManager {
    
    let entityName = "Notification"
    
    func getNotificationsFromAPI(viewdelegate: ViewDelegate){
        
        var loader = NotificationLoader(viewdelegate: viewdelegate)
        var teamManager = TeamsManager()
        var leagueManager = LeaguesManager()
        var teams = teamManager.getFavorites()
        var leagues = leagueManager.getFavorites()
        
        var teamIds = [Int64]()
        var leagueIds = [Int64]()
        
        for league in leagues {
            leagueIds.append(league.id)
        }
        for team in teams{
            teamIds.append(team.id)
        }
        
        loader.getNotifications(teamIds, leagueIds: leagueIds)
    }
    
    //Get data from server DB
    
    func getNotificationsFromDB() -> [NotificationDto] {
        var dataSource = DataSource(_entityName: entityName)
        var notificationsData = dataSource.readAll()
        var notifications = [NotificationDto]()
        for notificationData in notificationsData{
            notifications.append(NotificationDto.parseFromData(notificationData))
        }
        return notifications
    }
    
    //Add data to local DB
    
    func addNotificationsToDB(notifications: [NotificationDto]){
        var dataSource = DataSource(_entityName: entityName)
        dataSource.deleteAll()
        
        for notification in notifications {
            dataSource.add(notification.data(), id: notification.id)
        }
    }
}
