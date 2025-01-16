CREATE SCHEMA bookmania;
use bookmania;

-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: bookmania
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author` (
  `id` int NOT NULL AUTO_INCREMENT,
  `author_name` varchar(50) DEFAULT NULL,
  `author_description` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES (1,'Gordon Ramsay',NULL),(2,'Steven Raichlen',NULL),(3,'Suvir Saran',NULL),(4,'Caitlin Freeman',NULL),(5,'Elana Amsterdam',NULL),(6,'Robin Davis',NULL),(7,'Kate Armstrong',NULL),(8,'Megan Sadd',NULL),(9,'Frank Herbert',NULL),(10,'J.R.R. Tolkien',NULL),(11,'Anne Rice',NULL),(12,'Kevin Anderson',NULL),(13,'Pierre Boulle',NULL),(14,'Matthew Rozell',NULL),(15,'Manfred Bietak',NULL),(16,'Thomas Cahill',NULL),(17,'Stephen Dando-Collins',NULL),(18,'Paul Cartledge',NULL),(19,'Stephen G. Hyslop',NULL),(20,'Dan Jones',NULL),(21,'Nicholas Reeves',NULL),(22,'Stephen King',NULL),(23,'Bram Stoker',NULL),(24,'Peter Benchley',NULL),(26,'Robert Harris',NULL),(27,'Elizabeth Brooks',NULL),(28,'James Padolsey',NULL),(29,'Jon Loeliger',NULL),(31,'Jon Duckett',NULL),(32,'David Flanagan',NULL),(35,'Neal Ford',NULL),(36,'Richard Chizmar',NULL),(37,'Jeremy Preace',NULL),(38,'Jason Krol',NULL),(39,'Paul DuBois',NULL);
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `number_of_page` int NOT NULL,
  `genre` int NOT NULL,
  `publisher` int NOT NULL,
  `author` int NOT NULL,
  `price` float DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  `newness` tinyint(1) NOT NULL,
  `release_date` int DEFAULT NULL,
  `img_directory` varchar(10) DEFAULT NULL,
  `image_big` varchar(20) NOT NULL,
  `book_description` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `author` (`author`),
  KEY `publisher` (`publisher`),
  KEY `genre` (`genre`),
  CONSTRAINT `book_ibfk_1` FOREIGN KEY (`author`) REFERENCES `author` (`id`),
  CONSTRAINT `book_ibfk_2` FOREIGN KEY (`publisher`) REFERENCES `publisher` (`id`),
  CONSTRAINT `book_ibfk_3` FOREIGN KEY (`genre`) REFERENCES `genre` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (1,'World Kitchen',105,1,1,1,9.25,'grwk.PNG',0,2009,'cooking','grwk_big.PNG','Gordon Ramsay has once again put together an amazing cookbook, this time featuring his favourite recipes from around the world. Delving into Middle Eastern, American, Thai, Chinese, Indian, Spanish, French, Italian, Greek, even our own British, he provides an innovative range of recipes to be cooked every day, no matter what you\'re in the mood for.'),(2,'How To Grill',76,1,2,2,7.99,'htg.PNG',0,2001,'cooking','htg_big.PNG','Master the techniques that make barbecue great with this indispensable show-and-tell by Steven Raichlen. Using more than 1,000 full-color, step-by-step photographs, How to Grill covers it all, from how to build an ingenious three-zone fire to the secrets of grilling a porterhouse, prime rib, fish steak, kebab, or chicken breast. Plus the perfect burger. Includes 100 recipes - one to illustrate each technique - with memorably delicious results!'),(3,'Indian Home Cooking',122,1,3,3,18.49,'ifc.PNG',0,2004,'cooking','ifc_big.PNG','With its exotic aromas and complex flavors, Indian cuisine is one of the world\'s best. It\'s no wonder that so many people adore it--and also no surprise that it could seem daunting to cook Indian food at home. Now, acclaimed chef and cooking teacher Suvir Saran cuts out the fuss, sharing casual, home-style Indian dishes that are perfect for everyday cooking.'),(4,'Modern Art Desserts',65,1,1,4,18.89,'mad.PNG',1,2013,'cooking','mad_big.PNG','Taking cues from works by Andy Warhol, Frida Kahlo, and Matisse, pastry chef Caitlin Freeman, of Miette bakery and Blue Bottle Coffee fame, creates a collection of uniquely delicious dessert recipes (with step-by-step assembly guides) that give readers all they need to make their own edible masterpieces.'),(5,'Paleo Cooking',152,1,3,5,11.69,'pcfep.PNG',0,2013,'cooking','pcfep_big.PNG','Elana Amsterdam has established herself as an extremely successful gluten-free author and blogger; her simple recipes offer busy cooks streamlined techniques and short ingredients lists. While her first two books emphasized gluten-free recipes, Elana has eaten a grain-free diet since 2001. Her paleo recipes have become the most popular on her site, embraced by readers looking to not only eliminate gluten--but also dairy and grains--whether because of allergies or to generally improve their health.'),(6,'STAR WARS Cook Book',89,1,1,6,6.15,'swcb.PNG',0,1998,'cooking','swcb_big.PNG','From C-3PO Pancakes to Jedi Juice Bars, this intergalactic cookbook features healthy snacks, delicious dishes, sweet treats, and easy-to-use recipes that will entice even the pickiest eaters. This book includes 35 recipes, shiny foil stickers featuring \"Star Wars\" characters, and safe and easy tips for cooking with kids of all ages. Full-color throughout.'),(7,'The Wolrd\'s Best Street Food',102,1,3,7,6.99,'twbsf.PNG',0,2012,'cooking','twbsf_big.PNG','The street is where you ll find the heart of a cuisine and its culture somewhere among the taco carts and noodle stalls, the scent of wood fires and the hubbub of fellow diners. Bring the world \'s greatest street foods to your home with this compendium of classic recipes.'),(8,'30-Minute Vegan Dinners',52,1,2,8,23.65,'vd.PNG',0,2019,'cooking','vd_big.PNG','Megan Sadd, founder of the vegan food blog Carrots and Flowers, which has nearly 280k likes on Facebook, shares 75 new and amazing recipes that work on multiple levels for busy home cooks. Each recipe is kid-friendly and easy to prepare, featuring easy-to-find, real-food ingredients and no highly processed meat or dairy substitutes. Most recipes are gluten free, or include a gluten-free option. Readers won\'t groan at the thought of preparing dinner after work when they have such quick, easy and delicious options. There will be 75 recipes and 75 photos.'),(9,'DUNE',412,2,3,9,12.39,'dune.PNG',0,2005,'fantasy','dune_big.PNG','Frank Herbert\'s Hugo and Nebula Award winner celebrates 40 years with this new anniversary edition. The sweeping tale of a desert planet called Arrakis, \"Dune\" has been a favorite among sci-fi fans for decades.'),(10,'The Hobbit',304,2,2,10,10.25,'hobbit.PNG',0,1986,'fantasy','hobbit_big.PNG','Bilbo Baggins was a hobbit who wanted to be left alone in quiet comfort. But the wizard Gandalf came along with a band of homeless dwarves. Soon Bilbo was drawn into their quest, facing evil orcs, savage wolves, giant spiders, and worse, unknown dangers. Finally, it was Bilbo -- alone and unaided -- who had to confront the great dragon Smaug, the terror of an entire countryside...'),(11,'Interview With The Vampire',371,2,2,11,11.85,'iwtv.PNG',0,1997,'fantasy','iwtv_big.PNG','We are in a small room with the vampire, face to face, as he speaks--as he pours out the hypnotic, shocking, moving, and erotically charged confessions of his first two hundred years as one of the living dead.'),(12,'The Lord Of The Rings: The Fellowship Of The Ring',423,2,2,10,19.99,'lotr1.PNG',0,2012,'fantasy','lotr1_big.PNG','In ancient times the Rings of Power were crafted by the Elven-smiths, and Sauron, the Dark Lord, forged the One Ring, filling it with his own power so that he could rule all others. But the One Ring was taken from him, and though he sought it throughout Middle-earth, it remained lost to him. After many ages it fell into the hands of Bilbo Baggins, as told in \"The Hobbit.\" In a sleepy village in the Shire, young Frodo Baggins finds himself faced with an immense task, as his elderly cousin Bilbo entrusts the Ring to his care. Frodo must leave his home and make a perilous journey across Middle-earth to the Cracks of Doom, to destroy the Ring and foil the Dark Lord in his evil purpose.'),(13,'The Lord Of The Rings: The Two Towers',352,2,2,10,18.99,'lotr2.PNG',0,2012,'fantasy','lotr2_big.PNG','\"The Two Towers\" is the second volume in J.R.R. Tolkien\'s epic adventure, \"The Lord of the Rings.\" Frodo and his Companions of the Ring have been beset by danger during their quest to destroy the Ruling Ring in the Cracks of Doom in order to prevent it from falling into the hands of the Dark Lord. They have lost the wizard, Gandalf, in a battle in the Mines of Moria, and Boromir, seduced by the power of the Ring, tried to seize it by force. While Frodo and Sam made their escape, the rest of the company was attacked by Orcs. Now they continue the journey alone down the great River Anduin -- alone, that is, save for the mysterious creeping figure that follows wherever they go.'),(14,'The Lord Of The Rings: The Return Of The King',416,2,2,10,22.99,'lotr3.PNG',0,2012,'fantasy','lotr3_big.PNG','As the Shadow of Mordor grows across the land, the Companions of the Ring have become involved in separate adventures. Aragorn, revealed as the hidden heir of the ancient Kings of the West, has joined with the Riders of Rohan against the forces of Isengard, and takes part in the desperate victory of the Hornburg. Merry and Pippin, captured by Orcs, escape into Fangorn Forest and there encounter the Ents. Gandalf has miraculously returned and defeated the evil wizard, Saruman. Sam has left his master for dead after a battle with the giant spider, Shelob; but Frodo is still alive -- now in the foul hands of the Orcs. And all the while the armies of the Dark Lord are massing as the One Ring draws ever nearer to the Cracks of Doom.'),(15,'Tales Of The Bounty Hunters: Star Wars Legends',352,2,3,12,7.15,'swbh.PNG',0,1996,'fantasy','swbh_big.PNG','In a wild and battle-scarred galaxy, assassins, pirates, smugglers, and cutthroats of every description roam at will, fearing only the professional bounty hunters-amoral adventurers who track down the scum of the universe...for a fee. When Darth Vader seeks to strike at the heart of the Rebellion by targeting Han Solo and the Millennium Falcon, he calls upon six of the most successful-and feared-hunters, including the merciless Boba Fett. They all have two things in common: lust for profit and contempt for life... Featuring original stories by Kevin J. Anderson, M. Shayne Bell, Daniel Keys Moran, Kathy Tyers and Dave Wolverton.'),(16,'Planet Of The Apes',272,2,3,13,9.85,'tpota.PNG',0,2001,'fantasy','tpota_big.PNG','In the not-too-distant future, three astronauts land on what appears to be a planet just like Earth, with lush forests, a temperate climate, and breathable air. But while it appears to be a paradise, nothing is what it seems. They soon discover the terrifying truth: On this world humans are savage beasts, and apes rule as their civilized masters. In an ironic novel of nonstop action and breathless intrigue, one man struggles to unlock the secret of a terrifying civilization, all the while wondering: Will he become the savior of the human race, or the final witness to its damnation? In a shocking climax that rivals that of the original movie, Boulle delivers the answer in a masterpiece of adventure, satire, and suspense.'),(17,'D-Day and Beyond: The Things Our Fathers',198,3,1,14,43,'dday.PNG',1,2019,'history','dday_big.PNG','From the bloody beach at Omaha through the hedgerow country of Normandy and beyond, American veterans of World War II--Army engineers and infantrymen, Coast Guardsmen and Navy sailors, tank gunners and glider pilots--sit down with you across the kitchen table and talk about what they saw and experienced, tales they may have never told anyone before. World War II brought out the worst in humanity, but it also brought out the best. In these narratives you will draw your own lessons. Here are the stories that a special generation of Americans told us for the future when we took the time to be still, to listen, and to draw strength.'),(18,'Seventy Great Mysteries Of Ancient Egypt',123,3,1,15,10.25,'egypt.PNG',0,2003,'history','egypt_big.PNG','In this new compendium in the popular Seventies series, Egyptologists and archaeologists probe mysteries and puzzles such as origins of the ancient Egyptians, the mummification process, and the murder (or not) of Tut. A selection of Discovery Channel, History, and Book-of-the-Month clubs.'),(19,'How the Irish Saved Civilization',169,3,2,16,10.25,'irishheroes.PNG',0,1996,'history','irishheroes_big.PNG','From the fall of Rome to the rise of Charlemagne - the \"dark ages\" - learning, scholarship, and culture disappeared from the European continent. The great heritage of western civilization - from the Greek and Roman classics to Jewish and Christian works - would have been utterly lost were it not for the holy men and women of unconquered Ireland. In this delightful and illuminating look into a crucial but little-known \"hinge\" of history, Thomas Cahill takes us to the \"island of saints and scholars\", the Ireland of St. Patrick and the Book of Kells. Here, far from the barbarian despoliation of the continent, monks and scribes laboriously, lovingly, even playfully preserved the west\'s written treasures. With the return of stability in Europe, these Irish scholars were instrumental in spreading learning. Thus the Irish not only were conservators of civilization, but became shapers of the medieval mind, putting their unique stamp on western culture.'),(20,'Legions of Rome',212,3,1,17,36.59,'rome.PNG',0,2012,'history','rome_big.PNG','The complete history of every Imperial Roman legion and what it achieved as a fighting force, by an award-winning historian In this landmark publication, Stephen Dando-Collins does what no other author has ever attempted to do: provide a complete history of every Imperial Roman legion. Based on thirty years of meticulous research, he covers every legion of Rome in rich detail. In the first part of the book, the author provides a detailed account of what the legionaries wore and ate, what camp life was like, what they were paid, and how they were motivated and punished. Part two examines the histories of all the legions that served Rome for three hundred years starting in 30 BC. The book\'s final section is a sweeping chronological survey of the campaigns in which the armies were involved, told from the point of view of the legions. Featuring more than 150 maps, photographs, diagrams and battle plans, \"Legions of Rome\" is an essential read for ancient history enthusiasts, military history experts and general readers alike.'),(21,'The Spartans',110,3,3,18,15.59,'spartans.PNG',0,2013,'history','spartans_big.PNG','The definitive account of the extraordinary people of Sparta, from the world\'s leading expert.'),(22,'The Secret History of World War II ',243,3,1,19,26,'thesecret.PNG',0,2016,'history','thesecret_big.PNG','From top secret spy missions to recently declassified WWII documents, this richly illustrated account of the covert espionage operations of World War II takes readers behind the battle lines and into the undercover war effort. Includes recently released never-before-seen photographs, coded messages, classified maps, and over 700 rare artifacts that shed light on the war\'s darkest secrets. From the authors who created Eyewitness to World War II and numerous other best-selling illustrated reference books, this is the shocking story behind the covert activity that shaped the outcome of one of the world s greatest conflicts and the destiny of millions of people. National Geographic s landmark book illuminates World War II as never before by taking you inside the secret lives of spies and spy masters; secret agents and secret armies; Enigma machines and code breakers; psychological warfare and black propaganda; secret weapons and secret battle strategies. Six heavily illustrated narrative chapters reveal the truth behind the lies and deception that shaped the secret war; six pictorial essays showcase hundreds of rare photos and artifacts (many never before seen); more than 45 specially created sidebars tell the stories of spies and secret operations. Renowned historian and top-selling author Stephen Hyslop reveals this little-known side of the war in captivating detail, weaving in extraordinary eyewitness accounts and information only recently declassified. Rare photographs, artifacts, and illuminating graphics enrich this absorbing reference book.\"'),(23,'The Templars',217,3,3,20,19,'thetemplars.PNG',1,2018,'history','thetemplars_big.PNG','An instant international bestseller, this major new history of the knights Templar by the bestselling author of The Plantagenets is \"\"another triumphant tale from a historian who writes as addictively as any page-turning novelist.\"\" -The Guardian Jerusalem 1119. A small group of knights seeking a purpose in the violent aftermath of the First Crusade decides to set up a new order. These are the first Knights of Templar, a band of elite warriors prepared to give their lives to protect Christian pilgrims to the Holy Land. Over the next two hundred years, the Templars would become the most powerful religious order of the medieval world. Their legend has inspired fervent speculation ever since. But who were they really and what actually happened? In this groundbreaking narrative history, the bestselling author of The Plantagenets tells the true story of the Templars for the first time in a generation, drawing on extensive original sources to build a gripping account of these Christian holy warriors whose heroism and depravity have so often been shrouded in myth. The Templars were protected by the pope and sworn to strict vows of celibacy. They fought the forces of Islam in hand-to-hand combat on the sun-baked hills where Jesus lived and died, finding their nemesis in Saladin, who vowed to drive all Christians from the lands of Islam. They were experts at channeling money across borders. They established the medieval world\'s first global bank and waged private wars against anyone who threatened their interests. Then in 1307 the Templars fell foul of a vindictive King of France, whose lawyers built a meticulous case against them. On Friday October 13, hundreds of brothers were arrested, imprisoned and tortured, and the order was disbanded amid lurid accusations of sexual misconduct and heresy. They were tried by the Pope in secret proceedings and publicly humiliated. But were they heretics or victims of a ruthlessly repressive state? Dan Jones goes back to the sources tobring their dramatic tale, so relevant to our own times, in a book that is at once authoritative and compulsively readable.'),(24,'The Complete Tutankhamun',89,3,1,21,14.65,'tutankhamun.PNG',0,1995,'history','tutankhamun_big.PNG','From the day in 1922 when King Tut\'s tomb was discovered, the legacy of the boy-king has exerted a unique hold on people\'s imaginations. This fascinating new book reveals the whole story behind Howard Carter\'s quest for the tomb and includes extracts from Carter\'s notes and diaries, first-time publication of many of his drawings and reconstructions, and much more.'),(25,'Chasing the Boogeyman: A Novel',336,4,1,36,26.59,'ctbm.PNG',1,2021,'horror','ctbm_big.PNG','The New York Times bestselling coauthor of Gwendy\'s Button Box brings his signature \"thrilling, page-turning\" ( Michael Koryta, author of How It Happened ) prose to this story of small-town evil that combines the storytelling of Stephen King with the true-crime suspense of Michelle McNamara. In the summer of 1988, the mutilated bodies of several missing girls begin to turn up in a small Maryland town. The grisly evidence leads police to the terrifying assumption that a serial killer is on the loose in the quiet suburb. But soon a rumor begins to spread that the evil stalking local teens is not entirely human. Law enforcement, as well as members of the FBI are certain that the killer is a living, breathing madman--and he\'s playing games with them. For a once peaceful community trapped in the depths of paranoia and suspicion, it feels like a nightmare that will never end. Recent college graduate Richard Chizmar returns to his hometown just as a curfew is enacted and a neighborhood watch is formed. In the midst of preparing for his wedding and embarking on a writing career, he soon finds himself thrust into the real-life horror story. Inspired by the terrifying events, Richard writes a personal account of the serial killer\'s reign of terror, unaware that these events will continue to haunt him for years to come. A clever, terrifying, and heartrending work of metafiction, Chasing the Boogeyman is the ultimate marriage between horror fiction and true crime. Chizmar\'s \"brilliant...absolutely fascinating, totally compelling, and immediately poignant\" (C.J. Tudor, New York Times bestselling author) writing is on full display in this truly unique novel that will haunt you long after you turn the final page.'),(26,'Dracula',418,4,3,23,5.25,'dracula.PNG',0,1993,'horror','dracula_big.PNG','There he lay looking as if youth had been half-renewed, for the white hair and moustache were changed to dark iron-grey, the cheeks were fuller, and the white skin seemed ruby-red underneath; the mouth was redder than ever, for on the lips were gouts of fresh blood, which trickled from the corners of the mouth and ran over the chin and neck. Even the deep, burning eyes seemed set amongst the swollen flesh, for the lids and pouches underneath were bloated. It seemed as if the whole awful creature were simply gorged with blood; he lay like a filthy leech, exhausted with his repletion.\''),(27,'IT: A Novel',1168,4,2,22,43.99,'it.PNG',1,2017,'horror','it_big.PNG','\"A landmark in American literature\" ( Chicago Sun-Times )Stephen King\'s #1 national bestseller about seven adults who return to their hometown to confront a nightmare they had first stumbled on as teenagers...an evil without a name: It . Welcome to Derry, Maine. It\'s a small city, a place as hauntingly familiar as your own hometown. Only in Derry the haunting is real. They were seven teenagers when they first stumbled upon the horror. Now they are grown-up men and women who have gone out into the big world to gain success and happiness. But the promise they made twenty-eight years ago calls them reunite in the same place where, as teenagers, they battled an evil creature that preyed on the city\'s children. Now, children are being murdered again and their repressed memories of that terrifying summer return as they prepare to once again battle the monster lurking in Derry\'s sewers. Readers of Stephen King know that Derry, Maine, is a place with a deep, dark hold on the author. It reappears in many of his books, including Bag of Bones , Hearts in Atlantis , and 11/22/63 . But it all starts with It . \"Stephen King\'s most mature work\" ( St. Petersburg Times ), \" It will overwhelm you... to be read in a well-lit room only\" ( Los Angeles Times )'),(28,'Jaws: A Novel',278,4,3,24,14.99,'jaws.PNG',0,2013,'horror','jaws_big.PNG','Here is Peter Benchleys classic suspense novel of shark versus man, which was made into the blockbuster Steven Spielberg movie. The \"Jaws\" phenomenon changed popular culture and continues to inspire a growing interest in sharks and the oceans today. When Peter Benchley wrote \"Jaws\" in the early 1970s, he meticulously researched all available data about shark behavior. Over the ensuing decades, Benchley was actively engaged with scientists and filmmakers on expeditions around the world as they expanded their knowledge of sharks. Also during this time, there was an unprecedented upswing in the number of sharks killed to make shark-fin soup, and Benchley worked with governments and nonprofits to sound the alarm for shark conservation. He encouraged each new generation of \"Jaws\" fans to enjoy his riveting tale and to channel their excitement into support and protection of these magnificent, prehistoric apex predators. This edition of \"Jaws\" contains bonus content from Peter Benchleys archives, including the original typed title page, a brainstorming list of possible titles, a letter from Benchley to producer David Brown with honest feedback on the movie adaptation, and excerpts from Benchleys book \"Shark Trouble\" highlighting his firsthand account of writing \"Jaws, \" selling it to Universal Studios, and working with Steven Spielberg. \"NEW YORK TIMES\" BESTSELLER \"A tightly written, tautly paced study of terror that] makes us tingle.\"--\"The Washington Post\" \"Powerful . . . Benchleys] story grabs you at once.\"--\"The New York Times Book Review\" \"Relentless terror . . . Youd better steel yourself for this one. It isnt a tale for the faint of heart.\"--\"The Philadelphia Inquirer\"\" \" \"Pure engrossment from the very opening . . . a fine story told with style, class, and a splendid feeling for suspense.\"--\"Chicago Sun-Times\"'),(29,'The Shining',447,4,2,22,17.35,'skts.PNG',0,2012,'horror','skts_big.PNG','Jack Torrance\'s new job at the Overlook Hotel is the perfect chance for a fresh start. As the off-season caretaker at the atmospheric old hotel, he\'ll have plenty of time to spend reconnecting with his family and working on his writing. But as the harsh winter weather sets in, the idyllic location feels ever more remote . . . and more sinister. And the only one to notice the strange and terrible forces gathering around the Overlook is Danny Torrance, a uniquely gifted five-year-old.'),(30,'The Ghost',181,4,3,26,6,'theghost.PNG',0,2008,'horror','theghost_big.PNG','Britain\'s former prime minister is holed up in a remote, ocean-front house in America, struggling to finish his memoirs, when his long-term assistant drowns. A professional ghostwriter is sent out to rescue the project - a man more used to working with fading rock stars and minor celebrities than ex-world leaders.'),(31,'The Whispering House',388,4,2,27,12.35,'twh.PNG',1,2021,'horror','twh_big.PNG','Simmering and mysterious, The Whispering House trades in secrets: of a son haunted by his family\'s unsettling past, and a young woman uncovering the truth about her sister\'s last days.'),(32,'The Green Mile',544,4,2,22,20.15,'sktgm.PNG',0,2008,'horror','sktgm_big.PNG','At Cold Mountain Penitentiary, along the lonely stretch of cells known as the Green Mile, killers await death, whilst their guards watch over them. Good or evil, innocent or guilty, none of them have ever seen the likes of brutal new prisoner John Coffey, seemingly a devil in human form.'),(33,'Clean Code in JavaScript',436,5,4,28,47.69,'ccjs.PNG',1,2020,'it','ccjs_big.PNG','Get the most out of JavaScript for building web applications through a series of patterns, techniques, and case studies for clean coding Key Features Write maintainable JS code using internal abstraction, well-written tests, and well-documented code Understand the agents of clean coding like SOLID principles, OOP, and functional programming Explore solutions to tackle common JavaScript challenges in building UIs, managing APIs, and writing states Book Description Building robust apps starts with creating clean code. In this book, you\'ll explore techniques for doing this by learning everything from the basics of JavaScript through to the practices of clean code. You\'ll write functional, intuitive, and maintainable code while also understanding how your code affects the end user and the wider community. The book starts with popular clean-coding principles such as SOLID, and the Law of Demeter (LoD), along with highlighting the enemies of writing clean code such as cargo culting and over-management. You\'ll then delve into JavaScript, understanding the more complex aspects of the language. Next, you\'ll create meaningful abstractions using design patterns, such as the Class Pattern and the Revealing Module Pattern. You\'ll explore real-world challenges such as DOM reconciliation, state management, dependency management, and security, both within browser and server environments. Later, you\'ll cover tooling and testing methodologies and the importance of documenting code. Finally, the book will focus on advocacy and good communication for improving code cleanliness within teams or workplaces, along with covering a case study for clean coding. By the end of this book, you\'ll be well-versed with JavaScript and have learned how to create clean abstractions, test them, and communicate about them via documentation. What you will learn Understand the true purpose of code and the problems it solves for your end-users and colleagues Discover the tenets and enemies of clean code considering the effects of cultural and syntactic conventions Use modern JavaScript syntax and design patterns to craft intuitive abstractions Maintain code quality within your team via wise adoption of tooling and advocating best practices Learn the modern ecosystem of JavaScript and its challenges like DOM reconciliation and state management Express the behavior of your code both within tests and via various forms of documentation Who this book is for This book is for anyone who writes JavaScript, professionally or otherwise. As this book does not relate specifically to any particular framework or environment, no prior experience of any JavaScript web framework is required. Some knowledge of programming is assumed to understand the concepts covered in the book more effectively.'),(34,'Version Control with Git',452,5,5,29,54.35,'git.PNG',0,2012,'it','git_big.PNG','Offering step-by-step tutorials, this book takes readers through ways to track, merge, and manage software projects using Git, the flexible open source version control system.'),(35,'Google Adwords',352,5,4,37,14.99,'google.PNG',1,2019,'it','google_big.PNG','Do you want to know Everything About Google AdWords? What are the best strategies to rank at the top? Google Marketing is a phenomenal showcasing approach for business owners. You can show a promotion for your solution to individuals that are searching down your sort of solution at that details second WHICH are trying to find firms in your fundamental place. This type of concentrating on makes most business owners require to promote on Google. Everything About Google AdWords Fully updated for 2020 ! Google AdWords is a solution that can take your solution to the following degree. You can place as well as likewise run promotions which will definitely display exactly Googles search, also on the initial website. These promotions will definitely look like well as appearance smooth as well as attractive. Google settings these advertisements tactically at either the leading or base of their web page when individuals look your keywords. At the factor when a purchaser looks for a term or expression, Google will certainly reveal the client crucial discounts depending on the keywords used in the query. Websites that need their coupons to show up on the results web page deal on keyword expressions that they rely upon. People will certainly utilize these keywords when looking for their kind of organization. For instance, a handyman placed in Atlanta may supply on the search phrases such as \"woodworking Florida,\" \"Home timber products,\" or \"woodwork devices.\" Contingent upon the amount you offer contrasted with different handymen in the area; your promotion may show up on the outcomes web page when individuals check for the terms you provide on. No matter the amount you give, Google additionally takes into consideration the importance along with nature of your advertisement as well as likewise website. So regardless of whether you have one of the most fantastic given, the promo for your shop will most likely never ever show up in search when someone looks for \"labor residence work.\" You need to be a great deal extra certain with essential expressions. This guide will focus on the following: Choosing Keywords How To Build a Google Friendly Website Local SEO Begins at Home Website Content that is Keyword Specific Creating Compelling Ads Optimizing for Conversions Tips on Improving your Content Marketing Strategy Search Campaigns Ad Group Settings & structure Converting Your Followers How to Optimize Your AdWords Campaign... AND MORE! Get your copy today ... Scroll to the top of the page and select the buy now button!'),(36,'HTML and CSS : Design and Build Websites',490,5,4,31,42.99,'htmlcss.PNG',0,2011,'it','htmlcss_big.PNG','\"HTML & CSS: Learn to Design and Build Web Sites\" teaches readers the basics of HTML and CSS. This book is unique because it throws away dull templates and presents the information in full color, with the use of helpful info-graphics. It starts by introducing structure and hierarchy rather than jumping with the first elements or how websites work. Since a picture can often tell a thousand words, the book introduces each new element in a visual way, relying on images and diagrams rather than pages of text. It then goes on to discuss CSS, and teaches the reader how to control how their pages will look / appear. As a value-add, the book is accompanied by a website that the user can download to their computer with lots of examples and exercises to try for themselves. The book covers: structure, text, lists, links, images, tables, forms, useful options, adding style w/CSS, controlling fonts, colors, thinking in boxes, styling lists, styling tables, layouts, using grids, and offers practical advice about SEO, Google analytics, ftp, and HTML5 all in beautifully rendered 4-color ease of reading. The reader will learn: How pages are structured How to create text How to create lists Linking between pages on a site Adding images to a page Structure and creation of tables Elements of forms and how to create How to add style with CSS Controlling fonts Adding colors Layouts.'),(37,'JavaScript: The Definitive Guide',1098,5,5,32,25.99,'js.PNG',0,2011,'it','js_big.PNG','Since 1996, \"JavaScript: The Definitive Guide\" has been the bible for JavaScript programmers--a programmer\'s guide and comprehensive reference to the core language and to the client-side JavaScript APIs defined by web browsers.The 6th edition covers HTML5 and ECMAScript 5. Many chapters have been completely rewritten to bring them in line with today\'s best web development practices. New chapters in this edition document jQuery and server side JavaScript. It\'s recommended for experienced programmers who want to learn the programming language of the Web, and for current JavaScript programmers who want to master it.'),(38,'Web Development with MongoDB and Node.js',300,5,4,38,57.25,'mongonode.PNG',0,2014,'it','mongonode_big.PNG','This book is designed for developers of any skill level that want to get up and running using Node.js and MongoDB to build full featured web applications. A basic understanding of JavaScript and HTML is the only requirement for this book.'),(39,'MySQL',380,5,5,39,26,'mysql.PNG',0,2008,'it','mysql_big.PNG','For years, \"MySQL\" has been helping MySQL developers and database administrators learn their MySQL system inside and out. This third edition has been updated to include information on MySQL 5 and it will prove itself as being the most definitive reference guide to using, administering and programming MySQL databases.'),(40,'The Productive Programmer',224,5,5,35,13.45,'tpp.PNG',0,2008,'it','tpp_big.PNG','How to improve your life (and career) in software development by taking advantage of four key principles: acceleration, focus, automation, and DRYness. Learn from a highly experience master developer how to make your work time more effective. Discover how to avoid interruptions that break your focus; learn how discover the best tools for the job, and use them effectively; find out how to avoid repeating yourself as you\'re coding. Get the most you possibly can out of your tools, from your laptop or workstation to your development environment.');
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name_of_sender` varchar(50) NOT NULL,
  `senders_email` varchar(50) NOT NULL,
  `senders_message` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
