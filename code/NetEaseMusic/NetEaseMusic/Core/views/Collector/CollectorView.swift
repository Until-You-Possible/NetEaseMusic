//
//  CollectorView.swift
//  NetEaseMusic
//
//  Created by Ray on 2023/8/9.
//

import SwiftUI

struct CollectorView: View {
    var body: some View {
        NavigationView {
            VStack (alignment: .leading) {
                
                       Text("Main Content")
                           .toolbar {
                               ToolbarItem(placement: .navigationBarLeading) {
                                   Button(action: {
                                       // Left button action
                                   }) {
                                       Image(systemName: "arrow.left")
                                   }
                               }
                               
                               ToolbarItem(placement: .principal) {
                                   Button(action: {
                                       // Center button action
                                   }) {
                                       Image(systemName: "heart.fill")
                                   }
                               }
                               
                               ToolbarItem(placement: .navigationBarTrailing) {
                                   Button(action: {
                                       // Right button action
                                   }) {
                                       Image(systemName: "gear")
                                   }
                               }
                           }
                Text("xxxxxxxxdssssssssssx")
                Spacer()
            }
    }
    }
}

struct CollectorView_Previews: PreviewProvider {
    static var previews: some View {
        CollectorView()
    }
}
