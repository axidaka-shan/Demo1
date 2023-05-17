//
//  DatePickerDemo4View.swift
//  Demo1
//
//  Created by axidaka on 2023/3/20.
//  Copyright © 2023 shan. All rights reserved.
//

import SwiftUI

struct DatePickerDemo4View: View {
  @State var date = Date()
  
  var body: some View {
      VStack {
          DatePicker(
              "Select a date",
              selection: $date,
              displayedComponents: [.date, .hourAndMinute]
          )
          .datePickerStyle(GraphicalDatePickerStyle())
          .environment(\.locale, Locale(identifier: "en_US"))
          .frame(maxHeight: 400)
          .labelsHidden()
          .accentColor(.blue)
//          .maximumDate(Date().addingTimeInterval(60 * 60 * 24 * 7)) // Set maximum date to 1 week from now
      }
  }
}

struct DatePickerDemo4View_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerDemo4View()
    }
}
