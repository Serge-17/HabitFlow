//
//  ContentView.swift
//  HabitFlow
//
//  Created by Serge Eliseev on 09.10.2024.
//
import SwiftUI


struct HabitItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let description: String
    let detailedDescription: String
    var completionCount: Int = 0

}


@Observable
class Habits {
    var items = [HabitItem]() {
        didSet {
            // Сохранение изменений в UserDefaults, если массив изменился.
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    // Инициализатор, который загружает данные из UserDefaults, если они доступны.
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            // Декодирование сохраненных данных и их присвоение массиву items.
            if let decodedItems = try? JSONDecoder().decode([HabitItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }

        items = []
    }
}

struct ContentView: View {
    @State private var habits = Habits()
    @State private var showingAddHabit = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(habits.items) { item in
                    NavigationLink(destination: HabitDetailView(habit: Binding(
                        get: { item },
                        set: { updated in
                            if let index = habits.items.firstIndex(where: { $0.id == updated.id }) {
                                habits.items[index] = updated // Обновляем привычку в списке
                            }
                        }
                    ))) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                Text(item.description)
                            }
                            Spacer()
                        }
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("Habit Flow")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button("Добавить привычку", systemImage: "widget.medium.badge.plus") {
                    showingAddHabit = true
                }
            }
        }
        .sheet(isPresented: $showingAddHabit) {
            HabitCreate(habits: habits)
        }
    }

    func removeItems(at offsets: IndexSet) {
        habits.items.remove(atOffsets: offsets)
    }
}

#Preview {
        ContentView()
    }




//Cоздать приложение для отслеживания привычек
//чтобы люди могли следить за тем, как часто они делают определённые вещи
//изучение языка, игра на музыкальном инструменте, физические упражнения
//должен быть список всех действий, которые они хотят отслеживать,
//форма для добавления новых действий — достаточно названия и описания.


//Dop
//при нажатии на одно из действий должен открываться экран с подробным описанием.
//чтобы на экране с подробным описанием отображалось, сколько раз они выполнили это
//кнопка, увеличивающая количество выполненных действий.
