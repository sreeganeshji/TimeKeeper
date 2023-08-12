//
//  LandingPage.swift
//  Time Keeper
//
//  Created by Ganesh Bangalore on 8/12/23.
//

import SwiftUI

struct LandingPage: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab)
        {
            Text("Tab 1 Content")
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
