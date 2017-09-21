//
//  DisplayNPCVC.swift
//  NPCGenerator
//
//  Created by Christian Riboldi on 9/12/17.
//  Copyright © 2017 Christian Riboldi. All rights reserved.
//

import UIKit
import Material
import MaterialComponents

class DisplayNPCVC : UITableViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameDescriptorLabel: UILabel!
    
    @IBOutlet weak var raceLabel: UILabel!
    @IBOutlet weak var subraceLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var alignmentLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var strengthLabel: UILabel!
    @IBOutlet weak var dexterityLabel: UILabel!
    @IBOutlet weak var constitutionLabel: UILabel!
    @IBOutlet weak var intelligenceLabel: UILabel!
    @IBOutlet weak var wisdomLabel: UILabel!
    @IBOutlet weak var charismaLabel: UILabel!
    @IBOutlet weak var classImageView: UIImageView!
    
    @IBOutlet weak var backgroundStory: UITextView!
    
    private var backButton: IconButton!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        update()
        
        navigationItem.setNavTitle("NPC Info Screen")
        
        navigationItem.backButton.image = Icon.cm.arrowBack
        navigationItem.backButton.tintColor = Color.getTextColor(Color.primaryColor())
    }
    
    override func viewDidLayoutSubviews() {
        backgroundStory.setContentOffset(.zero, animated: false)
        super.viewDidLayoutSubviews()
    }
    
    static func makeFromStoryboard() -> DisplayNPCVC {
        let storyboard = UIStoryboard(name: "DisplayNPC", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "DisplayNPCVC") as! DisplayNPCVC
    }
    
    private func update() {
        let npc = RandomNPCGenerator.getNPC(withRace: "Human", withGender: "Male", withAlignment: "LG", withOccupation: "Class")
        nameLabel.text = npc.name
        nameDescriptorLabel.text = npc.title
        raceLabel.text = npc.race.name()
        subraceLabel.text = "None"
        ageLabel.text = npc.age.description
        heightLabel.text = npc.height
        weightLabel.text = npc.weight
        alignmentLabel.text = npc.alignment.name()
        profileImageView.image = #imageLiteral(resourceName: "human_icon")
        
        strengthLabel.text = npc.stats.strength.score.toString()
        dexterityLabel.text = npc.stats.dexterity.score.toString()
        constitutionLabel.text = npc.stats.constitution.score.toString()
        intelligenceLabel.text = npc.stats.intelligence.score.toString()
        wisdomLabel.text = npc.stats.wisdom.score.toString()
        charismaLabel.text = npc.stats.charisma.score.toString()
        classImageView.image = #imageLiteral(resourceName: "class_ranger")
    }
    
}
