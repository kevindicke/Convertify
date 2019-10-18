//
//  ContentView.swift
//  Convertify
//
//  Created by Kevin Dicke on 10/14/19.
//  Copyright © 2019 Spritztour. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var firstUnit = 0
    @State private var secondUnit = 1
    @State private var temp = "0"
    
    
    let volumeUnits = ["Celsius", "Fahrenheit", "Kelvin"]
    
    var convertified : String {
        let doubleTemp = Float(temp) ?? 0
        var results = ""
        if firstUnit == secondUnit {
            results = temp
        } else if firstUnit == 0 && secondUnit == 1 {
            return String((doubleTemp * 1.8) + 32)
        } else if firstUnit == 0 && secondUnit == 2 {
            return String(doubleTemp + 273.15)
        } else if firstUnit == 1 && secondUnit == 0 {
            return String((doubleTemp - 32) / 1.8)
        } else if firstUnit == 1 && secondUnit == 2 {
            return String((((doubleTemp - 32) * 5) / 9) + 273.15)
        } else if firstUnit == 2 && secondUnit == 0 {
            return String(doubleTemp - 273.15)
        } else if firstUnit == 2 && secondUnit == 1 {
            return String(((doubleTemp - 273.15) * 1.8) + 32)
        }
        return results
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Temperature to convertify")){
                     TextField("Temperature", text: $temp)
                        .keyboardType(.decimalPad)
                }
                Section(header: Text("From")){
                    Picker(volumeUnits[firstUnit], selection: $firstUnit) {
                        ForEach(0 ..< volumeUnits.count){
                            Text("\(self.volumeUnits[$0].capitalized)")
                        }
                    }
                .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("To")){
                     Picker(volumeUnits[firstUnit], selection: $secondUnit) {
                           ForEach(0 ..< volumeUnits.count){
                               Text("\(self.volumeUnits[$0].capitalized)")
                           }
                       }
                   .pickerStyle(SegmentedPickerStyle())
                }
                Text("\(convertified)°")
                
            }
            .navigationBarTitle("Convertify", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
