//
//  HomeViewController.swift
//  Catstagram
//
//  Created by 선가연 on 5/3/24.
//

import UIKit

class HomeViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // 구분선 없애기
        tableView.separatorStyle = .none
        
        // feedTableView 등록
        let feedNib = UINib(nibName: "FeedTableViewCell", bundle: nil)
        tableView.register(feedNib, forCellReuseIdentifier: "FeedTableViewCell")
        
//        // storyTableView 등록
//        let storyNib = UINib(nibName: "StoryTableViewCell", bundle: nil)
//        tableView.register(storyNib, forCellReuseIdentifier: "StoryTableViewCell")
    }
}

extension HomeViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //        if indexPath.row == 0 {
        //            guard let cell = tableView.dequeueReusableCell(withIdentifier: "StoryTableViewCell", for: indexPath) as? StoryTableViewCell else { return UITableViewCell()
        //            }
        //            return cell
        //        }
        //        else {
        //            guard let cell = tableView.dequeueReusableCell(withIdentifier: "FeedTableViewCell", for: indexPath) as? FeedTableViewCell else { return UITableViewCell()
        //            }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FeedTableViewCell", for: indexPath) as? FeedTableViewCell else { return UITableViewCell()
        }
        
        // 선택 기능 없애기
        cell.selectionStyle = .none
        return cell
    }
    
    
    // 크기 설정
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //        if indexPath.row == 0 {
        //            return 80
        //        }
        //        else {
        //            return 570
        //        }
        return 570
    }
}
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        guard let tableViewCell = cell as? StoryTableViewCell else {
//            return
//        }
//        tableViewCell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
//    }


//extension HomeViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 10
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
////        let cell = UICollectionViewCell()
////        cell.backgroundColor = .black
////        return cell
//        
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoryCollectionViewCell", for: indexPath) as? StoryCollectionViewCell else {
//            return UICollectionViewCell()
//        }
//        
//        return cell
//    }
//    
//    // 셀 크기 설정
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 50, height: 60)
//    }
//    
//}
