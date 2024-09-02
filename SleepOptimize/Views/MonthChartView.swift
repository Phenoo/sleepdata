//
//  MonthChartView.swift
//  SleepOptimize
//
//  Created by Eze Chidera Paschal on 28/08/2024.
//


import SwiftUI
import Charts

struct CalculatedMonthlySalesChartView: View {
    @ObservedObject var salesViewModel: SalesViewModel
    var body: some View {
        Chart(salesViewModel.salesByMonth, id: \.day) {
            BarMark(
                x: .value("Month", $0.day, unit: .month),
                y: .value("Sales", $0.sales)
            )
            .foregroundStyle(.blue.gradient)
        }
    }
}

// you can simple give all data to the chart
// tell it to use a unit of month
// and it automically collects all data points for each month

struct MonthChartView: View {
    
    @ObservedObject var salesViewModel: SalesViewModel
    
    var body: some View {
        Chart(salesViewModel.salesData) {
            BarMark(
                x: .value("Month", $0.saleDate, unit: .month),
                y: .value("Sales", $0.quantity)
            )
            .foregroundStyle(Color.lightPurple.gradient)
            .interpolationMethod(.catmullRom)
        }
        .chartXAxis {
            AxisMarks(values: .stride(by: .month)) { _ in
                AxisGridLine()
                AxisTick()
                AxisValueLabel(format: .dateTime.month(.abbreviated), centered: true)
            }
        }
        .chartYAxis {
            AxisMarks(position: .leading)
        }
    
    }
}

#Preview {
    VStack{
        MonthChartView(salesViewModel: .preview)
            .aspectRatio(1, contentMode: .fit)
        
    }
        .padding()
}
