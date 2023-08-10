//
//  PrivateFMView.swift
//  NetEaseMusic
//
//  Created by Ray on 2023/8/9.
//

import SwiftUI
import ScalingHeaderScrollView


struct PrivateFMView: View {
    var body: some View {

        ScalingHeaderScrollView {
            ZStack (alignment: .leading) {
                ScalingHeaderScrollView {
                    Image("topSky")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } content: {

                }
                .height(min: 250.0, max: UIScreen.main.bounds.height - 150)
                .headerSnappingPositions(snapPositions: [0, 0.5, 1])
                .initialSnapPosition(initialSnapPosition: 0.5)
                .ignoresSafeArea()
             }
         } content: {
             DayRecommendSongView()
         }
         .ignoresSafeArea()
        
    }
}

struct PrivateFMView_Previews: PreviewProvider {
    static var previews: some View {
        PrivateFMView()
    }
}
