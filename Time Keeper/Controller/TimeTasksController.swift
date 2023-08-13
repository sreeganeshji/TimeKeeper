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
    @Published var categoryExpansionState: [TaskCategory: Bool] = [:]
    
    public init(tasks: [TimeTask])
    {
        self.timeTaskViewModels = tasks.map({ timeTask in
            TimeTaskViewModel(task: timeTask)
        })
        
        let categories: [TaskCategory] = GetCategories()
        
        categories.forEach { category in
            categoryExpansionState[category] = true
        }
    }
    
    public func GetCategories() -> [TaskCategory]
    {
        let taskCategoryList: [TaskCategory] = self.timeTaskViewModels.map({ timeTaskViewModel in
            timeTaskViewModel.task.TaskCategory})
        
        let taskCategorySet = Set(taskCategoryList)
        
        return Array(taskCategorySet)
    }
    
    public func GetTasksInCategory(category: TaskCategory) -> [TimeTaskViewModel]
    {
        return timeTaskViewModels.filter { timeTaskViewModel in
            timeTaskViewModel.task.TaskCategory == category
        }
    }
}
