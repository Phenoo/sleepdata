//
//  ClockView.swift
//  SleepOptimize
//
//  Created by Eze Chidera Paschal on 22/08/2024.
//

import SwiftUI
import Combine

class CurrentTime: ObservableObject {
    @Published var seconds = Double.zero
    
    private let timer = Timer.publish(every: 0.016, on: .main, in: .common).autoconnect()
    private var cancellableSet = Set<AnyCancellable>()
    
    init() {
        timer.map { date in
            let components = Calendar.current.dateComponents([.year, .month, .day], from: date)
            let referenceDate = Calendar.current.date(
                from: DateComponents(
                    year: components.year,
                    month: components.month,
                    day: components.day
                )
            )!
            return Date().timeIntervalSince(referenceDate)
        }
        .assign(to: \.seconds, on: self)
        .store(in: &cancellableSet)
    }
}

struct ClockView: View {
    
    @ObservedObject var currentTime = CurrentTime()
    var body: some View {
        ZStack {
            Circle().stroke(Color.lightPurple, lineWidth: 8)
            ForEach(0..<60) { tick in
                VStack {
                    Rectangle()
                        .fill(Color.lightPurple)
                        .opacity(1)
                        .frame(width: 2, height: tick & 5 == 0 ? 15 : 7)
                    Spacer()
                }
                .rotationEffect(.degrees(Double(tick)/60 * 360))
            }
            
            ForEach(1..<13) { tick in
                VStack {
                    Text("\(tick)")
                        .font(.headline)
                        .foregroundStyle(Color.lightPurple)
                        .rotationEffect(.degrees(-Double(tick)/12 * 360))
                    Spacer()
                }
                .rotationEffect(.degrees(Double(tick)/12 * 360))
            }
            .padding(20)
            
            //hand
            
            // sencod
                      Hand(angleMultipler: currentTime.seconds.remainder(dividingBy: 60) / 60, scale: 0.5)
                          .stroke(.red, lineWidth: 1)
                      // minute
                      Hand(angleMultipler:  currentTime.seconds/60 / 60, scale: 0.4)
                          .stroke(lineWidth: 2)
                      // hour
                      Hand(angleMultipler: currentTime.seconds / (60 * 12) / 60, scale: 0.2)
                          .stroke(lineWidth: 4)
            
            ZStack {
                Circle()
                    .fill(Color.lightPurple)
                    .frame(width: 8, height: 8)
                Circle()
                    .fill(Color.lightPurple)
                    .frame(width: 4, height: 4)
            }
            
        }
        .frame(width: 250, height: 250)
       
    }
}

struct Hand: Shape {
    let angleMultipler: CGFloat
    let scale: CGFloat
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            let length = rect.width
            let center = CGPoint(x: rect.midX, y: rect.midY)
            
            path.move(to: center)
            
            let angle = CGFloat.pi/2 - CGFloat.pi * 2 * angleMultipler
            
            path.addLine(to: CGPoint(
                x: rect.midX + cos(angle) * length * scale,
                y: rect.midY + sin(angle) * length * scale
            ))
        }
    }
}

#Preview {
    ClockView()
}
