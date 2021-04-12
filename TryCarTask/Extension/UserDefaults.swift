//
//  UserDefaults.swift
//  Iraq
//
//  Created by UPS Apple on 1/28/20.
//  Copyright © 2020 Mina Mageed. All rights reserved.
//

import Foundation
// MARK: - Hepler methods

protocol ObjectSavable {
    func setObject<Object>(_ object: Object, forKey: String) throws where Object: Encodable
    func getObject<Object>(forKey: String, castTo type: Object.Type) throws -> Object where Object: Decodable
}

enum ObjectSavableError: String, LocalizedError {
    case unableToEncode = "Unable to encode object into data"
    case noValue = "No data object found for the given key"
    case unableToDecode = "Unable to decode object into given type"
    
    var errorDescription: String? {
        rawValue
    }
}

extension UserDefaults {
    
    class func insertStringToUserDefaults(stringValue: String, key: String, sync: Bool = true) {
        UserDefaults.standard.set(stringValue, forKey: key)
        if sync {
            UserDefaults.standard.synchronize()
        }
    }
    
    class func getStringValueFromUserDefaults(key: String) -> String? {
        return UserDefaults.standard.object(forKey: key) as? String
    }
    
    class func insertBoolToUserDefaults(boolValue: Bool, key: String, sync: Bool = true) {
        UserDefaults.standard.set(boolValue, forKey: key)
        if sync {
            UserDefaults.standard.synchronize()
        }
    }
    
    class func getBoolValueFromUserDefaults(key: String) -> Bool? {
        return UserDefaults.standard.object(forKey: key) as? Bool
    }
    
}
// MARK: - Access Token
extension UserDefaults {
    
    class func setAccessToken(token: String, sync: Bool = true) {
        UserDefaults.insertStringToUserDefaults(stringValue: token, key: "token", sync: sync)
    }
    
    class func getAccessToken() -> String {
        return UserDefaults.getStringValueFromUserDefaults(key: "token") ?? ""
    }
    
    class func setRefreshToken(token: String, sync: Bool = true) {
        UserDefaults.insertStringToUserDefaults(stringValue: token, key: "RefreshToken", sync: sync)
    }
    
    class func getRefreshToken() -> String {
        return UserDefaults.getStringValueFromUserDefaults(key: "RefreshToken") ?? ""
    }
    
    
    
    class func setClientNumber(number: String, sync: Bool = true) {
        UserDefaults.insertStringToUserDefaults(stringValue: number, key: "ClientNumber", sync: sync)
    }
    
    class func getClientNumber() -> String? {
        return UserDefaults.getStringValueFromUserDefaults(key: "ClientNumber")
        
    }
    
    class func setUserName(name: String, sync: Bool = true) {
        UserDefaults.insertStringToUserDefaults(stringValue: name, key: "UserName", sync: sync)
    }
    
    class func getUserName() -> String? {
        return UserDefaults.getStringValueFromUserDefaults(key: "UserName")
        
    }
    
    class func setUserType(type: String, sync: Bool = true) {
        UserDefaults.insertStringToUserDefaults(stringValue: type, key: "UserType", sync: sync)
    }
    
    class func getUserType() -> String? {
        return UserDefaults.getStringValueFromUserDefaults(key: "UserType")
        
    }
    
}

// MARK: Is Logged User
extension UserDefaults {
    
    class func setUserAuthStatus(isLogged: Bool, sync: Bool = true) {
        UserDefaults.insertStringToUserDefaults(stringValue: isLogged.description, key: "UserAuthStatus", sync: sync)
    }
    
    class func getUserAuthStatus() -> String? {
        return UserDefaults.getStringValueFromUserDefaults(key: "UserAuthStatus")
    }
    
}

extension UserDefaults: ObjectSavable {
    func setObject<Object>(_ object: Object, forKey: String) throws where Object: Encodable {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(object)
            set(data, forKey: forKey)
        } catch {
            throw ObjectSavableError.unableToEncode
        }
    }
    
    func getObject<Object>(forKey: String, castTo type: Object.Type) throws -> Object where Object: Decodable {
        guard let data = data(forKey: forKey) else { throw ObjectSavableError.noValue }
        let decoder = JSONDecoder()
        do {
            let object = try decoder.decode(type, from: data)
            return object
        } catch {
            throw ObjectSavableError.unableToDecode
        }
    }
    
    func removeAllUserInfo() {
        UserDefaults.insertStringToUserDefaults(stringValue: "", key: "token", sync: true)
        let domain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: domain)
        UserDefaults.standard.synchronize()
        print(Array(UserDefaults.standard.dictionaryRepresentation().keys).count)
    }
}

