//
//  TimeTasksController.swift
//  Time Keeper
//
//  Created by Ganesh Bangalore on 8/12/23.
//

import Foundation

public class TimeTasksController: ObservableObject
{
    @Published var timeTaskViewModels: [TimeTaskViewModel]
    
    public init(tasks: [TimeTask])
    {
        self.timeTaskViewModels = tasks.map({ timeTask in
            TimeTaskViewModel(task: timeTask)
        })
    }
}
