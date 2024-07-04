//
//  HomeViewController.swift
//  Catstagram
//
//  Created by 선가연 on 5/3/24.
//

import UIKit
import Kingfisher

class HomeViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    let imagePickerViewController = UIImagePickerController()
    
    @IBAction func buttonGoAlbum(_ sender: UIButton) {
        self.imagePickerViewController.sourceType = .photoLibrary
        self.present(imagePickerViewController, animated: true, completion: nil)
    }
    
    var arrayCat: [FeedModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // 구분선 없애기
        tableView.separatorStyle = .none
        
        // feedTableView 등록
        let feedNib = UINib(nibName: "FeedTableViewCell", bundle: nil)
        tableView.register(feedNib, forCellReuseIdentifier: "FeedTableViewCell")
        
        // storyTableView 등록
        let storyNib = UINib(nibName: "StoryTableViewCell", bundle: nil)
        tableView.register(storyNib, forCellReuseIdentifier: "StoryTableViewCell")
        
        let input = FeedAPIInput(limit: 30, page: 10)
        FeedDataManager().feedDataManager(input, self)
        
        imagePickerViewController.delegate = self
    }
}

extension HomeViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayCat.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            if indexPath.row == 0 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "StoryTableViewCell", for: indexPath) as? StoryTableViewCell
                else {
                    return UITableViewCell()
                }
                return cell
            }
            else {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "FeedTableViewCell", for: indexPath) as? FeedTableViewCell 
                else {
                    return UITableViewCell()
                }
                
                // 선택 기능 없애기
                cell.selectionStyle = .none
                
                // 이미지 넣기
                if let urlString = arrayCat[indexPath.row - 1].url {
                    let url = URL(string: urlString)
                    cell.imageViewFeed.kf.setImage(with: url)
                }
                return cell
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FeedTableViewCell", for: indexPath) as? FeedTableViewCell else { return UITableViewCell()
        }
    }
    
    
    // 크기 설정
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            if indexPath.row == 0 {
                return 80
            }
            else {
                return 570
            }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let tableViewCell = cell as? StoryTableViewCell else {
            return
        }
        
        tableViewCell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
    }
    
}



extension HomeViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = UICollectionViewCell()
//        cell.backgroundColor = .black
//        return cell
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoryCollectionViewCell", for: indexPath) as? StoryCollectionViewCell else {
            return UICollectionViewCell()
        }

        return cell
    }
    
    // 셀 크기 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50, height: 60)
    }
    
}

extension HomeViewController {
    func successAPI(_ result: [FeedModel]) {
        arrayCat = result
        tableView.reloadData()
    }
}

extension HomeViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            // print(image)
            let imageString = "gs:/catstagram-d7fbf.appspot.com/Cat2"
            let input = FeedUploadInput(content: "저희 상이입니다. 귀엽지 않나요?", postImgsUrl: [imageString])
            FeedUploadDataManager().posts(self, input)
            
            self.dismiss(animated: true, completion: nil)
        }
    }
}
