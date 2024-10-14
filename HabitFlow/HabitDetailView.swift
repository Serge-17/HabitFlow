//
//  HabitDetailView.swift
//  HabitFlow
//
//  Created by Serge Eliseev on 09.10.2024.
//

import SwiftUI

struct HabitDetailView: View {
    @Binding var habit: HabitItem
    
    var body: some View {
        VStack(spacing: 20) {
                Text(habit.name)
                    .font(.largeTitle)
                    .bold()
                Text(habit.description)
                    .font(.headline)
                Text(habit.detailedDescription)
                    .font(.body)
                
                Text("Выполнено \(habit.completionCount) раз")
                    .font(.subheadline)
                
                Button(action: {
                    habit.completionCount += 1 // Увеличиваем счетчик выполнений
                }) {
                    Text("Отметить как выполненное")
                        .padding(10)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                
            }
            .padding()
            
        }
    }
}


