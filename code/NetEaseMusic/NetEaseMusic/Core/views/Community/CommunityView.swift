//
//  CommunityView.swift
//  NetEaseMusic
//
//  Created by Ray on 2022/12/5.
//

import SwiftUI

struct CommunityView: View {
    var body: some View {
        VStack () {
            Text("社区")
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Text("社区")
            }
        }
    }
}

struct CommunityView_Previews: PreviewProvider {
    static var previews: some View {
        CommunityView()
    }
}
