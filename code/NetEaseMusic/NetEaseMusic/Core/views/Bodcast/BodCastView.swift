//
//  BodCaseView.swift
//  NetEaseMusic
//
//  Created by Ray on 2022/12/5.
//

import SwiftUI
import SwiftUIFontIcon


struct BodCastView: View {
    
    @ObservedObject var viewModel = EntrySlideViewModel()
    
    var body: some View {
        
        VStack () {
            Text("xxx")
        }
        .background(.gray)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Text("播客")
            }
        }
    }
}





struct BodCaseView_Previews: PreviewProvider {
    static var previews: some View {
        BodCastView()
    }
}