INSERT INTO `contacts` VALUES (1,'Anonymus','anonymus@gmail.com','i love reading books'),(2,'anonymus maaan','anonymus@gmail.com','i love reading books'),(3,'teszt','teszt@gmail.com','undefined'),(4,'teszt2','teszt2@gmail.com','undefined'),(5,'undefined','undefined','undefined'),(6,'undefined','undefined','undefined'),(12,'undefined','undefined','undefined'),(13,'undefined','undefined','undefined'),(14,'teszt3','teszt3@gmail.com','undefined'),(15,'teszt4','teszt4@gmail.com','teszt4 szövegs'),(16,'teszt4','teszt4@gmail.com','undefined'),(17,'teszt5','teszt5@gmail.com','teszt5 szövegs'),(43,'dawdad','mircimarci@gmail.com','addwadwad'),(44,'dawdad','mircimarci@gmail.com','addwadwad'),(45,'teszt','teszt@gmail.com','111111111111'),(46,'lacika','lacika@gmail.com','tesztmessage');
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupons`
--

DROP TABLE IF EXISTS `coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coupons` (
  `id` int NOT NULL AUTO_INCREMENT,
  `coupon` varchar(20) NOT NULL,
  `multiple` float NOT NULL,
  `usedornot` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupons`
--

LOCK TABLES `coupons` WRITE;
/*!40000 ALTER TABLE `coupons` DISABLE KEYS */;
INSERT INTO `coupons` VALUES (1,'CP34FG76ZH',0.8,0),(2,'ER72TC20PG',0.7,0),(3,'PY87BC49HY',0.5,0);
/*!40000 ALTER TABLE `coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genre` (
  `id` int NOT NULL AUTO_INCREMENT,
  `genre_type` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` VALUES (1,'Cooking'),(2,'Fantasy'),(3,'History'),(4,'Horror'),(5,'IT');
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_books`
--

DROP TABLE IF EXISTS `order_books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_books` (
  `id` int NOT NULL AUTO_INCREMENT,
  `book_id` int NOT NULL,
  `book_price` int NOT NULL,
  `order_id` int NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `book_id` (`book_id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `order_books_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`),
  CONSTRAINT `order_books_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_books`
--

LOCK TABLES `order_books` WRITE;
/*!40000 ALTER TABLE `order_books` DISABLE KEYS */;
INSERT INTO `order_books` VALUES (1,2,10000,1,2),(2,11,39,2,1),(3,12,39,2,1),(4,15,39,2,1),(5,4,19,4,1),(6,33,48,4,1),(7,10,10,4,1);
/*!40000 ALTER TABLE `order_books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `total_price` int NOT NULL,
  `discount` int NOT NULL,
  `zip_code` varchar(10) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,3,10000,20,'2222','BUDAPEST','anonymus'),(2,30,39,0,'nem1234','nembudapest','nemAnynymus'),(3,30,77,0,'1234','budapest','Anynymus'),(4,30,77,0,'1234','budapest','Anynymus');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publisher`
--

DROP TABLE IF EXISTS `publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publisher` (
  `id` int NOT NULL AUTO_INCREMENT,
  `publisher_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publisher`
--

LOCK TABLES `publisher` WRITE;
/*!40000 ALTER TABLE `publisher` DISABLE KEYS */;
INSERT INTO `publisher` VALUES (1,'Ad Astra'),(2,'Bestline'),(3,'Disciplina'),(4,'ComputerPanorama'),(5,'ComputerComplex');
/*!40000 ALTER TABLE `publisher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `gender` tinyint NOT NULL,
  `address` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `zip_code` int NOT NULL,
  `email` varchar(50) NOT NULL,
  `pass` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Kiss','Pista',1,'Vár utca','Kaposvár',3014,'kpista@gmail.com','pistajelszava'),(2,'Kiss','Pista',1,'Vár utca','Kaposvár',3014,'kpista@gmail.com','60daf04ea4e1512f12434f3bf09c61834ad65efb'),(3,'Kiss','Pista',1,'Vár utca','Kaposvár',3014,'kpista@gmail.com','aac2da16e7b82ed8efc10080e0696d0a98bab58c'),(4,'Erős','Pista',1,'Vár utca','Kaposvár',3014,'kpista@gmail.com','aac2da16e7b82ed8efc10080e0696d0a98bab58c'),(5,'György','Ács',0,'Pöltenberg Ernő utca 2. 3/50','Budapest',1046,'acsgyorgy.mail@gmail.com','445d5662ffd3f78207c7ddc06acf13ae38d78da4'),(6,'Ferike','Kiss',1,'fff','zagrab',1023,'ferike@gmail.com','0683aefa004ab90bfc75af36b431b7ac5345f22c'),(7,'Nagy','Laci',1,'zala','zala',1000,'nlacika@gmail.com','99969b466ac14664d923fb2e992a90bc71b75beb'),(8,'lalika','marika',1,'fenyő','kaposvár',1032,'laika@gmail.com','955ba299b9fd301cc4f9cf20c7e46d27508300cc'),(9,'lalika','marika',1,'fenyő','kaposvár',1032,'laika@gmail.com','955ba299b9fd301cc4f9cf20c7e46d27508300cc'),(10,'marika','marika',1,'ez','az',1000,'marika@gmail.com','82b8049741b2fadcaca7aec9e3391b811f3db800'),(11,'mari','zsuzsi',0,'ezaz','azaz',1111,'ezazmari@gmail.com','6b68f5f7cf36d11b6c6e194e76e961af09ba0a26'),(12,'Szabó','Feri',0,'Polski','fiat',1111,'ferike@gmail.com','525293c8904a60dd361b2fd05516ea233db4a52b'),(13,'lalika','marika',1,'ez','az ',1111,'lalika@gmail.com','e2f8de2d8ef916d967926a6362cdab4375be04da'),(14,'dada','adwa',0,'dwawd','wdawda',1111,'karalabe@gmail.com','dd6f4ac913ffe455d8250fb53fde4a00c574d36b'),(15,'Jenő','Kiss',1,'ez','ez',0,'ezmegaz@gmail.com','3337b9e10f2d83f28726e140b026b8e8ad9d3d21'),(16,'Benedek','Elek',1,'anonymus','buda',1111,'benedek@gmail.com','db97a6b1030ae10c659abd87d0d47461f668076b'),(17,'amerika','kapitany',1,'amerika','new',1111,'amerika@gmail.com','a4cee3b73655175390683873f7c3464cf0c1dacc'),(18,'bubu','maci',1,'erdő','erdő',1111,'bubu@gmail.com','dd9a5b0ee2b9ee1ff2968bc3d75d9f2339e168ab'),(19,'lali','mari',1,'ez','az',1111,'lalimari@gmail.com','2b46491b8a72a35dbd894ecd11561d7dbfe7081a'),(20,'kárász','marcika',1,'ideoda','budapesti',1111,'budapesti@gmail.com','37eac2d40a351ce3f669037a5ab475276ceee1ed'),(21,'firsttest1','lasttest1',1,'addresstest1','citytest1',1111,'emailtest@gmail.com','8ac7e9c06b0815160978cd83d0394abecadbeb5a'),(22,'firsttest1','lasttest1',1,'addresstest1','citytest1',1111,'emailtest@gmail.com','8ac7e9c06b0815160978cd83d0394abecadbeb5a'),(23,'firsttest2','lastetest2',1,'Pöltenberg Ernő utca 2. 3/50','Budapest',1046,'emailtest2.mail@gmail.com','4a568d1aadb451290c06fed4039f1c3787efc6e4'),(24,'firsttest3','lasttes3',1,'addresstest3','cityttest3',1111,'emailtest3@gmail.com','ab7433d5a4df748dad733f37d7d295f2ab36cc81'),(25,'György','Ács',1,'Pöltenberg Ernő utca 2. 3/50','Budapest',1046,'matyityatya.mail@gmail.com','09248697d067064fd9f41034fcd0eb17f94fdd42'),(26,'Szép','Laci',1,'Anonymus utca 1.','Bugyi',6543,'szlacika@gmail.com','79a98c68f76abdadd5ff640ee2b8a240a309696a'),(27,'Tamás','Teszt',1,'Anonymus utca 3.','Budapest',1034,'tamas@gmail.com','badc07f0fc60fe3707958c42ee9fa5e989929c05'),(28,'Teszt','Ernő',1,'Anyonymus','Budapest',1043,'tesztelek@gmail.com','5729b060bdae1fd83a8d84556f78e764053cdd8f'),(29,'Teszt','Feri',1,'Anonymus','Budapest',1234,'tesztferi@gmail.com','3267f4808ae1e38a58528c98cb046ac0f6278f9e'),(30,'lackó','kovács',1,'Anynymus','budapest',1234,'lacko@gmail.com','676c61f72fed4cf4cbf0ed003fd22ed63afd533a'),(31,'karesz','maresz',1,'ilyenolyan','amolyan',1111,'karesz@gmail.com','21d5057843d130de2dedbb254c7fc6b48d2065ae'),(32,'erdei','magdika',0,'anonym','anonym',2222,'erdei@gmail.com','ad7cdb0fa1179b2f57df768d5b1314be370b778f'),(33,'erdo','feri',1,'erdo','erdo',1111,'erdo@gmail.com','180d4fd2f6fc9d1a1f447c19764803fa77adc3c5'),(34,'teszt2','teszt2',1,'teszt2','teszt2',33333,'teszt3@gmail.com','7c2361428611fcbc21395efe187fa11eb07b6193'),(35,'teszt5','teszt5',1,'teszt5','teszt5',1111,'teszt5@gmail.com','1ba2b8c4038645bec96a2b74db6e5c37f1cfa0bf'),(36,'teszt6','',1,'teszt6','teszt6',111,'teszt6@gmail.com','97a5aca0f80b2d5f0dfa16bc337f579a8e5fb75a');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlist` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `book_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `book_id` (`book_id`),
  CONSTRAINT `wishlist_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `wishlist_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=593 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist`
--

LOCK TABLES `wishlist` WRITE;
/*!40000 ALTER TABLE `wishlist` DISABLE KEYS */;
INSERT INTO `wishlist` VALUES (590,30,12);
/*!40000 ALTER TABLE `wishlist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-19 18:24:39
