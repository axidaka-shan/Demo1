//
//  GroupDemoView.swift
//  Demo1
//
//  Created by axidaka on 2023/3/17.
//  Copyright © 2023 shan. All rights reserved.
//

import SwiftUI

struct GroupDemoView: View {
  @State private var progressValue = 0.0
  var body: some View {
    VStack{
      VStack {
        Text("VStack Text1")
          .background(Color.red)
        Text("VStack Text2")
          .background(Color.blue)

      }
      
      Group {
        Text("group Text1")
          .background(Color.orange)
        Text("group Text2")
          .background(Color.gray)

      }
      
      GroupBox{
        Text("groupBox1")
        Text("groupBox2")

      }
      
      ForEach(0...5,id:\.self){ index in
        GroupBox(label: Text("第\(index)项"), content: {
          Text("Content")
            .frame(width: 120, height: 20, alignment: .center).background(Color.red)
        })
      }
    }
  }
}

struct GroupDemoView_Previews: PreviewProvider {
    static var previews: some View {
        GroupDemoView()
    }
}
