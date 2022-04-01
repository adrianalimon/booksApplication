//
//  CatalogoViewController.swift
//  MyLibraryProject
//
//  Created by Adriana Limon on 2/7/22.
//

import UIKit
import iCarousel
import MaterialComponents
import MaterialComponents.MaterialTabs_TabBarView

class CatalogoViewController : UIViewController, UITextFieldDelegate, iCarouselDataSource {
    
    var saludoLabel : UILabel?
    var backButton : UIButton?
    var userLabel : UILabel?
    var tableView : UITableView?
    var userValue = ""
    
    var signatureText : UILabel?
    var logOutButton : UIButton?
    var bottomMenuView : UIView?
    
    var searchTextField : UITextField?
    var searchButton : UIButton?
    

    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    var dataSoruce : MenuObject?
    
    var backgorundColor = UIColor(displayP3Red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
    
    
    let myCarousel: iCarousel = {
        let view = iCarousel()
        view.type = .rotary
        return view
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(myCarousel)
        myCarousel.dataSource = self
        
        myCarousel.autoscroll = -0.5
        
        myCarousel.frame = CGRect(x: 0, y: 78, width: view.frame.size.width, height: 120)

        view.backgroundColor = backgorundColor
        
        getData()
        initUI()
        
        searchTextField?.delegate = self
        
        let label = UILabel()
        label.text = userValue
        label.frame = CGRect(x: 52, y: 38, width: width, height: 35)
        view.addSubview(label)
        
        
    }
    
    func numberOfItems(in carousel: iCarousel) -> Int {
        return 10
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView{
        let view = UIView(frame: CGRect(x: 0, y: 78, width: self.view.frame.size.width/3.5, height: 120))
        view.backgroundColor = .clear
        
        let imageView = UIImageView(frame: view.bounds)
        view.addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "book\(index + 1)")
        
        return view
    }
    
    
    func initUI(){
        
        let booksImage = "booksHalfImage.png"
        let image1 = UIImage(named: booksImage)
        let imageView1 = UIImageView(image: image1!)
        imageView1.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 80)
        imageView1.center.x = self.view.center.x
        view.addSubview(imageView1)
        
        
        backButton = UIButton(frame: CGRect(x: 13, y: 30, width: 25, height: 25))
        backButton?.setImage(UIImage(named: "backButton"), for: .normal)
        backButton?.addTarget(self, action:#selector(backAction) , for: .touchUpInside)
        backButton?.backgroundColor = .clear
        view.addSubview(backButton!)
        
        
        saludoLabel = UILabel(frame: CGRect(x: 52, y: 18, width: width, height: 35))
        saludoLabel?.text = "Hola"
        saludoLabel?.font = UIFont(name:"HelveticaNeue-Bold", size: 24.0)
        saludoLabel?.textColor = .black
        saludoLabel?.backgroundColor = .clear
        
        view.addSubview(saludoLabel!)
        
        
        userLabel = UILabel(frame: CGRect(x: 52, y: 38, width: width, height: 35))
        userLabel?.text = "AdrianaLimon"
        userLabel?.font = UIFont(name:"HelveticaNeue-Bold", size: 26.0)
        userLabel?.textColor = .white
        userLabel?.backgroundColor = .clear
        
        view.addSubview(userLabel!)
        
        
        let lineView = UIView(frame: CGRect(x: 158, y: 63, width: 170, height: 2.5))
        lineView.layer.borderWidth = 2.5
        lineView.layer.borderColor = UIColor.black.cgColor
        //self.view.addSubview(lineView)
        
        let myColor : UIColor = UIColor(red: 155, green: 159, blue: 165, alpha: 0.52)
        
        searchTextField = UITextField(frame: CGRect(x: 0, y: 210, width: 310, height: 35))
        searchTextField?.placeholder = "Búsqueda"
        searchTextField?.layer.cornerRadius = 12
        searchTextField?.layer.borderWidth = 0.5
        searchTextField?.layer.borderColor = myColor.cgColor
        searchTextField?.backgroundColor = .lightGray
        searchTextField?.textAlignment = NSTextAlignment.left
        searchTextField?.keyboardType = UIKeyboardType.default
        searchTextField?.autocorrectionType = UITextAutocorrectionType.no
        searchTextField?.clearButtonMode = UITextField.ViewMode.whileEditing
        searchTextField?.center.x = self.view.center.x
        searchTextField?.translatesAutoresizingMaskIntoConstraints = false
        searchTextField?.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: (searchTextField?.frame.height)!))
        searchTextField?.leftViewMode = .always
        view.addSubview(searchTextField!)
        
