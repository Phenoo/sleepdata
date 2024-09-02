//
//  ChartTestView.swift
//  SleepOptimize
//
//  Created by Eze Chidera Paschal on 23/08/2024.
//

import SwiftUI
import Charts

struct ProfitByCategory: Hashable {
    let department: String
    let profit: Double
    let productCategory: String
}


struct SalesData {
    var day: Date
    var sales: Double
    
    static var last365Days: [SalesData] {
        var data = [SalesData]()
        let calendar = Calendar.current
        let startDate = calendar.startOfDay(for: Date().addingTimeInterval(-3600 * 24 * 365))
        for i in 0..<365 {
            if let date = calendar.date(byAdding: .day, value: i, to: startDate) {
                let sales = Double.random(in: 100...1000) // Random sales between 100 and 1000
                data.append(SalesData(day: date, sales: sales))
            }
        }
        return data
    }
}


struct ChartTestView: View {
    let data: [ProfitByCategory] = [
        ProfitByCategory(department: "Production", profit: 4000, productCategory: "Gizmos"),
        ProfitByCategory(department: "Production", profit: 5000, productCategory: "Gadgets"),
        ProfitByCategory(department: "Production", profit: 6000, productCategory: "Widgets"),
    ]

    @State private var scrollPosition = Date()

    var body: some View {
        ZStack {
            Color.darkPurple
            Chart {
                ForEach(SalesData.last365Days, id: \.day) { data in
                    BarMark(
                        x: .value("Day", data.day, unit: .day),
                        y: .value("Sales", data.sales),
                        width: 20,
                        stacking: .standard
                    )
                    .position(by: .value("Day", data.day))
                    
                    
                }
                .foregroundStyle(Color.lightPurple)
            }
            .chartScrollableAxes(.horizontal)
            .chartXVisibleDomain(length: 3600 * 24 * 30)
            .chartScrollPosition(x: $scrollPosition)
            .chartScrollTargetBehavior(
                .valueAligned(
                    matching: DateComponents(hour: 0),
                    majorAlignment: .matching(DateComponents(day: 1))
                )
            )

        }
    }
}


#Preview {
    ChartTestView()
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
}
