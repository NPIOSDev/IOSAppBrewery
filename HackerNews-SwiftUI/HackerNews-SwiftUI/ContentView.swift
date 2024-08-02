//
//  ContentView.swift
//  HackerNews-SwiftUI
//
//  Created by Nelson on 30/7/2024.
//

import SwiftUI

//let posts = [
//    Post(id: "1", title: "hello"),
//    Post(id: "2", title: "hello1"),
//    Post(id: "3", title: "hello2")
//]

struct ContentView: View {
    @ObservedObject var networkManger = NetworkManager()
    
    var body: some View {
        NavigationView {
            if networkManger.posts.count > 0 {
                List(networkManger.posts) { post in
                    NavigationLink(destination: DetailView(url: post.url)){
                        HStack{
                            Text(String(post.points))
                            Text(post.title)
                        }
                    }
                    
                }.navigationBarTitle("Hacker News")
            }
        }.onAppear {
            self.networkManger.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