        searchButton = UIButton(frame: CGRect(x: width - 48, y: 218, width: 20, height: 20))
        searchButton?.setImage(UIImage(named: "magnifier"), for: .normal)
        searchButton?.addTarget(self, action: #selector(goToSearch), for: .touchUpInside)
        view.addSubview(searchButton!)
        
        
        let tabBarView = MDCTabBarView(frame: CGRect(x: 0, y: 200, width:  self.view.bounds.size.width, height: 50))
        tabBarView.items = [
          UITabBarItem(title: "Libros", image: UIImage(named: "phone"), tag: 0),
          UITabBarItem(title: "Categorias", image: UIImage(named: "heart"), tag: 0),
          UITabBarItem(title: "Autores", image: UIImage(named: "heart"), tag: 0),
        ]
        tabBarView.preferredLayoutStyle = .scrollableCentered
        
        //view.addSubview(tabBarView)
        // Configure constraints
        
        
        tableView = UITableView(frame: CGRect(x: 10, y: 250, width: width - 20, height: height - 100))
        tableView?.backgroundColor = backgorundColor
        tableView?.delegate = self
        tableView?.dataSource = self
        
        view.addSubview(tableView!)
        
        
        bottomMenuView = UIView(frame: CGRect(x: 0, y: height - 35, width: width, height: 45))
        bottomMenuView?.backgroundColor = .darkGray
        view.addSubview(bottomMenuView!)
        
        
        logOutButton = UIButton(frame: CGRect(x: width - 35, y: 6.5, width: 25, height: 25))
        logOutButton?.backgroundColor = .clear
        logOutButton?.setImage(UIImage(named: "whiteLogOut"), for: .normal)
        //logOutButton?.center.x = self.view.center.x
        bottomMenuView?.addSubview(logOutButton!)
        
        
        signatureText = UILabel(frame: CGRect(x: 10, y: 2.8, width: 150, height: 30))
        signatureText?.text = "©MyMatebrary 2022"
        signatureText?.font = .systemFont(ofSize: 9)
        signatureText?.textColor = .white
        signatureText?.backgroundColor = .clear
        signatureText?.textAlignment = .left
        bottomMenuView?.addSubview(signatureText!)
        
        
    }
    
