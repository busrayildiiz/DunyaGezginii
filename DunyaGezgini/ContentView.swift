//
//  ContentView.swift
//  DunyaGezgini
//
//  Created by MacBook Pro on 9.10.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var fahrenheitValue : String = ""
    @State var isVisible = false
    
    let numberFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            numberFormatter.minimumFractionDigits = 0
            numberFormatter.maximumFractionDigits = 2
        return numberFormatter
    }()
    
   
    func convertToCelcius() -> String {
        if let value = Double(fahrenheitValue){
            
            let fahrenheit = Measurement<UnitTemperature>(value: value, unit: .fahrenheit)
            
            let celciusValue = fahrenheit.converted(to: .celsius)
            
            return numberFormatter.string(from: NSNumber(value: celciusValue.value)) ?? "???"
        } else {
            return "???"
        }
    }
    
    var body: some View {
        VStack {
            TextField("CONVERSION_TEXT_FIELD", text: $fahrenheitValue).font(Font.system(size:64.0 )).multilineTextAlignment(.center)
                .keyboardType(.decimalPad)
            Text("CONVERSION_FAHRENHEIT")
            Text("CONVERSION_IS_ACTUALLY").foregroundColor(.gray )
            Text(convertToCelcius())
            Text("CONVERSION_DEGREES_CELCIUS")
            Spacer()
        }
            .font(.title)
            .foregroundColor(.orange)
            .padding()
            .opacity(isVisible ? 1.0 : 0.0)
            .offset(x: 0,y: isVisible ? 0 : 20)
            .animation(.easeOut(duration:2.0))
            .onAppear{
                self.isVisible = true
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
