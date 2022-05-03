CREATE DATABASE `Fortunes` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
CREATE TABLE `Log` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Readings` longtext NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Date` timestamp NOT NULL,
  `Type` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `Tarot` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `UpMeaning` longtext NOT NULL,
  `DownMeaning` longtext NOT NULL,
  `Love` longtext NOT NULL,
  `YesNo` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Name_UNIQUE` (`Name`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `Tea` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Description` longtext NOT NULL,
  `Image` varchar(256) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Name_UNIQUE` (`Name`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `LogTarot` (
  `LogsID` int NOT NULL,
  `TarotsID` int NOT NULL,
  PRIMARY KEY (`LogsID`,`TarotsID`),
  KEY `Taort_ID_idx` (`TarotsID`),
  KEY `Log_ID_idx` (`LogsID`),
  CONSTRAINT `Log_ID` FOREIGN KEY (`LogsID`) REFERENCES `Log` (`ID`),
  CONSTRAINT `Tarot_ID` FOREIGN KEY (`TarotsID`) REFERENCES `Tarot` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `LogTea` (
  `LogsID` int NOT NULL,
  `TeasID` int NOT NULL,
  PRIMARY KEY (`LogsID`,`TeasID`),
  KEY `Tea_ID_idx` (`TeasID`),
  CONSTRAINT `LogTea_ID` FOREIGN KEY (`LogsID`) REFERENCES `Log` (`ID`),
  CONSTRAINT `Tea_ID` FOREIGN KEY (`TeasID`) REFERENCES `Tea` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


/*
-- Query: SELECT * FROM Fortunes.Tea
LIMIT 0, 1000

-- Date: 2022-04-20 17:45
*/
INSERT INTO `Tea` (`ID`,`Name`,`Description`,`Image`) VALUES (1,'Crescent','Moon, receptivity, introspection','');
INSERT INTO `Tea` (`ID`,`Name`,`Description`,`Image`) VALUES (2,'Circle Segments','Legato, rationality, sleep','');
INSERT INTO `Tea` (`ID`,`Name`,`Description`,`Image`) VALUES (3,'Sum','Total, together, net','');
INSERT INTO `Tea` (`ID`,`Name`,`Description`,`Image`) VALUES (4,'Fuller Circle Segment','Do not disturb','');
INSERT INTO `Tea` (`ID`,`Name`,`Description`,`Image`) VALUES (5,'Waves','Movement, travel','');
INSERT INTO `Tea` (`ID`,`Name`,`Description`,`Image`) VALUES (6,'Circle with a Spot','New start','');
INSERT INTO `Tea` (`ID`,`Name`,`Description`,`Image`) VALUES (7,'Star','Success','');
INSERT INTO `Tea` (`ID`,`Name`,`Description`,`Image`) VALUES (8,'Heart','Love','');
INSERT INTO `Tea` (`ID`,`Name`,`Description`,`Image`) VALUES (9,'Horseshoe','Luck','');
INSERT INTO `Tea` (`ID`,`Name`,`Description`,`Image`) VALUES (10,'Cup','Celebration','');
INSERT INTO `Tea` (`ID`,`Name`,`Description`,`Image`) VALUES (11,'V','Strong emotion, fire','');
INSERT INTO `Tea` (`ID`,`Name`,`Description`,`Image`) VALUES (12,'Spiral','Creativity','');
INSERT INTO `Tea` (`ID`,`Name`,`Description`,`Image`) VALUES (13,'|||','Change','');
INSERT INTO `Tea` (`ID`,`Name`,`Description`,`Image`) VALUES (14,'X','Stop','');
INSERT INTO `Tea` (`ID`,`Name`,`Description`,`Image`) VALUES (15,'Wheel','Progress','');
INSERT INTO `Tea` (`ID`,`Name`,`Description`,`Image`) VALUES (16,'Anchor','Stability','');
INSERT INTO `Tea` (`ID`,`Name`,`Description`,`Image`) VALUES (17,'Chains','Responsibility','');
INSERT INTO `Tea` (`ID`,`Name`,`Description`,`Image`) VALUES (18,'Key','Caution','');
INSERT INTO `Tea` (`ID`,`Name`,`Description`,`Image`) VALUES (19,'Fish','Good fortune','');
INSERT INTO `Tea` (`ID`,`Name`,`Description`,`Image`) VALUES (20,'Duck','Money','');
INSERT INTO `Tea` (`ID`,`Name`,`Description`,`Image`) VALUES (21,'Cloud','Trouble','');



/*
-- Query: SELECT * FROM Fortunes.Tarot
LIMIT 0, 1000

-- Date: 2022-04-20 17:45
*/
INSERT INTO `Tarot` (`ID`,`Name`,`UpMeaning`,`DownMeaning`,`Love`,`YesNo`) VALUES (1,'The Fool','New beginnings, innocence, adventure','Recklessness, fearlessness, risk','Take a leap of faith','Yes');
INSERT INTO `Tarot` (`ID`,`Name`,`UpMeaning`,`DownMeaning`,`Love`,`YesNo`) VALUES (2,'The Magician','Willpower, creation, manifestation','Manipulation, illusions','If there\'s a cloud in the sky, watch out!','Yes');
INSERT INTO `Tarot` (`ID`,`Name`,`UpMeaning`,`DownMeaning`,`Love`,`YesNo`) VALUES (3,'The High Priestess','Intuitive, unconscious, divine feminine','Repressed feelings, withdrawal, silence','Make up or break up','Yes');
INSERT INTO `Tarot` (`ID`,`Name`,`UpMeaning`,`DownMeaning`,`Love`,`YesNo`) VALUES (4,'The Empress','Femininity, nurturing, fertility, abundance','Dependence, smothering, emptiness','Love is in the air','Yes');
INSERT INTO `Tarot` (`ID`,`Name`,`UpMeaning`,`DownMeaning`,`Love`,`YesNo`) VALUES (5,'The Emperor','Authority, structure, a father figure','Excessive control, rigidity, domination','You like being dominated?!','Yes');
INSERT INTO `Tarot` (`ID`,`Name`,`UpMeaning`,`DownMeaning`,`Love`,`YesNo`) VALUES (6,'The Hierophant','Spiritual wisdom, tradition, conformity, morality, ethics','Rebellion, subversiveness, freedom, personal beliefs','Be open to advice','Neither');
INSERT INTO `Tarot` (`ID`,`Name`,`UpMeaning`,`DownMeaning`,`Love`,`YesNo`) VALUES (7,'The Lovers','Love, harmony, partnerships, choices','Disbalance, one-sidedness, disharmony','Soulmate or side piece in your vicinity','Yes');
INSERT INTO `Tarot` (`ID`,`Name`,`UpMeaning`,`DownMeaning`,`Love`,`YesNo`) VALUES (8,'The Chariot','Direction, control, willpower, determination, success, action','Lack of control, opposition, lack of direction, self-discipline','You do you','Yes');
INSERT INTO `Tarot` (`ID`,`Name`,`UpMeaning`,`DownMeaning`,`Love`,`YesNo`) VALUES (9,'Strength','Strength, courage, compassion, focus, persuasion, influence','Self-doubt, weakness, insecurity, low energy, raw emotion','You don\'t have to be the only one pulling the weight','Yes');
INSERT INTO `Tarot` (`ID`,`Name`,`UpMeaning`,`DownMeaning`,`Love`,`YesNo`) VALUES (10,'The Hermit','Wisdom, soul searching, solitude, spiritual enlightenment, receiving or giving guidance','Loneliness, isolation, paranoia, sadness, being overcome or paralyzed by fear','Single and ready to single','Yes');
INSERT INTO `Tarot` (`ID`,`Name`,`UpMeaning`,`DownMeaning`,`Love`,`YesNo`) VALUES (11,'Wheel of Fortune','Chance, destiny and fate, karma, turning points, life cycles','Upheaval, lousy luck, unwelcome change, setbacks, external forces','Things are looking good','Yes');
INSERT INTO `Tarot` (`ID`,`Name`,`UpMeaning`,`DownMeaning`,`Love`,`YesNo`) VALUES (12,'Justice','Fairness, integrity, legal disputes, cause and effect, life lessons','Injustice, dishonesty, failure to take responsibility, deceitful practices, negative karma','You\'re going to get what you deserve','Neutral');
INSERT INTO `Tarot` (`ID`,`Name`,`UpMeaning`,`DownMeaning`,`Love`,`YesNo`) VALUES (13,'The Hanged Man','Letting go, sacrificing, pausing to reflect, uncertainty, spiritual development','Discontentment, stagnation, negative patterns, no solution, fear of sacrifice','RIP your love life','Maybe');
INSERT INTO `Tarot` (`ID`,`Name`,`UpMeaning`,`DownMeaning`,`Love`,`YesNo`) VALUES (14,'Death','Ending of a cycle, transitions, getting rid of excess, powerful movement, resolutions','Resisting change, fear of new beginnings, dependency, repeating negative patterns','You need to move on','Yes');
INSERT INTO `Tarot` (`ID`,`Name`,`UpMeaning`,`DownMeaning`,`Love`,`YesNo`) VALUES (15,'Temperance','Balance, moderation, good health, cooperating with others, finding solutions','Imbalance, discord, hastiness, overindulgence, risky behavior','Move in','Yes');
INSERT INTO `Tarot` (`ID`,`Name`,`UpMeaning`,`DownMeaning`,`Love`,`YesNo`) VALUES (16,'The Devil','Material focus, trapped in bondage, addictions and depression, negative thinking, betrayal','Overcoming addiction, independence, reclaiming power, detachment, freedom','It\'s not looking so hot','No');
INSERT INTO `Tarot` (`ID`,`Name`,`UpMeaning`,`DownMeaning`,`Love`,`YesNo`) VALUES (17,'The Tower','Intense and sudden change, release, painful loss, tragedy, revelation','Resisting change, avoiding tragedy, a narrow escape, delaying what is inevitable','They\'re leaving you, if you\'re not alone already','No');
INSERT INTO `Tarot` (`ID`,`Name`,`UpMeaning`,`DownMeaning`,`Love`,`YesNo`) VALUES (18,'The Start','Hope, renewal, creativity and inspiration, generosity, healing','Despair, lack of hope, creative block, boredom, focusing on the negative','It\'s looking good actually','Yes');
INSERT INTO `Tarot` (`ID`,`Name`,`UpMeaning`,`DownMeaning`,`Love`,`YesNo`) VALUES (19,'The Moon','Fear, anxiety, confusion, delusion, risk','Overcoming fear, finding the truth, conquering anxiety, gaining clarity','Good sign for lesbians','No');
INSERT INTO `Tarot` (`ID`,`Name`,`UpMeaning`,`DownMeaning`,`Love`,`YesNo`) VALUES (20,'The Sun','Happiness, fertility, success, optimism, truth','Sadness, procrastination, pessimism, lies, failure','Wait no more!','Yes');
INSERT INTO `Tarot` (`ID`,`Name`,`UpMeaning`,`DownMeaning`,`Love`,`YesNo`) VALUES (21,'Judgement','Reflection, inner calling, reckoning, awakening, rebirth, absolution','Feeling down, self-doubt, missing the call fearlessness','I don\'t know, you determine your life','Yes');
INSERT INTO `Tarot` (`ID`,`Name`,`UpMeaning`,`DownMeaning`,`Love`,`YesNo`) VALUES (22,'The World','Fulfillment, harmony, completion, integration, travel, unity','Incompletion, shortcuts, delays, emptiness','You\'re either going get everything you want or nothing','Yes');
INSERT INTO `Tarot` (`ID`,`Name`,`UpMeaning`,`DownMeaning`,`Love`,`YesNo`) VALUES (23,'Ace of Wands','creation, willpower, inspiration, desire','Lack of energy, lack of passion, boredom','Start as friends','Yes');
INSERT INTO `Tarot` (`ID`,`Name`,`UpMeaning`,`DownMeaning`,`Love`,`YesNo`) VALUES (24,'Two of Wands','Planning, making decisions, leaving home','Fear of change, playing safe, bad planning','Sometimes people are boring','Yes');
INSERT INTO `Tarot` (`ID`,`Name`,`UpMeaning`,`DownMeaning`,`Love`,`YesNo`) VALUES (25,'Three of Wands','Looking ahead, expansion, rapid growth','Obstacles, delays, frustration','Spice it up a little','Neutral');
INSERT INTO `Tarot` (`ID`,`Name`,`UpMeaning`,`DownMeaning`,`Love`,`YesNo`) VALUES (26,'Four of Wands','Community, home, celebration','Lack of support, transience, home conflicts','Put a ring on it','Yes');
INSERT INTO `Tarot` (`ID`,`Name`,`UpMeaning`,`DownMeaning`,`Love`,`YesNo`) VALUES (27,'Five of Wands','Competition, rivalry, conflict','Avoiding conflict, respecting differences','Fight for love','Neither');
INSERT INTO `Tarot` (`ID`,`Name`,`UpMeaning`,`DownMeaning`,`Love`,`YesNo`) VALUES (28,'Six of Wands','Victory, success, public reward','Excess pride, lack of recognition, punishment','All you do is win','Yes');
INSERT INTO `Tarot` (`ID`,`Name`,`UpMeaning`,`DownMeaning`,`Love`,`YesNo`) VALUES (29,'Seven of Wands','Perseverance, defensive, maintaining control','Give up, destroyed confidence, overwhelmed','Say bye to you\'re relationship~','No');
INSERT INTO `Tarot` (`ID`,`Name`,`UpMeaning`,`DownMeaning`,`Love`,`YesNo`) VALUES (30,'Eight of Wands','Rapid action, movement, quick decisions','Panic, waiting, slowdown','This is your warning','Yes');
INSERT INTO `Tarot` (`ID`,`Name`,`UpMeaning`,`DownMeaning`,`Love`,`YesNo`) VALUES (31,'Nine of Wands','Resilience, grit, last stand ','Exhaustion, fatigue, questioning motivations','Poor you','No');
INSERT INTO `Tarot` (`ID`,`Name`,`UpMeaning`,`DownMeaning`,`Love`,`YesNo`) VALUES (32,'Ten of Wands','Accomplishment, responsibility, burden','Inability to delegate, overstressed, burnt out','All they do is bring pain','Neutral');
INSERT INTO `Tarot` (`ID`,`Name`,`UpMeaning`,`DownMeaning`,`Love`,`YesNo`) VALUES (33,'Page of Wands','Exploration, excitement, freedom','Lack of direction, procrastination, creating conflict','It\'s not serious','Neutral');
INSERT INTO `Tarot` (`ID`,`Name`,`UpMeaning`,`DownMeaning`,`Love`,`YesNo`) VALUES (34,'Knight of Wands','Action, adventure, fearlessness','Anger, impulsiveness, recklessness','The grass is greener on the other side','Yes');
INSERT INTO `Tarot` (`ID`,`Name`,`UpMeaning`,`DownMeaning`,`Love`,`YesNo`) VALUES (35,'Queen of Wands','Courage, determination, joy ','Selfishness, jealousy, insecurities','You do you, Queen','Neutral');
INSERT INTO `Tarot` (`ID`,`Name`,`UpMeaning`,`DownMeaning`,`Love`,`YesNo`) VALUES (36,'King of Wands','Big picture, leader, overcoming challenges','Impulsive, overbearing, unachievable expectations','Time to settle','Maybe');
INSERT INTO `Tarot` (`ID`,`Name`,`UpMeaning`,`DownMeaning`,`Love`,`YesNo`) VALUES (37,'Ace of Cups','New feelings, spirituality, intuition','Emotional loss, blocked creativity, emptiness','Your feelings are valid and ready to bloom','Yes');
INSERT INTO `Tarot` (`ID`,`Name`,`UpMeaning`,`DownMeaning`,`Love`,`YesNo`) VALUES (38,'Two of Cups','Unity, partnership, connection','Imbalance, broken communication, tension','Looks good to me','No');
INSERT INTO `Tarot` (`ID`,`Name`,`UpMeaning`,`DownMeaning`,`Love`,`YesNo`) VALUES (39,'Three of Cups','Friendship, community, happiness','Overindulgence, gossip, isolation','Looking lucky in the love department','Yes');
INSERT INTO `Tarot` (`ID`,`Name`,`UpMeaning`,`DownMeaning`,`Love`,`YesNo`) VALUES (40,'Four of Cups','Apathy, contemplation, disconnectedness','Sudden awareness, choosing happiness, acceptance','Alone not lonely amirite?','No');
INSERT INTO `Tarot` (`ID`,`Name`,`UpMeaning`,`DownMeaning`,`Love`,`YesNo`) VALUES (41,'Five of Cups','Loss, grief, self-pity','Acceptance, moving on, finding peace','It\'s not you, it\'s uh...','No');
INSERT INTO `Tarot` (`ID`,`Name`,`UpMeaning`,`DownMeaning`,`Love`,`YesNo`) VALUES (42,'Six of Cups','Familiarity, happy memories, healing','Moving forward, leaving home, independence','Focus on the present','Neutral');
INSERT INTO `Tarot` (`ID`,`Name`,`UpMeaning`,`DownMeaning`,`Love`,`YesNo`) VALUES (43,'Seven of Cups','Searching for purpose, choices, daydreaming','Lack of purpose, diversion, confusion','So many fishes in the sea, Captain!','Neutral');
INSERT INTO `Tarot` (`ID`,`Name`,`UpMeaning`,`DownMeaning`,`Love`,`YesNo`) VALUES (44,'Eight of Cups','Walking away, disillusionment, leaving behind','Avoidance, fear of change, fear of loss','Are you really happy?','No');
INSERT INTO `Tarot` (`ID`,`Name`,`UpMeaning`,`DownMeaning`,`Love`,`YesNo`) VALUES (45,'Nine of Cups','Satisfaction, emotional stability, luxury','Lack of inner joy, smugness, dissatisfaction','Looks like things are heating up','Yes');
INSERT INTO `Tarot` (`ID`,`Name`,`UpMeaning`,`DownMeaning`,`Love`,`YesNo`) VALUES (46,'Ten of Cups','Inner happiness, fulfillment, dreams coming true','Shattered dreams, broken family, domestic disharmony','Looks like sunshine','Yes');
INSERT INTO `Tarot` (`ID`,`Name`,`UpMeaning`,`DownMeaning`,`Love`,`YesNo`) VALUES (47,'Page of Cups','Happy surprise, dreamer, sensitivity','Emotional immaturity, insecurity, disappointment','it\'s a time for someone sensitive and mature','Yes');
INSERT INTO `Tarot` (`ID`,`Name`,`UpMeaning`,`DownMeaning`,`Love`,`YesNo`) VALUES (48,'Knight of Cups','Following the heart, idealist, romantic','Moodiness, disappointment','Good vibes all around','Yes');
INSERT INTO `Tarot` (`ID`,`Name`,`UpMeaning`,`DownMeaning`,`Love`,`YesNo`) VALUES (49,'Queen of Cups','Compassion, calm, comfort','Martyrdom, insecurity, dependence','Put yourself first in the relationship','Neutral');
INSERT INTO `Tarot` (`ID`,`Name`,`UpMeaning`,`DownMeaning`,`Love`,`YesNo`) VALUES (50,'King of Cups','Compassion, control, balance','Coldness, moodiness, bad advice','Things are looking stable','Yes');
INSERT INTO `Tarot` (`ID`,`Name`,`UpMeaning`,`DownMeaning`,`Love`,`YesNo`) VALUES (51,'Ace of Swords','Breakthrough, clarity, sharp mind','Confusion, brutality, chaos','Deep in love or deep in hate','Yes');
INSERT INTO `Tarot` (`ID`,`Name`,`UpMeaning`,`DownMeaning`,`Love`,`YesNo`) VALUES (52,'Two of Swords','difficult choices, indecision, stalemate','lesser of two evils, no right choice, confusion','Well matched with a lot in common','Maybe');
INSERT INTO `Tarot` (`ID`,`Name`,`UpMeaning`,`DownMeaning`,`Love`,`YesNo`) VALUES (53,'Three of Swords','Heartbreak, suffering, grief','Recovery, forgiveness, moving on','There\'s a lot of heartache T.T','No');
INSERT INTO `Tarot` (`ID`,`Name`,`UpMeaning`,`DownMeaning`,`Love`,`YesNo`) VALUES (54,'Four of Swords','Rest, restoration, contemplation','Restlessness, burnout, stress','It really depends on how you\'re feeling','Neutral');
INSERT INTO `Tarot` (`ID`,`Name`,`UpMeaning`,`DownMeaning`,`Love`,`YesNo`) VALUES (55,'Five of Swords','Unbridled ambition, win at all costs, sneakiness','Lingering resentment, desire to reconcile, forgiveness','I smell a little cheating','No');
INSERT INTO `Tarot` (`ID`,`Name`,`UpMeaning`,`DownMeaning`,`Love`,`YesNo`) VALUES (56,'Six of Swords','Transition, leaving behind, moving on','Emotional baggage, unresolved issues, resisting transition','Maybe travel a little first','Yes');
INSERT INTO `Tarot` (`ID`,`Name`,`UpMeaning`,`DownMeaning`,`Love`,`YesNo`) VALUES (57,'Seven of Swords','Deception, trickery, tactics and strategy','Coming clean, rethinking approach, deception','Wake up','No');
INSERT INTO `Tarot` (`ID`,`Name`,`UpMeaning`,`DownMeaning`,`Love`,`YesNo`) VALUES (58,'Eight of Swords','Imprisonment, entrapment, self-victimization','Self acceptance, new perspective, freedom','Don\'t get trapped','No');
INSERT INTO `Tarot` (`ID`,`Name`,`UpMeaning`,`DownMeaning`,`Love`,`YesNo`) VALUES (59,'Nine of Swords','Anxiety, hopelessness, trauma','Hope, reaching out, despair','Be wary, but don\'t let you\'re insecurities get the best of you','Neutral');
INSERT INTO `Tarot` (`ID`,`Name`,`UpMeaning`,`DownMeaning`,`Love`,`YesNo`) VALUES (60,'Ten of Swords','Failure, collapse, defeat','Can\'t get worse, only upwards, inevitable end','There\'s no good outcome','No');
INSERT INTO `Tarot` (`ID`,`Name`,`UpMeaning`,`DownMeaning`,`Love`,`YesNo`) VALUES (61,'Page of Swords','Curiosity, restlessness, mental energy','Deception, manipulation, all talk','Cut the haters out','No');
INSERT INTO `Tarot` (`ID`,`Name`,`UpMeaning`,`DownMeaning`,`Love`,`YesNo`) VALUES (62,'Knight of Swords','Action, impulsiveness, defending beliefs','No direction, disregard for consequences, unpredictability','I sense a lot anger','No');
INSERT INTO `Tarot` (`ID`,`Name`,`UpMeaning`,`DownMeaning`,`Love`,`YesNo`) VALUES (63,'Queen of Swords','Complexity, perceptiveness, clear mindedness','Cold hearted, cruel, bitterness','I sense some troubles ahead','No');
INSERT INTO `Tarot` (`ID`,`Name`,`UpMeaning`,`DownMeaning`,`Love`,`YesNo`) VALUES (64,'King of Swords','Head over heart, discipline, truth','Manipulative, cruel, weakness','love is not the priority','No');
INSERT INTO `Tarot` (`ID`,`Name`,`UpMeaning`,`DownMeaning`,`Love`,`YesNo`) VALUES (65,'Ace of Pentacles','Opportunity, prosperity, new venture','Lost opportunity, missed chance, bad investment','Hmmm depends. Either good or brutal','Yes');
INSERT INTO `Tarot` (`ID`,`Name`,`UpMeaning`,`DownMeaning`,`Love`,`YesNo`) VALUES (66,'Two of Pentacles','Balancing decisions, priorities, adapting to change','Loss of balance, disorganized, overwhelmed','I sense a little cheaty and infidelity','Maybe');
INSERT INTO `Tarot` (`ID`,`Name`,`UpMeaning`,`DownMeaning`,`Love`,`YesNo`) VALUES (67,'Three of Pentacles','Teamwork, collaboration, building','Lack of teamwork, disorganized, group conflict','It\'s a time for learning','Yes');
INSERT INTO `Tarot` (`ID`,`Name`,`UpMeaning`,`DownMeaning`,`Love`,`YesNo`) VALUES (68,'Four of Pentacles','Conservation, frugality, security','Greediness, stinginess, possessiveness','Someone\'s a little possessive...','Yes');
INSERT INTO `Tarot` (`ID`,`Name`,`UpMeaning`,`DownMeaning`,`Love`,`YesNo`) VALUES (69,'Five of Pentacles','Need, poverty, insecurity','Recovery, charity, improvement','You can make it work if you both put in work','No');
INSERT INTO `Tarot` (`ID`,`Name`,`UpMeaning`,`DownMeaning`,`Love`,`YesNo`) VALUES (70,'Six of Pentacles','Charity, generosity, sharing','Strings attached, stinginess, power and domination','It\'s good for now','Neutral');
INSERT INTO `Tarot` (`ID`,`Name`,`UpMeaning`,`DownMeaning`,`Love`,`YesNo`) VALUES (71,'Seven of Pentacles','Hard work, perseverance, diligence','Work without results, distractions, lack of rewards','I\'m sensing some good vibes coming your way','Yes');
INSERT INTO `Tarot` (`ID`,`Name`,`UpMeaning`,`DownMeaning`,`Love`,`YesNo`) VALUES (72,'Eight of Pentacles','Apprenticeship, passion, high standards','Lack of passion, uninspired, no motivation','Keep your eyes on the prize','Yes');
INSERT INTO `Tarot` (`ID`,`Name`,`UpMeaning`,`DownMeaning`,`Love`,`YesNo`) VALUES (73,'Nine of Pentacles','Fruits of labor, rewards, luxury','Reckless spending, living beyond means, false success','Settle down, but also spice it up','Yes');
INSERT INTO `Tarot` (`ID`,`Name`,`UpMeaning`,`DownMeaning`,`Love`,`YesNo`) VALUES (74,'Ten of Pentacles','Legacy, culmination, inheritance','Fleeting success, lack of stability, lack of resources','I\'m sensing a period of stability','Yes');
INSERT INTO `Tarot` (`ID`,`Name`,`UpMeaning`,`DownMeaning`,`Love`,`YesNo`) VALUES (75,'Page of Pentacles','Ambition, desire, diligence','Lack of commitment, greediness, laziness','Not seeing a lot of love','No');
INSERT INTO `Tarot` (`ID`,`Name`,`UpMeaning`,`DownMeaning`,`Love`,`YesNo`) VALUES (76,'Knight of Pentacles','Efficiency, hard work, responsibility','Laziness, obsessiveness, work without reward','I see commitment, just not right now','Yes');
INSERT INTO `Tarot` (`ID`,`Name`,`UpMeaning`,`DownMeaning`,`Love`,`YesNo`) VALUES (77,'Queen of Pentacles','Practicality, creature comforts, financial security','Self-centeredness, jealousy, smothering','Now\'s not the time for an affair','Yes');
INSERT INTO `Tarot` (`ID`,`Name`,`UpMeaning`,`DownMeaning`,`Love`,`YesNo`) VALUES (78,'King of Pentacles','Abundance, prosperity, security','Greed, indulgence, sensuality','It\'s a good time to settle down if you want','Yes');

