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
        var results = ""
        if firstUnit == secondUnit {
            results = temp
        } else if true {
            
        }
        return results
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Temperture to convertify")){
                     TextField("Temperture", text: $temp)
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
