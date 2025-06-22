//
//  ContentView.swift
//  Grocery List
//
//  Created by Oğuzhan Cnr on 16.06.2025.
//

import SwiftUI
import SwiftData
import TipKit

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    
    @State private var item: String = ""
    
    @FocusState private var isFocused: Bool
    
    let buttonTip = ButtonTip()
    
    func setupTips() {
        do{
            try Tips.resetDatastore()
            Tips.showAllTipsForTesting()
            try Tips.configure([
                .displayFrequency(.immediate)
            ])
        } catch {
            print("Error init TipKit: \(error.localizedDescription)")
        }
    }
    
    init() {
        setupTips()
    }
        
    
    func addEssentialFoods() {
        modelContext.insert(Item(title: "Bakery & Bread", isCompleted: false))
        modelContext.insert(Item(title: "Meat & Seafood", isCompleted: true))
        modelContext.insert(Item(title: "Cheese & Eggs", isCompleted: .random()))
        modelContext.insert(Item(title: "Pasta & Rice", isCompleted: .random()))
        modelContext.insert(Item(title: "Cereals & Snacks", isCompleted: .random()))
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(items) { item in
                    Text(item.title)
                        .font(.title3.weight(.light))
                        .padding(.vertical, 4)
                        .foregroundStyle(item.isCompleted ? Color.accentColor : Color.primary)
                        .strikethrough(item.isCompleted)
                        .italic(item.isCompleted)
                        .swipeActions {
                            Button(role: .destructive) {
                                withAnimation {
                                    modelContext.delete(item)
                                }
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                        }
                        .swipeActions(edge: .leading) {
                            Button("Done", systemImage: item.isCompleted == false ? "checkmark.circle" : "x.circle") {
                                item.isCompleted.toggle()
                            }
                            .tint(item.isCompleted == false ? .green : .accentColor)
                        }
                }
            }
            .navigationTitle("Grocery List")
            .toolbar {
                if items.isEmpty {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            addEssentialFoods()
                        } label: {
                            Image(systemName: "carrot")
                        }
                        .popoverTip(buttonTip)
                    }
                }
            }
            // MARK: - Textfield
            .safeAreaInset(edge: .bottom) {
                VStack (spacing: 12) {
                    TextField("", text: $item)
                        .textFieldStyle(.plain)
                        .padding(8)
                        .background(.tertiary)
                        .cornerRadius(12)
                        .font(.title.weight(.light))
                        .focused($isFocused)
                    
                    Button {
                        guard !item.isEmpty else { return }
                        let newItem = Item(title: item, isCompleted: false)
                        modelContext.insert(newItem)
                        item = ""
                        isFocused = false
                    } label: {
                        Text("Save")
                            .font(.title2.weight(.light))
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.roundedRectangle)
                    .controlSize(.large)
                }
                .padding()
                .background(.bar)
            }
            .overlay {
                if items.isEmpty {
                    ContentUnavailableView("Empty Cart", systemImage: "cart.fill", description: Text("Add some items to the shopping cart!"))
                }
            }
        }
    }
}


#Preview("Sample Data") {
    let sampleData: [Item] = [
        Item(title: "Bakery & Bread", isCompleted: false),
        Item(title: "Meat & Seafood", isCompleted: true),
        Item(title: "Cheese & Eggs", isCompleted: .random()),
        Item(title: "Pasta & Rice", isCompleted: .random()),
        Item(title: "Cerals & Snacks", isCompleted: .random())
    ]
    
    let container = try! ModelContainer(for: Item.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
    
    for item in sampleData {
        container.mainContext.insert(item)
    }
    
   return ContentView()
        .modelContainer(container)
       
}

#Preview ("Empty List") {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
