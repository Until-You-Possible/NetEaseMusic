//
//  GameAreaView.swift
//  NetEaseMusic
//
//  Created by Ray on 2023/8/9.
//

import SwiftUI

struct GameAreaView: View {
    
    let data = (1...8).map { $0 } // 15条数据
    let containerWidth: CGFloat = 300.0
    let minHeight: CGFloat = 50.0
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: minHeight))]) {
                ForEach(data, id: \.self) { item in
                    Text("\(item)")
                        .frame(minHeight: minHeight)
                        .background(Color.blue)
                        .foregroundColor(.white)
                }
            }
        }
    }
}

struct GameAreaView_Previews: PreviewProvider {
    static var previews: some View {
        GameAreaView()
    }
}
