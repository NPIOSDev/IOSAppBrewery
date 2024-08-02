//
//  InfoView.swift
//  MyCard
//
//  Created by Nelson on 30/7/2024.
//

import SwiftUI

struct InfoView: View {
    let text: String
    let imageName: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25).fill(Color.white).frame(height: 50).foregroundColor(.white).overlay(HStack {
            Image(systemName: imageName).foregroundColor(.green)
            Text(text)
        }).padding(.all)
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(text: "hello", imageName: "phone.fill").previewLayout(.sizeThatFits)
    }
}
