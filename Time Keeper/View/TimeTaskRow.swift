//
//  TimeTaskRow.swift
//  Time Keeper
//
//  Created by Ganesh Bangalore on 8/12/23.
//

import SwiftUI

struct TimeTaskRow: View {
    @ObservedObject var timeTaskViewModel: TimeTaskViewModel
    
    var body: some View {
        HStack{
            VStack(alignment:.leading)
            {
                Text(timeTaskViewModel.task.Title)
                    .font(.title2)
                Text(timeTaskViewModel.task.Description)
                    .lineLimit(1)
                    .truncationMode(.tail)
            }
            Spacer()
            Text("23:12")
            Button(action:
            {
                if(timeTaskViewModel.isRunning)
                {
                    
                }
                else
                {
                    
                }
            })
            {
                Image(systemName: timeTaskViewModel.isRunning ? "play.fill" : "stop.fill")
            }
        }
        .frame(height: 50)
//        .padding(.horizontal)
    }
}

struct TimeTaskRow_Previews: PreviewProvider {
    static var previews: some View {
        TimeTaskRow(timeTaskViewModel: TimeTaskViewModel.init(task:.init(Title: "Coding tasks", Desription: "Doing some coding for fun! There's just so much to say on this") ))
    }
}