// Mobile Number
extension UserDefaults {
    
    class func setMobileNumber(mobile: String, sync: Bool = true) {
        var mobileWithCodeCountry = mobile
        UserDefaults.insertStringToUserDefaults(stringValue: mobileWithCodeCountry, key: "mobile", sync: sync)
    }
    
    class func getMobileNumber() -> String? {
        return UserDefaults.getStringValueFromUserDefaults(key: "mobile")
    }
    
    class func setMobileNumberWithCountryCode(mobile: String,countryCode: String, sync: Bool = true) {
        var mobileWithCodeCountry = countryCode + mobile
        UserDefaults.insertStringToUserDefaults(stringValue: mobileWithCodeCountry, key: "mobileWithCodeCountry", sync: sync)
    }
    
    class func getMobileNumberWithCountryCode() -> String? {
        return UserDefaults.getStringValueFromUserDefaults(key: "mobileWithCodeCountry")
    }
    
    class func setCountryId(id: String, sync: Bool = true) {
        
        UserDefaults.insertStringToUserDefaults(stringValue: id, key: "CountryID")
    }
    
    class func getCountryId() -> Int? {
        let id = UserDefaults.getStringValueFromUserDefaults(key: "CountryID") ?? "368"
        return Int(id)
    }
    
    
    
    
    
    class func setPassword(password: String, sync: Bool = true) {
        UserDefaults.insertStringToUserDefaults(stringValue: password, key: "password", sync: sync)
    }
    
    class func getPassword() -> String? {
        return UserDefaults.getStringValueFromUserDefaults(key: "password")
        
    }
    
    class func setVerificationHistoryId(codId: String, sync: Bool = true) {
        UserDefaults.insertStringToUserDefaults(stringValue: codId, key: "setVerificationHistoryId", sync: sync)
    }
    
    class func getVerificationHistoryId() -> String? {
        return UserDefaults.getStringValueFromUserDefaults(key: "setVerificationHistoryId")
    }
    
    class func setClientFullName(codId: String, sync: Bool = true) {
        UserDefaults.insertStringToUserDefaults(stringValue: codId, key: "ClientFullName", sync: sync)
    }
    
    class func getClientFullName() -> String? {
        return UserDefaults.getStringValueFromUserDefaults(key: "ClientFullName")
    }
    
    
}
//MARKE :- Notification Preference 
extension UserDefaults {
    
    class func setIsViaSMS (_ isViaSms : Bool , sync: Bool = true) {
        var stringValue = "true"
        stringValue = isViaSms ? "true": "false"
        UserDefaults.insertStringToUserDefaults(stringValue: stringValue, key: "isViaSms", sync: sync)
        print("*****SET IsViaSMS    *******\(isViaSms) ")
    }
    
    class func getIsViaSMS ()-> Bool? {
        if   UserDefaults.getStringValueFromUserDefaults(key: "isViaSms") == "true" {
            return true
        }
        return false
    }
    
    class func setIsViaEmail (_ IsViaEmail : Bool , sync: Bool = true) {
        var stringValue = "true"
        stringValue = IsViaEmail  ? "true": "false"
        UserDefaults.insertStringToUserDefaults(stringValue: stringValue, key: "IsViaEmail", sync: sync)
    }
    class func getIsViaEmail ()-> Bool? {
        if   UserDefaults.getStringValueFromUserDefaults(key: "IsViaEmail") == "true" {
            return true
        }
        return false
    }
    
    
    
    class func setIsViaPushNotification (_ IsViaPushNotification : Bool , sync: Bool = true) {
        var stringValue = "true"
        stringValue = IsViaPushNotification ? "true": "false"
        UserDefaults.insertStringToUserDefaults(stringValue: stringValue, key: "IsViaPushNotification", sync: sync)
    }
    
    class func getIsViaPushNotification ()-> Bool? {
        if   UserDefaults.getStringValueFromUserDefaults(key: "IsViaPushNotification") == "true" {
            return true
        }
        return false
    }
    
}

