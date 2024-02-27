import 'package:flutter/material.dart';

import '../generated/assets.dart';
import '../models/game.dart';

class Games {
  static const List<Game> data = [
    Game(
      title: 'NBA 2k23',
      img: Assets.gamesNba2k23,
      isPs4: true,
      isPs5: true,
      color: Colors.pinkAccent,
      details: {
        'imgs': [
          Assets.detailsNba1,
          Assets.detailsNba2,
          Assets.detailsNba3,
          Assets.detailsNba4,
          Assets.detailsNba5,
        ],
        'description':
            'FIFA 23 Dual Entitlement includes PS4™ & PS5™ games. FIFA 23 brings even more of the action and realism of football to the pitch in The World’s Game, with advances in HyperMotion2 Technology on PlayStation®5 driven by twice as much real-world motion capture helping to create more true football animation than ever before in every match. Play the biggest tournaments in football with both the men’s and women’s FIFA World Cup™ coming as post-launch updates, play as women’s club teams powered by dedicated HyperMotion2 animation for the first time ever, plus enjoy cross-play features† that make it easier to play against friends. Enjoy a new way to play and build your dream squad with FUT Moments and a revamped Chemistry system in FIFA Ultimate Team™, or live out your football dreams in Career Mode as you define your personality as a player, or manage as some of football’s most famous names. This game includes optional in-game purchases of virtual currency that can be used to acquire virtual in-game items, including a random selection of virtual in-game items.',
        'features': [
          {
            'text': 'PS Plus required for online play',
            'icon': Assets.otherPSPlusMono,
          },
          {
            'text': 'Supports up to 22 online players with PS Plus',
            'icon': Assets.otherPSPlusOnline,
          },
          {
            'text': '1 - 4 players',
            'icon': Assets.otherMultiplayer,
          },
          {
            'text': 'In-game purchases optional',
            'icon': Assets.otherInGamePurchases,
          },
          {
            'text': 'Online play optional',
            'icon': Assets.otherOptionalOnlinePlay,
          },
        ],
      },
    ),
    Game(
        title: 'FIFA 23',
        img: Assets.gamesFifa23,
        isPs4: true,
        isPs5: true,
        color: Color.fromARGB(255, 195, 159, 113),
        details: {
          'imgs': [
            Assets.detailsFifa0,
            Assets.detailsFifa1,
            Assets.detailsFifa2,
            Assets.detailsFifa3,
            Assets.detailsFifa4,
          ],
          'description':
              'FIFA 23 Dual Entitlement includes PS4™ & PS5™ games. FIFA 23 brings even more of the action and realism of football to the pitch in The World’s Game, with advances in HyperMotion2 Technology on PlayStation®5 driven by twice as much real-world motion capture helping to create more true football animation than ever before in every match. Play the biggest tournaments in football with both the men’s and women’s FIFA World Cup™ coming as post-launch updates, play as women’s club teams powered by dedicated HyperMotion2 animation for the first time ever, plus enjoy cross-play features† that make it easier to play against friends. Enjoy a new way to play and build your dream squad with FUT Moments and a revamped Chemistry system in FIFA Ultimate Team™, or live out your football dreams in Career Mode as you define your personality as a player, or manage as some of football’s most famous names. This game includes optional in-game purchases of virtual currency that can be used to acquire virtual in-game items, including a random selection of virtual in-game items.',
          'features': [
            {
              'text': 'PS Plus required for online play',
              'icon': Assets.otherPSPlusMono,
            },
            {
              'text': 'Supports up to 22 online players with PS Plus',
              'icon': Assets.otherPSPlusOnline,
            },
            {
              'text': '1 - 4 players',
              'icon': Assets.otherMultiplayer,
            },
            {
              'text': 'In-game purchases optional',
              'icon': Assets.otherInGamePurchases,
            },
            {
              'text': 'Online play optional',
              'icon': Assets.otherOptionalOnlinePlay,
            },
          ],
        }),
    Game(
        title: 'Deathloop',
        img: Assets.gamesDeathloop,
        isPs4: false,
        isPs5: true,
        color: Color.fromARGB(255, 171, 107, 22),
        details: {
          'imgs': [
            Assets.detailsDl1,
            Assets.detailsDl2,
            Assets.detailsDl3,
            Assets.detailsDl4,
            Assets.detailsDl5
          ],
          'description':
              'DEATHLOOP is a next-gen first person shooter from Arkane Lyon, the award-winning studio behind Dishonored. In DEATHLOOP, two rival assassins are trapped in a mysterious timeloop on the island of Blackreef, doomed to repeat the same day for eternity. As Colt, the only chance for escape is to end the cycle by assassinating eight key targets before the day resets. Learn from each cycle - try new paths, gather intel, and find new weapons and abilities. Do whatever it takes to break the loop.\n\nDESIGNED FOR THE PS5\nDEATHLOOP is built for a new generation, leveraging the PlayStation 5\'s hardware and graphics to bring Arkane’s unique artistic vision to life like never before. DEATHLOOP takes advantage of new cutting-edge features like haptic feedback and adaptive triggers to make each encounter feel unique and impactful.\n\nIF AT FIRST YOU DON’T SUCCEED... DIE, DIE AGAIN\nEvery new loop is an opportunity to change things up. Use the knowledge you gain from each attempt to change up your playstyle, stealthily sneaking through levels or barreling into the fight, guns-blazing. In each loop you’ll discover new secrets, gather intel on your targets as well as the island of Blackreef, and expand your arsenal. Armed with a host of otherworldly abilities and savage weaponry, you’ll utilize every tool at your command to execute takedowns that are as striking as they are devastating. Customize your loadout wisely to survive this deadly game of hunter vs hunted.',
          'features': [
            {
              'text': 'PS Plus required for online play',
              'icon': Assets.otherPSPlusMono,
            },
            {
              'text': 'Supports up to 22 online players with PS Plus',
              'icon': Assets.otherPSPlusOnline,
            },
            {
              'text': 'Single Player Mode',
              'icon': Assets.otherMultiplayer,
            },
            {
              'text': 'In-game purchases optional',
              'icon': Assets.otherInGamePurchases,
            },
            {
              'text': 'Online play optional',
              'icon': Assets.otherOptionalOnlinePlay,
            },
            {
              'text': 'Game Help supported',
              'icon': Assets.otherPSPlus,
            },
          ],
        }),
    Game(
        title: 'Spider-Man: Remastered',
        img: Assets.gamesSpiderman,
        isPs4: true,
        isPs5: false,
        color: Color.fromARGB(255, 202, 90, 90),
        details: {
          'imgs': [
            Assets.detailsSm1,
            Assets.detailsSm2,
            Assets.detailsSm3,
            Assets.detailsSm4,
            Assets.detailsSm5
          ],
          'description':
              'BE GREATER.\n\nExplore a new chapter in Marvel’s Spider-Man universe as a more experienced Peter Parker.\n\nStarring one of the world’s most iconic Super Heroes, Marvel\'s Spider-Man features the acrobatic abilities, improvisation and web-slinging that the wall-crawler is famous for, while also introducing elements never-before-seen in a Spider-Man game.\n\nFrom traversing by parkour and unique environmental interactions, to new combat and blockbuster action, it’s Spider-Man unlike any you’ve played before.',
          'features': [
            {
              'text': 'Single Player Mode',
              'icon': Assets.otherPerson,
            },
            {
              'text': 'DUALSHOCK 4 vibration',
              'icon': Assets.otherMultiplayer,
            }
          ]
        }),
    Game(title: 'Horizon Forbidden West™',
        img: Assets.gamesHorizon,
        isPs4: false,
        isPs5: true,
        color: Color.fromARGB(255, 169, 209, 220),
        details: {
          'imgs': [
            Assets.detailsHorizon1,
            Assets.detailsHorizon2,
            Assets.detailsHorizon3,
            Assets.detailsHorizon4,
            Assets.detailsHorizon5
          ],
          'description':
          'Edition includes:\n- Full game (PS5 and PS4).\n\nJoin Aloy as she braves the Forbidden West, a deadly frontier that conceals mysterious new threats.\n\nPlayStation®5 features:\n- Fast-travel and get back into the game almost instantly with the PS5 console’s ultra-high-speed SSD and fast load times.\n- Play in stunning 4K, HDR and with a Performance Mode targeting 60FPS.\n- Feel impact from attacks with the DualSense™ wireless controller’s haptic feedback and feel the resistance of your bow, grappling tool and other weapons with the DualSense wireless controller’s adaptive triggers.\n- Hear sounds from all around you with the PS5 console’s Tempest 3D AudioTech with stereo headphones (analogue or USB).\n\n4K and HDR require a 4K and HDR compatible TV or display.\n\nIf you already own the PS4 version of this game, you can get the PS5 digital version at no extra cost and you do not need to purchase this product. Owners of a PS4 disc copy must insert it into the PS5 every time they want to download or play the PS5 digital version. PS4 game disc owners who buy the PS5 Digital Edition disc-free console will not be able to get the PS5 version at no extra cost.',
          'features': [
            {
              'text': 'Single Player Mode',
              'icon': Assets.otherPerson,
            },
            {
              'text': 'Offline play enabled',
              'icon': Assets.otherPSPlusOnline,
            }
          ]
        }),
    Game(title: 'Farcy 6',
        img: Assets.gamesFarcry,
        isPs4: true,
        isPs5: true,
        color: Color.fromARGB(255, 213, 136, 65),
        details: {
          'imgs': [
            Assets.detailsFarcry1,
            Assets.detailsFarcry2,
            Assets.detailsFarcry3,
            Assets.detailsFarcry4,
            Assets.detailsFarcry5,
          ],
          'description':
          'Get the Deluxe Edition of Far Cry® 6, which includes the game and the Ultimate Pack.\n\nThe Ultimate Pack includes:\n- The Jungle Expedition Pack\n- The Croc Hunter Pack\n- The Vice Pack\n\nPlay as Dani Rojas, a local Yaran, as you fight alongside a modern-day guerrilla revolution to liberate Yara! Fight against Castillo’s regime in the most expansive Far Cry to date.\n\nIf you already own the PS4™ version of this game, you can get the PS5™ digital version at no extra cost and you do not need to purchase this product. Owners of a PS4™ disc copy must insert it into the PS5™ every time they want to download or play the PS5™ digital version. PS4™ game disc owners who buy the PS5™ Digital Edition disc-free console will not be able to get the PS5™ version at no extra cost.',
          'features': [
            {
              'text': 'PS Plus required for online play',
              'icon': Assets.otherPSPlusMono,
            },
            {
              'text': 'Supports up to 22 online players with PS Plus',
              'icon': Assets.otherPSPlusOnline,
            },
            {
              'text': '1 Player',
              'icon': Assets.otherPerson,
            },
            {
              'text': 'In-game purchases optional',
              'icon': Assets.otherInGamePurchases,
            },
            {
              'text': 'Online play optional',
              'icon': Assets.otherOptionalOnlinePlay,
            },
            {
              'text': 'Game Help supported',
              'icon': Assets.otherPSPlus,
            },
            {
              'text': 'Vibration function and trigger effect required',
              'icon': Assets.otherMultiplayer,
            },
          ]
        }),
    Game(title: 'The Last of Us: Part II',
        img: Assets.gamesTheLastOfUs,
        isPs4: true,
        isPs5: true,
        color: Color.fromARGB(255, 80, 128, 131),
        details: {
          'imgs': [
            Assets.detailsHorizon1,
            Assets.detailsHorizon2,
            Assets.detailsHorizon3,
            Assets.detailsHorizon4,
            Assets.detailsHorizon5
          ],
          'description':
          'Digital Deluxe Edition includes:\n• Digital soundtrack.\n• Digital Dark Horse mini art book.\n• Six PSN avatars for PS4™.\n• PS4™ dynamic theme.\n\nAfter a deadly journey across post-pandemic USA, Ellie and Joel settle down in Wyoming.\n\nLiving in a thriving community gives them stability, despite the threat of the Infected and desperate survivors.\n\nWhen a violent event disrupts the peace, Ellie begins a relentless journey for justice. Hunting those responsible, she’s confronted by devastating physical and emotional repercussions of her actions.\n\n• Discover an emotional story challenging your notions of right and wrong.\n• Adventure in a beautiful, dangerous world from peaceful mountains to overgrown ruins.\n• Experience action-survival gameplay of tense melee combat, fluid movement and dynamic stealth.',
          'features': [
            {
              'text': 'PS Plus required for online play',
              'icon': Assets.otherPSPlusMono,
            },
            {
              'text': '1 Player',
              'icon': Assets.otherMultiplayer,
            },
            {
              'text': 'In-game purchases optional',
              'icon': Assets.otherInGamePurchases,
            },
          ],
        }),
    Game( title: 'Killing Floor 2',
        img: Assets.gamesKillingFloor,
        isPs4: false,
        isPs5: true,
        color: Color.fromARGB(255, 155, 125, 87),
        details: {
          'imgs': [
            Assets.detailsKf1,
            Assets.detailsKf2,
            Assets.detailsKf3,
            Assets.detailsKf4,
            Assets.detailsKf5
          ],
          'description':
          'In Killing Floor 2 players descend into continental Europe where the outbreak caused by Horzine Biotech’s failed experiment has quickly spread and gained unstoppable momentum, essentially paralyzing the European Union— Just one month after the conclusion of the events in the original Killing Floor, the specimen clones are everywhere and civilization is in disarray communications have failed, governments have collapsed, and military forces have been systematically eradicated. The people of Europe know survival and self-preservation too well and lucky survivors have gone into hiding. Not all have given up hope though... A group of civilians and mercenaries have banded together to combat the outbreak and established privately funded operation bases across Europe. Upon tracking specimen clone outbreaks, players will descend into zed-laden hot zones and exterminate them. PS4 Pro Enhanced.',
          'features': [

            {
              'text': 'PS Plus required for online play',
              'icon': Assets.otherPSPlusMono,
            },
            {
              'text': 'Supports up to 22 online players with PS Plus',
              'icon': Assets.otherPSPlusOnline,
            },
            {
              'text': '1 Player',
              'icon': Assets.otherPerson,
            },
            {
              'text': 'In-game purchases optional',
              'icon': Assets.otherInGamePurchases,
            },
            {
              'text': 'Online play optional',
              'icon': Assets.otherOptionalOnlinePlay,
            },
            {
              'text': 'Game Help supported',
              'icon': Assets.otherPSPlus,
            },
            {
              'text': 'PS4 Pro enhanced',
              'icon': Assets.otherMultiplayer,
            },
          ]
        }),
    Game(title: 'Tiny Tina\'s Wonderlands',
        img: Assets.gamesTinytina,
        isPs4: true,
        isPs5: false,
        color: Color.fromARGB(255, 185, 105, 222),
        details: {
          'imgs': [
            Assets.detailsTtw,
            Assets.detailsTtw1,
            Assets.detailsTtw3,
            Assets.detailsTtw4,
            Assets.detailsTtw5
          ],
          'description':
          'Embark on an epic adventure full of whimsy, wonder, and high-powered weaponry! Bullets, magic, and broadswords collide across this chaotic fantasy world brought to life by the unpredictable Tiny Tina. Roll your own multiclass hero and loot, shoot, slash, and cast your way through outlandish monsters and loot-filled dungeons on a quest to stop the tyrannical Dragon Lord. Everyone\'s welcome, so join the party, throw on your adventuring boots, and be Chaotic Great!\n\nAN UNPREDICTABLE FANTASY WORLD\nAN UNPREDICTABLE FANTASY WORLD\n\nGUNS, SPELLS, AND MORE\nBlast baddies with powerful guns and devastating spells in frenetic first-person battles. Use your firepower to vanquish legions of enemies, including smack-talking skeletons, land-roaming sharks, and colossal bosses. Then delve deeper into dangerous dungeons for a shot at epic loot!\n\nPARTY UP TO DEFEAT EVIL\nJoining you at the table are headstrong captain Valentine and rule-obsessed robot Frette. During your quest to defeat the Dragon Lord, you\'ll meet a cast of lovable misfits like a lute-wielding Bardbarian and your very own Fairy Punchfather.\n\nPERSONALIZE YOUR HERO\nCreate the perfect hero with deep customization, including a multiclass system that lets you mix and match six unique character skill trees, all with their own awesome abilities. Level up, refine your build, expand your arsenal, and become the ultimate adventurer.\n\nBAND TOGETHER IN CHAOTIC CO-OP\nEnjoy the story solo or start a party with up to three friends in seamless online multiplayer or local split-screen. Share the spoils or rush to get the shiniest loot—how you play is up to you!',
          'features': [
            {
              'text': 'PS Plus required for online play',
              'icon': Assets.otherPSPlusMono,
            },
            {
              'text': 'Supports up to 22 online players with PS Plus',
              'icon': Assets.otherPSPlusOnline,
            },
            {
              'text': '1 Player',
              'icon': Assets.otherPerson,
            },
            {
              'text': 'In-game purchases optional',
              'icon': Assets.otherInGamePurchases,
            },
            {
              'text': 'Online play optional',
              'icon': Assets.otherOptionalOnlinePlay,
            },
            {
              'text': 'Game Help supported',
              'icon': Assets.otherPSPlus,
            },
            {
              'text': 'PS4 Pro enhanced',
              'icon': Assets.otherMultiplayer,
            },
          ]
        }),
    Game( title: 'Sherlock Holmes: The Devil\'s Daughter',
      img: Assets.gamesSherlockHolmes,
      isPs4: true,
      isPs5: true,
      color: Color.fromARGB(255, 217, 119, 98),
      details: {
        'imgs': [
          Assets.detailsSl1,
          Assets.detailsSl2,
          Assets.detailsSl3,
          Assets.detailsSl4,
          Assets.detailsSl5
        ],
        'description':
        'Sherlock Holmes: The Devil’s Daughter is a fantastic adventure with unique gameplay that blends investigation, action and exploration for an extraordinary experience that will test the limits of your nerves and intelligence.\n\nTrack down evil in the darkest corners of London and the human soul while playing as the great detective, as you untangle a web of intrigue leading to the final stunning revelation.\n\nEach of your deductions and actions affects the rest of the story, for better or for worse…\n\nPlay as Sherlock Holmes and use his extraordinary abilities to progress through the adventure. Freely explore several of the city\'s neighbourhoods in search of clues and suspects. Interrogations, combat, chases, infiltration… discover a game that is unlike any other!',
        'features': [
          {
            'text': '1 Player',
            'icon': Assets.otherPerson,
          },
          {
            'text': 'DUALSHOCK 4 vibration',
            'icon': Assets.otherMultiplayer,
          },
        ]
      },),
    Game(title: 'Shadow of the Tomb Raider: Definitive Edition',
        img: Assets.gamesTombRaider,
        isPs4: true,
        isPs5: true,
        color: Color.fromARGB(212, 67, 211, 96),
        details: {
          'imgs': [
            Assets.detailsTr1,
            Assets.detailsTr2,
            Assets.detailsTr3,
            Assets.detailsTr4,
            Assets.detailsTr5
          ],
          'description':
          'In Shadow of the Tomb Raider Definitive Edition experience the final chapter of Lara’s origin as she is forged into the Tomb Raider she is destined to be. Combining the base game, all seven DLC challenge tombs, as well as all downloadable weapons, outfits, and skills, Shadow of the Tomb Raider Definitive Edition is the ultimate way to experience Lara\'s defining moment.',
          'features': [
            {
              'text': '1 Player',
              'icon': Assets.otherPerson,
            },
            {
              'text': 'DUALSHOCK 4 vibration',
              'icon': Assets.otherMultiplayer,
            },
          ]
        }),
  ];
}
