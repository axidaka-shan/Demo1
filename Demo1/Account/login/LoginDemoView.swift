//
//  LoginDemoView.swift
//  Demo1
//
//  Created by axidaka on 2023/5/12.
//  Copyright © 2023 shan. All rights reserved.
//

import SwiftUI

struct LoginDemoView: View {
  private let interlabelPadding: CGFloat = 8
  private let dividerHeight: CGFloat = 1
  private let passwordTextField = "passwordTextField"
  private let emailTextField = "emailTextField"


  @State public var isUsernameFirstResponder: Bool? = false
  @State public var isPasswordFirstResponder: Bool? =  false
  @State public var email: String = ""
  @State public var password: String = ""
  @State public var emailErrorMessage: String = ""
  @State public var passwordErrorMessage: String = ""
  @State public var isEmailValid: Bool = true
  @State public var isPasswordValid: Bool = true
  @State public var isLoading: Bool = false
  @State public var authStatusString: String?
  @State private var showAlert = false

  var body: some View {
    
    ZStack {
      ScrollViewReader { _ in
        ScrollView(.vertical, showsIndicators: false) {
          
          Spacer()
            .frame(height: 100)
          Text("Sign In")
            .font(Font(UIFont.systemFont(ofSize: 30)))
            .foregroundColor(Color(.white))
          
          Group {
            VStack(alignment: .leading) {
              FormTextField(
                // No stored user, present normal credentials view
                title: "username",
                text: $email,
                nextResponder: $isPasswordFirstResponder,
                prevResponder: .constant(nil),
                isResponder: $isUsernameFirstResponder,
                keyboardType: .emailAddress,
                returnKeyType: .next,
                textContentType: .username,
                onFirstResponderResigned: {
                  checkEmailAvailable()
                },
                textFiledChange: { textfile in
                  textfile.attributedPlaceholder = NSAttributedString(
                    string: textfile.placeholder ?? "",
                    attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray]
                  )
                  textfile.font = UIFont.systemFont(ofSize: 17)
                },
                textcontentVerticalAlignment: .center,
                keybordManagerEnable: true,
                isContentValid: isEmailValid
              ).frame(minWidth: 0,
                      maxWidth: .infinity,
                      minHeight: 55,
                      maxHeight: 55)
              .background(Color.gray)
              .cornerRadius(5)
              AccountTools.CaptionText(emailErrorMessage, color: Color(.red))
                .isHidden(isEmailValid)
            }
            .id(emailTextField)

            VStack(alignment: .leading) {
              SecureTextField(
                title: "password",
                text: $password,
                textContentType: .password,
                nextResponder: .constant(nil),
                prevResponder: $isUsernameFirstResponder,
                isResponder: $isPasswordFirstResponder,
                returnKeyType: .done,
                shouldShowFaceIDButton: false,
                faceIdAction: {
                }, onFirstResponderResigned: {
                  checkPasswordAvailable()
                }, onBecomeResponder: {
                }, onCommit: {
                },
                textFiledChange: { textfile in
                  textfile.attributedPlaceholder = NSAttributedString(
                    string: textfile.placeholder ?? "",
                    attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray]
                  )
                  textfile.font = UIFont.systemFont(ofSize: 16)
                },
                textcontentVerticalAlignment: .center,
                keybordManagerEnable: true,
                isContentValid: isPasswordValid
              ).frame(minWidth: 0,
                      maxWidth: .infinity,
                      minHeight: 55,
                      maxHeight: 55)
              .background(Color.gray)
              .cornerRadius(5)
              AccountTools.CaptionText(passwordErrorMessage, color: Color(.red))
                .isHidden(isPasswordValid)
            }
            .id(passwordTextField)
            
            Group {
              HStack {
                Spacer()
                  Button(action: {
                    
                  }) {
                    Text("forgot")
                      .underline()
                      .font(Font(UIFont.systemFont(ofSize: 15)))
                      .alignmentGuide(.trailing, computeValue: { _ in 0 })
                  }
                  .accentColor(Color(.white))
              }
              .padding(.top, 20)
              
              Spacer()
                .frame(height: 30)
              
              Button {
                doLoginAction()
              } label: {
                Text("sign in")
                  .foregroundColor(Color.white)
              }
              .frame(maxWidth: .infinity)
              .frame(height: 50)
              .background(Color.red)
              .cornerRadius(10)
              .font(Font(UIFont.systemFont(ofSize: 17)))
              
            }
            HStack {
            }
            .padding(EdgeInsets(top: 24, leading: 0, bottom: 200, trailing: 0))
          }
          .padding(.horizontal, 20)
          .clipped()
          .onAppear {
          }
        }
        .ignoresSafeArea(.keyboard)
        .navigationBarTitle("login", displayMode: .inline)
        .alert(isPresented: $showAlert) {
            Alert(
              title: Text("Demo1"),
                message: Text(authStatusString ?? ""),
                dismissButton: .default(Text("ok"))
            )
        }
        .onTapGesture {
          resignActiveTextField()
        }
      }

      if isLoading {
      }
    }
    .background(Color.black)
    .edgesIgnoringSafeArea(.all)
    
    
  }
  
  func resignActiveTextField() {
    isUsernameFirstResponder = false
    isPasswordFirstResponder = false
    UIApplication.shared.resignResponder()
  }
  
  func checkInputInfoValid() {
    self.checkEmailAvailable()
    self.checkPasswordAvailable()
  }
  
  func checkEmailAvailable() {
    var result = true
    email = AppUtils.trimmingTextSpace(text: email) ?? ""
    let errorMsg = AppUtils.getEmailErrorMsg(email: email, isSupportUsername: true, pageType: .Login)
    if let errorMessage = errorMsg {
      result = false
      emailErrorMessage = errorMessage
    } else {
      emailErrorMessage = ""
    }
    isEmailValid = result
  }
  
  func checkPasswordAvailable() {
    var result = true
    password = AppUtils.trimmingTextSpace(text: password) ?? ""
    let errorMsg = AppUtils.getPasswordErrorMsg(password: password, pageType: .Login)
    if let errorMessage = errorMsg {
      result = false
      passwordErrorMessage = errorMessage
    } else {
      passwordErrorMessage = ""
    }
    isPasswordValid = result
  }
  
  func doLoginAction() {
    UIApplication.shared.resignResponder()
    self.checkInputInfoValid()
    if isEmailValid && isPasswordValid && !isLoading {
      isLoading = true
      
    }
  }
}

struct LoginDemoView_Previews: PreviewProvider {
    static var previews: some View {
      LoginDemoView()
    }
}
