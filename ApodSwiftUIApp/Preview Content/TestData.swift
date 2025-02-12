//
//  TestData.swift
//  ApodSwiftUIApp
//
//  Created by Artem Chen on 2/12/25.
//

import Foundation

let testSingleApodData: Data = """
    {
      "copyright": "\nDave Boddington\n",
      "date": "2025-02-11",
      "explanation": "Will the spider ever catch the fly? Not if both are large emission nebulas toward the constellation of the Charioteer (Auriga).  The spider-shaped gas cloud in the image center is actually an emission nebula labelled IC 417, while the smaller fly-shaped cloud on the left is dubbed  NGC 1931 and is both an emission nebula and a reflection nebula.  About 10,000 light-years distant, both nebulas harbor young star clusters. For scale, the more compact NGC 1931 (Fly) is about 10 light-years across. The featured deep image, captured over 20 hours during late January in Berkshire UK, also shows more diffuse and red-glowing interstellar gas and dust.   Explore Your Universe: Random APOD Generator",
      "hdurl": "https://apod.nasa.gov/apod/image/2502/SpiderFly_Boddington_4788.jpg",
      "media_type": "image",
      "service_version": "v1",
      "title": "The Spider and the Fly",
      "url": "https://apod.nasa.gov/apod/image/2502/SpiderFly_Boddington_1080.jpg"
    }
""".data(using: .utf8)!

