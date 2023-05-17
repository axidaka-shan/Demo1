//
//  PushDemoView2.swift
//  Demo1
//
//  Created by axidaka on 2023/3/14.
//  Copyright © 2023 shan. All rights reserved.
//

import SwiftUI

struct PushDemoView2: View {
    var body: some View {
      NavigationView {
          VStack {
              NavigationLink(destination: PushFlightBoard(boardName: "Arrivals")) {
                  HStack {
                      Image(systemName: "icloud.and.arrow.down").resizable().frame(width: 30, height: 30)
                      Text("Arrivals")
                  }
              }
              NavigationLink(destination: PushFlightBoard(boardName: "Departures")) {
                  HStack {
                      Image(systemName: "icloud.and.arrow.up").resizable().frame(width: 30, height: 30)
                      Text("Departures")
                  }
              }
          }.navigationBarTitle(Text("Mountain Airport"))
      }
  }
}

struct PushDemoView2_Previews: PreviewProvider {
    static var previews: some View {
      PushDemoView2()
    }
}

struct PushFlightBoard: View {
    let boardName: String
    var body: some View {
        VStack {
            Text(boardName)
        }.navigationBarTitle(Text(boardName), displayMode: .inline)
    }
}
