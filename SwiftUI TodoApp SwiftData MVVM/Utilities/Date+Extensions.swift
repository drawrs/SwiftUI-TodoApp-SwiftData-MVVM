//
//  Date+Extensions.swift
//  SwiftUI TodoApp SwiftData MVVM
//
//  Created by Rizal Hilman on 08/07/24.
//

import Foundation

extension Date {
    func formattedString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE d, MMMM"
        return formatter.string(from: self)
    }
}
