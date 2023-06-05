//
//  SafeAreaDemoView.swift
//  Demo1
//
//  Created by visit on 2023/5/18.
//  Copyright © 2023 deng. All rights reserved.
//

import SwiftUI

struct SafeAreaDemoView: View {
  var body: some View {
          ZStack {
//            Color.gray
//              .frame(maxWidth: .infinity, maxHeight: .infinity)
//              .ignoresSafeArea()
//
//            Color.blue
//              .ignoresSafeArea(.all, edges: .vertical)
//              .frame(maxWidth: .infinity, maxHeight: .infinity)


          }
          .frame(maxWidth: .infinity, maxHeight: .infinity)
          .background(Color.yellow)
//          .ignoresSafeArea(edges: .all)
      }
}

struct SafeAreaDemoView_Previews: PreviewProvider {
    static var previews: some View {
        SafeAreaDemoView()
    }
}
