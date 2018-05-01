//
//  ViewController.swift
//  MyFavouriteMoviesWIthCollectionView
//
//  Created by Salwa on 4/21/18.
//  Copyright © 2018 Developers2Be. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {


    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var MoviesList = Array<MovieItem> ()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
         ReadFromPList()
        
    }

   

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return MoviesList.count
    
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell:CollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
         as! CollectionViewCell
        
        cell.movieName.text   = MoviesList[indexPath.row].Name!
        cell.movieDesc.text   = MoviesList[indexPath.row].Desc!
        cell.movieImage.image = UIImage (named : MoviesList[indexPath.row].Image!)
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let mainstoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let desVC = mainstoryboard.instantiateViewController(withIdentifier: "MovieDetailsVC") as? MovieDetailsVC
        
        desVC?.movieNameText = MoviesList[indexPath.row].Name!
        desVC?.movieDescText = MoviesList[indexPath.row].Desc!
        desVC?.movieImg      = UIImage (named : MoviesList[indexPath.row].Image!)!
        
        self.navigationController?.pushViewController(desVC!, animated: true)
        
    }
    
    func ReadFromPList() {
      
        let path = Bundle.main.path(forResource: "Movies", ofType: "plist")
        let url = URL(fileURLWithPath: path!)
        let data = try!Data(contentsOf: url)
        let plist = try!PropertyListSerialization.propertyList(from: data, options:.mutableContainers, format: nil)
        let dicArray = plist as![[String : String]]
        
        for dic in dicArray {
            
          MoviesList.append(MovieItem(Name: dic["Name"], Desc: dic["Desc"], Image: dic["Image"]))
        }
           collectionView.reloadData()

    }
    
    
}

