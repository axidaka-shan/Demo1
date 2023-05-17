//
//  RegisterDemo2View.swift
//  Demo1
//
//  Created by axidaka on 2023/3/20.
//  Copyright © 2023 shan. All rights reserved.
//

import SwiftUI

struct RegisterDemo2View: View {
  private let interlabelPadding: CGFloat = 8
  private let dividerHeight: CGFloat = 1
  static let birthDateTitle = "Date of Birth"
  
  private let fullnameTextField = "fullnameTextField"
 
  var displayDateFormatter: DateFormatter {
      let formatter = DateFormatter()
      formatter.dateFormat = "MMMM dd, yyyy"
      return formatter
  }
  var requestDateFormatter: DateFormatter {
      let formatter = DateFormatter()
      formatter.dateFormat = "yyyy-MM-dd"
      return formatter
  }
  
  @State public var isfullnameFirstResponder: Bool? = false
  @State public var isBirthDatePickerFirstResponder: Bool? =  false
  
  @State public var fullname: String = ""
  @State public var birthDate: Date?

  @State public var fullnameErrorMessage: String = ""
  @State public var birthDateErrorMessage: String = ""
  
  @State public var isFullnameValid: Bool = true
  @State public var isBirthDateValid: Bool = true
  
  @State public var isLoading: Bool = false
  @State public var authStatusString: String?
  
  @State public var showingBirthDatePicker: Bool? = false
  @State public var birthDateString: String = ""
    
  var body: some View {
    let birthDateBinding = Binding<Date>(get: { birthDate ?? Date() }, set: { birthDate = $0 })

    ZStack {
      ScrollViewReader { _ in
        ScrollView(.vertical, showsIndicators: false) {

          Text("Create a profile")
            .font(Font(UIFont.systemFont(ofSize: 30)))
            .foregroundColor(Color(.black))
          Group {
            VStack(alignment: .leading) {
              FormTextField(
                title: "Name",
                text: $fullname,
                nextResponder: $showingBirthDatePicker,
                prevResponder: .constant(nil),
                isResponder: $isfullnameFirstResponder,
                keyboardType: .default,
                returnKeyType: .next,
                textContentType: .familyName,
                onFirstResponderResigned: {
                  checkFullnameAvailable()
                },
                textFiledChange: { textfile in
                  textfile.attributedPlaceholder = NSAttributedString(
                    string: textfile.placeholder ?? "",
                    attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
                  )
                  textfile.font = UIFont.systemFont(ofSize: 17)
                },
                textcontentVerticalAlignment: .bottom,
                keybordManagerEnable: true,
                isContentValid: isFullnameValid
              ).frame(minWidth: 0,
                      maxWidth: .infinity,
                      minHeight: 75,
                      maxHeight: 75)
              .id(fullnameTextField)
              .onTapGesture {
                dismissPickers()
              }
              AccountTools.CaptionText(fullnameErrorMessage, color: Color(.red))
                .isHidden(isFullnameValid)
            }
            
                      
            VStack(alignment: .leading) {
              Text(RegisterDemo2View.birthDateTitle)
                .foregroundColor(birthDate != nil ? Color(.systemGray) : Color(.clear))
                .offset(y: -10)
                .scaleEffect(birthDate != nil ? 0.8:1, anchor: .leading)
              Button(action: {
                resignActiveTextField()
                showingBirthDatePicker?.toggle()
              }, label: {
                HStack {
                  Text(birthDate != nil ? displayDateFormatter.string(from: birthDate ?? Date()) : RegisterDemo2View.birthDateTitle)
                    .font(Font.system(size: 16))
                    .foregroundColor(Color(UIColor.systemGray))
                  Spacer()
                }
              })
                .frame(maxWidth: .infinity)
                .sheet(isPresented: Binding(
                  get: { self.showingBirthDatePicker ?? false },
                  set: { self.showingBirthDatePicker = $0 }
                  ), content: {
                  
                    DatePicker("", selection: birthDateBinding, displayedComponents: .date)
                        .labelsHidden()
                        .datePickerStyle(GraphicalDatePickerStyle())
                        .frame(height: 300)
                    
                    Spacer()
                      .frame(height: 30)

                    HStack {
                      Spacer()

                      Button(action: {
                        showingBirthDatePicker?.toggle()
                      }) {
                          Text("Done")
                              .foregroundColor(Color.white)
                              .padding()
                              .background(Color.blue)
                              .cornerRadius(10)
                      }
                      .padding(.trailing, 20)
                  }
                })
              
              AccountTools.SeparatorView(color: Color(.gray))
            }
            .padding(.vertical)
            
            
            Group {
              Spacer()
                .frame(height: 40)
              BaseButton(
                title: "Continue",
                action: {
                  doRegisterAction()
                },
                isEnabled: true,
                isLoading: isLoading
              )
              .frame(height: 50)
              .cornerRadius(25)
              .padding()
              AccountTools.CaptionText("asdaf asfdas dadaa sdafasf dasda dasasdaf asfdasdadasasdafasfdasdadasasdafasfdasdadasasdafasfdasdadasasdafasfdasdadasasdafasfdasdadasasdafasfdasdadasa sdafasfdasdadasasdafasfdasdadasasd afasfdasdadasasdafasfdasdadasasdafasfdasdadasasdafasfdasdadass.", color: .primary)
                .padding(.bottom, 45)
            }
            
            
          }
          .padding(.horizontal, 32)
          .clipped()
        }
      }
      .padding(.vertical)
    }
    .ignoresSafeArea(.keyboard)
  }
  
