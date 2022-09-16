//
//  ContentView.swift
//  ChatAppDemo
//
//  Created by kittawat phuangsombat on 2022/9/15.
//

import SwiftUI

struct ContentView: View {
    @StateObject var messageManager = MessagesManager()
   
    var body: some View {
        VStack {
            VStack {
              TitleRow()
                
                
                ScrollViewReader { proxy in
                    ScrollView {
                        ForEach( messageManager.messages, id: \.id) { message in
                            MessageBubble(message: message)
                        }
                    }
                    .padding(.top, 10)
                    .background(.white)
                .cornerRadius(30, corners: [.topLeft, .topRight])
                .onChange(of: messageManager.lastMessagedId) { id in
                    withAnimation {
                        proxy.scrollTo(id, anchor: .bottom)
                    }
                }
                }
            }
            .background(Color("Peach"))
             
            MessageFIeld()
                .environmentObject(messageManager)
        }
    }
}   

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
