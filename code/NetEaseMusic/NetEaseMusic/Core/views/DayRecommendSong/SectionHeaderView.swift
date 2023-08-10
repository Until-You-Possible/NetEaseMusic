//
//  SectionHeaderView.swift
//  NetEaseMusic
//
//  Created by Ray on 2023/8/10.
//

import SwiftUI
import SwiftUIFontIcon

struct SectionHeaderView: View {
    var body: some View {
        //MARK: control content
        HStack {
            FontIcon.text(.materialIcon(code: .play_circle_filled), fontsize: 26, color: Color.red)
            Text("全部播放")
                .fontWeight(.bold)
            Spacer()
            HStack {
                FontIcon.text(.materialIcon(code: .update), fontsize: 26);
                Spacer()
                    .frame(width: 30)
                FontIcon.text(.materialIcon(code: .subject), fontsize: 26)
            }
        }
        .padding(.horizontal)
        .frame(height: 80)
        .background(Color.white)
    }
}

struct SectionHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        SectionHeaderView()
    }
}
