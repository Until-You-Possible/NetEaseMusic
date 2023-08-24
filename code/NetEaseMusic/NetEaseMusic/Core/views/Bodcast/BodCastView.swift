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
        
//        NavigationView {
            VStack () {
                Text("xxx")
            }
            .background(.gray)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        // 在此处添加按钮的操作
                    }) {
                        FontIcon.text(.materialIcon(code: .arrow_back),
                                      fontsize: 28, color: .black)
                    }
                }
            }
    }

}





struct BodCaseView_Previews: PreviewProvider {
    static var previews: some View {
        BodCastView()
    }
}