    func getData(){
        
        // MARK: - Literatura Juvenil
        let piedraFilosofal = Producto(nombre: "Harry Potter y la Piedra Filosofal", descripcion: "Harry Potter se ha quedado huérfano y vive en casa de sus abominables tíos y su insoportable primo Dudley. Harry se siente muy triste y solo, hasta que un buen día recibe una carta que cambiará su vida para siempre. En ella le comunican que ha sido aceptado como alumno en el colegio Hogwarts de Magia y Hechicería.", precio: 299.00, imagen: "harry_potter", peso: 250.0, calorias: 100, autor: "J. K. Rowling", categoria: "Literatura Juvenil", biografia: "Joanne Rowling (Yate, 31 de julio de 1965), quien escribe bajo los seudónimos J. K. Rowling y Robert Galbraith, es una escritora, productora de cine y guionista británica, conocida por ser la autora de la serie de libros Harry Potter, que han superado los quinientos millones de ejemplares vendidos. Este éxito literario supuso que la Sunday Times Rich List de 2008 estimase la fortuna de Rowling en 560 millones de libras, lo que la situó como la duodécima mujer más rica en el Reino Unido. Asimismo, Forbes ubicó a Rowling en el cuadragésimo puesto en su lista de las celebridades más poderosas de 2007 y la revista Time la seleccionó como «personaje del año» ese mismo año, resaltando la inspiración social, moral y política que les ha dado a los personajes de Harry Potter. Rowling es una conocida filántropa que apoya instituciones de caridad como Comic Relief, One Parent Families y Multiple Sclerosis Society of Great Britain.")
        
        let juegosDelHambre = Producto(nombre: "Los Juegos del Hambre", descripcion: "En una oscura versión del futuro próximo, doce chicos y doce chicas se ven obligados a participar en un reality show llamado «Los Juegos del Hambre». Solo hay una regla: matar o morir.", precio: 349.00, imagen: "juegos_hambre", peso: 255, calorias: 1000, autor: "Suzanne Collins", categoria: "Literatura Juvenil", biografia: "Suzanne Collins (Hartford, Connecticut, Estados Unidos, 10 de agosto de 1962) es una escritora y guionista estadounidense, creadora de la famosa serie de Los juegos del hambre (The Hunger Games). La carrera de Suzanne empezó en 1991 como guionista en programas de televisión para niños trabajando para canales como Nickelodeon. Mientras trabajaba en el programa Generation u! de Kid's WBOOK, conoció al escritor de libros para niños James Plumiew quien la inspiró a escribir libros infantiles por su cuenta. En 2003 publicó su primera novela Gregor: Las Tierras Bajas, inspirada por la novela de Lewis Carroll, Las aventuras de Alicia en el país de las maravillas. A este libro seguirían otros cuatro como parte de la saga Las Crónicas de las Tierras Bajas. En 2005 publicó un libro de imágenes con textos que riman, ilustrado por Mike Lester, titulado Cuando Charlie McButton perdió el poder. En 2008 publicó la novela por la que sería famosa, Los juegos del hambre, inspirada por el mito griego de Teseo y el minotauro; al respecto Collins declaró: «Creta estaba enviando un mensaje muy claro: Métete con nosotros y vamos a hacer algo peor que matar: vamos a matar a sus hijos». Sin embargo, en algunos sectores se ha comentado que Collins se basó íntegramente en el aclamado libro de 1999, Battle Royale, del escritor japonés Koushun Takami. En 2009 y 2010 publicó las novelas que completaron la trilogía: En llamas y Sinsajo. La serie cuenta con 26 ediciones extranjeras. Actualmente Collins vive en Connecticut con sus dos hijos. Es practicante de la religión católica.")
        
        let ciudadesPapel = Producto(nombre: "Ciudades de Papel", descripcion: "En su último año de preparatoria, Quentin, un desastre en popularidad y en asuntos del corazón, se reencuentra con su vecina, la legendaria, inalcanzable y enigmática Margo Roth Spiegelman, quien se presenta en su habitación en mitad de la noche para proponerle que la acompañe en un plan de venganza inaudito contra todos aquellos que les han hecho daño a lo largo de su adolescencia.", precio: 314.00, imagen: "ciudades_papel", peso: 250.0, calorias: 999, autor: "John Green", categoria: "Literatura Juvenil", biografia: "John Michael Green (Indianápolis, 24 de agosto de 1977) es un escritor estadounidense de literatura juvenil, blogger en YouTube y productor ejecutivo. Es reconocido mayormente por su libro Bajo la misma estrella y Ciudades de papel. Sus padres, quienes lo apoyaron con su decisión, fueron Mike Green y Sydney Green. Su padre era director de un centro de conservación natural estadounidense y de su madre se desconoce la ocupación que tenía. En 2014 fue incluido en la lista de las 100 personas más influyentes en el mundo, de la revista Time. También en 2006 ganó el Printz Award por su novela debut Buscando a Alaska la cual se inspiró por su tiempo en la Indian Springs School, en 2008 fue coautor de Let it snow (historias conectadas que pasan en la época de Navidad), también en ese año salió Paper Towns. En el 2010 escribió su novela más conocida, Bajo la misma estrella, debutó en el número 1 en la lista de los más vendidos del New York Times en enero de 2012. En 2014 se estrenó su adaptación cinematográfica, la cual fue un éxito entre adolescentes y adultos, quedando en el #1 en la taquilla. En 2015 salió la adaptación al cine de Paper Towns (Ciudades de papel) con Cara Delevingne y Nat Wolff en los papeles protagonistas. También es conocido por sus videos de YouTube. Green comenzó en 2007, con el lanzamiento del canal Vlogbrothers, que dirige junto a su hermano, Hank Green. Desde entonces Green ha lanzado eventos como Project for Awesome y VidCon, y ha creado un total de 11 series en línea junto con su hermano, como Crash Course, un canal educativo de YouTube de literatura, historia y ciencia.")
        
        let aTodosLosChicos = Producto(nombre: "A Todos Los Chicos de los Que Me Enamoré", descripcion: "Lara Jean guarda sus cartas de amor en una caja. No son cartas que le hayan enviado, las ha escrito ella, una por cada chico de los que se ha enamorado. En ellas se muestra tal cual es, porque sabe que nadie las leerá. Hasta que un día alguien las envía por equivocación y la vida amorosa de Lara Jean pasa de imaginaria a estar totalmente fuera de control.", precio: 418.00, imagen: "todos_chicos", peso: 255, calorias: 1000, autor: "Jenny Han", categoria: "Literatura Juvenil", biografia: "Jenny Han (Richmond, Virginia, 3 de septiembre de 1980) es una escritora estadounidense de literatura infantil y juvenil. Es la autora de la trilogía “A todos los chicos de los que me enamoré”, que fueron adaptados en películas con el mismo título. Sus libros fueron publicados en más de treinta idiomas. Nació en Richmond, Virginia, en una familia coreana y estudió literatura en la Universidad de Carolina del Norte en Chapel Hill con un máster en escritura creativa de The New School. Se desempeñó como bibliotecaria infantil. Reside en Brooklyn. Han escribió su primer libro, la novela infantil Shug, cuando aún estaba en la universidad. Fue publicado en 2006. Su siguiente proyecto fue Verano, una trilogía romántica para jóvenes adultos, sobre la mayoría de edad de una niña durante sus vacaciones de verano. Las tres novelas, El verano en que me enamoré, No hay verano sin ti y Siempre nos quedará el verano, rápidamente se convirtieron en los más vendidos según la lista de superventas del New York Times.")
        
        let literaturaJuvenil = Categoria(nombre: "Literatura Juvenil", productos: [piedraFilosofal,juegosDelHambre,ciudadesPapel,aTodosLosChicos])
        
        // MARK: - Ciencia Ficción
        let dune = Producto(nombre: "Dune", descripcion: "Dune es la primera novela de la serie homónima «Dune» de Frank Herbert, una obra maestra unánimemente reconocida como la mejor saga de ciencia ficción de todos los tiempos. ", precio: 315.00, imagen: "dune", peso: 230, calorias: 400, autor: "Frank Herbert", categoria: "Ciencia Ficción", biografia: "Franklin Patrick Herbert Jr. (Tacoma, Washington; 8 de octubre de 1920 - Madison, Wisconsin; 11 de febrero de 1986), más conocido como Frank Herbert, fue un escritor estadounidense de ciencia ficción, famoso por la novela de 1965 Dune y sus cinco secuelas. Aunque ganó reconocimiento por sus novelas, también escribió cuentos y trabajó como periodista, fotógrafo, crítico literario, consultor ecológico y conferenciante. La saga Dune, ambientada en un futuro lejano y teniendo lugar durante milenios, explora temas complejos, como la supervivencia de la especie humana a largo plazo, la evolución humana, la ciencia y la ecología planetarias, y la intersección de la religión, la política, la economía y el poder en un futuro donde la humanidad hace mucho tiempo que desarrolló viajes interestelares y se asentó en miles de mundos. Dune es la novela de ciencia ficción más vendida de todos los tiempos, y toda la serie se considera ampliamente entre los clásicos del género.")
                
        let milNovecientos = Producto(nombre: "1984", descripcion: "En el año 1984 Londres es una ciudad lúgubre en la que la policía del pensamiento controla de forma asfixiante la vida de los ciudadanos. Winston Smith es un peón de este engranaje perverso, su cometido es reescribir la historia para adaptarla a lo que el partido considera la versión oficial de los hechos hasta que decide replantearse la verdad del sistema que los gobierna y somete.", precio: 50.0, imagen: "1984", peso: 250, calorias: 200, autor: "George Orwell", categoria: "Ciencia Ficción", biografia: "Eric Arthur Blair (Motihari, Raj Británico, 25 de junio de 1903-Londres, Reino Unido, 21 de enero de 1950), más conocido por su seudónimo de George Orwell, fue un novelista, periodista, ensayista y crítico británico nacido en la India, conocido mundialmente por su novelas distópicas Rebelión en la granja (1945) y 1984 (1949). Su obra lleva la marca de las experiencias autobiográficas vividas por el autor en tres etapas de su vida: su posición en contra del imperialismo británico que lo llevó al compromiso como representante de las fuerzas del orden colonial en Birmania durante su juventud; a favor del socialismo democrático, después de haber observado y sufrido las condiciones de vida de las clases sociales de los trabajadores de Londres y París; y en contra de los totalitarismos nazi y estalinista tras su participación en la guerra civil española. Además de cronista, crítico de literatura y novelista, es uno de los ensayistas en lengua inglesa más destacados de las décadas de 1930 y de 1940. Sin embargo, es más conocido por sus críticas al totalitarismo en su novela corta alegórica Rebelión en la granja (1945) y su novela distópica 1984 (1949), escrita en sus últimos años de vida y publicada poco antes de su fallecimiento, y en la que crea el concepto de «Gran Hermano», que desde entonces pasó al lenguaje común de la crítica de las técnicas modernas de vigilancia. En 2008 figuraba en el puesto número dos del listado de los cincuenta escritores británicos de mayor relevancia desde 1945, elaborado por The Times. El adjetivo «orwelliano» es frecuentemente utilizado en referencia al distópico universo totalitario imaginado por el escritor británico.")
        
        let readyPlayer = Producto (nombre: "Ready Player One", descripcion: "En el año 2044 y, como el resto de la humanidad, Wade Watts prefiere mil veces el videojuego de OASIS al cada vez más sombrío mundo real. Se asegura que esconde las diabólicaspiezas de un rompecabezas cuya resolución conduce a una fortuna incalculable.", precio: 260.00, imagen: "ready_player", peso: 500, calorias: 100, autor: "Ernest Cline", categoria: "Ciencia Ficción", biografia: "Ernest Christy Cline (Ashland, Ohio; 29 de marzo de 1972) es un escritor de ciencia ficción, poeta slam y guionista de cine estadounidense. Es conocido por sus novelas Ready Player One y Armada. Nació en 1972 en la localidad de Ashland en el estado de Ohio (Estados Unidos). Desde pequeño se aficionó al mundo de los ordenadores, aprendió BASIC y tuvo una Atari 2600. Además fue un aficionado de la ciencia ficción como Back to the Future, lo cual le ha marcado en sus libros, o le ha llevado a comprar un DMC DeLorean que modificó para que parezca una mezcla de varios vehículos de películas de ciencia ficción, al igual que el coche que tiene Parzival en su obra Ready Player One, a este vehículo lo llama ECTO 88. En 2010 vendió los derechos de la obra a Warner Bros, que en 2018 hizo una superproducción con la obra, con el propio Cline trabajando como uno de los guionistas.")
        
        let fahrenheit451 = Producto (nombre: "Fahrenheit 451", descripcion: "Montag pertenece a una extraña brigada de bomberos cuya misión, paradójicamente, no es la de sofocar incendios, sino la de provocarlos para quemar libros. Porque en el país de Montag está terminantemente prohibido leer.", precio: 199.00, imagen: "farenheit", peso: 500, calorias: 100, autor: "Ray Bradbury", categoria: "Ciencia Ficción", biografia: "Bradbury nació el 22 de agosto de 1920 en Waukegan, hijo de Leonard Spaulding Bradbury y de Esther Moberg. Su familia se mudó varias veces desde su lugar de origen hasta establecerse, finalmente, en Los Ángeles, California, en 1934. A partir de entonces, Bradbury fue un ávido lector durante toda su juventud y un escritor aficionado. Se graduó de Los Angeles High School en 1938, pero no pudo asistir a la universidad por razones económicas. Para ganarse la vida, comenzó a vender periódicos de 1938 a 1942. Además, se propuso formarse de manera autodidacta pasando la mayor parte de su tiempo en la biblioteca pública leyendo libros y, en ese periodo, comenzó a escribir sus primeros cuentos. Sus trabajos iniciales los vendió a revistas y, así, a comienzos de 1940, algunos de estos fueron compilados en Dark Carnival en 1947. Finalmente, se estableció en California, donde residió y continuó su producción hasta su fallecimiento. Bradbury escribió cuentos y novelas de diversos géneros, desde el policial hasta el realista y costumbrista, pero se le conoce como un escritor clásico de la ciencia ficción por Crónicas marcianas (1950), que cuenta sobre los seis primeros viajes a Marte y su posterior colonización. También, trabajó como argumentista y guionista en numerosas películas y series de televisión, entre las que cabe destacar su colaboración con John Huston en la adaptación de Moby Dick para la película homónima que este dirigió en 1956. Además, escribió poemas y ensayos. Existe un asteroide llamado (9766) Bradbury en su honor.")
        
        let cienciaFicción = Categoria(nombre: "Ciencia Ficción", productos: [dune,milNovecientos,readyPlayer,fahrenheit451])
        
        // MARK: - Arte
        let símbolosArte = Producto(nombre: "Los Símbolos en el Arte", descripcion: "Una acreditada guía que aborda más de cincuenta de los símbolos visuales más comunes e interesantes de todo el mundo desde el año 2300 a. C. hasta la actualidad.", precio: 485.00, imagen: "simbolos_arte", peso: 200, calorias: 500, autor: "Matthew Wilson", categoria: "Arte", biografia: "Matthew Wilson es historiador del arte, docente y escritor y participa en numerosas publicaciones. Está especializado en exámenes de historia del arte.")
        
        let japónHokusai = Producto(nombre: "El Japón de Hokusai", descripcion: "Si pensamos en una imagen que simbolice la creación artística de Japón, sin duda nos vendrá a la cabeza, aunque desconozcamos el nombre del autor, la estampa de una ola azul que se alza y, en su movimiento, crea el marco para una montaña mítica, el monte Fuji.", precio: 328.00, imagen: "japon_hokusai", peso: 0.200, calorias: 500, autor: "Suso Mourelo", categoria: "Arte", biografia: "Suso Mourelo (Madrid, 1964) es autor de no ficción y periodista. Licenciado en Ciencias de la Comunicación y máster en Relaciones Internacionales, es especialista en Asia. Ha sido profesor universitario, reportero y director de programas divulgativos en España, gestor cultural y coordinador de exposiciones internacionales en el Indianapolis Museum of Art (Indiana, Estados Unidos). Autor de la novela La frontera Oeste (Caballo de Troya, 2016), el grueso de su obra literaria lo conforman el ensayo y la narrativa de viajes. Su primer título (Adiós a China. Viaje por un país en transformación, Espasa, 2001), supuso su acercamiento editorial al mundo asiático, región a la que ha dedicado cuatro libros. En 2017 vio la luz En el barco de Ise. Un viaje literario por Japón (La línea del Horizonte), en el que sigue las huellas de los novelistas japoneses y confronta sus relatos con la sociedad actual. En 2018 publicó Tiempo de Hiroshima (La Línea del Horizonte), exquisito canto a la vida y crónica del renacimiento de una ciudad aniquilada. Desde 2016, Suso Mourelo vive entre Japón y España.")
        
        let verdeNatural = Producto(nombre: "Verde al Natural", descripcion: "Santi Sallés, urban sketcher de reconocido prestigio y un auténtico apasionado de la naturaleza, ha reunido en este personal manual práctico un compendio excelente de recursos y consejos para aprender o mejorar el dibujo de esta especialidad.", precio: 485.00, imagen: "verde_natural", peso: 100, calorias: 600, autor: "Santi Sallés", categoria: "Arte", biografia: "Santi Sallés es urban sketcher, ilustrador y diseñador gráfico. Formado en diseño industrial por la escuela Elisava de Barcelona y con una larga trayectoria como creativo a sus espaldas, entre sus clientes se encuentran agencias de publicidad, empresas y medios como La Vanguardia, El País Semanal y Vanity Fair. Es autor de diversos libros de ilustración y dibujo, y ha colaborado como docente en Elisava, la Universidad de Barcelona y el Istituto Europeo di Design, entre otros. Es miembro activo del colectivo USKBarcelona.")
        
        let arte = Categoria(nombre: "Arte", productos: [símbolosArte,japónHokusai,verdeNatural])
        
        // MARK: - Fotografía
        
        let fotografíaAnalógica = Producto(nombre: "Fotografía Analógica", descripcion: "Este es un libro sobre la belleza de la fotografía analógica y una celebración de todas esas mágicas y asombrosas cámaras que, durante demasiado tiempo, han ido directamente al cubo de la basura.", precio: 565.00, imagen: "fotografia_analogica", peso: 100, calorias: 200, autor: "Andrew Bellamy", categoria: "Fotografía", biografia: "Andrew Bellamy es director creativo de ILOTT Vintage, un proyecto dedicado a la recuperación y restauración de cámaras fotográficas de mediados del siglo xx. Anteriormente había trabajado como director creativo y de arte en diversas agencias de diseño de Londres, Oslo y Miami. Vive y trabaja en Nueva York.")
                
        let fotografíaFantástica = Producto(nombre: "Taller de Fotografía Fantástica", descripcion: "Este libro te enseñará a hacer realidad cualquier fantasía imaginable. Consigue una cámara o un móvil, pon en marcha tu imaginación y descubre todo lo que puedes llegar a crear en este taller de fotografía fantástica.", precio: 375.00, imagen: "fotografia_fantastica", peso: 100, calorias: 300, autor: "Jan Von Holleben", categoria: "Fotografía", biografia: "Jan Von Holleben (Colonia, 1977) es un fotógrafo formado en educación especial en la Pädagogische Hochschule de Friburgo, y en Teoría e Historia de la Fotografía en el Instituto de Arte y Diseño de Surrey. Su labor artística e investigadora se centra en la relación entre juego y fotografía, y ha trabajado como editor y director de arte y fotografía.")
        
        let fotografía = Categoria(nombre: "Fotografía", productos: [fotografíaAnalógica,fotografíaFantástica])
        
        // MARK: - Novela de Época
        let mujercitas = Producto(nombre: "Mujercitas", descripcion: "En una época en el que puritanismo lo impregnaba todo, Louisa May Alcott publicó una novela que planteaba, de manera audaz, el derecho de las mujeres a perseguir sus sueños y escribir su propio destino.", precio: 299.90, imagen: "mujercitas", peso: 380, calorias: 550, autor: "Louisa May Alcott", categoria: "Novela de Época", biografia: "Louisa May Alcott (Germantown, Pensilvania; 29 de noviembre de 1832 - Boston, Massachusetts; 6 de marzo de 1888) fue una escritora estadounidense, reconocida por su famosa novela Mujercitas (1868). Comprometida con el movimiento abolicionista y con el sufragismo, escribió bajo el pseudónimo de A. M. Barnard una colección de novelas y relatos en los que se tratan temas tabúes para la época como el adulterio y el incesto. Alcott obtuvo un sorpresivo y abrumador éxito con la aparición de la primera parte de Mujercitas (Little Women: or Meg, Jo, Beth and Amy) (1868), relato en parte autobiográfico inspirado en su niñez junto a sus hermanas en Concord, Massachusetts. Esta obra fue escrita por encargo de su editor, que quería un libro orientado a mujeres jóvenes. La segunda parte, Aquellas mujercitas (Good Wives), publicado en 1869, llevaría a sus protagonistas a la vida adulta. Después de esta primera publicación, aparece conjuntamente con Mujercitas en las ediciones de su tiempo.Nota 1 Más adelante, apareció Hombrecitos (Little Men) (1871), que trata de manera similar el carácter y la forma de ser de sus sobrinos que vivían en Orchard House en Concord, Massachusetts. Los muchachos de Jo (Jo's Boys) (1886) completó la «saga de la familia March». La mayoría de sus volúmenes posteriores, Una chica anticuada (An Old-Fashioned Girl) (1870), Cuentos de la tía Jo (Aunt Jo's Scrap Bag) (en seis volúmenes, 1871-1879), Rosa en flor (Rose in Bloom) (1876) y otros, siguieron la línea de Mujercitas, de la cual el numeroso y leal público de la autora nunca se cansó. Mujercitas ha sido llevada al cine en varias películas, entre las cuales destaca una de ellas, la adaptación dirigida por Mervin LeRoy en 1949 y protagonizada por June Allyson, Margaret O'Brien, Janet Leigh, Elizabeth Taylor y Chayanne.")
        
        let orgulloPrejuicio = Producto(nombre: "Orgullo y Prejuicio", descripcion: "La obra más conocida de Jane Austen constituyó en su día todo un alegato contra el matrimonio de conveniencia y las convenciones sociales que tasaban el valor de la mujer en la cuantía de su dote.", precio: 189.90, imagen: "orgullo_y_prejuicio", peso: 380, calorias: 750, autor: "Jane Austen", categoria: "Novela de Época", biografia: "Jane Austen (Steventon, 16 de diciembre de 1775-Winchester, 18 de julio de 1817) fue una novelista británica que vivió durante la época georgiana. La ironía que empleaba para dotar de comicidad a sus novelas hace que Jane Austen sea considerada entre los clásicos de la novela inglesa, a la vez que su recepción va, incluso en la actualidad, más allá del interés académico, siendo sus obras leídas por un público más amplio. Nació en la rectoría de Steventon (Hampshire). Su familia pertenecía a la burguesía agraria, contexto del que no salió y en el que sitúa todas sus obras, siempre en torno al matrimonio de su protagonista. La candidez de las obras de Austen, sin embargo, es meramente aparente, si bien puede interpretarse de varias maneras. Los círculos académicos siempre han considerado a Austen como una escritora conservadora, mientras que la crítica feminista más actual apunta que en su obra puede apreciarse una novelización del pensamiento de Mary Wollstonecraft sobre la educación de la mujer. Ha sido llevada al cine en numerosas ocasiones, algunas veces reproducidas de forma fiel, como el clásico Más fuerte que el orgullo de 1940 dirigido por Robert Z. Leonard y protagonizada por Greer Garson y Laurence Olivier y en otras haciendo adaptaciones a la época actual, como es el caso de Clueless, adaptación libre de Emma. Otras versiones son la de Sentido y sensibilidad, de 1995; Mansfield Park, de 2000, y las de Orgullo y prejuicio en 2004 (dirigida por Gurinder Chadha) y en 2005 (dirigida por Joe Wright). Sin embargo, la versión más fiel y perfecta que hasta ahora se ha hecho del libro de Orgullo y prejuicio es la serie que presentó la BBC protagonizada por Colin Firth y Jennifer Ehle. El interés que la obra de Jane Austen sigue despertando hoy en día muestra la vigencia de su pensamiento y la influencia que ha tenido en la literatura posterior. Su vida también ha sido llevada al cine con la película Becoming Jane (2007).")
        
        let sentidoSensibilidad = Producto(nombre: "Sentido y Sensibilidad", descripcion: "En una sociedad rígida, donde el éxito o el fracaso de una mujer dependía de la elección de un marido, Austen explora las opciones que estas tenían para hacer frente a tal injusticia.", precio: 189.90, imagen: "sentido_y_sensibilidad", peso: 475, calorias: 630, autor: "Jane Austen", categoria: "Novela de Época", biografia: "Jane Austen (Steventon, 16 de diciembre de 1775-Winchester, 18 de julio de 1817) fue una novelista británica que vivió durante la época georgiana. La ironía que empleaba para dotar de comicidad a sus novelas hace que Jane Austen sea considerada entre los clásicos de la novela inglesa, a la vez que su recepción va, incluso en la actualidad, más allá del interés académico, siendo sus obras leídas por un público más amplio. Nació en la rectoría de Steventon (Hampshire). Su familia pertenecía a la burguesía agraria, contexto del que no salió y en el que sitúa todas sus obras, siempre en torno al matrimonio de su protagonista. La candidez de las obras de Austen, sin embargo, es meramente aparente, si bien puede interpretarse de varias maneras. Los círculos académicos siempre han considerado a Austen como una escritora conservadora, mientras que la crítica feminista más actual apunta que en su obra puede apreciarse una novelización del pensamiento de Mary Wollstonecraft sobre la educación de la mujer. Ha sido llevada al cine en numerosas ocasiones, algunas veces reproducidas de forma fiel, como el clásico Más fuerte que el orgullo de 1940 dirigido por Robert Z. Leonard y protagonizada por Greer Garson y Laurence Olivier y en otras haciendo adaptaciones a la época actual, como es el caso de Clueless, adaptación libre de Emma. Otras versiones son la de Sentido y sensibilidad, de 1995; Mansfield Park, de 2000, y las de Orgullo y prejuicio en 2004 (dirigida por Gurinder Chadha) y en 2005 (dirigida por Joe Wright). Sin embargo, la versión más fiel y perfecta que hasta ahora se ha hecho del libro de Orgullo y prejuicio es la serie que presentó la BBC protagonizada por Colin Firth y Jennifer Ehle. El interés que la obra de Jane Austen sigue despertando hoy en día muestra la vigencia de su pensamiento y la influencia que ha tenido en la literatura posterior. Su vida también ha sido llevada al cine con la película Becoming Jane (2007).")
        
        let emma = Producto(nombre: "Emma", descripcion: "Novela romántica y cómica realizada en 1815. Obra maestra de la narrativa del siglo XIX. Novela exquisita y espléndido retrato de la Inglaterra de provincias.", precio: 189.90, imagen: "emma", peso: 0.200, calorias: 300, autor: "Jane Austen", categoria: "Novela de Época", biografia: "Jane Austen (Steventon, 16 de diciembre de 1775-Winchester, 18 de julio de 1817) fue una novelista británica que vivió durante la época georgiana. La ironía que empleaba para dotar de comicidad a sus novelas hace que Jane Austen sea considerada entre los clásicos de la novela inglesa, a la vez que su recepción va, incluso en la actualidad, más allá del interés académico, siendo sus obras leídas por un público más amplio. Nació en la rectoría de Steventon (Hampshire). Su familia pertenecía a la burguesía agraria, contexto del que no salió y en el que sitúa todas sus obras, siempre en torno al matrimonio de su protagonista. La candidez de las obras de Austen, sin embargo, es meramente aparente, si bien puede interpretarse de varias maneras. Los círculos académicos siempre han considerado a Austen como una escritora conservadora, mientras que la crítica feminista más actual apunta que en su obra puede apreciarse una novelización del pensamiento de Mary Wollstonecraft sobre la educación de la mujer. Ha sido llevada al cine en numerosas ocasiones, algunas veces reproducidas de forma fiel, como el clásico Más fuerte que el orgullo de 1940 dirigido por Robert Z. Leonard y protagonizada por Greer Garson y Laurence Olivier y en otras haciendo adaptaciones a la época actual, como es el caso de Clueless, adaptación libre de Emma. Otras versiones son la de Sentido y sensibilidad, de 1995; Mansfield Park, de 2000, y las de Orgullo y prejuicio en 2004 (dirigida por Gurinder Chadha) y en 2005 (dirigida por Joe Wright). Sin embargo, la versión más fiel y perfecta que hasta ahora se ha hecho del libro de Orgullo y prejuicio es la serie que presentó la BBC protagonizada por Colin Firth y Jennifer Ehle. El interés que la obra de Jane Austen sigue despertando hoy en día muestra la vigencia de su pensamiento y la influencia que ha tenido en la literatura posterior. Su vida también ha sido llevada al cine con la película Becoming Jane (2007).")
        
        let aquellasMujercitas = Producto(nombre: "Aquellas Mujercitas", descripcion: "Han pasado tres años desde que se reunieron con su padre y las hermanas March están descubriendo que convertirse en adultas no es tarea fácil.", precio: 189.90, imagen: "aquellas_mujercitas", peso: 0.300, calorias: 500, autor: "Louisa May Alcott", categoria: "Novela de Época", biografia: "Louisa May Alcott (Germantown, Pensilvania; 29 de noviembre de 1832 - Boston, Massachusetts; 6 de marzo de 1888) fue una escritora estadounidense, reconocida por su famosa novela Mujercitas (1868). Comprometida con el movimiento abolicionista y con el sufragismo, escribió bajo el pseudónimo de A. M. Barnard una colección de novelas y relatos en los que se tratan temas tabúes para la época como el adulterio y el incesto. Alcott obtuvo un sorpresivo y abrumador éxito con la aparición de la primera parte de Mujercitas (Little Women: or Meg, Jo, Beth and Amy) (1868), relato en parte autobiográfico inspirado en su niñez junto a sus hermanas en Concord, Massachusetts. Esta obra fue escrita por encargo de su editor, que quería un libro orientado a mujeres jóvenes. La segunda parte, Aquellas mujercitas (Good Wives), publicado en 1869, llevaría a sus protagonistas a la vida adulta. Después de esta primera publicación, aparece conjuntamente con Mujercitas en las ediciones de su tiempo.Nota 1 Más adelante, apareció Hombrecitos (Little Men) (1871), que trata de manera similar el carácter y la forma de ser de sus sobrinos que vivían en Orchard House en Concord, Massachusetts. Los muchachos de Jo (Jo's Boys) (1886) completó la «saga de la familia March». La mayoría de sus volúmenes posteriores, Una chica anticuada (An Old-Fashioned Girl) (1870), Cuentos de la tía Jo (Aunt Jo's Scrap Bag) (en seis volúmenes, 1871-1879), Rosa en flor (Rose in Bloom) (1876) y otros, siguieron la línea de Mujercitas, de la cual el numeroso y leal público de la autora nunca se cansó. Mujercitas ha sido llevada al cine en varias películas, entre las cuales destaca una de ellas, la adaptación dirigida por Mervin LeRoy en 1949 y protagonizada por June Allyson, Margaret O'Brien, Janet Leigh, Elizabeth Taylor y Chayanne.")
           
        
        let novelaÉpoca = Categoria(nombre: "Novela de Época", productos: [mujercitas,orgulloPrejuicio,sentidoSensibilidad,emma,aquellasMujercitas])
       
        // MARK: - Ciencia
        let culturaAmbiental = Producto(nombre: "Manual Crítico de la Cultura Ambiental", descripcion: "Este manual está concebido como un texto que estimule el entendimiento de los problemas ambientales en general, que perciba la gravedad de las amenazas más acuciantes que de ellos vienen derivándose y que invite a adoptar una postura socialmente activa, fundada y crítica.", precio: 20.0, imagen: "cultura_ambiental", peso: 1_156.00, calorias: 0, autor: "Pedro Costa", categoria: "Ciencia", biografia: "Pedro Costa nició su ecologismo en la lucha antinuclear de los años 1973-1982, abandonando su profesión de ingeniero (1969-1974) relacionado con la industria nuclear. Reinició su vida como colaborador periodístico en Ciudadano, Doblón, Triunfo… (1974-1979), reorientándose después como consultor ambiental (1979-2007). En ese largo periodo compatibilizó su actividad militante con la elaboración de una cuarentena de estudios y proyectos ambientales, adquiriendo un amplio conocimiento del país y sus problemas. Ha mantenido, hasta hoy, una intensa actividad como articulista ecopolítico.")
               
        let elCerebro = Producto(nombre: "El Cerebro: Manual del Usuario", descripcion: "Esta manual trata de lo que realmente se puede hacer con un cerebro humano en el presente: es decir, mucho, mucho más de lo que piensas.", precio: 369.00, imagen: "cerebro_manual", peso: 400, calorias: 500, autor: "Marco Magrini", categoria: "Ciencia", biografia: "Marco Magrini ha sido periodista durante dos tercios de su vida neuronal. En los veinticuatro años que pasó en Sole 24 Ore, principalmente como corresponsal especial, primero se ocupó de bancos e industria y luego (felizmente) de ciencia y tecnología. Actualmente ejerce en el blog de Eureka en el sitio web de l'Espresso, escribe en TuttoGreen de la Stampa y firma ClimateWatch en Geographical, la revista mensual de la Royal Geographical Society de Londres.")
        
        let genesisElOrigen = Producto(nombre: "Génesis: El Origen de las Sociedades", descripcion: "En Génesis, el célebre biólogo Edward O. Wilson examina la historia evolutiva y nos ofrece una descripción reveladora de los profundos orígenes de la sociedad.", precio: 269.00, imagen: "genesis_sociedades", peso: 250, calorias: 1200, autor: "Edward O. Wilson", categoria: "Ciencia", biografia: "Edward Osborne Wilson (Birmingham, Alabama, 10 de junio de 1929-26 de diciembre de 2021) fue un entomólogo y biólogo estadounidense conocido por su trabajo en evolución y sociobiología, siendo considerado como el biólogo más importante y destacado del mundo en su tiempo. Se ha referido a él como el padre de la biodiversidad y de la sociobiología por sus contribuciones pioneras en estos campos. También fue pionero en la defensa de la unión de los conocimientos y la información de distintas disciplinas para crear un marco unificado de entendimiento. Su especialidad biológica fue el estudio de las hormigas, campo en el que fue considerado como la mayor autoridad mundial.")
        
        let ciencia = Categoria(nombre: "Ciencia", productos: [culturaAmbiental,elCerebro,genesisElOrigen])
        
        // MARK: - Menu
        let menu = MenuObject(categorias: [literaturaJuvenil,cienciaFicción,arte,fotografía,novelaÉpoca,ciencia], title: "Menu Pujol")//
        
       
        dataSoruce = menu
        
        
//        dataSoruce?.categorias = dataSoruce?.categorias?.filter({$0.nombre == "Desayuno"})
//
//        tableView?.reloadData()
    }
}



