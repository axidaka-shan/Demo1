//
//  SheetDemoPreviousView.swift
//  Demo1
//
//  Created by axidaka on 2023/3/13.
//  Copyright © 2023 shan. All rights reserved.
//

import SwiftUI

struct SheetDemoPreviousView: View {
    /// 触发present的key
    @State var presetnKey = false

    var body: some View {
        //页面设置为垂直布局
      if #available(iOS 14.0, *) {
        VStack(alignment: .center, spacing: nil, content: {
          Spacer()
          Button("点击按钮触发push的效果") {
            self.presetnKey.toggle()//toggle()可以说是将presetnKey的bool值取反
          }
          Spacer()
        })
        .navigationBarTitle("首页", displayMode: .inline)//设置标题，并固定到导航中间
                .sheet(isPresented: $presetnKey) {
                    //非全屏模式
                    SheetDemoNextView()
                }
//        .fullScreenCover(isPresented: $presetnKey, content: {
//          //全屏模式
//          SheetDemoNextView()
//        })
      } else {
        // Fallback on earlier versions
      }
    }
}

struct SheetDemoPreviousView_Previews: PreviewProvider {
    static var previews: some View {
      SheetDemoPreviousView()
    }
}
