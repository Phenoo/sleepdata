//
//  PersonalView.swift
//  SleepOptimize
//
//  Created by Eze Chidera Paschal on 23/08/2024.
//

import SwiftUI

struct PersonalView: View {
    @State private var name: String = ""
    @State private var height: String = ""
    @State private var weight: String = ""

    let options = ["Option 1", "Option 2", "Option 3", "Option 4"]

    
    var body: some View {
        NavigationStack {
            Form {
                
                VStack(alignment: .center) {
                    ZStack {
                        Image("user")
                            .resizable()
                            .scaledToFill()
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                           
                      
                   
                        Circle().fill(Color.black.opacity(0.5)).frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                        
                        HStack {
                            Image(systemName: "camera.fill")
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .foregroundStyle(.white)
                        }
                    }
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .center)
                .foregroundStyle(.white)
            .listRowBackground(Color.clear)
                
                Section("NAME"){
                    TextField("Maria", text: $name)
                        .foregroundStyle(.white)
                    .listRowBackground(Color.cardPurple)
                }
                
                
                Section("EMAIL"){
                    TextField("maria@gmail", text: $name)
                        .foregroundStyle(.white)
                        .tint(.white)
                }
                .foregroundStyle(.white)
                .listRowBackground(Color.cardPurple)
       
                Picker("Gender", selection: $weight) {
                    Text("Female")
                    Text("Male")
                    
                    
                }
                .foregroundStyle(.white)
                .pickerStyle(.navigationLink)
                .foregroundStyle(.white)
            .listRowBackground(Color.cardPurple)
                
                Picker("Height", selection: $height) {
                    ForEach(options, id: \.self) { option in
                        Text(option)
                            .foregroundStyle(.white)
                    }
                }.pickerStyle(.navigationLink)
                    .foregroundStyle(.white)
                .listRowBackground(Color.cardPurple)
                Picker("Weight", selection: $height) {
                    ForEach(options, id: \.self) { option in
                        Text(option)
                            .foregroundStyle(.white)
                    }
                }.pickerStyle(.navigationLink)
                    .foregroundStyle(.white)
                .listRowBackground(Color.cardPurple)
            
            

                
                
            }
         
            .foregroundStyle(.white)
            .listRowBackground(Color.cardPurple)
            .scrollContentBackground(.hidden)
            .background(Color.darkPurple)
            .navigationTitle("Personal Information")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    PersonalView().preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
}
