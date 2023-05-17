//
//  PushDemoView.swift
//  Demo1
//
//  Created by axidaka on 2023/3/13.
//  Copyright © 2023 shan. All rights reserved.
//

import SwiftUI

struct PushDemoView: View {
    /// 点击触发push时的key
    @State var pushKey = false

    var body: some View {
        //需要NavigationView包裹
        NavigationView(content: {
            //页面设置为垂直布局
            VStack(alignment: .center, spacing: nil, content: {
                Spacer()
                //点击文字跳转到SecondView()
                NavigationLink("点击文字直接push", destination: Text("我是push到的页面"))
                Spacer()
                NavigationLink("", destination: Text("按钮push到的页面"), isActive: $pushKey)
                Button("点击按钮触发push的效果") {
                    self.pushKey.toggle()//toggle()可以说是将pushkey的bool值取反
                }
                Spacer()
            })
            .navigationBarTitle("首页", displayMode: .inline)//设置标题，并固定到导航中间
        })
    }
}

struct PushDemoView_Previews: PreviewProvider {
    static var previews: some View {
      PushDemoView()
    }
}
