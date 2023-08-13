//
//  CategoryHeaderView.swift
//  Time Keeper
//
//  Created by Ganesh Bangalore on 8/12/23.
//

import SwiftUI

struct CategoryHeaderView: View {
    let category: TaskCategory
    @Binding var isExpanded: Bool
    
    var body: some View {
        HStack
        {
            Text(category.CategoryName)
                .foregroundColor(category.CategoryColor)
            Spacer()
            Button(action: {
                isExpanded.toggle()
            }) {
                Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                    .foregroundColor(category.CategoryColor)
            }
        }
    }
}

struct CategoryHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHeaderView(category: .init(Id: 1, CategoryName: "Work stuff", CategoryColor: .blue), isExpanded: .constant(true))
    }
}
