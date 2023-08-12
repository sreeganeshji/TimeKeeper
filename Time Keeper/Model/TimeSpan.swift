//
//  TimeSpan.swift
//  Time Keeper
//
//  Created by Ganesh Bangalore on 8/12/23.
//

import Foundation

public struct TimeSpan: Codable, Comparable
{
    var StartTime: Date
    var EndTime: Date?
    
    public static func < (lhs: TimeSpan, rhs: TimeSpan) -> Bool {
        lhs.StartTime < rhs.StartTime
    }
}
