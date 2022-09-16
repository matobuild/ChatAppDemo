//
//  ChatAppDemoApp.swift
//  ChatAppDemo
//
//  Created by kittawat phuangsombat on 2022/9/15.
//

import SwiftUI
import Firebase


@main
struct ChatAppDemoApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
