//
//  AppUtils.swift
//  Demo1
//
//  Created by axidaka on 2023/2/23.
//

import Foundation
import UIKit

public enum AppShowAccountPageType: NSInteger {
    case Login = 0
    case ForgetPassword = 1
    case Register = 2
    case Purchase = 3
    case Landing = 4
    case Favorite = 5

}

open class AppUtils {
  
  required public init() {
    
  }
  
  private static var sharedManager: AppUtils = {
    
    if let appName = Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as? String,
       let classType = NSClassFromString(appName + "." + "Utils") as? AppUtils.Type {
      let instance = classType.init()
      return instance
    } else {
      let instance = AppUtils()
      return instance
    }

  }()
  
  open class func shared() -> AppUtils {
      return sharedManager
  }
  
  
  // MARK: - Public methods
  
  open class var appName: String {
    return (Bundle.main.infoDictionary?["CFBundleDisplayName"] as? String) ?? ""
  }
  
  public class func screenWidth() -> CGFloat {
      return UIScreen.main.bounds.size.width
  }
  
  public class func screenHeight() -> CGFloat {
      return UIScreen.main.bounds.size.height
  }
  
  public class func getLeafInstance<T: LeafInstanceProtocol>(_ leafName: String) -> T {
    if let appName = Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as? String,
       let className = NSClassFromString(appName + "." + leafName) as? T.Type {
      let instance = className.init()
      return instance
    } else {
      let instance = T.init()
      return instance
    }
  }
  
  // Account
  open class func trimmingTextSpace(text: String?) -> String? {
      return text?.trimmingCharacters(in: CharacterSet.whitespaces)
  }
  
  open class func checkNameValid(name: String?) -> Bool {
      var checkFlag = false
      
      if let newString = name {
          if newString.count>0 && newString.count <= AppUtils.getAccountRegisterNameMaxLength() {
              checkFlag = true
          }
      }
      
      return checkFlag
  }
  
  open class func checkEmailAndUserNameValid(name: String?) -> Bool {
      var checkFlag = false
      
      if let newString = name {
          if AppUtils.checkUserNameValid(userName: newString) || AppUtils.checkEmailValid(email: newString) {
              checkFlag = true
          }
      }
      
      return checkFlag
  }
  
  open class func checkUserNameValid(userName: String?) -> Bool {
      
      var checkFlag = false
      
      if let newString = userName {
          if !newString.isEmpty && newString.count <= AppUtils.getAccountUsernameMaxLength() {
              checkFlag = true
          }
      }
      
      return checkFlag
  }
  
  open class func checkEmailValid(email: String?) -> Bool {
      
      var checkFlag = false
      
      if let newString = email {
          if newString.count <= AppUtils.getAccountEmailMaxLength() {
              let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]+"
              let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
              
              checkFlag = emailTest.evaluate(with: email)
          }
      }
      
      return checkFlag
  }
  
  open class func checkPasswordVaild(password: String?) -> Bool {
      var checkFlag = false
      let passwordRegex = "\\S{6,}"
      let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
      
      checkFlag = passwordTest.evaluate(with: password)
      
      return checkFlag
  }
  
  open class func checkDateValid(date: String?) -> Bool {
      var checkFlag = false
      
      if let newString = date {
          if !newString.isEmpty {
              checkFlag = true
          }
      }
      
      return checkFlag
  }
  
  open class func getNameErrorMsg(name: String?, isFirstName: Bool) -> String? {
      let isValid = AppUtils.checkNameValid(name: name)
      
      if isValid {
          return nil
      } else {
          
          if let newString = name, !newString.isEmpty {
              return isFirstName ? "nl.register.validate.firstnameinvalid" : "nl.register.validate.lastnameinvalid"
          } else {
              return isFirstName ? "nl.register.validate.firstnameempty" : "nl.register.validate.lastnameempty"
          }
      }
  }
  
  open class func getEmailErrorMsg(email: String?, isSupportUsername: Bool, pageType: AppShowAccountPageType) -> String? {
      var isValid = false
      
      if isSupportUsername {
          isValid = AppUtils.checkEmailAndUserNameValid(name: email)
      } else {
          isValid = AppUtils.checkEmailValid(email: email)
      }
      
      if isValid {
          return nil
      } else {
          
          if let newString = email, !newString.isEmpty {
              
              if pageType == .Login {
                  return "nl.login.validate.usernameinvalid"
              } else if pageType == .ForgetPassword {
                  return "nl.forgot.validate.emailinvalid"
              } else {
                  return "nl.register.validate.emailinvalid"
              }
          } else {
              
              if pageType == .Login {
                  return "nl.login.validate.usernameempty"
              } else if pageType == .ForgetPassword {
                  return "nl.forgot.validate.emailempty"
              } else {
                  return "nl.register.validate.emailempty"
              }
          }
      }
  }
  
  open class func getUserNameErrorMsg(userName: String?) -> String? {
      let isValid = AppUtils.checkUserNameValid(userName: userName)
      
      if isValid {
          return nil
      } else {
          
          if let newString = userName, !newString.isEmpty {
              
              return "nl.register.validate.usernameinvalid"
          } else {
              
              return "nl.register.validate.usernameempty"
          }
      }
  }
  
  open class func getPasswordErrorMsg(password: String?, pageType: AppShowAccountPageType) -> String? {
      let passwordValid = AppUtils.checkPasswordVaild(password: password)
      
      if passwordValid {
          return nil
      } else {
          
          if let newString = password, !newString.isEmpty {
              if pageType == .Login {
                  return ("nl.login.validate.passwordinvalid")
              } else {
                  return ("nl.register.validate.passwordinvalid")
              }
          } else {
              if pageType == .Login {
                  return ("nl.login.validate.passwordempty")
              } else {
                  return ("nl.register.validate.passwordempty")
              }
          }
      }
  }
  
  open class func getConfirmPasswordErrorMsg(confirmPassword: String?, password: String?) -> String? {
      let passwordValid = AppUtils.checkPasswordVaild(password: confirmPassword) && (confirmPassword == password)
      
      if !passwordValid {
          return ("nl.register.validate.confirmpasswordinvalid")
      } else {
          return nil
      }
  }
  
  open class func getDateErrorMsg(date: String?) -> String? {
      let dateValid = AppUtils.checkDateValid(date: date)
      
      if dateValid {
          return nil
      } else {
          return ("nl.register.validate.dateempty")
      }
  }
  
  open class func getAccountUsernameMaxLength() -> NSInteger {
      return  128
  }
  
  open class func getAccountEmailMaxLength() -> NSInteger {
      return  128
  }
  
  open class func getAccountPasswordMaxLength() -> NSInteger {
      return  64
  }
  
  open class func getAccountRegisterNameMaxLength() -> NSInteger {
      return  20
  }
  
  // MARK: - Private methods

}

public protocol LeafInstanceProtocol {
    init()
}
