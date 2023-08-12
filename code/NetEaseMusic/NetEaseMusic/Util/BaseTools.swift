//
//  BaseTools.swift
//  NetEaseMusic
//
//  Created by Ray on 2023/8/12.
//

import Foundation


class BaseTools {
    
    static func getCurrentDay () -> Int {
        let today = Date()
        let calendar = Calendar.current
        let day = calendar.component(.day, from: today)
        return day;
    }
    
    static func getCurrentMonth () -> Int {
        let currentDate = Date()
        let calendar = Calendar.current
        let currentMonth = calendar.component(.month, from: currentDate)
        return currentMonth;
    }
}
