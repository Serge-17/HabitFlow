//
//  HabitCreate.swift
//  HabitFlow
//
//  Created by Serge Eliseev on 09.10.2024.
//

import SwiftUI

struct HabitCreate: View {
    @State private var name: String = ""  // Initialize the state variable
    @State private var description: String = ""
    @State private var detailedDescription: String = ""
    
    @Environment(\.dismiss) var dismiss

    var habits: Habits
    
    var body: some View {
        NavigationStack {
            Form {
                
                Section {
                    TextField("Add a new habit", text: $name)  // Bind to the state variable
                }
                
                Section {
                    TextField("Add description", text: $description)
                }
                
                Section {
                    TextField("Detailed description", text: $detailedDescription)
                }
                
            }
            .navigationTitle("New Habit")  // Optional navigation title
            .navigationBarTitleDisplayMode(.inline)

            .toolbar {

                Button("Save") {
                    //Создание нового элемента расхода и добавление его в список.
                    let item = HabitItem(name: name, description: description, detailedDescription: detailedDescription)
                    habits.items.append(item)
                    dismiss()
                }
            }
        }
    }
       
}

#Preview {
    HabitCreate(habits: Habits())
}
