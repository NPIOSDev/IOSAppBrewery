//
//  ContentView.swift
//  MyCard
//
//  Created by Nelson on 30/7/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color(red: 0.09, green: 0.63, blue: 0.52).ignoresSafeArea(.all)
            VStack {
                Image("dog").resizable().aspectRatio(contentMode: .fit).frame(width: 150.0, height: 150.0).clipShape(Circle()).overlay(Circle().stroke(Color.white, lineWidth: 5))
                Text("Ming Chun Hung").font(Font.custom("SpecialElite-Regular", size: 40)).bold().foregroundColor(.white)
                Text("IOS Developer").foregroundColor(.white).font(.system(size: 25))
                Divider()
                InfoView(text: "+886952669909", imageName: "phone.fill")
                InfoView(text: "tomneo2004@gmai.com", imageName: "envelope.fill")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