let testApodsData: Data = """
    [
      {
        "copyright": "Vojan Höfer",
        "date": "2025-02-01",
        "explanation": "Vivid and lustrous, wafting iridescent waves of color wash across this skyscape from northern Sweden. Known as nacreous clouds or mother-of-pearl clouds, they are rare. But their unforgettable appearance was captured in this snapshot on January 12 with the Sun just below the local horizon. A type of polar stratospheric cloud, they form when unusually cold temperatures in the usually cloudless lower stratosphere form ice crystals. Still sunlit at altitudes of around 15 to 25 kilometers, the clouds diffract the sunlight even when the Sun itself is hidden from direct view.",
        "hdurl": "https://apod.nasa.gov/apod/image/2502/IMG_0340-Internet-2.jpg",
        "media_type": "image",
        "service_version": "v1",
        "title": "Nacreous Clouds over Sweden",
        "url": "https://apod.nasa.gov/apod/image/2502/IMG_0340-Internet-2_1024.jpg"
      },
      {
        "date": "2025-02-02",
        "explanation": "What's happening to Comet G3 ATLAS? After passing near the Sun in mid-January, the head of the comet has become dimmer and dimmer. By late January, Comet C/2024 G3 (ATLAS) had become a headless wonder -- even though it continued to show impressive tails after sunset in the skies of Earth's Southern Hemisphere. Pictured are images of Comet G3 ATLAS on successive January nights taken from Río Hurtado, Chile. Clearly, the comet's head is brighter and more centrally condensed on the earlier days (left) than on later days (right).  A key reason is likely that the comet's nucleus of ice and rock, at the head's center, has fragmented. Comet G3 ATLAS passed well inside the orbit of planet Mercury when at its solar closest, a distance that where heat destroys many comets.  Some of comet G3 ATLAS' scattering remains will continue to orbit the Sun.   Gallery: Comet G3 ATLAS",
        "hdurl": "https://apod.nasa.gov/apod/image/2502/AtlasDisintegrating_Majzik_3600.jpg",
        "media_type": "image",
        "service_version": "v1",
        "title": "Comet G3 ATLAS Disintegrates",
        "url": "https://apod.nasa.gov/apod/image/2502/AtlasDisintegrating_Majzik_1080.jpg"
      },
      {
        "date": "2025-02-03",
        "explanation": "Some stars explode in slow motion.  Rare, massive Wolf-Rayet stars are so tumultuous and hot that they are slowly disintegrating right before our telescopes.  Glowing gas globs each typically over 30 times more massive than the Earth are being expelled by violent stellar winds.  Wolf-Rayet star WR 124, visible near the featured image center, is thus creating the surrounding nebula known as M1-67, which spans six light years across. Details of why this star has been slowly blowing itself apart over the past 20,000 years remains a topic of research.  WR 124 lies 15,000 light-years away towards the constellation of the Arrow (Sagitta).  The fate of any given Wolf-Rayet star likely depends on how massive it is, but many are thought to end their lives with spectacular explosions such as supernovas or gamma-ray bursts.   Explore Your Universe: Random APOD Generator",
        "hdurl": "https://apod.nasa.gov/apod/image/2502/wr124_hubbleschmidt_1289.jpg",
        "media_type": "image",
        "service_version": "v1",
        "title": "Wolf-Rayet Star 124: Stellar Wind Machine",
        "url": "https://apod.nasa.gov/apod/image/2502/wr124_hubbleschmidt_960.jpg"
      },
      {
        "copyright": "\nJulene Eiguren\n",
        "date": "2025-02-04",
        "explanation": "Yes, but can your rainbow do this? Late in the day, the Sun set as usual toward the west. However, on this day, the more interesting display was 180 degrees around -- toward the east. There, not only was a rainbow visible, but an impressive display of anticrepuscular rays from the rainbow's center. In the featured image from Lekeitio in northern Spain, the Sun is behind the camera. The rainbow resulted from sunlight reflecting back from falling rain. Anticrepuscular rays result from sunlight, blocked by some clouds, going all the way around the sky, overhead, and appearing to converge on the opposite horizon -- an optical illusion.  Rainbows by themselves can be exciting to see, and anticrepuscular rays a rare treat, but capturing them both together is even more unusual -- and can look both serene and surreal.   Jigsaw Challenge: Astronomy Puzzle of the Day",
        "hdurl": "https://apod.nasa.gov/apod/image/2502/RainbowFan_Eiguren_3228.jpg",
        "media_type": "image",
        "service_version": "v1",
        "title": "Anticrepuscular Rays: A Rainbow Fan over Spain",
        "url": "https://apod.nasa.gov/apod/image/2502/RainbowFan_Eiguren_1080.jpg"
      },
      {
        "copyright": "\nGabriel Muñoz\n",
        "date": "2025-02-05",
        "explanation": "Where is Comet ATLAS going? In the featured time-lapse video, the comet is not itself moving very much, but the Earth's rotation makes it appear to be setting over a hill. The Comet C/2024 G3 (ATLAS) sequence was captured with an ordinary camera on January 22 from the Araucanía Region in central Chile. Comet ATLAS has been an impressive site in the evening skies of Earth's Southern Hemisphere over the past few weeks, so bright and awe-inspiring that it may eventually become known as the Great Comet of 2025. Unfortunately, Comet G3 ATLAS is not going anywhere anymore because its central nucleus broke up during its close pass to the Sun last month. Some of the comet's scattered remains of rocks and ice will continue to orbit the Sun, some in nearly the same outward section of the orbit that the comet's nucleus would have taken.",
        "media_type": "video",
        "service_version": "v1",
        "title": "Comet G3 ATLAS Setting over a Chilean Hill\n",
        "url": "https://www.youtube.com/embed/nt5j0NiVesQ"
      },
      {
        "copyright": "Lorand Fenyes",
        "date": "2025-02-06",
        "explanation": "Grand spiral galaxies often seem to get all the glory, flaunting their young, bright, blue star clusters in beautiful, symmetric spiral arms. But small, irregular galaxies form stars too. In fact dwarf galaxy IC 2574 shows clear evidence of intense star forming activity in its telltale reddish regions of glowing hydrogen gas. Just as in spiral galaxies, the turbulent star-forming regions in IC 2574 are churned by stellar winds and supernova explosions spewing material into the galaxy's interstellar medium and triggering further star formation. A mere 12 million light-years distant, IC 2574 is part of the M81 group of galaxies, seen toward the northern constellation Ursa Major. Also known as Coddington's Nebula, the lovely island universe is about 50,000 light-years across, discovered by American astronomer Edwin Coddington in 1898.",
        "hdurl": "https://apod.nasa.gov/apod/image/2502/289_lorand_fenyes_coddington_ic2574_nagy.jpg",
        "media_type": "image",
        "service_version": "v1",
        "title": "IC 2574: Coddington's Nebula",
        "url": "https://apod.nasa.gov/apod/image/2502/289_lorand_fenyes_coddington_ic2574_nagy1024.jpg"
      },
      {
        "date": "2025-02-07",
        "explanation": "The giant galaxy cataloged as LEDA 1313424 is about two and a half times the size of our own Milky Way. Its remarkable appearance in this recently released Hubble Space Telescope image strongly suggests its nickname \"The Bullseye Galaxy\". Known as a collisional ring galaxy it has nine rings confirmed by telescopic observations, rippling from its center like waves from a pebble dropped into a pond. Of course, the pebble dropped into the Bullseye galaxy was a galaxy itself. Telescopic observations identify the blue dwarf galaxy at center-left as the likely collider, passing through the giant galaxy's center and forming concentric rings in the wake of their gravitational interaction. The Bullseye Galaxy lies some 567 million light-years away toward the constellation Pisces. At that distance, this stunning Hubble image would span about 530,000 light-years.",
        "hdurl": "https://apod.nasa.gov/apod/image/2502/Hubble_LEDA1313424_STScI-01.jpg",
        "media_type": "image",
        "service_version": "v1",
        "title": "LEDA 1313424: The Bullseye Galaxy",
        "url": "https://apod.nasa.gov/apod/image/2502/Hubble_LEDA1313424_STScI-01_1024.jpg"
      },
      {
        "copyright": "Aldo S. Kleiman",
        "date": "2025-02-08",
        "explanation": "A waxing crescent Moon and a waning crescent Venus are found at opposite corners of this twilight telephoto field of view. The close conjunction of the two brightest celestial beacons in planet Earth's western evening sky was captured on February 1 from Rosario, Argentina. On that date, the slender crescent Moon was about 3 days old. But the Moon's visible sunlit crescent will grow to a bright Full Moon by February 14. Like the Moon, Venus cycles through phases as it orbits the Sun. And while its visible sunlit crescent narrows, the inner planet's apparent size increases as it gets closer to Earth. In a Valentine from the Solar System, Venus, named for the Roman goddess of Love, will also reach its peak brightness in planet Earth's evening skies around February 14.",
        "hdurl": "https://apod.nasa.gov/apod/image/2502/IMG_3775M.jpg",
        "media_type": "image",
        "service_version": "v1",
        "title": "A Conjunction of Crescents",
        "url": "https://apod.nasa.gov/apod/image/2502/IMG_3775M_1024.jpg"
      },
      {
        "copyright": "\nMichael Goh\n",
        "date": "2025-02-09",
        "explanation": "What strange world is this? Earth. In the foreground of the featured image are the Pinnacles, unusual rock spires in Nambung National Park in Western Australia. Made of ancient sea shells (limestone), how these human-sized picturesque spires formed remains unknown.  In the background, just past the end of the central Pinnacle, is a bright crescent Moon. The eerie glow around the Moon is mostly zodiacal light, sunlight reflected by dust grains orbiting between the planets in the Solar System. Arching across the top is the central band of our Milky Way Galaxy. Many famous stars and nebulas are also visible in the background night sky. The featured 29-panel panorama was taken and composed in 2015 September after detailed planning that involved the Moon, the rock spires, and their corresponding shadows. Even so, the strong zodiacal light was a pleasant surprise.   Your Sky Surprise: What picture did APOD feature on your birthday? (post 1995)",
        "hdurl": "https://apod.nasa.gov/apod/image/2502/PinnaclesGalaxy_Goh_2400.jpg",
        "media_type": "image",
        "service_version": "v1",
        "title": "Milky Way over the Australian Pinnacles",
        "url": "https://apod.nasa.gov/apod/image/2502/PinnaclesGalaxy_Goh_1080.jpg"
      },
      {
        "copyright": "\nMickael Coulon\n",
        "date": "2025-02-10",
        "explanation": "Is this the largest hummingbird ever?  Although it may look like a popular fluttering nectarivore, what is pictured is actually a beautifully detailed and colorful aurora, complete with rays reminiscent of feathers. This aurora was so bright that it was visible to the unaided eye during blue hour -- just after sunset when the sky appears a darkening blue.  However, the aurora only looked like a hummingbird through a sensitive camera able to pick up faint glows. As reds typically occurring higher in the Earth's atmosphere than the greens, the real 3D shape of this aurora would likely appear unfamiliar.  Auroras are created when an explosion on the Sun causes high energy particles to flow into the Earth's atmosphere and excite atoms and molecules of nitrogen and oxygen.  The featured image was captured about two weeks ago above Lyngseidt, Norway.",
        "hdurl": "https://apod.nasa.gov/apod/image/2502/BirdAurora_Coulon_2581.jpg",
        "media_type": "image",
        "service_version": "v1",
        "title": "Auroral Hummingbird over Norway",
        "url": "https://apod.nasa.gov/apod/image/2502/BirdAurora_Coulon_960.jpg"
      },
      {
        "copyright": "\nDave Boddington\n",
        "date": "2025-02-11",
        "explanation": "Will the spider ever catch the fly? Not if both are large emission nebulas toward the constellation of the Charioteer (Auriga).  The spider-shaped gas cloud in the image center is actually an emission nebula labelled IC 417, while the smaller fly-shaped cloud on the left is dubbed  NGC 1931 and is both an emission nebula and a reflection nebula.  About 10,000 light-years distant, both nebulas harbor young star clusters. For scale, the more compact NGC 1931 (Fly) is about 10 light-years across. The featured deep image, captured over 20 hours during late January in Berkshire UK, also shows more diffuse and red-glowing interstellar gas and dust.   Explore Your Universe: Random APOD Generator",
        "hdurl": "https://apod.nasa.gov/apod/image/2502/SpiderFly_Boddington_4788.jpg",
        "media_type": "image",
        "service_version": "v1",
        "title": "The Spider and the Fly",
        "url": "https://apod.nasa.gov/apod/image/2502/SpiderFly_Boddington_1080.jpg"
      }
    ]
""".data(using: .utf8)!
