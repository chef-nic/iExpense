//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Nicholas Johnson on 7/12/24.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}


