//
//  MobileAgreementRules.swift
//  NetEaseMusic
//
//  Created by Ray on 2022/12/10.
//

import SwiftUI

struct MobileAgreementRules: View {
    let url = "https://wap.gd.10086.cn/ui_new/v2020/026/marketingActivities/agree/contract.shtml"
    var body: some View {
        WebViewPage(url: URL(string: url)!)
    }
}

struct MobileAgreementRules_Previews: PreviewProvider {
    static var previews: some View {
        MobileAgreementRules()
    }
}