  func dismissPickers() {
    showingBirthDatePicker = false
    isBirthDatePickerFirstResponder = false
  }
  
  func resignActiveTextField() {
    isfullnameFirstResponder = false
    UIApplication.shared.resignResponder()
  }
  
  func checkInputInfoValid() {
    self.checkFullnameAvailable()
    self.checkDateAvailable()
  }
  
  func checkFullnameAvailable() {
    var result = true
    fullname = AppUtils.trimmingTextSpace(text: fullname) ?? ""
    let errorMsg = AppUtils.getUserNameErrorMsg(userName: fullname)
    if let errorMessage = errorMsg {
      result = false
      fullnameErrorMessage = errorMessage
    } else {
      fullnameErrorMessage = ""
    }
    isFullnameValid = result
  }
  
  func checkDateAvailable() {
    var result = true
    let errorMsg = AppUtils.getDateErrorMsg(date: displayDateFormatter.string(from: birthDate ?? Date()))
    if let errorMessage = errorMsg {
      result = false
      birthDateErrorMessage = errorMessage
    } else {
      birthDateErrorMessage = ""
    }
    isBirthDateValid = result
  }
  
  func doRegisterAction() {
    UIApplication.shared.resignResponder()
    self.checkInputInfoValid()
    if isFullnameValid && isBirthDateValid {
    
    }
  }
  
  func consentButtonTapped(action: @escaping () -> Void) -> some View {
    return Button(action: action, label: {
      ZStack {
        Color(.blue)
        Image("iconCheckboxSelected")
      }
      .cornerRadius(2.0)
    })
  }

  func consentButtonUntapped(action: @escaping () -> Void) -> some View {
    return Button(action: action, label: {
      Color.clear
        .border(Color.primary, width: 1)
        .cornerRadius(2.0)
    })
  }

  func consentTextTapped(action: @escaping () -> Void, text: String) -> some View {
    return Button(action: action, label: {
      AccountTools.CaptionText(text, color: .primary)
    })
  }

  func consentTextUntapped(action: @escaping () -> Void, text: String) -> some View {
    return Button(action: action, label: {
      AccountTools.CaptionText(text, color: .primary)
    })
  }

  func attributedTextfile(textfile: UITextField) {
    textfile.attributedPlaceholder = NSAttributedString(
      string: textfile.placeholder ?? "",
      attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
    )
    textfile.font = UIFont.systemFont(ofSize: 16)
  }
  
  
  
  public static func getDatefromMonthYear(string: String) -> Date {
    let components = string.components(separatedBy: "/")
    let month = components[0].trimmingCharacters(in: .whitespaces)
    let year = components[1].trimmingCharacters(in: .whitespaces)
    let isoDate = "\(year)/\(month)/01"

    let formatter = DateFormatter()
    formatter.locale = .current
    formatter.dateFormat = "yyyy/MM/dd"
    formatter.timeZone = TimeZone.current
    let dateTime = formatter.date(from: isoDate)
    return dateTime ?? Date()
  }
}

struct RegisterDemo2View_Previews: PreviewProvider {
    static var previews: some View {
      RegisterDemo2View()
    }
}

extension RegisterDemo2View {
  struct TappableLink: View {
    let text: String
    let destination: URL
    let font: Font
    let fontColor: Color

    var body: some View {
      Link(destination: destination, label: {
        Text(text)
          .font(font)
          .foregroundColor(fontColor)
          .underline()
      })
    }
  }

}
