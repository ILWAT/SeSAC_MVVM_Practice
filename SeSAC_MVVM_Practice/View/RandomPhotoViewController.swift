//
//  RandomPhotoViewController.swift
//  SeSAC_MVVM_Practice
//
//  Created by 문정호 on 2023/09/19.
//

import UIKit

class RandomPhotoViewController: UIViewController{
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var dataSource: UICollectionViewDiffableDataSource<Int, PhotoResult>!
    
    let viewModel = PhotoViewModel()
    
    override func viewDidLoad() {
        collectionView.collectionViewLayout = createLayout()
        viewModel.fetchPhoto()
        
        configureDataSource()
        updateSnapShot()
        
        collectionView.delegate = self
        
        viewModel.photo.bind { _ in
            self.updateSnapShot()
        }
        
       
    }
    
    
    private func createLayout() -> UICollectionViewLayout{
        let config = UICollectionLayoutListConfiguration(appearance: .plain)
        let layout = UICollectionViewCompositionalLayout.list(using: config)
        return layout
    }
    
    private func configureDataSource() {
        let cellRestration = UICollectionView.CellRegistration<UICollectionViewListCell, PhotoResult> { cell, indexPath, itemIdentifier in
            var content = UIListContentConfiguration.valueCell()
            let thumbURL = itemIdentifier.urls.thumb
            DispatchQueue.global().async {
                guard let url = URL(string: thumbURL) else {return}
                print("url ok")
                guard let data = try? Data(contentsOf: url) else {return}
                print("data ok")
                DispatchQueue.main.async {
                    content.image = UIImage(data: data)
                    cell.contentConfiguration = content
                }
            }
            
        }
        
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueConfiguredReusableCell(using: cellRestration, for: indexPath, item: itemIdentifier)
            return cell
        })
        
    }
    
    private func updateSnapShot() {
        var snapshot = NSDiffableDataSourceSnapshot<Int, PhotoResult>()
        snapshot.appendSections([0])
        snapshot.appendItems([viewModel.photo.value])
        dataSource.apply(snapshot)
    }
    
    
    
}

extension RandomPhotoViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.fetchPhoto()
    }
}
