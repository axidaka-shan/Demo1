//
//  ListHideSeparatorDemoView.swift
//  Demo1
//
//  Created by axidaka on 2023/3/22.
//  Copyright © 2023 shan. All rights reserved.
//

import SwiftUI

struct ListHideSeparatorDemoView: View {
  
//  隐藏List每行的横线的几种方式：
  
  /**
   1. 修改List的SeparatorStyle
   可以通过修改List的separatorStyle属性来隐藏每行的横线。将separatorStyle设置为.none即可。（无效）
   */
  
//  init() {
//      UITableView.appearance().separatorStyle = .none
//  }
//
//  var body: some View {
//    List {
//        Text("Row 1")
//        Text("Row 2")
//        Text("Row 3")
//    }
//    .listStyle(PlainListStyle())
//    .onAppear {
//        UITableView.appearance().separatorStyle = .none
//    }
//  }
  
  /**
   2. 修改List的RowInsets
   可以通过修改List的rowInsets属性来设置每行的内边距，从而覆盖默认的横线。
   */
//  var body: some View {
//      List {
//          Text("Row 11")
//          Text("Row 22")
//          Text("Row 33")
//      }
//      .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
//      .listStyle(PlainListStyle())
//  }
  
  /**
   3. 修改List的RowBackground
   可以通过修改List的listRowBackground属性来设置每行的背景，从而覆盖默认的横线。
   */
  var body: some View {
      List {
          Text("Row 111")
              .listRowBackground(Color.white)
          Text("Row 222")
              .listRowBackground(Color.white)
          Text("Row 333")
              .listRowBackground(Color.white)
      }
      .listStyle(PlainListStyle())
  }
  
  
  /**
   4. listRowSeparator(.hidden)是在SwiftUI中用于隐藏List每行的横线的一种方式。它是作为ViewModifier使用的，可以在List的每一行上应用它来隐藏横线。
   */
//  var body: some View {
//    List {
//      if #available(iOS 15.0, *) {
//        Text("Row 1111")
//          .listRowSeparator(.hidden)
//      } else {
//        // Fallback on earlier versions
//      }
//      if #available(iOS 15.0, *) {
//        Text("Row 2222")
//          .listRowSeparator(.hidden)
//      } else {
//        // Fallback on earlier versions
//      }
//      if #available(iOS 15.0, *) {
//        Text("Row 3333")
//          .listRowSeparator(.hidden)
//      } else {
//        // Fallback on earlier versions
//      }
//    }
//  }
}

struct ListHideSeparatorDemoView_Previews: PreviewProvider {
    static var previews: some View {
        ListHideSeparatorDemoView()
    }
}
