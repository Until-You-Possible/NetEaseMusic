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
        NavigationView {
            ScrollView () {
                ForEach(0..<40) { index in
                    Text("xxxddd")
                }
            }
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            // 在此处添加按钮的操作
                        }) {
                            Text("Back")
                        }
                    }
                    
                    ToolbarItem(placement: .principal) {
                        HStack(spacing: 10) {
                            Text("Default")
                                .foregroundColor(.white)
                                .font(.system(size: 14))
                            Text("Style")
                                .foregroundColor(.white)
                                .font(.system(size: 14))
                        }
                        .padding(8)
                        .background(Color.gray.opacity(0.6))
                        .cornerRadius(20)
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            // 在此处添加按钮的操作
                        }) {
                            Text("More")
                        }
                    }
                }
                .toolbarBackground(Color.red) // 清除导航栏的背景颜色
        
        }
    }
}

struct PrivateFMView_Previews: PreviewProvider {
    static var previews: some View {
        PrivateFMView()
    }
}
