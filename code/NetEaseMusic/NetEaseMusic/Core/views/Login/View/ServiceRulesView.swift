//
//  ServiceRulesView.swift
//  NetEaseMusic
//
//  Created by Ray on 2022/12/10.
//

import SwiftUI

struct ServiceRulesView: View {
    let url = "https://cn.bing.com/search?q=%E7%BD%91%E6%98%93%E4%BA%91%E6%9C%8D%E5%8A%A1%E6%9D%A1%E6%AC%BE"
    var body: some View {
        WebViewPage(url: URL(string: url)!)
    }
}

struct ServiceRulesView_Previews: PreviewProvider {
    static var previews: some View {
        ServiceRulesView()
    }
}
