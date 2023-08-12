//
//  TaskState.swift
//  Time Keeper
//
//  Created by Ganesh Bangalore on 8/12/23.
//

import Foundation

/**
 # Enum representing the possible states for a TimeTask instance
 */
public enum TaskState: Int, Codable
{
    // When the task
    // 1. Hasn't been started yet
    // 2. Was previously running. Now stopped
    case Stopped = 0
    
    // When the task is currently running
    case Running = 1
}