// MARK: - UITableViewDataSource
extension CatalogoViewController : UITableViewDataSource{
    ///El numero de celdas por cada seccion
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSoruce?.categorias?[section].productos?.count ?? 0
    }
    
    ///El tipo de celda que se mostrara
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let product = dataSoruce?.categorias?[indexPath.section].productos?[indexPath.row]
        let cell = CatalogoTableViewCell(producto: product!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return height / 4
    }
}



// MARK: - UITableViewDelegate
extension CatalogoViewController : UITableViewDelegate{
    ///Aqui vamos a definir el texto o VIEW que se mostrará en los headers de las seciones
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return dataSoruce?.categorias?[section].nombre ?? ""
//    }
   
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView() // Aqui definimos el UIView el cual se va a retornar en la funcion
        let color = UIColor(displayP3Red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1) // Creacmos una constante color en la cual se definiran colores random
        view.backgroundColor = backgorundColor // Le asignamos el color random al background de la vista
        
       
        let label = UILabel(frame: CGRect(x: 10, y: 0, width: width / 1.6, height: 20))
        label.text = dataSoruce?.categorias?[section].nombre ?? ""
        label.font = .boldSystemFont(ofSize: 18)
        view.addSubview(label)
        
        
        return view
    }
    
    ///Cacha el Clik en cada celda para alguna accion
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Estoy en la seccion \(indexPath.section) en la celda \(indexPath.row)")
        let producto = dataSoruce?.categorias?[indexPath.section].productos?[indexPath.row]
        let vc = DetailBooksViewController()
        vc.product = producto
        vc.modalPresentationStyle = .popover
        present(vc, animated: true, completion: nil)
    }
    
    ///Numero de secciones que vamos a usar
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSoruce?.categorias?.count ?? 0
    }
    
    @objc func backAction()
        {
            print("back action")
            dismiss(animated:true)
        }
    
    @objc func goToSearch(){
        searchPressed()
    }
    
    func searchPressed() {
        searchTextField?.endEditing(true)
        print(searchTextField?.text)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField?.endEditing(true)
        print(searchTextField?.text)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Ingrese Su Búsqueda"
            return false
        }
    }
}

