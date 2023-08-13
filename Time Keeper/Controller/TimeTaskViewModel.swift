//
//  TimeTaskViewModel.swift
//  Time Keeper
//
//  Created by Ganesh Bangalore on 8/12/23.
//

import Foundation

public class TimeTaskViewModel: ObservableObject
{
    @Published var task: TimeTask
    @Published var isRunning: Bool = false
    

    public init(task: TimeTask)
    {
        self.task = task
    }
    // Methods for loading, saving, starting, stopping tasks
    
}
