//
//  SongListView.swift
//  NetEaseMusic
//
//  Created by Ray on 2023/8/9.
//

import SwiftUI

struct SongListView: View {
    var body: some View {
        VStack () {
//            RoundedRectangle(cornerRadius: 30)
//                .fill(
////                    LinearGradient(colors: [Color.red], startPoint: .leading, endPoint: .bottomLeading)
//                    LinearGradient(gradient: Gradient(colors: [.red, Color.blue]), startPoint: .leading, endPoint: .trailing)
//                )
            RoundedRectangle(cornerRadius: 45.0)
                        .fill(
                            LinearGradient(gradient: Gradient(colors: [Color.red,Color.blue]), startPoint: .leading, endPoint: .trailing)
                        )
                        .frame(width: 300,height: 200)
            
        }
    }
}

struct SongListView_Previews: PreviewProvider {
    static var previews: some View {
        SongListView()
    }
}
