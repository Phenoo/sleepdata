//
//  CategoryView.swift
//  SleepOptimize
//
//  Created by Eze Chidera Paschal on 22/08/2024.
//

import SwiftUI

struct CategoryView: View {
    
    let category: Category
    
    var body: some View {
        VStack(alignment: .leading) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(category.items, id: \.self) { item in
                        CategoryIteView(item: item)
                    }
                }
            }
        }
    }
}

struct CategoryIteView: View {
    let item: Item
    
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .topTrailing) {
                Image(item.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 160, height: 150)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                
                Button(action: {}, label: {
                    Image(systemName: "heart")
                        .font(.title2)
                        .padding(8)
                        .foregroundStyle(.white)
                        .background(Color.black.opacity(0.5))
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)

                })
                .padding(4)
            }
            .overlay(alignment: .bottom) {
                VStack {
                    Text("35 min")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .padding(6)
                        .background {
                            RoundedRectangle(cornerRadius: 5).fill(Color.black.opacity(0.5))
                        }
                        .frame(width: 80)
                }
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                    .padding(.vertical, 8)
            }
            
            Text(item.title)
                .font(.subheadline)
                .fontWeight(.semibold)
        }
    }
}
