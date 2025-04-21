//
//  Final_AppApp.swift
//  Final App
//
//  Created by Aidan J. Neff on 4/21/25.
//

import SwiftUI

@main
struct MyApp: App {
    
    @StateObject var termOrDef = TermOrDef()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(termOrDef)
        }
    }
}
