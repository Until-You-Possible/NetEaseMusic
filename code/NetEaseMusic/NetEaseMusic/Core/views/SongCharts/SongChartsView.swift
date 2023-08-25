//
//  SongChartsView.swift
//  NetEaseMusic
//
//  Created by Ray on 2023/8/9.
//

import SwiftUI

struct SongChartsView: View {
    var body: some View {
        HStack () {
            Text("song charts view")
        }
        .frame(width: 200, height: 40)
        .border(.gray, width: 1)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                 .stroke(.orange, lineWidth: 2)
                    
        )
    }
}

struct SongChartsView_Previews: PreviewProvider {
    static var previews: some View {
        SongChartsView()
    }
}
