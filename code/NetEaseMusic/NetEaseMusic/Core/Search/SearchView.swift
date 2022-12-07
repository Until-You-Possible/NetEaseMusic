//
//  SearchView.swift
//  NetEaseMusic
//
//  Created by Ray on 2022/12/4.
//

import SwiftUI

struct SearchView: View {
    var body: some View {
        NavigationView() {
            VStack {
                ScrollView {
                    LazyVStack {
                        Text("dd")
                        Text("ddfffffff")
                    }
                }
            }
            .navigationTitle("搜索")
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
