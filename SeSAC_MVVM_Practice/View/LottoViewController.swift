//
//  ViewController.swift
//  SeSAC_MVVM_Practice
//
//  Created by 문정호 on 2023/09/14.
//

import UIKit

class LottoViewController: UIViewController {

    @IBOutlet weak var drwNoTextField: UITextField!
    @IBOutlet weak var bonusLabel: UILabel!
    @IBOutlet weak var sixthLabel: UILabel!
    @IBOutlet weak var fifthLabel: UILabel!
    @IBOutlet weak var fourthLabel: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    lazy var viewModel = {
        let viewModel = LottoViewModel()
        viewModel.title.bind { value in
            self.titleLabel.text = "로또 6/45 제\(value)회차 추첨번호"
            print(self.titleLabel.text)
        }
        viewModel.drwtNo1.bind { value in
            self.firstLabel.text = "\(value)"
        }
        viewModel.drwtNo2.bind { value in
            self.secondLabel.text = "\(value)"
        }
        viewModel.drwtNo3.bind { value in
            self.thirdLabel.text = "\(value)"
        }
        viewModel.drwtNo4.bind { value in
            self.fourthLabel.text = "\(value)"
        }
        viewModel.drwtNo5.bind { value in
            self.fifthLabel.text = "\(value)"
        }
        viewModel.drwtNo6.bind { value in
            self.sixthLabel.text = "\(value)"
        }
        viewModel.bonusNo.bind { value in
            self.bonusLabel.text = "\(value)"
        }
        print("bind 종료")
        return viewModel
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.loadData(drwNo: 1084)
    }

    @IBAction func tappedLoadButton(_ sender: UIButton) {
        guard let text = drwNoTextField.text else {return}
        guard let number = Int(text) else {return}
        viewModel.loadData(drwNo: number)
    }
    
}

