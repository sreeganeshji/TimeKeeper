//
//  Category.swift
//  Time Keeper
//
//  Created by Ganesh Bangalore on 8/12/23.
//

import Foundation
import SwiftUI

public struct TaskCategory: Codable
{
    public var CategoryName: String
    
    public var CategoryColor: Color
    
    enum CodingKeys: String, CodingKey
    {
        case CategoryName
        case CategoryColor
    }
    
    init(CategoryName: String, CategoryColor: Color) {
        self.CategoryName = CategoryName
        self.CategoryColor = CategoryColor
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        CategoryName = try container.decode(String.self, forKey: .CategoryName)

        // Decode the color components and create a Color
        let colorComponents = try container.decode([CGFloat].self, forKey: .CategoryColor)
        CategoryColor = Color(UIColor(red: colorComponents[0], green: colorComponents[1], blue: colorComponents[2], alpha: colorComponents[3]))
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(CategoryName, forKey: .CategoryName)

        // Convert the Color to RGBA components
        let uiColor = UIColor(CategoryColor)
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
        uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        let colorComponents = [red, green, blue, alpha]
        try container.encode(colorComponents, forKey: .CategoryColor)
    }
}

