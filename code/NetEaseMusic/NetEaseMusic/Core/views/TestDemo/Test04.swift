//
//  Test04.swift
//  NetEaseMusic
//
//  Created by Ray on 2023/8/31.
//

import SwiftUI

struct Test04: View {
    @State private var currentSection = 0
    @State private var bottomText = "Default Text"
    
    let items: [String] = ["Item 1", "Item 2", "Item 3"]

    var body: some View {
        VStack {
            TabView(selection: $currentSection) {
                ForEach(0..<items.count, id: \.self) { index in
                    VStack {
                        Text(items[index])
                            .font(.title)
                        
                        Text("Some content for \(items[index])")
                            .font(.subheadline)
                        
                        Text(bottomText)
                            .font(.subheadline)
                    }
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .rotationEffect(.degrees(90))
            .onChange(of: currentSection) { newValue in
                bottomText = "Selected: \(items[newValue])"
                print("bottomText", bottomText)
            }
        }
    }
}

struct Test04_Previews: PreviewProvider {
    static var previews: some View {
        Test04()
    }
}
