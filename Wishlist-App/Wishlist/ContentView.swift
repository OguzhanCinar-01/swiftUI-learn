//
//  ContentView.swift
//  Wishlist
//
//  Created by Oğuzhan Cnr on 18.02.2025.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    /// Context çekmeye yarar SwiftData'ya erişim sağlar
    @Environment(\.modelContext) private var modelContext
    /// Provider benzeri sadece bu yapıdaki değişiklikleri günceller
    @Query private var wishes: [Wish]
    
    @State private var isAlertShowing: Bool = false
    @State private var title: String = ""
    
    
    var body: some View {
        NavigationStack{
            List {
                ForEach(wishes) { wish in
                    Text(wish.title)
                        .font(.title.weight(.thin)).fontDesign(.serif)
                        .padding(.vertical, 2)
                        /// Draggable
                        .swipeActions{
                            Button("Delete", role: .destructive){
                                modelContext.delete(wish)
                            }
                        }
                }
            } //: LIST
            .navigationTitle("Wishlish")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isAlertShowing.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .imageScale(.large)
                    }                }
                if wishes.isEmpty != true {
                    ToolbarItem(placement: .bottomBar) {
                        Text("\(wishes.count) wish\(wishes.count > 1 ? "es" : "")")
                }
              }
            }
            .alert("Create a new wish", isPresented: $isAlertShowing) {
                TextField("Enter a wish", text: $title)
                
                Button {
                    modelContext.insert(Wish(title: title))
                    title = ""
                } label: {
                    Text("Save")
                }
            }
            .overlay{
                if wishes.isEmpty {
                    ContentUnavailableView("My Wishlist", systemImage: "heart.circle",
                        description: Text("You don't have any wishes yet."))
                }
            }
        }
    }
}

#Preview("List with Sample Data") {
    let container = try! ModelContainer(for: Wish.self, configurations:
        ModelConfiguration(isStoredInMemoryOnly: true))
    
    container.mainContext.insert(Wish(title: "Master SwiftData"))
    container.mainContext.insert(Wish(title: "Buy a new Iphone"))
    container.mainContext.insert(Wish(title: "Practice latin dances"))
    container.mainContext.insert(Wish(title: "Travel to Europe"))
    container.mainContext.insert(Wish(title: "Make a positive impact"))
    
    return ContentView()
        .modelContainer(container)
}

#Preview("Empty List") {
    ContentView()
        .modelContainer(for: Wish.self, inMemory: true)
}
