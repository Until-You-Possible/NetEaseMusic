//
//  EntrySlideView.swift
//  NetEaseMusic
//
//  Created by Ray on 2023/3/3.
//

import SwiftUI
import SwiftUIFontIcon

struct EntryType: Identifiable, Hashable {
    var id = UUID()
    var code: SwiftUIFontIcon.MaterialIconCode
    var text: String
}

struct EntrySlideView: View {
    
    @State private var currentPage = 0
    private let timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    @State private var isAutoScrolling = true
    @ObservedObject var entrySildeViewModel = EntrySlideViewModel()
    
    var body: some View {
        
        if let entryList = entrySildeViewModel.entryArray {
            TabView(selection: $currentPage) {
                ForEach(entryList.indices, id: \.self) { index in
                     let current = entryList[index]
                     HStack {
                         ForEach(0..<current.count, id: \.self) { innerIndex in
                             let innerCurrent = current[innerIndex]
                             VStack {
                                 Text(innerCurrent["name"].stringValue)
                             }
                         }
                     }
                 }
            }
            .frame(width: .infinity, height: 80)
            .tabViewStyle(.page(indexDisplayMode: .never))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
            .onReceive(timer) { _ in
                let newIndex = (currentPage + 1) % 2
                withAnimation {
                    currentPage = newIndex
                }
            }
            .gesture(
                DragGesture()
                    .onChanged { _ in
                        // 用户手动滑动时暂停自动轮播
                        isAutoScrolling = false
                    }
                    .onEnded { _ in
                        // 用户停止滑动后继续自动轮播
                        isAutoScrolling = true
                    }
            )
        } else {
            ProgressView()
        }
        

    }
}

struct EntrySlideView_Previews: PreviewProvider {
    static var previews: some View {
        EntrySlideView()
    }
}
