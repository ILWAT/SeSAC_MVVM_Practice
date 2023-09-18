//
//  PhotoViewModel.swift
//  SeSAC_MVVM_Practice
//
//  Created by 문정호 on 2023/09/19.
//

import Foundation

class PhotoViewModel{
    
    var photo = Observable(value: PhotoResult(id: "", slug: "", urls: Urls(raw: "", full: "", regular: "", small: "", thumb: "", smallS3: "")))
    
    func fetchPhoto(){
        APIManager.shared.requestUnsplashRandomAPI { photo in
            self.photo.value = photo
        }
    }
}
