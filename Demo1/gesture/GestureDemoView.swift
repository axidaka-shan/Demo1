//
//  GestureDemoView.swift
//  Demo1
//
//  Created by visit on 2023/6/4.
//  Copyright © 2023 deng. All rights reserved.
//

import SwiftUI

struct GestureDemoView: View {
    var body: some View {
      VStack{
          Text("点击")
      }
      .padding(.horizontal, 50)
//      .background(Color.purple)
//      .frame(width: 200, height: 200)
//            .background(Color.purple) //加上颜色可以让点击区域生效
      .contentShape(Rectangle()) //没有颜色的情况用contentShape扩大点击响应区域
      .onTapGesture {
          print("tap")
      }
    }
}

struct GestureDemoView_Previews: PreviewProvider {
    static var previews: some View {
        GestureDemoView()
    }
}
