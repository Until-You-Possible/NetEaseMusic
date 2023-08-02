//
//  BodCaseView.swift
//  NetEaseMusic
//
//  Created by Ray on 2022/12/5.
//

import SwiftUI


struct BodCastView: View {
    
    var body: some View {
        Text("Middle View")
            .frame(height: 30)
            .cornerRadius(10)
            .padding([.leading, .trailing], 10)
            .background(Color.green)

    }

}





struct BodCaseView_Previews: PreviewProvider {
    static var previews: some View {
        BodCastView()
    }
}
