//
//  FollowView.swift
//  NetEaseMusic
//
//  Created by Ray on 2022/12/5.
//

import SwiftUI
import SwiftUIFontIcon

struct FollowView: View {
    
    var body: some View {
        VStack () {
            
            VStack () {
                // MARK: public message and button
                HStack () {
                    Image("rcmdTestImage")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                        .cornerRadius(60)
                    VStack (alignment: .leading, spacing: 2) {
                        HStack () {
                            Text("勤俭持家的一个帅气的阳光大男孩")
                            Text("官方发布")
                                .layoutPriority(1)
                        }
                        .lineLimit(1)
                        // MARK: show the different sub titleor message
                        // such as: fans count/subtitle
                        Text("32.8万粉丝")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                    }
                    .padding(.trailing, 10)
                    HStack(spacing: 2) {
                        Image(systemName: "plus")
                        Text("关注")
                    }
                    .frame(width: 80, height: 28)
                    .foregroundColor(.red)
                    .overlay {
                        RoundedRectangle(cornerRadius: 50)
                            .stroke(.pink, lineWidth: 1)
                    }
                }
                
                // MARK: different content
                VStack () {
                    
                }
            }
            
        }
        .padding(.horizontal)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                MenuButtonView()
            }
            ToolbarItem(placement: .principal) {
                Text("动态")
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Image(systemName: "plus")
                    .background(.red)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    .onTapGesture {
                        print("plus clicked")
                    }
            }
        }
    }
}

struct FollowView_Previews: PreviewProvider {
    static var previews: some View {
        FollowView()
    }
}
