//
//  Test03.swift
//  NetEaseMusic
//
//  Created by Ray on 2023/8/30.
//

import SwiftUI

struct Test03: View {
    @State var currentSection: Int = 0
    private let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()
    @State private var isAutoScrolling = true
    
    var body: some View {
        VStack () {
            TabView(selection: $currentSection) {
                Image("rcmdTestImage")
                    .resizable()
                    .tag(0)
                    .rotationEffect(.degrees(-90))
                Image("sky_resized")
                    .resizable()
                    .tag(1)
                    .rotationEffect(.degrees(-90))
                Image("rcmdTestImage")
                    .resizable()
                    .tag(2)
                    .rotationEffect(.degrees(-90))
            }
            .frame(width: 140,height: 140)
            .padding(.horizontal)
            .tabViewStyle(.page(indexDisplayMode: .never))
            .rotationEffect(.degrees(90))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
            .onReceive(timer) { _ in
                if isAutoScrolling {
                    let newIndex = (currentSection + 1) % 3
                    print("new index ", newIndex)
                    withAnimation {
                        currentSection = newIndex
                    }
                }
            }
        }
    }
}

struct Test03_Previews: PreviewProvider {
    static var previews: some View {
        Test03()
    }
}
