//
//  TableDemoView.swift
//  Demo1
//
//  Created by axidaka on 2023/3/14.
//  Copyright © 2023 shan. All rights reserved.
//

import SwiftUI

struct TableDemoView: View {
    var body: some View {
      TabView {
          FlightBoard()
              .tabItem ({
                  Image(systemName: "icloud.and.arrow.down").resizable()
                  Text("Arrivals")
              })
          FlightBoard()
              .tabItem ({
                  Image(systemName: "icloud.and.arrow.up").resizable()
                  Text("Departures")
              })
      }
  }
}

struct TableDemoView_Previews: PreviewProvider {
    static var previews: some View {
        TableDemoView()
    }
}

struct FlightBoard: View {
    var body: some View {
        Text("Hello World!")
    }
}
