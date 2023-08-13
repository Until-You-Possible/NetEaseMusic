//
//  AllListenView.swift
//  NetEaseMusic
//
//  Created by Ray on 2023/8/13.
//

import SwiftUI

struct AllListenView: View {
    var body: some View {
        
        VStack (alignment: .leading) {
            HStack () {
                Text("大家都在听")
                Button {
                    print("播放按钮事件")
                } label: {
                    Text("播放")
                        .foregroundColor(.black)
                }
                .buttonStyle(PlainButtonStyle())
            }
            
            //MARK: content list
            ScrollView (.horizontal) {
                HStack () {
                    VStack () {
                        HStack () {
                            AsyncImage(url: URL(string: "http://p1.music.126.net/sN5dTpmeJO1DhxIj1ogMLg==/109951163416453597.jpg")) { image in
                                image
                                    .resizable()
                                    .frame(width: 80, height: 80)
                                    .cornerRadius(4)
                            } placeholder: {
                                ProgressView()
                                    .frame(width: 80, height: 80)
                            }
                            VStack() {
                                Text("想想就烦")
                                HStack() {
                                    Text("AGAC")
                                }
                            }
                        }
                    }
                    .frame(width: 360)
                    .background(.gray)
                    VStack () {
                        Text("xxxd")
                    }
                    .frame(width: 360)
                    VStack () {
                        Text("xxxd")
                    }
                    .frame(width: 360)
                }
            }
            
        }
        
    }
}

struct AllListenView_Previews: PreviewProvider {
    static var previews: some View {
        AllListenView()
    }
}
