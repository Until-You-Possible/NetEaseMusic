//
//  BodCaseView.swift
//  NetEaseMusic
//
//  Created by Ray on 2022/12/5.
//

import SwiftUI

struct BodCastView: View {
    
    private let codeLength = 4 // 短信验证码的长度
//    @State private var code: String = "2468"
    @State private var codes: [String] = ["1", "2", "3", "4"]
    @FocusState private var focusedField: Int? // Track the focused input box
    
    var body: some View {
        HStack(spacing: 16) {
            ForEach(0..<codeLength, id: \.self) { index in
                TextField("", text: $codes[index])
                    .font(.title)
                    .frame(width: 40, height: 40)
                    .multilineTextAlignment(.center)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
                    .focused($focusedField, equals: index) // Set focus on the input box with the same index
            }
        }
        .padding()
    }
    
}





struct BodCaseView_Previews: PreviewProvider {
    static var previews: some View {
        BodCastView()
    }
}
