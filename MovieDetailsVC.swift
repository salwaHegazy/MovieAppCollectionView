//
//  MovieDetailsVC.swift
//  MyFavouriteMoviesWIthCollectionView
//
//  Created by Salwa on 4/22/18.
//  Copyright © 2018 Developers2Be. All rights reserved.
//

import UIKit

class MovieDetailsVC: UIViewController {

    @IBOutlet weak var cellImage: UIImageView!
    
    @IBOutlet weak var cellName: UILabel!
    
    @IBOutlet weak var cellDesc: UITextView!
    
    
    var movieNameText = String ()
    var movieDescText = String ()
    var movieImg = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        cellName.text = movieNameText
        cellDesc.text = movieDescText
        cellImage.image = movieImg
        

    
    func buDismiss(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    }}