//MARKE :- ProfileImageURL
extension UserDefaults {
    class func setProfileImageURL(imageURL: String) {
        UserDefaults.insertStringToUserDefaults(stringValue: imageURL, key: "ProfileImageURL", sync: true)
    }
    
    class func getProfileImageURL() -> String? {
        return UserDefaults.getStringValueFromUserDefaults(key: "ProfileImageURL")
        
    }
}

//MARKE :- FCM Token ID
extension UserDefaults {
    class func setFcmTokenId(tokenId: String) {
        UserDefaults.insertStringToUserDefaults(stringValue: tokenId, key: "userTokenId", sync: true)
    }
    
    class func getFcmTokenId() -> String? {
        return UserDefaults.getStringValueFromUserDefaults(key: "userTokenId")
        
    }
}

extension UserDefaults {
class func setIndustryId(id: Int, sync: Bool = true) {
    let idString = String(id)
   return   UserDefaults.insertStringToUserDefaults(stringValue: idString, key: "IndustryId", sync: true)
}

class func getIndustryId() -> Int? {
    let id = UserDefaults.getStringValueFromUserDefaults(key: "IndustryId") ?? "0"
   if id == "0" { return nil } else { return Int(id)}
}
    class func setMerchantId(id: Int, sync: Bool = true) {
        let idString = String(id)
       return   UserDefaults.insertStringToUserDefaults(stringValue: idString, key: "MerchantId", sync: true)
    }

    class func getMerchantId() -> Int? {
        let id = UserDefaults.getStringValueFromUserDefaults(key: "MerchantId") ?? "0"
       
        if id == "0" { return nil } else { return Int(id)}
    }
    class func setStoreId(id: Int, sync: Bool = true) {
        let idString = String(id)
       return   UserDefaults.insertStringToUserDefaults(stringValue: idString, key: "StoreId", sync: true)
    }

    class func getStoreId() -> Int? {
        let id = UserDefaults.getStringValueFromUserDefaults(key: "StoreId") ?? "0"
        if id == "0" { return nil } else { return Int(id)}
    }
    
    class func setRewardId(id: Int, sync: Bool = true) {
        let idString = String(id)
       return   UserDefaults.insertStringToUserDefaults(stringValue: idString, key: "RewardId", sync: true)
    }

    class func getRewardId() -> Int? {
        let id = UserDefaults.getStringValueFromUserDefaults(key: "RewardId") ?? "0"
        if id == "0" { return nil } else { return Int(id)}

}
    class func setBrandId(id: Int, sync: Bool = true) {
        let idString = String(id)
       return   UserDefaults.insertStringToUserDefaults(stringValue: idString, key: "BrandId", sync: true)
    }

    class func getBrandId() -> Int? {
        let id = UserDefaults.getStringValueFromUserDefaults(key: "BrandId") ?? "0"
       
        if id == "0" { return nil } else { return Int(id)}
    }
}

extension UserDefaults {
    class func getSavedAccountTutorial() -> [String : [String : String]] {
        return (UserDefaults.standard.dictionary(forKey: "savedUserIds") ?? [String : [String : String]]()) as? [String : [String : String]] ?? [String : [String : String]]()
    }
    
    class func setSavedAccountTutorial(_ users : [String : [String : String]]) {
        UserDefaults.standard.set(users, forKey: "savedUserIds")
        UserDefaults.standard.synchronize()
    }
    
    class func userIsfound(userId : String) -> Bool {
        let users = UserDefaults.getSavedAccountTutorial()
        
        if users[userId] != nil {
            return true
        }
        
        return false
    }
    
    class func getTutorialsFlags(userId : String) -> [String : String]?{
        
        if self.userIsfound(userId: userId) {
            
            let users = UserDefaults.getSavedAccountTutorial()

            if users[userId] != nil {
                return users[userId]
            } else {
                return nil
            }
                        
        } else {
            return nil
        }
    }
}

extension UserDefaults {
    
    class func setMobileNumberStatus(status: Bool, sync: Bool = true) {
        UserDefaults.insertBoolToUserDefaults(boolValue: status, key: "mobileNumberStatus", sync: sync)
    }
    
    class func getMobileNumberStatus() -> Bool? {
        return UserDefaults.getBoolValueFromUserDefaults(key: "mobileNumberStatus")
    }
    
    class func getMobileNumberStatus() -> Bool {
        return UserDefaults.getBoolValueFromUserDefaults(key: "mobileNumberStatus") ?? false 
    }
    
}
