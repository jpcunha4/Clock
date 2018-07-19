//
//  Alarm.swift
//  Clock
//
//  Created by Joao Paulo Cunha Ávila on 19/07/18.
//  Copyright © 2018 Joao Paulo Cunha Ávila. All rights reserved.
//

import Foundation

class Alarm {
    var hour:Int
    var minute:Int
    var repeating:[String]
    var alarmName:String
    var sound:String
    var snooze:Bool
    
    init(hour:Int, minute:Int, repeating:[String], alarmName:String, sound:String, snooze:Bool) {
        self.hour = hour
        self.minute = minute
        self.repeating = repeating
        self.alarmName = alarmName
        self.sound = sound
        self.snooze = snooze
    }
}
