//
//  ContentView.swift
//  English_Project
//
//  Created by Leonardo Mesquita Alves on 17/12/23.
//

import SwiftUI
import SwiftData
import AVFoundation

struct ContentView: View {
    @Environment(\.modelContext) private var context
    @Query(sort: \Item.date, order: .reverse) private var items: [Item]
    private var filteredItems: [Item]{
        guard !vm.searchItem.isEmpty else { return items }
        return items.filter{ $0.name.localizedCaseInsensitiveContains(vm.searchItem) || $0.descrip.localizedCaseInsensitiveContains(vm.searchItem)}
    }
    @Bindable var vm: contentViewModel = contentViewModel()
    
    var body: some View {
        NavigationStack {
            Group{
                List{
                    ForEach(filteredItems) { item in
                        NavigationLink{
                            EditItemView(item: item)
                        } label: {
                            ListCell(item: item)
                        }
                        .swipeActions(edge: .leading, allowsFullSwipe: false){
                            Button{
                                
                                vm.speak(item.name)
                                
                            } label: {
                                Image(systemName: "speaker.3.fill")
                            }
                        }
                    }.onDelete { indexSet in
                        indexSet.forEach { index in
                            let item = items[index]
                            context.delete(item)
                        }
                    }
                    
                }.listStyle(.plain)
                    .overlay{
                        if items.isEmpty {
                            ContentUnavailableView("No Words", systemImage: "pencil.and.list.clipboard", description: Text("You need to add a new word!"))
                        }
                    }
                
            }.navigationTitle("^[\(items.count) word](inflect: true)")
                .toolbar{
                    ToolbarItem(placement: .topBarTrailing){
                        Menu{
                            Button("Info"){
                                vm.info = true
                            }
                            Picker("Voice velocity", selection: $vm.velocity){
                                Button("Slow"){
                                    vm.velocity = 0.1
                                }
                                Button("Normal"){
                                    vm.velocity = 0.3
                                }
                                Button("Fast"){
                                    vm.velocity = 0.6
                                }
                            }.pickerStyle(.menu)
                            
                        } label: {
                            Image(systemName: "ellipsis.circle")
                        }
                        
                    }
                    
                }
                .toolbar{
                    Button{
                        vm.newItem = true
                        
                    } label: {
                        Image(systemName: "plus.square.fill")
                    }
                    
                    
                }
                .searchable(text: $vm.searchItem, placement: .navigationBarDrawer(displayMode: .automatic), prompt: "Search a word/phrase")
            
        }
        .sheet(isPresented: $vm.newItem){
            CreateNewItemView()
            
        }.sheet(isPresented: $vm.info){
            InfoView()
                .presentationDetents([.fraction(0.28)])
            
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}


