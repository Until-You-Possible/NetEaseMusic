//
//  FileLoader.swift
//  NetEaseMusic
//
//  Created by Ray on 2022/12/10.
//

import SwiftUI
import Foundation
import SwiftyJSON


class FileLoader {
    
    static func readLocalFile(filename: String) -> Data? {
        guard let file = Bundle.main.path(forResource: filename, ofType: "json")
            else {
                fatalError("Unable to locate file \"\(filename)\" in main bundle.")
        }
        
        do {
            print("file", file)
            return try String(contentsOfFile: file).data(using: .utf8)
        } catch {
            fatalError("Unable to load \"\(filename)\" from main bundle:\n\(error)")
        }
    }
    
    
    static func loadJson(data: Data) -> JSON {
        do {
            let json = try JSON(data: data)
            return json
        } catch {
            fatalError("Unable to decode  \"\(data)\" \n\(error)")
        }
    }
    
    static func loadJsonSpec<T: Decodable>(data: Data) -> T {
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            fatalError("Unable to decode  \"\(data)\" as \(T.self):\n\(error)")
        }
    }
}
