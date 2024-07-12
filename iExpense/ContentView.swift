//
//  ContentView.swift
//  iExpense
//
//  Created by Nicholas Johnson on 7/12/24.
//

import SwiftUI

struct ContentView: View {
    @State private var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationStack {
            List {
                Section("Personal") {
                    ForEach(expenses.personalItems, id: \.id) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                Text(item.type)
                            }
                            
                            Spacer()
                            AmountText(amount: item.amount)
                        }
                    }
                    .onDelete(perform: removePersonalItems)
                }
                Section("Business") {
                    ForEach(expenses.businessItems, id: \.id) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                Text(item.type)
                            }
                            
                            Spacer()
                            AmountText(amount: item.amount)
                        }
                    }
                    .onDelete(perform: removeBusinessItems)
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button("Add Expense", systemImage: "plus") {
                    showingAddExpense.toggle()
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
    
    func removeBusinessItems(at offsets: IndexSet) {
        expenses.businessItems.remove(atOffsets: offsets)
    }
    
    func removePersonalItems(at offsets: IndexSet) {
        expenses.personalItems.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}

struct AmountText: View {
    var amount: Double
    
    var body: some View {
        
        if amount < 10 {
            Text(amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                .foregroundStyle(.green)
        } else if amount >= 10 && amount <= 20 {
            Text(amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                .foregroundStyle(.yellow)
        } else {
            Text(amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                .foregroundStyle(.red)
        }
    }
}
