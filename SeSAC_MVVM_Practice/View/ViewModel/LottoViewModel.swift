//
//  LottoViewModel.swift
//  SeSAC_MVVM_Practice
//
//  Created by 문정호 on 2023/09/14.
//

import Foundation


class LottoViewModel{
    let title = Observable(value: 0)
    let drwtNo1 = Observable(value: 0)
    let drwtNo2 = Observable(value: 0)
    let drwtNo3 = Observable(value: 0)
    let drwtNo4 = Observable(value: 0)
    let drwtNo5 = Observable(value: 0)
    let drwtNo6 = Observable(value: 0)
    let bonusNo = Observable(value: 0)
    
    
    func loadData(drwNo: Int){
        print("loadData")
        let apiManager = APIManager()
        
        apiManager.requestAlamofireLottoAPI(drwNo: drwNo) { result in
            self.title.value = result.drwNo
            self.drwtNo1.value = result.drwtNo1
            self.drwtNo2.value = result.drwtNo2
            self.drwtNo3.value = result.drwtNo3
            self.drwtNo4.value = result.drwtNo4
            self.drwtNo5.value = result.drwtNo5
            self.drwtNo6.value = result.drwtNo6
            self.bonusNo.value = result.bnusNo
        }
    }
}
