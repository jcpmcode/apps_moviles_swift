class Diccionarios {
    // Tabla 1
    let tablaValoresCaracteresNombre = [
        " " : "00",
        "0" : "00",
        "1" : "01",
        "2" : "02",
        "3" : "03",
        "4" : "04",
        "5" : "05",
        "6" : "06",
        "7" : "07",
        "8" : "08",
        "9" : "09",
        "&" : "10",
        "Ñ" : "10",
        "A" : "11",
        "B" : "12",
        "C" : "13",
        "D" : "14",
        "E" : "15",
        "F" : "16",
        "G" : "17",
        "H" : "18",
        "I" : "19",
        "J" : "21",
        "K" : "22",
        "L" : "23",
        "M" : "24",
        "N" : "25",
        "O" : "26",
        "P" : "27",
        "Q" : "28",
        "R" : "29",
        "S" : "32",
        "T" : "33",
        "U" : "34",
        "V" : "35",
        "W" : "36",
        "X" : "37",
        "Y" : "38",
        "Z" : "39"
    ]
    
    // Tabla 2
    let tablaValoresCocienteYResiduo = [
        "0" : "1",
        "1" : "2",
        "2" : "3",
        "3" : "4",
        "4" : "5",
        "5" : "6",
        "6" : "7",
        "7" : "8",
        "8" : "9",
        "9" : "A",
        "10" : "B",
        "11" : "C",
        "12" : "D",
        "13" : "E",
        "14" : "F",
        "15" : "G",
        "16" : "H",
        "17" : "I",
        "18" : "J",
        "19" : "K",
        "20" : "L",
        "21" : "M",
        "22" : "N",
        "23" : "P",
        "24" : "Q",
        "25" : "R",
        "26" : "S",
        "27" : "T",
        "28" : "U",
        "29" : "V",
        "30" : "W",
        "31" : "X",
        "32" : "Y",
        "33" : "Z"
    ]
    
    // Tabla 3
    let tablaValoresGeneracionDigitoVerificador = [
        "0" : "00",
        "1" : "01",
        "2" : "02",
        "3" : "03",
        "4" : "04",
        "5" : "05",
        "6" : "06",
        "7" : "07",
        "8" : "08",
        "9" : "09",
        "A" : "10",
        "B" : "11",
        "C" : "12",
        "D" : "13",
        "E" : "14",
        "F" : "15",
        "G" : "16",
        "H" : "17",
        "I" : "18",
        "J" : "19",
        "K" : "20",
        "L" : "21",
        "M" : "22",
        "N" : "23",
        "&" : "24",
        "Ñ" : "24",
        "O" : "25",
        "P" : "26",
        "Q" : "27",
        "R" : "28",
        "S" : "29",
        "T" : "30",
        "U" : "31",
        "V" : "32",
        "W" : "33",
        "X" : "34",
        "Y" : "35",
        "Z" : "36",
        " " : "37"
    ]
    
    // Tabla 4
    let tablaPalabrasInconvenientes = [
        "BUEI" : "BUEX",
        "CACA" : "CACX",
        "CAGA" : "CAGX",
        "CAKA" : "CAKX",
        "COGE" : "COGX",
        "COJE" : "COJX",
        "FETO" : "FETX",
        "JOTO" : "JOTX",
        "KACO" : "KACX",
        "KAGO" : "KAGX",
        "KOJO" : "KOJX",
        "KULO" : "KULX",
        "LOCO" : "LOCX",
        "LOKO" : "LOKX",
        "MAMO" : "MAMX",
        "MEAS" : "MEAX",
        "MION" : "MIOX",
        "MULA" : "MULX",
        "PEDO" : "PEDX",
        "PUTA" : "PUTX",
        "QULO" : "QULX",
        "RUIN" : "RUIX",
        "MAME" : "MAMX",
        "MEAR" : "MEAX",
        "MEON" : "MEOX",
        "MOCO" : "MOCX",
        "PEDA" : "PEDX",
        "PENE" : "PENX",
        "PUT" : "PUTX",
        "CACO" : "CACX",
        "CAGO" : "CAGX",
        "CAKO" : "CAKX",
        "COJA" : "COJX",
        "COJI" : "COJX",
        "CULO" : "CULX",
        "GUEY" : "GUEX",
        "KACA" : "KACX",
        "KAGA" : "KAGX",
        "KOGE" : "KOGX",
        "KAKA" : "KAKX",
        "LOCA" : "LOCX",
        "LOKA" : "LOKX",
        "RATA" : "RATX"
    ]
    
    // Tabla 5
    let tablaPalabrasNoUtilizadasRFCMorales = [
        " EL ",
        " LA ",
        " S. DE ",
        " S.A. DE ",
        " R.L. ",
        " C.V. ",
        " DE ",
        " LOS ",
        " LAS ",
        " Y ",
        " DEL ",
        " S.A. ",
        " COMPAÑÍA ",
        " CIA ",
        " SOCIEDAD ",
        " SOC ",
        " COOPERATIVA ",
        " COOP ",
        " A.C. ",
        " A. EN P. ",
        " S. EN C. POR A. ",
        " S. EN C. ",
        " E. EN N.C. ",
        " EN ",
        " PARA ",
        " CON ",
        " POR ",
        " SUS ",
        " AL ",
        " S.C. ",
        " E ",
        " S.C.S. ",
        " S.C.L. ",
        " THE ",
        " I.A.P ",
        " S.N.C. ",
        " AND ",
        " OF ",
        " C.D. ",
        " COMPANY ",
        " MAC ",
        " MC ",
        " VAN ",
        " VON "
    ]
    
    let tablaPalabrasNoUtilizadasRFCMoralesSinPuntos = [
        " EL ",
        " LA ",
        " S DE ",
        " SA DE ",
        " RL ",
        " CV ",
        " DE ",
        " LOS ",
        " LAS ",
        " Y ",
        " DEL ",
        " SA ",
        " COMPAÑÍA ",
        " CIA ",
        " SOCIEDAD ",
        " SOC ",
        " COOPERATIVA ",
        " COOP ",
        " AC ",
        " A EN P ",
        " S EN C POR A ",
        " S EN C ",
        " E EN NC ",
        " EN ",
        " PARA ",
        " CON ",
        " POR ",
        " SUS ",
        " AL ",
        " SC ",
        " E ",
        " SCS ",
        " SCL ",
        " THE ",
        " IAP ",
        " SNC ",
        " AND ",
        " OF ",
        " CD ",
        " COMPANY ",
        " MAC ",
        " MC ",
        " VAN ",
        " VON "
    ]
    
    // Tabla 6
    let tablaPalabrasNoUtilizadasRFCFisicas = [
        "D",
        "DEL",
        "LA",
        "LOS",
        "LAS",
        "Y",
        "MC",
        "MAC",
        "VON",
        "VAN"
    ]
    
    // Tabla 7
    let caracteresNoPermitidos = [
        "!",
        "%",
        "/",
        "(",
        "$",
        ")",
        "=",
        "[",
        "]",
        "{",
        "}",
        "+",
        "<",
        "*",
        "–",
        ">",
        "º",
        "ª",
        "\\",
        "^",
        "`",
        "´",
        "·",        
    ]
    
    let puntosYComas = [
        ".",
        ":",
        ",",
        ";"
    ]
    
    let numerosRomanos = [
        "M" : 1000,
        "D" : 500,
        "C" : 100,
        "L" : 50,
        "X" : 10,
        "V" : 5,
        "I" : 1
    ]
    
    let equivalenciasAcentos = [
        "Á" : "A",
        "É" : "E",
        "Í" : "I",
        "Ó" : "O",
        "Ú" : "U"
    ]
}

