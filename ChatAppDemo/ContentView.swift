//
//  ContentView.swift
//  ChatAppDemo
//
//  Created by kittawat phuangsombat on 2022/9/15.
//

import SwiftUI

struct ContentView: View {
    var messageArray = ["hellp", "how r u ", "i goo"," hthat good   "]
    
    
    var body: some View {
        VStack {
          TitleRow()
            
            ScrollView {
                ForEach( messageArray, id: \.self) { text in
                    MessageBubble(message: Message(id: "1222", text: text, received: true, timestamp: Date() ))
                }
            }
            .padding(.top, 10)
            .background(.white)
            .cornerRadius(30, corners: [.topLeft, .topRight])
        }
        .background(Color("Peach"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
