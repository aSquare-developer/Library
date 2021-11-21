//
//  Serial.swift
//  Library
//
//  Created by Artur Anissimov on 20.11.2021.
//

struct Serial {
    let name: String
    let image: String
    let category: SerialCategory
    let year: Int
    let description: String
}

enum SerialCategory: String, CaseIterable {
    case fantastic = "Фантастика"
    case horror = "Ужасы"
    case mystic = "Мистические"
}

extension Serial {
    
    static func getSerials(with category: SerialCategory) -> [Serial] {
        
        var serialsListWithCurrentCategory: [Serial] = []
        let data = SerialDataManager().serials
        
        data.forEach { serial in
            if serial.category == category {
                serialsListWithCurrentCategory.append(serial)
            }
        }
        
        return serialsListWithCurrentCategory
    }
    
    static func getCategoryList() -> [SerialCategory] {
        
        var categoryList: [SerialCategory] = []
        
        for value in SerialCategory.allCases {
            categoryList.append(value)
        }
        
        return categoryList
        
    }
}
