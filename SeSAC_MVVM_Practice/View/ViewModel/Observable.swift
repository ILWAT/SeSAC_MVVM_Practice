//
//  Observable.swift
//  SeSAC_MVVM_Practice
//
//  Created by 문정호 on 2023/09/14.
//

import Foundation

class Observable<T> {
    private var notifier: ((T)->Void)?
    
    var value: T{
        didSet{
            print(value)
            notifier?(value)
        }
    }
    
    init(value: T) {
        self.value = value
    }
    
    func bind(_ completionHandler: @escaping ((T)->Void)){
        completionHandler(value)
        self.notifier = completionHandler
    }
}
