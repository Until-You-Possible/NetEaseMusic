//
//  FileLoader.swift
//  NetEaseMusic
//
//  Created by Ray on 2022/12/10.
//

import SwiftUI
import Foundation

struct CountriesData: Decodable {
    let name: String
    let result: [DistrictsRawData]
}

struct DistrictsRawData: Decodable {
    let english_name: String
    let chinese_name: String
    let country_code: String
    let phone_code  : String
}


class FileLoader {
    
    static func readLocalFile(_ filename: String) -> Data? {
        guard let file = Bundle.main.path(forResource: filename, ofType: "json")
            else {
                fatalError("Unable to locate file \"\(filename)\" in main bundle.")
        }
        
        do {
            return try String(contentsOfFile: file).data(using: .utf8)
        } catch {
            fatalError("Unable to load \"\(filename)\" from main bundle:\n\(error)")
        }
    }
    
    
    static func loadJson(_ data: Data) -> CountriesData {
        do {
            return try JSONDecoder().decode(CountriesData.self, from: data)
        } catch {
            fatalError("Unable to decode  \"\(data)\" as \(CountriesData.self):\n\(error)")
        }
    }
}
