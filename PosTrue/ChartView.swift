//
//  ChartView.swift
//  PosTrue
//
//  Created by Asiyah Awais on 6/2/23.
//

import SwiftUI
import Foundation
import Charts

struct Session: Identifiable {
    let id = UUID()
    let seshNum: Int
    let seshAvg: Double
    let totEx: Int
    let day: String

    init(seshNum: Int, seshAvg: Double, totEx: Int, day: String) {
        self.seshNum = seshNum
        self.seshAvg = seshAvg
        self.totEx = totEx
        self.day = day
    }
}

struct ChartView: View {

    let sessions: [Session] = [
        .init(seshNum: 0, seshAvg: 3, totEx: 4, day: "Sun"),
        .init(seshNum: 1, seshAvg: 4, totEx: 3, day: "Mon"),
        .init(seshNum: 2, seshAvg: 5, totEx: 2, day: "Tue"),
        .init(seshNum: 3, seshAvg: 4.5, totEx: 3, day: "Wed"),
        .init(seshNum: 4, seshAvg: 5.5, totEx: 0, day: "Thu"),
        .init(seshNum: 5, seshAvg: 5, totEx: 1, day: "Fri"),
        .init(seshNum: 6, seshAvg: 4.5, totEx: 1, day: "Sat")
    ]


    var body: some View {
        VStack(alignment: .leading) {
            Text("Average Daily Muscle Stiffness")
                .font(.title2)
                .fontWeight(.medium)
            Chart(sessions) {
                LineMark(
                    x: .value("Session Number", $0.day),
                    y: .value("Stiffness Average", $0.seshAvg)
                )
                .interpolationMethod(.catmullRom)
            }
            Spacer()
            Text("Daily Exercise vs Muscle Stiffness")
                .font(.title2)
                .fontWeight(.medium)
            Chart(sessions) {
                PointMark(
                    x: .value("Total Exercises", $0.totEx),
                    y: .value("Stiffness Average", $0.seshAvg)
                )
            }
            
        }
        .padding()
    }
}
