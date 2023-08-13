//
//  LandingPage.swift
//  Time Keeper
//
//  Created by Ganesh Bangalore on 8/12/23.
//

import SwiftUI

struct LandingPage: View {
    @State private var selectedTab = 0
    
    let tasks: [TimeTask] = [.init(Title: "Work Tasks", Desription: "Lots of cool stuff to work and learn aobut"), .init(Title: "School tasks", Desription: "Working on school assignments")]
    
    var body: some View {
        TabView(selection: $selectedTab)
        {
            TimeTasksPage(timeTasksController: .init(tasks: tasks))
                 .tabItem {
                     Image(systemName: "1.circle")
                     Text("Tab 1")
                 }
                 .tag(0)
             
             Text("Tab 2 Content")
                 .tabItem {
                     Image(systemName: "2.circle")
                     Text("Tab 2")
                 }
                 .tag(1)
             
             Text("Tab 3 Content")
                 .tabItem {
                     Image(systemName: "3.circle")
                     Text("Tab 3")
                 }
                 .tag(2)
         }
    }
}

struct LandingPage_Previews: PreviewProvider {
    static var previews: some View {
        LandingPage()
    }
}
