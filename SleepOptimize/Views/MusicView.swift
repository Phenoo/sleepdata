//
//  MusicView.swift
//  SleepOptimize
//
//  Created by Eze Chidera Paschal on 22/08/2024.
//

import SwiftUI

struct MusicView: View {
    @State private var animateContent: Bool = false
    @State private var offsetY: CGFloat = 0
    
    @Binding var expandSheet: Bool
    var animation: Namespace.ID

    @State private var value = 11.0

    var body: some View {
        GeometryReader {
            let size = $0.size
            let safeArea = $0.safeAreaInsets
            ZStack(alignment: .top) {
                RoundedRectangle(cornerRadius: animateContent ? deviceCornerRadius : 0, style: .continuous)
                    .fill(.black)
                    .overlay {
                        Rectangle()
                            .fill(.gray.opacity(0.4))
                            .opacity(animateContent ? 1 : 0)
                    }
                    .matchedGeometryEffect(id: "BACKGROUNDVIEW", in: animation)
                
                LinearGradient(gradient: Gradient(colors: [Color.lightPurple, Color.clear]), startPoint: .top, endPoint: .bottom)
                    .frame(height: 300)
                
                
                VStack (spacing: 15) {

                    
                    GeometryReader {
                        let size = $0.size
                        Image("category1")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: size.width, height: size.height)
                            .clipShape(RoundedRectangle(cornerRadius: animateContent ? 30 : 60, style: .continuous))
                    }
                    .matchedGeometryEffect(id: "SONGCOVER", in: animation)
                    .frame(height: size.width - 50)
                    .padding(.top, size.height < 700 ? 80 : 100)

                    VStack(alignment: .center, spacing: 10) {
                        Text("Song Title")
                            .font(.title)
                            .fontWeight(.semibold)
                        
                        Text("Artist")
                            .font(.title3)
                            .foregroundStyle(.gray)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.bottom, 40)
                    
                    PlayerView(value: $value)
//                        .offset(y: offsetY)
                        .offset(y: animateContent ? 0 : size.height)
                }
                .padding(.top, safeArea.top + safeArea.bottom == 0 ? 10 : 0)
                .padding(.bottom, safeArea.bottom == 0 ? 10 : safeArea.bottom)
                .padding(.horizontal, 25)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity, alignment: .top)
                
            }
            .contentShape(Rectangle())
            .offset(y: offsetY)
            .gesture(
            DragGesture()
                .onChanged({ value in
                    let translationY = value.translation.height
                    offsetY = (translationY > 0 ? translationY : 0)
                }).onEnded({ value in
                    withAnimation(.easeInOut(duration: 0.3)) {
                        if offsetY > size.height * 0.4 {
                            expandSheet = false
                            animateContent = false
                        } else {
                            offsetY = .zero
                        }
                    }
                })
            )
        }
        .ignoresSafeArea()
        .onAppear {
            withAnimation(.easeInOut(duration: 0.35)) {
                animateContent = true
            }
        }
    }
}

struct PlayerView: View {
    @Binding var value: Double
    
    var calval: Double {
        let val = (value / 100) * 3.55
        
        return val
    }
    
    var body: some View {
        GeometryReader {
            let size = $0.size
            let spacing = $0.size.height * 0.04
            
            VStack(spacing: spacing) {
                VStack(spacing: spacing) {
                    VStack(alignment: .center, spacing: 15) {
                      
                        
                        Slider(value: $value, in: 0...100)
                        
                        HStack {
                            Text(String(format: "%.2f", calval))
                                .font(.caption)
                            Spacer()
                            Text("3.55")
                                .font(.caption)
                        }
                        
                        HStack(alignment: .center, spacing: 20) {
                            Image(systemName: "backward.end.fill")
                                .imageScale(.large)
                            
                            Image(systemName: "15.arrow.trianglehead.counterclockwise")
                                .imageScale(.medium)
                            
                            Spacer()
                            Image(systemName: "pause.fill")
                                .font(.largeTitle)
                                .padding()
                                .background(Color.lightPurple.opacity(0.5))
                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)

                            Spacer()

                            Image(systemName: "15.arrow.trianglehead.clockwise")
                                .imageScale(.medium)
                            
                            Image(systemName: "forward.end.fill")
                                .imageScale(.large)
                            
                        }

                        HStack(alignment: .center, spacing: 20) {
                            Image(systemName: "stopwatch.fill")
                                .imageScale(.large)
                            
                          
                            Spacer()
                           Text("Music")
                                .foregroundStyle(.white)
                            Spacer()

                            
                            Image(systemName: "heart")
                                .imageScale(.large)
                            
                        }
                        .padding(.top, 30)

                        
                    }
                }
            }
        }
    }
}

extension View {
    var deviceCornerRadius: CGFloat {
        let key = "_displayCornerRadius"
        
        if let screen = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.screen {
            if let cornerRadius = screen.value(forKey: key) as? CGFloat {
                return cornerRadius
            }
            
            return 0
        }
        
        return 0
    }
}


