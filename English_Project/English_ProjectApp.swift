//
//  English_ProjectApp.swift
//  English_Project
//
//  Created by Leonardo Mesquita Alves on 17/12/23.
//

import SwiftUI

@main
struct English_ProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Item.self)
    }
}
