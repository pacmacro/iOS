import Mapbox

class ViewController: UIViewController,
                        MGLMapViewDelegate{
    //Controller for the mapview, i haven't renamed this since it would break a bunch of other elements
    
    var mapView: MGLMapView!
    var timer: Timer = Timer()
    var times = 0
    var annotationList: [MGLPointAnnotation] = [] //list of annotations to display on the map
    //Information

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // initialize the map view
        mapView = MGLMapView(frame: view.bounds, styleURL: URL(string: "mapbox://styles/ctrlshiftgo/cihfgoup600o2jnkx6dhzb3eh"))
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // set the map's center coordinate
        mapView.setCenter(CLLocationCoordinate2D(latitude: 49.280915,
            longitude: -123.122352),
            zoomLevel: 15, animated: false)
        view.addSubview(mapView)
        mapView.delegate = self
        //Drawing overlay
        
        //drawBoundingRect()
        
        //Initialize Annotation List
        
        //Call Timer Object
        timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(ViewController.mapLoop), userInfo: nil, repeats: true )
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        timer.invalidate()
        print("TImer should have been invalidated\n")
    }
    func drawBoundingRect(){
        //Setup center location
        let vanLat = 49.280915
        let vanLon = -123.122352
        //Setting up coordinates
        var coords: [CLLocationCoordinate2D] = [
            CLLocationCoordinate2DMake(vanLat, vanLon),
            CLLocationCoordinate2DMake(vanLat, vanLon + 0.002),
            CLLocationCoordinate2DMake(vanLat - 0.002, vanLon + 0.002),
            CLLocationCoordinate2DMake(vanLat - 0.002, vanLon)
        ]
        //Building Overlay
        let tmpOverlay = MGLPolygon(coordinates: &coords, count: UInt(coords.count))
        //Adding the overlay to the map
        mapView.addAnnotation(tmpOverlay)
    }
    func mapView(_ mapView: MGLMapView, alphaForShapeAnnotation annotation: MGLShape) -> CGFloat{
        return 0.5
    }
    func mapView(_ mapView: MGLMapView, fillColorForPolygonAnnotation annotation: MGLPolygon) -> UIColor {
        return UIColor.white
    }
    /*
     * This is the main logic for the map as it is updating
     * Called by a timer object
     * Calls functions to get data from the server and calls draw player on each
     */
    func mapLoop(){
        //Initializing and setup
        var currentPlayers: [Player] = getPlayers()
        currentPlayers = getPlayers()
        //Update Player locations on map
        for player in currentPlayers{
            drawPlayer(player, annotationList: &annotationList)
        }
        redrawAnnotations(annotationList)
        //Counter for times this has looped
        print("I have waited \(times) cycles")
        print("I have generated \(Double(arc4random_uniform(9))/100) this random number")
        times += 1
    }
    func getPlayers() -> [Player]{
        //Calls the server
        //Pretending to call server
        let listOfPlayers: [Player] = [
            Player.init(playerID: "1", playerName: "Josh", playerType: "Pacman", latitude: 0,longitude: 0)
            ]
        return listOfPlayers
        //Returns a list of aplayer objects
    }
    /**
     * Will check to see if the player has already been drawn
     * Removes the existing player based on the id
     * Redraws them at the new location
     */
    func drawPlayer(_ playerInput: Player, annotationList: inout [MGLPointAnnotation]){
        
        // Setting up annotation object
        let playerIcon = MGLPointAnnotation()
        playerIcon.coordinate = playerInput.coordinates
        playerIcon.title = playerInput.playerType + "-" + playerInput.playerName
        playerIcon.subtitle = playerInput.playerType
                
        //Check for player already existing on the screen
        var annotationExists: Bool = false
        for annotation in annotationList {
            
            if annotation.title == playerInput.playerType + "-" + playerInput.playerName {
                
                annotationExists = true
                annotation.coordinate = playerInput.coordinates
            }
        }
        if(!annotationExists){
            mapView.addAnnotation(playerIcon)
            annotationList.append(playerIcon)
        }
    }
    // Removes all existing annotations and replaces them to update coordinates
    func redrawAnnotations(_ annotationList: [MGLPointAnnotation]){
        
        mapView.removeAnnotations(annotationList)
        mapView.addAnnotations(annotationList)
        
    }
    
    /// Delegate function to set images for annotations. Will set the image based on the title of the annotation.
    func mapView(_ mapView: MGLMapView, imageFor annotation: MGLAnnotation) -> MGLAnnotationImage?{
        var imageName = "";
        // Unwrap the annotation subtitle
        if let iconType : String = annotation.subtitle! {
            imageName = iconType;
        }
        var annotationImage = mapView.dequeueReusableAnnotationImage(withIdentifier: imageName)
        let playerName : String = annotation.title!!
        if annotationImage == nil {
            let image = UIImage(named: imageName)
            annotationImage = MGLAnnotationImage(image: image!, reuseIdentifier: imageName + playerName)
        }
        return annotationImage
    }
    
}
