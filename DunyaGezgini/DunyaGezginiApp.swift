//
//  DunyaGezginiApp.swift
//  DunyaGezgini
//
//  Created by MacBook Pro on 9.10.2022.
//

import SwiftUI

@main
struct DunyaGezginiApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                ContentView()
                    .tabItem {
                        HStack {
                            Image(systemName: "thermometer")
                            Text("TAB_CONVERSION")
                        }
                    }
                MapView()
                    .tabItem {
                        HStack {
                            Image(systemName: "map")
                            Text("TAB_MAP")
                        }
                    }
            }.accentColor(.orange)
        }
    }
}

