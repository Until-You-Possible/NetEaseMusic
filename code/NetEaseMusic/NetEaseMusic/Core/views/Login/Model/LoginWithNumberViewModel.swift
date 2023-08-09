//
//  LoginWithNumberViewModel.swift
//  NetEaseMusic
//
//  Created by Ray on 2022/12/11.
//

import Foundation


struct CodeAreaType: Decodable {
    var name: String
    var result: [CodeAreaItem]
}

struct CodeAreaItem: Decodable {
    var english_name : String
    var chinese_name : String
    var country_code : String
    var phone_code   : String
}


class LoginWithNumberViewModel: ObservableObject {
    
    var districtList = [CodeAreaItem]()
    var alphabets = [String]()
    var dataDict: Dictionary<String, Array<CodeAreaItem>> = Dictionary()
    @Published var userPhoneNumber = ""
    
    init () {
        // get the area code for all contries and districts
        self.getAreaCodeData()
        
    }
    
    func getAreaCodeData() {
        if let data = FileLoader.readLocalFile(filename: "Districts"){
            let rawDistricts: CodeAreaType = FileLoader.loadJsonSpec(data: data)
            self.districtList = rawDistricts.result
            self.getAllLetterFromAreaCodeData()
            self.modifiyDataIntoTwoDimensional()
        }
    }
    // copy with data
    func getAllLetterFromAreaCodeData() {
        if districtList.count > 0 {
            // to find all alphabets from data
            // we suppose that all data are out of order
            for item in districtList {
                // get the first alphabet from english_name field
                if item.country_code.isEmpty {
                    return
                }
                let startIndex = item.country_code.startIndex
                let firstLetter = item.country_code[item.country_code.startIndex...item.country_code.index(startIndex, offsetBy: 0)]
                let convertFirstLetter = String(firstLetter)
                if alphabets.contains(convertFirstLetter) {
                    continue
                } else {
                    alphabets.append(convertFirstLetter)
                }
            }
            
        }
    }
    
    // deal with data according the letter we have
    // every letter have a corresponding the array
    func modifiyDataIntoTwoDimensional() {
        var sameDataArray = [CodeAreaItem]()
        for letter in alphabets {
            for list in districtList {
                if list.country_code.hasPrefix(letter) {
                    sameDataArray.append(list)
                    dataDict.updateValue(sameDataArray, forKey: letter)
                    // well, we need to notice that in our real data or project. maybe the data are out of order
                    // so we can order data by alphabet from A through Z
                } else {
                    sameDataArray = []
                }
            }
        }
    }
    // get phone code from service
    func getPhoneCode () {
        // url
    }
    
}
