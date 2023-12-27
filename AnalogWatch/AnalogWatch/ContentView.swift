//
//  ContentView.swift
//  AnalogWatch
//
//  Created by PHN MAC 1 on 27/12/23.
//

import SwiftUI

struct ClockView: View {
    @State private var currentTime = Date()

    var body: some View {
        ZStack{
            VStack {
                Text("Analog Clock")
                    .font(.largeTitle)

                Spacer()

                // Clock face
                ZStack {
                   
                    Image(.clockBg)
                        .resizable()
                        .frame(width: 330, height: 320)
                        .shadow(color: .black, radius: 5)
                    
                    Circle()
                        .fill(.black)
                        .frame(width: 13, height: 13)

                   // Second hand
                    Image(.second)
                        .resizable()
                        .frame(width: 5, height: 100)
                        .rotationEffect(Angle(degrees: Double(Calendar.current.component(.second, from: currentTime)) * 6.0), anchor: .bottom)
                        .offset(.init(width: 0, height: -50))
                        .shadow(color: .gray, radius: 5)

                    // Minute hand
                    Image(.minute)
                        .resizable()
                        .frame(width: 10, height: 80)
                        .rotationEffect(Angle(degrees: Double(Calendar.current.component(.minute, from: currentTime)) * 6.0), anchor: .bottom)
                        .offset(.init(width: 0, height: -40))
                        .shadow(color: .gray, radius: 5)
                       

              //       Hour hand
                    Image(.hour)
                        .resizable()
                        .frame(width: 15, height: 60)
                        .rotationEffect(Angle(degrees: Double(Calendar.current.component(.day, from: currentTime)) * 6.0), anchor: .bottom)
                        .offset(.init(width: 0, height: -30))
                        .shadow(color: .gray, radius: 5)
                }
                .onAppear {
                    Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                        currentTime = Date()
                    }
                }

                // Digital time display
                Text(getDateTime().date)
                    .font(.title)
                    .padding()
                
                Text(getDateTime().time)
                    .font(.system(size: 25, weight: .semibold))

                Spacer()
            }
        }
    }
        

    private func getDateTime() -> (date: String, time: String){
        var date: String = ""
        var time: String = ""
        
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMM d, yyyy"
        date = formatter.string(from: currentTime)
        
        formatter.dateFormat = "hh:mm a"
        time = formatter.string(from: currentTime)
        
        return (date, time)
    }
}


#Preview {
    ClockView()
}
