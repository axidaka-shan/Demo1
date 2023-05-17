//
//  DatePickerDemo3View.swift
//  Demo1
//
//  Created by axidaka on 2023/3/17.
//  Copyright © 2023 shan. All rights reserved.
//

import SwiftUI

struct DatePickerDemo3View: View {
  @State var birthDate = Date()
  @State var isDatePickerShown = false
  
  var body: some View {
      VStack {
          Button(action: {
              self.isDatePickerShown.toggle()
          }) {
              Text(dateFormatter.string(from: birthDate))
                  .foregroundColor(.white)
                  .padding()
                  .background(Color.blue)
                  .cornerRadius(10)
          }
          .popover(isPresented: $isDatePickerShown, attachmentAnchor: .point(.bottom), arrowEdge: .top) {
              DatePicker("", selection: self.$birthDate, displayedComponents: .date)
                  .labelsHidden()
                  .datePickerStyle(GraphicalDatePickerStyle())
                  .frame(height: 300)
          }
          
          Spacer()
      }
  }
  
  var dateFormatter: DateFormatter {
      let formatter = DateFormatter()
      formatter.dateFormat = "yyyy-MM-dd"
      return formatter
  }
}

struct DatePickerDemo3View_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerDemo3View()
    }
}
