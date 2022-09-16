//
//  MessagesManager.swift
//  ChatAppDemo
//
//  Created by kittawat phuangsombat on 2022/9/16.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class MessagesManager: ObservableObject {
    @Published private(set) var messages: [Message] = []
    @Published private(set) var lastMessagedId = ""
    
    let db = Firestore.firestore()
    
    init() {
        getMessages()
    }
    
    func getMessages() {
        //attach a listener
        db.collection("messages").addSnapshotListener { querySnapShot, error in
            guard let documents = querySnapShot?.documents else {
                print("Error fetching documents: \(String(describing: error))")
                return
            }
            
            self.messages = documents.compactMap{ document -> Message? in
                do {
                    return try document.data(as: Message.self)
                } catch {
                    print("Error decoding document into Message: \(error)")
                    return nil
                }
            }
            
            //sort message in to time order
            self.messages.sort { $0.timestamp < $1.timestamp }
            
            //get last message
            if let id = self.messages.last?.id {
                self.lastMessagedId = id
            }
        }
    }
    
    
    func sendMessage(text: String)  {
        do {
            let newMessage = Message(id: "\(UUID())", text: text, received: false, timestamp: Date())
            
            try db.collection("messages").document().setData(from: newMessage)
        } catch {
            print("Error adding message to Firestore: \(error)")
        }
    }
}
