//
//  ViewController.swift
//  supercar
//
//  Created by DongSu Han on 2016. 12. 12..
//  Copyright © 2016년 DongSuHan. All rights reserved.
//

import UIKit

//델리게이션과 소스 두개 넣음
class ViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    
    @IBOutlet weak var imgView: UIImageView!
    
    let carCompanyName = ["Tesla", "Lamborghini","porsche"]
    var carModel:[String] = []
    var carModelImage:[String] = []
    
    let teslaImageNames = ["tesla-model-s.jpg","tesla-model-x.jpg"]
    let lamborghiniImageNames = ["lamborghini-aventador.jpg","lamborghini-veneno.jpg","lamborghini-huracan.jpg"]
    let porscheImageNames = ["porsche-911.jpg","porsche-boxter.jpg"]

    
    
    let tesla = ["Model S", "Modle X"];
    let lamborghini = ["aventador","veneno","huracan"]
    
    var porsche = ["911", "boxter"]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        carModel = tesla
        carModelImage = teslaImageNames
        
        imgView.layer.cornerRadius = 50.0
        imgView.layer.masksToBounds = true

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //how many depth?
    //data source
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    


    //픽커뷰 내용을 출력합니다.
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        //0번 컴포넌트 1번 채우고 2번채우고
        //1번 컴포넌트 1번 그 후 2번
        if component == 0{
            return carCompanyName[row]
        }else{
            return carModel[row]
        }
    }
    
    //0번 컴포넌트에 몇개 넣을거니?
    //그 후 카운터 개수 반환
    //uipickerview delegate
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        //컴포넌트가 첫 로우일때
        if component == 0{
            return carCompanyName.count
        }else{
            return carModel.count
        }
    }
    
    
    //몇번 컴포넌트의 몇번째가 실행되나 감지
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 && row == 0 {
            carModel = tesla
            carModelImage = teslaImageNames
        }else if component == 0 && row == 1 {
            carModel = lamborghini
            carModelImage = lamborghiniImageNames
        }else if component == 0 && row == 2 {
            carModel = porsche
            carModelImage = porscheImageNames
        }
        
        pickerView.reloadAllComponents()
        
        imgView.image = UIImage(named: carModelImage[pickerView.selectedRow(inComponent:1)])
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

