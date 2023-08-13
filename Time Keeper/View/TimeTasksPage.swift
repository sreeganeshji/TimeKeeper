//
//  TimeTasksPage.swift
//  Time Keeper
//
//  Created by Ganesh Bangalore on 8/12/23.
//

import SwiftUI

struct TimeTasksPage: View {
    @ObservedObject var timeTasksController: TimeTasksController
    
    var body: some View {
        List{
            ForEach(timeTasksController.GetCategories(), id: \.CategoryName)
            {
                category in
                let isExpandedBinding = Binding<Bool>(
                    get: {timeTasksController.categoryExpansionState[category] ?? true},
                    set: {value in timeTasksController.categoryExpansionState[category] = value}
                    )
                Section(header: CategoryHeaderView(category: category, isExpanded: isExpandedBinding)) {
                    if(timeTasksController.categoryExpansionState[category] ?? true)
                       {
                        ForEach(timeTasksController.GetTasksInCategory(category: category))
                        {
                            timeTaskViewModel in
                            TimeTaskRow(timeTaskViewModel: timeTaskViewModel)
                        }
                    }
                }
            }
        }

//        List(timeTasksController.timeTaskViewModels)
//        {
//            timeTaskViewModel in
//            TimeTaskRow(timeTaskViewModel: timeTaskViewModel)
//        }
    }
}

struct TimeTasksPage_Previews: PreviewProvider {
    static var previews: some View {
        TimeTasksPage(timeTasksController: .init(tasks: [.init(Title: "Work Tasks", Desription: "Lots of cool stuff to work and learn aobut"), .init(Title: "School tasks", Desription: "Working on school assignments")]))
    }
}
