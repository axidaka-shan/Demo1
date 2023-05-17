//
//  SheetDemoView.swift
//  Demo1
//
//  Created by axidaka on 2023/3/22.
//  Copyright © 2023 shan. All rights reserved.
//

import SwiftUI

// .sheet: 弹出一个模态视图，并在其上显示另一个视图。通常用于显示详情、编辑页面等。

struct SheetDemoView: View {
  @State private var showModal = false
  
  var body: some View {
      Button("Show Modal") {
          showModal = true
      }
      .sheet(isPresented: $showModal) {
          DetailView()
      }
  }
}

struct SheetDemoView_Previews: PreviewProvider {
    static var previews: some View {
        SheetDemoView()
    }
}

struct DetailView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Text("Details")
            Button("Dismiss") {
                presentationMode.wrappedValue.dismiss()
            }
        }
    }
}
