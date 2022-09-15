//
//  Message.swift
//  ChatAppDemo
//
//  Created by kittawat phuangsombat on 2022/9/15.
//

import Foundation

struct Message: Identifiable,Codable {
    var id: String
    var text: String
    var received: Bool
    var timestamp: Date
}
