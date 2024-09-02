//
//  RelaxView.swift
//  SleepOptimize
//
//  Created by Eze Chidera Paschal on 20/08/2024.
//

import SwiftUI

struct RelaxView: View {
 
    
    let categories: [Category] = [
        Category(name: "Calm Harmonies", items: [Item(image: "category1", title: "Aurora"), Item(image: "category2", title: "Northern light"), Item(image: "category3", title: "Light breeze")]),
        Category(name: "Slumber symphony", items: [Item(image: "category4", title: "City rain"), Item(image: "category5", title: "Peaceful "), Item(image: "category1", title: "Aurora")]),
        Category(name: "Relaxing Rhythms", items: [Item(image: "category7", title: "Aurora"), Item(image: "category8", title: "Aurora"), Item(image: "category1", title: "Aurora")])
    ]
    
    var body: some View {
        NavigationSplitView {
      
                List {
                    HStack {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                    Text("Sounds")
                                        .font(.subheadline)
                                        .fontWeight(.semibold)
                                        .foregroundStyle(.black)
                                        .padding(10)
                                        .background(Color.lightPurple)
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                })
                                FilterButton(text: "Music")
                                FilterButton(text: "Stories")
                                FilterButton(text: "Meditation")
                            }
                        }
                    }
                    .listRowBackground(Color.darkPurple)
                    .listRowSeparator(.hidden)

                    
                    ForEach(categories, id: \.self) { category in
                        Section(category.name) {
                            CategoryView(category: category)
                                .listRowBackground(Color.darkPurple)
                                .listRowSeparator(.hidden)

                        }
                        .foregroundStyle(.white)
                        .font(.headline)
                        .fontWeight(.semibold)
                    }
                }
                .navigationTitle("Relax")
                .navigationBarTitleDisplayMode(.inline)
                .foregroundColor(.white)
                .listRowSeparator(.hidden)
                .listRowBackground(Color.darkPurple)
                .listStyle(.inset)
                .scrollIndicators(.hidden)
                .scrollContentBackground(.hidden)
                .background(Color.darkPurple)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Image(systemName: "bolt.heart.fill")
                            .foregroundStyle(.white)
                    }
                }
             
                
        } detail: {
            Text("Select a song")
        }
        

    }
}

struct FilterButton: View {
    let text: String
    
    var body: some View {
        Button(action: {}, label: {
            Text(text)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                .padding(10)
                .background(Color.cardPurple)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        })
    }
}

#Preview {
    RelaxView()
        .preferredColorScheme(.dark)
}
