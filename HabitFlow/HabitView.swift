//
//  HabitView.swift
//  HabitFlow
//
//  Created by Serge Eliseev on 09.10.2024.
//

import SwiftUI


// Модель данных для привычки
struct Habit: Identifiable {
    let id: UUID = .init()
    let name: String
    let description: String
}

// Представление для отображения привычки
struct HabitView: View {
    let habit: Habit
    
    var body: some View {
        NavigationStack {
            List {
                Text(habit.name)
                //Text(habit.description)
            }
            .navigationTitle(habit.name)
        }
    }
}

// Пример использования в превью
#Preview {
    HabitView(habit: Habit(name: "Изучение языка", description: "Практиковать 30 минут каждый день"))
}
