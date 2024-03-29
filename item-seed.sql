DROP FUNCTION IF EXISTS item_seed;
CREATE FUNCTION item_seed()
RETURNS VOID AS $$
  plv8.subtransaction(function(){

    const itemData = [
      {
        generalName: 'REINFORCED STEEL BAR',
        unit: 'piece',
        description: ['TYPE', 'DIAMETER', 'LENGTH', 'GRADE MARK', 'MATERIAL TYPE'],
        descriptionField: [
          ['CUT & BEND', 'NONE'],
          ['10 mm', '12 mm', '16 mm', '20 mm', '25 mm', '40 mm'],
          ['6 m', '6.5 m', '7 m', '7.5 m', '9 m', '12 m'],
          ['60', '40', '75'],
          ['WELDABLE', 'NON-WELDABLE'],
        ],
      },
      {
        generalName: 'ELECTRICAL WIRE',
        unit: 'meter',
        description: [
          'WIRE TYPE',
          'INSULATION TYPE',
          'WIRE DIAMETER',
          'CORES',
          'COLOR',
          'BRAND',
        ],
        descriptionField: [
          ['STRANDED', 'SOLID'],
          ['THHN', 'THHN/THWN-2', 'THWN', 'THW', 'TW', 'TF', 'TFN', 'TFFN', 'PDX'],
          ['0.75 mm²', '300 mm²'],
          ['1C', '2C', '3C', '4C', '5C', '10C'],
          ['BLUE', 'RED', 'YELLOW', 'GREEN', 'WHITE', 'BLACK', 'BARE'],
          ['ROYAL CORD', 'PHELPS DODGE'],
        ],
      },
      {
        generalName: 'BOLT',
        unit: 'piece',
        description: [
          'MATERIAL TYPE',
          'TYPE',
          'HEAD',
          'COMPONENT',
          'NOMINAL SIZE',
          'LENGTH',
          'IS RENTAL',
        ],
        descriptionField: [
          ['STAINLESS STEEL', 'ALUMINUM'],
          ['FULL THREAD', 'SPACER LOCKED STAINLESS', 'QUICK', 'UNIFIX'],
          [
            'HEX',
            'COUNTERSUNK',
            'DOME',
            'BUTTON',
            'HEX WASHER',
            'PAN',
            'SOCKET',
            'SLOTTED HEX WASHER',
          ],
          ['NUT', 'NUT WITH WASHER', 'NONE'],
          ['M16 mm', 'M10 mm', 'M12 mm', 'M24 mm', 'M19 mm'],
          [
            '50 mm',
            '30 mm',
            '100 mm',
            '25 mm',
            '63.5 mm',
            '19 mm',
            '13 mm',
            '38 mm',
          ],
          ['YES', 'NO'],
        ],
      },
      {
        generalName: 'CEMENT',
        unit: 'kilogram',
        description: ['TYPE', 'BRAND'],
        descriptionField: [
          ['TYPE I', 'TYPE II', 'TYPE IT', 'TYPE IP'],
          ['CEMEX', 'EAGLE', 'HOLCIM', 'PORTLAND', 'REPUBLIC'],
        ],
      },
      {
        generalName: 'FIXED CLAMP',
        unit: 'piece',
        description: ['SIZE'],
        descriptionField: [['1 1/2 inch', '2 inch']],
      },
      {
        generalName: 'RIVET',
        unit: 'piece',
        description: ['TYPE', 'DIAMETER', 'GRIP'],
        descriptionField: [
          ['BLIND', 'DRIVE', 'FLANGE HEAD'],
          ['3/16 inch', '5/32 inch', '1/8 inch'],
          ['5/8 inch', '3/8 inch', '1/2 inch', '3/4 inch'],
        ],
      },
      {
        generalName: 'WELDING ROD',
        unit: 'piece',
        description: ['TYPE', 'LENGTH'],
        descriptionField: [['6011', '7018'], ['1/8(3.2 mm)']],
      },
      {
        generalName: 'ENGINE OIL',
        unit: 'liter',
        description: ['PRODUCT NAME', 'BRAND'],
        descriptionField: [
          [
            'RIMULA R1 30',
            'RIMULA R1 40',
            'RIMULA R3 10W',
            'RIMULA R3 ND 15W-40',
            'RIMULA R3+ 30',
            'RIMULA R3+ 40',
          ],
          ['SHELL'],
        ],
      },
      {
        generalName: 'TRANSMISSION AND GEAR OIL',
        unit: 'liter',
        description: ['PRODUCT NAME', 'BRAND'],
        descriptionField: [
          [
            'SPIRAX S2 A 140',
            'SPIRAX S2 A 80W-90',
            'SPIRAX S2 A 85W-140',
            'SPIRAX S2 A 90',
            'SPIRAX S2 G 140',
            'SPIRAX S2 G 80W-90',
            'SPIRAX S2 G 90',
            'SPIRAX S3 AX 80W-90',
            'SPIRAX S3 G 80W-90',
            'SPIRAX S6 AXME 75W-90',
            'SPIRAX S6 AXME 80W-140',
          ],
          ['SHELL'],
        ],
      },
      {
        generalName: 'GREASE',
        unit: 'liter',
        description: ['PRODUCT NAME', 'BRAND'],
        descriptionField: [['SHELL GADUS S2 V220 0'], ['SHELL']],
      },
      {
        generalName: 'HYDRAULIC OIL AND FLUID',
        unit: 'liter',
        description: ['PRODUCT NAME', 'BRAND'],
        descriptionField: [
          ['SHELL TELLUS S2 MX 68 ', 'MOBIL NUTO H 68'],
          ['SHELL', 'MOBIL'],
        ],
      },
      {
        generalName: 'DEGREASER',
        unit: 'liter',
        description: ['PRODUCT NAME', 'BRAND'],
        descriptionField: [['GREASOLVE'], ['PETRON']],
      },
      {
        generalName: 'FUEL',
        unit: 'liter',
        description: ['PRODUCT'],
        descriptionField: [['DIESEL', 'GASOLINE']],
      },
      {
        generalName: 'DIESEL EXHAUST FLUID',
        unit: 'liter',
        description: ['PRODUCT', 'BRAND'],
        descriptionField: [['ADBLUE'], ['PRO-99', 'PURE BLULE']],
      },
      {
        generalName: 'COOLANT AND ANTI-FREEZE',
        unit: 'liter',
        description: ['PRODUCT', 'BRAND'],
        descriptionField: [
          [
            'HAVOLINE XTENDED LIFE ANTIFREEZE / COOLANT CONCENTRATE',
            'RADIATOR COOLANT',
            'DELO XLI CI PREMIXED',
            'COOLANT READY MIX RAF 12+',
          ],
          ['CALTEX', 'DERFOE', 'SEGA', 'LIQUI MOLY'],
        ],
      },
      {
        generalName: 'READY MIX CONCRETE',
        unit: 'cubic meter',
        description: [
          'COMPRESSIVE STRENGTH',
          'DESIGN',
          'GRAVEL SIZE',
          'CURING PERIOD',
        ],
        descriptionField: [
          [
            '1500 PSI',
            '2000 PSI',
            '2500 PSI',
            '3000 PSI',
            '3500 PSI',
            '4000 PSI',
            '4500 PSI',
            '5000 PSI',
            '6000 PSI',
          ],
          ['ORDINARY DESIGN (ORD)', 'PUMP CRETE DESIGN (PCD)'],
          ['3/8', '3/4', '1'],
          ['7 days', '14 days', '21 days', '28 days'],
        ],
      },
      {
        generalName: 'SCREW',
        unit: 'piece',
        description: ['LENGTH', 'SCREW DIAMETER'],
        descriptionField: [
          ['1 1/2 inch', '1 inch', '2 inch', '3/4 inch'],
          ['3 mm'],
        ],
      },
      {
        generalName: 'GI PIPE',
        unit: 'piece',
        description: ['DIAMETER', 'LENGTH', 'WALL THICKNESS', 'IS USED'],
        descriptionField: [
          ['1 1/2 inch'],
          ['1 m - 1.5 m', '1.51 m - 2.5 m', '6 m'],
          ['SCH.40', 'SCH.20'],
          ['YES', 'NULL'],
        ],
      },
      {
        generalName: 'COVID19 RAPID ANTIGEN TEST KIT',
        unit: 'piece',
        description: ['BRAND', 'MANUFACTURER'],
        descriptionField: [
          ['INNOVITA', 'PANBIO'],
          ['INNOVITA', 'ABBOTT'],
        ],
      },
      {
        generalName: 'KNITTED GLOVE',
        unit: 'pair',
        description: ['PALM COATING', 'TYPE', 'SIZE'],
        descriptionField: [
          ['RUBBERIZED', 'LATEX'],
          ['DOTTED', 'DIPPED'],
          ['SMALL', 'MEDIUM', 'LARGE', 'EXTRA LARGE'],
        ],
      },
      {
        generalName: 'GOGGLES',
        unit: 'pair',
        description: ['SIMILAR NAME', 'COLOR'],
        descriptionField: [
          ['SAFETY GLASSES', 'FLASH GOGGLE', 'WELDING GOGGLES'],
          ['CLEAR', 'DARK'],
        ],
      },
      {
        generalName: 'HARD HAT',
        unit: 'piece',
        description: ['KIND', 'STYLE', 'ADD-ONS', 'BRIM', 'COLOR'],
        descriptionField: [
          ['HARD HAT', 'USED HARD HAT', 'FIREFIGHTER HARD HAT'],
          ['V-GARD', 'TOPGARD', 'COMFO-CAP', 'NONE'],
          [
            'WITH LINER',
            'WITH CHIN STRAP',
            'WITH LAMP BRACKET',
            'WITH VISOR AND BRACKET',
          ],
          ['FULL BRIM', 'HALF BRIM', 'NO BRIM'],
          ['WHITE', 'GREEN', 'RED', 'ORANGE', 'YELLOW', 'BLUE'],
        ],
      },
      {
        generalName: 'T SHIRT',
        unit: 'piece',
        description: ['TYPE', 'SIZE', 'COLOR'],
        descriptionField: [
          ['LONG SLEEVE'],
          ['SMALL', 'MEDIUM', 'LARGE'],
          ['MINT GREEN'],
        ],
      },
      {
        generalName: 'REFLECTORIZED VEST',
        unit: 'piece',
        description: ['COLOR', 'ADD-ONS'],
        descriptionField: [
          ['WHITE', 'GREEN', 'RED', 'ORANGE', 'YELLOW', 'BLUE', 'SILVER', 'BLACK'],
          ['WITH SCIC LOGO', 'WITH SMCC LOGO'],
        ],
      },
      {
        generalName: 'DISC',
        unit: 'piece',
        description: ['KIND', 'BRAND', 'BLADE', 'BLADE SIZE', 'GRIT NO'],
        descriptionField: [
          ['CUTTING DISC', 'GRINDING DISC', 'SANDING DISC', 'BUFFING DISC'],
          ['ORDINARY', 'BOSUN', 'TYROLIT', 'NONE'],
          ['DIAMOND', 'STAINLESS', 'NONE'],
          ['4 inch', '5 inch', '7 inch', '14 inch'],
          [
            'NOT APPLICABLE',
            '24',
            '36',
            '40',
            '50',
            '60',
            '70',
            '80',
            '100',
            '120',
            '220',
            '240',
          ],
        ],
      },
      {
        generalName: 'EAR PLUG',
        unit: 'pack',
        description: ['MODEL', 'MANUFACTURER'],
        descriptionField: [['MAX1'], ['HOWARD LIGHT']],
      },
      {
        generalName: 'TAPE',
        unit: 'piece',
        description: [
          'KIND',
          'SIMILAR NAME',
          'TYPE',
          'BRAND',
          'MODEL',
          'COLOR',
          'DIMENSION',
          'SIZE',
        ],
        descriptionField: [
          [
            'ELECTRICAL TAPE',
            'DUCT TAPE',
            'POLYETHYLENE TAPE',
            'RUBBER MASTIC TAPE',
            'COTTON TAPE',
            'RESTRICTING TAPE',
            'PETRO TAPE',
            'TEFLON TAPE',
            'MASKING TAPE',
            'GYPSUM TAPE',
            'PVC TAPE',
            'SELF-ADHESIVE TAPE',
            'DOUBLE SIDED TAPE',
            'PLASTIC LABEL TAPE',
            'FISH TAPE',
            'SURGICAL TAPE',
            'CONSPICUITY TAPE',
            'HAZARD TAPE',
            'CAUTION TAPE',
            'DANGER TAPE',
            'COPPER TAPE',
          ],
          [
            'DENSO TAPE',
            'SEALING TAPE',
            'PAPER TAPE',
            'MESH TAPE',
            'DRAWING TAPE',
            'MICROPORE TAPE',
          ],
          ['SEMI-CONDUCTING', 'FIRM', 'SIKAPROOF'],
          ['SHAIC', '3M', 'SIKA'],
          ['2228', 'P-4', 'PT-310', 'PF-320', 'TAPE-120', 'NONE'],
          ['RED', 'YELLOW', 'BLUE', 'GREEN', 'WHITE', 'CLEAR', 'NOT APPLICABLE'],
          [
            '1/2 inch',
            '1I inch',
            '1 1/2 inch',
            '3/4 inch',
            '2 inch',
            '3 inch',
            '4 inch',
            '6 inch',
            '7/8 inch X 15 foot',
            '12 inch',
            '1 m X 50 m',
            '1.1 mm X 50 mm X 10 m',
            '0.2 mm X 50 mm X 30 m ',
          ],
          ['SMALL', 'MEDIUM', 'BIG'],
        ],
      },
      {
        generalName: 'ROPE',
        unit: 'meters',
        description: ['TYPE', 'DIAMETER', 'STRAND', 'LENGTH'],
        descriptionField: [
          ['NYLON', 'WIRE'],
          ['10 mm', '8 mm'],
          ['3 strand', '6 strand'],
          ['500 m/reel'],
        ],
      },
      {
        generalName: 'PLASTIC CONE',
        unit: 'piece',
        description: ['KIND', 'SIMILAR NAME', 'SIZE'],
        descriptionField: [
          ['PLASTIC CONE', 'PUR - PLASTIC CONE', 'USED'],
          ['PYLON', 'ROAD CONE', 'SAFETY CONE', 'CONSTRUCTION CONE'],
          ['12 mm', '15 mm', '16 mm', '20 mm', '21 mm', '23 mm X 27 mm', '50 mm'],
        ],
      },
      {
        generalName: 'GASKET',
        unit: 'piece',
        description: ['TYPE', 'DIAMETER NOMINAL', 'THICKNESS'],
        descriptionField: [['RUBBER GASKET'], ['50 mm'], ['10 mm']],
      },
      {
        generalName: 'DUST MASK',
        unit: 'piece',
        description: ['KIND'],
        descriptionField: [['WITH FILTER', 'WITHOUT FILTER']],
      },
      {
        generalName: 'CROSS BRACE',
        unit: 'piece',
        description: ['LENGTH'],
        descriptionField: [['1.70 m', '2.20 m']],
      },
      {
        generalName: 'PAPER CLIP',
        unit: 'piece',
        description: ['KIND', 'SIZE'],
        descriptionField: [
          ['BINDER CLIP', 'BULLDOG CLIP', 'USED BINDER CLIP', 'USED BULLDOG CLIP'],
          [
            '3/4 inch',
            '1 inch',
            '1 1/2 inch',
            '1 1/4 inch',
            '1 5/8 inch',
            '2 inch',
            '3 inch',
            '4 inch',
            '5 inch',
          ],
        ],
      },
      {
        generalName: 'PIPE CLAMP',
        unit: 'piece',
        description: ['KIND', 'DIAMETER', 'BRAND'],
        descriptionField: [
          [
            'SWIVEL CLAMP',
            'SWIVEL COMBINATION CLAMP',
            'PUR - SWIVEL BEAM CLAMP',
            'REN - SWIVEL BEAM CLAMP',
            'FIXED CLAMP',
            'SUPERSLIM',
            'PUR - SUPERSLIM CLAMP',
          ],
          ['3/4', '1', '1 1/2', '1 1/4', '1 5/8', '2', '3', '4', '5'],
          ['KOREA', 'JAPAN', 'NONE'],
        ],
      },
      {
        generalName: 'CLAMP ASSEMBLY',
        unit: 'piece',
        description: ['KIND', 'PART NUMBER'],
        descriptionField: [
          ['A-CLAMP ASSEMBLY', 'PUR - A-CLAMP ASSEMBLY', 'CLAMP LIGHT ASSEMBLY'],
          ['B265', '100359', 'NONE'],
        ],
      },
      {
        generalName: 'STEEL BALL',
        unit: 'piece',
        description: ['SIZE'],
        descriptionField: [['1/8 inch']],
      },
      {
        generalName: 'FLAT TIE',
        unit: 'piece',
        description: ['LENGTH', 'THICKNESS'],
        descriptionField: [
          ['900 mm', '300 mm'],
          ['3 mm', '4 mm', '2 mm'],
        ],
      },
      {
        generalName: 'ENVELOPE',
        unit: 'pack',
        description: ['TYPE', 'COLOR', 'ENVELOPE NUMBER', 'DIMENSION'],
        descriptionField: [
          ['PLASTIC', 'AIRMAIL', 'EXPANDED', 'FILE CASE', 'COIN'],
          ['BROWN', 'WHITE', 'CLEAR'],
          ['NONE', '4 1/2', '7 1/2', '8 1/2'],
          [
            'SHORT (3 1/2 X 6)',
            'LONG (3 5/8 X 6 1/2)',
            '3 X 4 1/2',
            '4 X 6 3/8',
            '4 X 7 1/2',
          ],
        ],
      },
      {
        generalName: 'CONCRETE HOLLOW BLOCK',
        unit: 'piece',
        description: [
          'KIND',
          'BLOCK TYPE',
          'WIDTH',
          'LENGTH',
          'HEIGHT',
          'COMPRESSIVE STRENGTH',
          'CURING PERIOD',
        ],
        descriptionField: [
          ['LOAD BEARING', 'NON LOAD BEARING'],
          [
            'BEAM',
            'CORE STRETCHER',
            'DOUBLE END',
            'HALF',
            'L-CORNER',
            'LOUVER',
            'SINGLE END ',
            'STRETCHER',
            'STRETCHER SEALED END',
          ],
          ['4 in / 90 mm', '6 in / 140 mm', '8 in / 190 mm'],
          ['190 mm', '200 mm'],
          ['390 mm', '400 mm'],
          [
            '150 psi',
            '300 psi',
            '350 psi',
            '400 psi',
            '450 psi',
            '550 psi',
            '650 psi',
            '700 psi',
            '750 psi',
            '800 psi',
            '1000 psi',
            '1100 psi',
            '1450 psi',
            '1500 psi',
          ],
          ['7 days', '14 days', '21 days', '28 days'],
        ],
      },
      {
        generalName: 'TEKSCREW',
        unit: 'piece',
        description: ['TYPE', 'SCREW HEAD TYPE', 'SCREW DIAMETER', 'LENGTH'],
        descriptionField: [
          ['STAINLESS STEEL', 'STEEL', 'WOOD', 'METAL'],
          ['FLAT', 'HEX', 'OVAL', 'PAN', 'PANCAKE', 'WAFER'],
          ['8', '12', '14'],
          ['16', '20', '25', '35', '45', '50', '55', '65', '75'],
        ],
      },
      {
        generalName: 'WEDGE PINS',
        unit: 'piece',
        description: ['LENGTH'],
        descriptionField: [['70 mm']],
      },
      {
        generalName: 'CONCRETE CURING COMPOUND',
        unit: 'liter',
        description: ['TYPE'],
        descriptionField: [
          [
            'HYPERCURE',
            'WAX BASE CONCURE',
            'SPARKCURE RB RESIN BASE CONCRETE',
            'PROKUBE RB',
            'RESIN CURE',
          ],
        ],
      },
      {
        generalName: 'VIBRO SAND',
        unit: 'cubic meter',
        description: ['GRAIN SIZE'],
        descriptionField: [['2 mm', '4 mm']],
      },
      {
        generalName: 'CONCRETE MIX',
        unit: 'cubic meter',
        description: ['DESCRIPTION'],
        descriptionField: [['MIX SAND AND GRAVEL']],
      },
      {
        generalName: 'FORM',
        unit: 'pad',
        description: ['FORM TYPE'],
        descriptionField: [
          [
            'SCAFFOLDING CHECKLIST',
            'ACCOUNT PAYABLE VOUCHER',
            'APPLICATION FOR LEAVE',
            'AUTHORITY TO DEDUCT',
            'CHECK VOUCHER NEW SCIC',
            'CHECK VOUCHER NECO',
            'CHECK VOUCHER XWELL',
            'CUSTODY RECEIPT',
            'DAILY ACCOMPLISHMENT REPORT',
            'DAILY AGGREGATES HAULING / DELIVERY REPORT',
            'DELIVERY RECEIPT',
            'DISCREPANCY REPORT',
            'EUR',
            'FOWA',
            'GATE PASS',
            'JOURNAL VOUCHER',
            'LIQUIDATION/REIMBURSEMENT',
            'MAJOR MATERIALS INVENTORY REPORT',
            'MATERIAL ISSUANCE SLIP',
            'PROVISIONAL RECEIPT',
            'PURCHASE ORDER',
            'REQUEST FOR INSPECTION',
            'REQUEST FOR PAYMENT',
            'REQUEST FOR QA/QC RECEIVING INSPECTION',
            'RIR',
            'TRANSFER ORDER',
            'TRANSFER SLIP',
            'WORKING ADVANCE VOUCHER',
            'EQUIPMENT INSPECTION CHECKLIST',
            'DAILY TIMESHEET',
          ],
        ],
      },
      {
        generalName: 'TIME CARD',
        unit: 'pack',
        description: ['MODEL', 'PACKAGING SIZE'],
        descriptionField: [['9000+'], ['100 PCS PER PACK']],
      },
      {
        generalName: 'ALUMINUM CONDUCTOR STEEL REINFORCED',
        unit: 'piece',
        description: ['CATEGORY', 'WIRE GAUGE'],
        descriptionField: [
          ['AWG', 'MCM'],
          ['1/0', '4/0', '2/0', '250', '336.4'],
        ],
      },
      {
        generalName: 'STEEL ROPE',
        unit: 'meter',
        description: [
          'TYPES',
          'ADDITIONAL DESCRIPTION',
          'ROPE DIAMETER',
          'STRANDS',
        ],
        descriptionField: [
          ['STAINLESSS STEEL', 'GALVANIZED STEEL', 'WIRE', 'UNGALVANIZED'],
          ['ANTI-TWISTING BRAIDED'],
          ['20 mm'],
          ['12'],
        ],
      },
      {
        generalName: 'COUPLER',
        unit: 'piece',
        description: ['TYPE', 'SUB CATEGORY', 'DIAMETER'],
        descriptionField: [
          ['MECHANICAL', 'OPTICAL', 'ELECTRICAL'],
          [
            'RIGID',
            'FLEXIBLE',
            'SLEEVE',
            'FIBER OPTIC',
            'WIRE NUT',
            'TERMINAL BLOCKS',
            'CONNECTOR',
          ],
          ['40 mm'],
        ],
      },
      {
        generalName: 'CONCRETE HARDENER',
        unit: 'liter',
        description: ['BRAND', 'MODEL', 'VOLUME'],
        descriptionField: [
          ['SIKA', 'DRIBOND', 'ABC'],
          ['CUREHARD-24'],
          ['CUREHARD-24'],
        ],
      },
      {
        generalName: 'IRON SHEET',
        unit: 'piece',
        description: [
          'FINISH',
          'SURFACE',
          'ROOFING PROFILE',
          'THICKNESS',
          'LENGTH',
          'WIDTH',
          'PAINT',
        ],
        descriptionField: [
          ['CORRUGATED IRON', 'GALVANIZED', 'COLD-ROLLED', 'HOT ROLLED'],
          [
            'MATT',
            'HIGH GLOSS',
            'DOUBLE COATED',
            'WOOD PATTERN',
            'MARBLE PATTERN',
            'WINKLE',
          ],
          ['RIB TYPE', 'TRAPEZOID', 'R-SPAN', 'TWIN RIB'],
          ['0.4 mm'],
          ['8 ft'],
          ['4 ft'],
          ['RED', 'GREEN', 'BLUE', 'NOT AVAILABLE'],
        ],
      },
      {
        generalName: 'PAINT BRUSH',
        unit: 'piece',
        description: ['BRUSH TYPE', 'SIZE'],
        descriptionField: [
          [
            'MEDIUM-SIZED',
            'LARGE-SIZED',
            'SMALL BRISTLE',
            'SYNTHETIC BRISTLE',
            'FLAT SASH',
            'ROUND SASH',
            'ANGLED SASH',
            'FLAGGED BRISTLE',
            'STENCIL',
            'FINISHING',
            'FOAMING',
            'COTTON',
          ],
          [
            '1/2 inch',
            '3/4 inch',
            '1 inch',
            '1 1/2 inch',
            '1 3/4 inch',
            '2 inch',
            '2 1/2 inch',
            '2 3/4 inch',
            '3 inch',
            '3 1/2 inch',
            '3 3/4',
            '4 inch',
            '4 1/2 inch',
            '4 3/4 inch',
            '5 inch',
            '5 1/2 inch',
            '5 3/4 inch',
            '6 inch',
            '6 1/2 inch',
            '6 3/4 inch',
            '7 inch',
            '7 1/2 inch',
            '7 3/4 inch',
            '8 inch',
            '8 1/2 inch',
            '8 3/4 inch',
            '9 inch',
            '9 1/2 inch',
            '9 3/4 inch',
            '14 inch',
            '18 inch',
          ],
        ],
      },
      {
        generalName: 'PAINT',
        unit: 'liter',
        description: ['TYPE', 'FINISH', 'BRAND', 'MODEL', 'COLOR'],
        descriptionField: [
          [
            'SPRAY',
            'ACRYLIC',
            'URETHANE',
            'QUICK DRYING ENAMEL (QDE)',
            'REFLECTORIZED',
            'EPOXY',
            'WATERPROOF',
            'LATEX',
            'POLYURETHANE',
            'ROOF GUARD',
            'EPOXY PRIMER',
            'INTERMEDIATE',
            'THINNER',
            'EPOXY ENAMEL',
            'ALUMINUM',
            'BITUMEN',
            'TRAFFIC',
          ],
          ['CHLORINATED RUBBER-BASED REFLECTORIZED', 'SEMI-GLOSS'],
          [
            'BOYSEN',
            'DAVIES',
            'JOTUN',
            'ELASTOMERIC',
            'PERMATEX',
            'INTERGARD',
            'AHEMPELA',
            'KERAMIFLOOR',
          ],
          [
            'TANKGUARD',
            '701',
            'INTERTHANE 990',
            'SIGMACOVER-620',
            '251',
            '269',
            '850',
            'SILVUM-51570',
            'KF-90',
            'KF-61',
          ],
          [
            'REDBROWN',
            'WHITE',
            'MINT GREEN',
            'MARKER BLUE',
            'GREY',
            'BLACK',
            'BLUE',
            'IVORY RAL (1014)',
            'FLAT WHITE',
            'EAW SIENNA',
            'HANSA YELLOW',
            'LAMP BLACK',
            'THALO GREEN',
            'THOULIDINE RED',
            'THALO BLUE',
            'BLUE OXIDE',
            'BON RED',
            'BRIGHT WHITE',
            'CATERPILLAR YELLOW',
            'CHROME YELLOW LIGHT',
            'CHROME FLAT BLACK',
            'CLEAR',
          ],
        ],
      },
      {
        generalName: 'STOCK CARD',
        unit: 'pad',
        description: ['LENGTH', 'WIDTH'],
        descriptionField: [
          ['7 inch', '11 inch'],
          ['5 inch', '8.5 inch'],
        ],
      },
      {
        generalName: 'INVENTORY STOCK TAG',
        unit: 'pad',
        description: ['LENGTH', 'WIDTH'],
        descriptionField: [
          ['5.25 inch', '6.25 inch'],
          ['2.625 inch', '3.125 inch'],
        ],
      },
      {
        generalName: 'WASHER',
        unit: 'piece',
        description: ['MATERIAL', 'TYPE', 'NOMINAL SIZE'],
        descriptionField: [
          ['STEEL', 'ALUMINUM'],
          [
            'LOCK',
            'FLAT',
            'FENDER',
            'FINISHING',
            'SPLIT LOCK',
            'DOCK',
            'SQUARE',
            'SPRING',
          ],
          ['M16 mm', 'M10 mm', 'M12 mm', 'M24 mm', 'M19 mm'],
        ],
      },
      {
        generalName: 'NUTS',
        unit: 'piece',
        description: ['MATERIAL', 'TYPE', 'NOMINAL SIZE'],
        descriptionField: [
          ['STEEL', 'ALUMINUM', 'STAINLESS'],
          [
            'HEX NUTS',
            'NYLON INSERT LOCK NUTS',
            'WING NUTS',
            'CAP NUTS',
            'SQUARE NUTS',
            'FLANGE NUTS',
          ],
          ['M16 mm', 'M10 mm', 'M12 mm', 'M24 mm', 'M19 mm'],
        ],
      },
      {
        generalName: 'PIPE HOOK',
        unit: 'piece',
        description: ['AXIS', 'DESCRIPTION'],
        descriptionField: [
          ['HORIZONTAL', 'VERTICAL'],
          ['SHORT', 'LONG'],
        ],
      },
      {
        generalName: 'METAL SCREW',
        unit: 'piece',
        description: [
          'TYPE',
          'MATERIAL',
          'SCREW HEAD TYPE',
          'SCREW DIAMETER',
          'LENGTH',
        ],
        descriptionField: [
          ['SELF TAPPING', 'SELF DRILLING', 'MACHINE'],
          ['STAINLESS STEEL', 'STEEL', 'METAL'],
          ['FLAT', 'HEX', 'OVAL', 'PAN', 'PANCAKE', 'WAFER'],
          ['8', '12', '14'],
          ['16', '20', '25', '35', '45', '50', '55', '65', '75'],
        ],
      },
      {
        generalName: 'TIE ROD',
        unit: 'piece',
        description: ['DIAMETER', 'LENGTH'],
        descriptionField: [
          ['17 mm'],
          ['0.6 m', '1 m', '1.8 m', '2.1 m', '2.8 m', '3 m', '4 m', '6 m'],
        ],
      },
      {
        generalName: 'WOOD SCREW',
        unit: 'piece',
        description: [
          'TYPE',
          'MATERIAL ',
          'SCREW HEAD TYPE',
          'SCREW DIAMETER',
          'LENGTH',
        ],
        descriptionField: [
          ['SELF TAPPING', 'SELF DRILLING', 'MACHINE'],
          ['STAINLESS STEEL', 'STEEL', 'METAL'],
          ['FLAT', 'HEX', 'OVAL', 'PAN', 'PANCAKE', 'WAFER'],
          ['8 mm', '12 mm', '14 mm'],
          [
            '16 mm',
            '20 mm',
            '25 mm',
            '35 mm',
            '45 mm',
            '50 mm',
            '55 mm',
            '65 mm',
            '75 mm',
          ],
        ],
      },
      {
        generalName: 'TIE WIRE',
        unit: 'meter',
        description: ['IS COATED', 'Gauge NO'],
        descriptionField: [
          ['With PVC Coat', 'Without PVC Coat'],
          ['8', '10', '12', '14', '16', '18', '20', '22'],
        ],
      },
      {
        generalName: 'SHORING JACK',
        unit: 'piece',
        description: ['TYPE', 'LENGTH', 'DIAMETER'],
        descriptionField: [
          ['U HEAD', 'JACK BASE', 'SWIVEL JACK BASE', 'SCAFFOLDING BASE PLATE'],
          ['1.7 m', '2.2 m', '3 m', '4.2 m', '6 m'],
          ['30 mm', '32 mm', '34 mm'],
        ],
      },
      {
        generalName: 'JOINT PIN',
        unit: 'piece',
        description: ['FORMWORKS TYPE', 'SPECS', 'DIMENSION'],
        descriptionField: [['PUR', 'REN'], ['HD', 'RINGLOCK'], ['48 mm X 200 mm']],
      },
      {
        generalName: 'ACOUSTIC CEILING BOARD',
        unit: 'piece',
        description: ['DESIGN', 'DIMENSION'],
        descriptionField: [
          [
            'FINE FISSURED',
            'MILANO',
            'TEXTURA',
            'MAXIBOARD FINE FISSURED',
            'ARMSTRONG FINE FISSURED',
            'ARMSTRONG DUNE',
            'ARMSTRONG FINE FISSURED BEVELED TEGULAR',
            'ARMSTRONG DUNE BEVELED TEGULAR',
            'DAIEKN SMOOTH FINISH',
            'MAXIBOARD FLEECE',
          ],
          ['60 mm X 60 mm', '60 mm X 60 mm X 4 ft', '600 mm X 600 mm X 4 ft'],
        ],
      },
      {
        generalName: 'SUPERSLIM PIN',
        unit: 'kilogram',
        description: ['FORMWORKS TYPE', 'SIZE'],
        descriptionField: [['PUR', 'REN'], ['19 mm']],
      },
      {
        generalName: 'SPRING CLIP',
        unit: 'kilogram',
        description: ['FORMWORKS TYPE', 'MATERIAL', 'SIZE'],
        descriptionField: [['PUR', 'REN'], ['S/S'], ['19 mm']],
      },
      {
        generalName: 'GYPSUM SCREW',
        unit: 'piece',
        description: [
          'TYPE',
          'MATERIAL ',
          'SCREW HEAD TYPE',
          'SCREW DIAMETER',
          'LENGTH',
        ],
        descriptionField: [
          ['S TYPE', 'W TYPE', 'G TYPE'],
          ['STAINLESS STEEL', 'STEEL', 'METAL'],
          ['FLAT', 'HEX', 'OVAL', 'PAN', 'PANCAKE', 'WAFER'],
          ['8 mm', '12 mm', '14 mm'],
          ['16 mm', '25 mm', '35 mm', '45 mm', '50 mm', '55 mm', '65 mm', '75 mm'],
        ],
      },
      {
        generalName: 'AAC BLOCK ADHESIVE',
        unit: 'bag',
        description: ['NET WEIGHT PER BAG'],
        descriptionField: [['25K g']],
      },
      {
        generalName: 'CABLE',
        unit: 'meter',
        description: ['CABLE TYPE', 'VOLTAGE', 'COLOR', 'INSULATION THICKNESS'],
        descriptionField: [
          ['XLPE'],
          ['MEDIUM'],
          ['BROWN', 'BLUE', 'GREEN', 'YELLOW', 'RED'],
          ['6 mm'],
        ],
      },
      {
        generalName: 'ADMIXTURE',
        unit: 'liter',
        description: ['BRAND'],
        descriptionField: [['CHRYSO OMEGA 98S']],
      },
    ];

    const ITEM_PURPOSE_CHOICES = [
      'Major Material (cement, aggregates, ready-mix concerete, rebar, admixture, RC pipe, CHB)',
      'Formworks (all parts and types including accessories)',
      'Temporary Facilities',
      'Office Supplies, Furnitures, and Equipment',
      'Light Equipment & Tools',
      'PPE & Safety Paraphernalia',
      'Subcontractor (supply of labor, materials, fabrication, manufacture, production)',
      'Permanent Materials w/ BAC (line items in BOQ)',
      'Imported Material',
      'IT Equipment',
      'Fuel',
      'Hauling Works',
      'Survey, Calibration & Testing of Instruments',
      'Consumable/Common Materials for Permanent',
      'PED Transactions',
      'Repairs and Maintenance',
      'Other Services',
    ];

    const ITEM_UNIT_CHOICES = [
      'assy',
      'bag',
      'batch',
      'bank cubic meter',
      'board foot',
      'book',
      'borehole',
      'box',
      'bottle',
      'bucket',
      'bundle',
      'can',
      'cart',
      'carton',
      'cartridge',
      'case',
      'cubic centimeter',
      'coil',
      'container',
      'copy',
      'cubic meter',
      'cylinder',
      'day',
      'dayshift',
      'dolly',
      'dozen',
      'drum',
      'each',
      'elf',
      'film',
      'foundation',
      'foot',
      'gallon',
      'global',
      'hole',
      'hour',
      'inch',
      'jar',
      'joint',
      'kilogram',
      'kit',
      'kilometer',
      'lump sum',
      'linear feet',
      'pound',
      'length',
      'license',
      'line',
      'lumen',
      'lot',
      'liter',
      'megatonne',
      'milliliter',
      'module',
      'month',
      'meter',
      'night shift',
      'number',
      'ounce',
      'pack',
      'pad',
      'pail',
      'pair',
      'panel',
      'piece',
      'person',
      'pint',
      'position',
      'quartz',
      'quarter',
      'ream',
      'rig',
      'roll',
      'sack',
      'sample',
      'sausage',
      'section',
      'set up',
      'set',
      'sheet',
      'shot',
      'spot',
      'square foot',
      'square meter',
      'teraliter',
      'tablet',
      'teeth',
      'test',
      'tin',
      'toner',
      'tower',
      'trip',
      'tube',
      'unipack',
      'unit',
      'visit',
      'week',
      'yard',
    ];

    const TEAM_ID = "a5a28977-6956-45c1-a624-b9e90911502e";
    const SECTION_ID = "0672ef7d-849d-4bc7-81b1-7a5eefcc1451";
    const CHARS = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";

    const itemInput = [];
    const fieldInput = [];
    const itemDescriptionInput = [];
    const itemDescriptionFieldInput = [];

    const generateRandomCode = () => {
      let result = "";
      for (let i = 5; i > 0; --i)
        result += CHARS[Math.floor(Math.random() * CHARS.length)];
      return result;
    };

    const getRandomArrayElement = (array) => {
      return array[Math.floor(Math.random() * array.length)];
    };

    itemData.forEach((item) => {
      const itemId = plv8.execute('SELECT uuid_generate_v4()')[0].uuid_generate_v4;
      
      // insert item
      itemInput.push({
        item_id: itemId,
        item_general_name: item.generalName,
        item_unit: item.unit
          ? item.unit
          : getRandomArrayElement(ITEM_UNIT_CHOICES),
        item_purpose: getRandomArrayElement(ITEM_PURPOSE_CHOICES),
        item_cost_code: generateRandomCode(),
        item_gl_account: generateRandomCode(),
        item_team_id: TEAM_ID,
      });

      item.description.forEach((description, index) => {
        const fieldId = plv8.execute('SELECT uuid_generate_v4()')[0].uuid_generate_v4;
        const itemDescriptionId = plv8.execute('SELECT uuid_generate_v4()')[0].uuid_generate_v4;

        // insert field
        fieldInput.push({
          field_id: fieldId,
          field_name: description,
          field_is_required: true,
          field_type: 'DROPDOWN',
          field_order: 10,
          field_section_id: SECTION_ID,
        });

        // insert description
        itemDescriptionInput.push({
          item_description_id: itemDescriptionId,
          item_description_label: description,
          item_description_field_id: fieldId,
          item_description_item_id: itemId,
        });

        item.descriptionField[index].forEach((descriptionField) => {
          // insert description field
          itemDescriptionFieldInput.push({
            item_description_field_value: descriptionField,
            item_description_field_item_description_id: itemDescriptionId,
          });
        });
      });
    });

    const item_input = itemInput.map((item) => `('${item.item_id}', '${item.item_general_name}', '${item.item_unit}', '${item.item_purpose}', '${item.item_cost_code}', '${item.item_gl_account}', '${item.item_team_id}')`).join(',');

    const field_input = fieldInput.map((field) => `('${field.field_id}', '${field.field_name}', '${field.field_is_required}', '${field.field_type}', '${field.field_order}', '${field.field_section_id}')`).join(',');

    const item_description_input = itemDescriptionInput.map((itemDescription) => `('${itemDescription.item_description_id}', '${itemDescription.item_description_label}', '${itemDescription.item_description_field_id}', '${itemDescription.item_description_item_id}')`).join(',');

    const item_description_field_input = itemDescriptionFieldInput.map((itemDescriptionField) => `('${itemDescriptionField.item_description_field_value}', '${itemDescriptionField.item_description_field_item_description_id}')`).join(',');

    plv8.execute(`INSERT INTO item_table (item_id, item_general_name, item_unit, item_purpose, item_cost_code, item_gl_account, item_team_id) VALUES ${item_input}`);
    plv8.execute(`INSERT INTO field_table (field_id, field_name, field_is_required, field_type, field_order, field_section_id) VALUES ${field_input}`);
    plv8.execute(`INSERT INTO item_description_table (item_description_id, item_description_label, item_description_field_id, item_description_item_id) VALUES ${item_description_input}`);
    plv8.execute(`INSERT INTO item_description_field_table (item_description_field_value, item_description_field_item_description_id) VALUES ${item_description_field_input}`);
  })
$$ LANGUAGE plv8;
SELECT item_seed();
DROP FUNCTION IF EXISTS item_seed;