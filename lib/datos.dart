// sexo, edad, item

enum Genero {
  femenino,
  masculino,
}

enum Edad {
  cinco_ocho,
  nueve_trece,
  catorce_dieciocho,
}

enum Items {
  vegetales_verdes,
  vegetales_rojos,
  legumbres,
  tuberculos,
  otros_vegetales,
  frutas,
  pan,
  pastas_integrales,
  pastas_refinadas,
  lacteos,
  quesos,
  carnes,
  pescados,
  semillas,
  aceites,
}

List<String> titulo = [
  "Vegetales verdes",
  "Vegetales rojos/naranjas",
  "Legumbres",
  "Tubérculos (papa, batata, mandioca)",
  "Otros vegetales",
  "Frutas",
  "Pan",
  "Pastas y masas integrales: masa: pizza, tarta, empanada, canelon, masa de taco.",
  "Pastas y masas refinadas (No integrales)",
  "Lácteos (leche, yogur) parcialmente descremados",
  "Quesos semidescremados untables o semisólidos (port salut, muzzarella)",
  "Carnes rojas, ave y huevo por día",
  "Pescados",
  "Frutos secos y semillas",
  "Aceites"
];

List<List<List<List<String>>>> opciones = [
  // femenino
  [
    // Cinco a ocho
    [
      // vegetales verdes
      [
        '1 plato por semana',
        '1/2 plato por semana',
        '< 1/2 plato por semana',
      ],
      [
        '3 platos por semana o 1 unidad chica diaria',
        '1 platos por semana',
        '< 1 platos por semana',
      ],
      [
        '1/2 plato por semana o 2 medallones chicos por semana',
        '1/4 plato por semana o 1 medallón chico por semana',
        '< 1/4 plato por semana o < 1 medallón chico por semana',
      ],
      [
        '1/2 unidad chica diaria o 1/4 plato diario o 3 unidades chicas por semana',
        '1 unidad chica diaria o 1/2 plato diario o 3 unidades medianas por semana',
        '> 1 unidad chica diaria o > 1/2 plato diario o > 3 unidades medianas por semana',
      ],
      [
        '3 unidades medianas semanales o 1/3 plato crudo diario o 1/4 plato cocido diario',
        '1 unidad mediana semanal o 1/4 plato crudo diario o 1/4 plato cocido 4 veces/sem',
        '< 1 unidad mediana semanal o  < 1/4 plato crudo diario o < 1/4 plato cocido 4 veces/sem',
      ],
      [
        '1 unidad mediana diaria o 2 unidades chicas diaria',
        '1 unidad chica diaria',
        '< 1 unidad chia diaria',
      ],
      [
        '1 rodaja de pan o 1 mignon chico o 3 galletitas de agua',
        '2 rodajas de pan de molde o 2 mignones chicos o 6 galletitas de agua',
        '> 2 rodajas de pan de molde o > 2 mignones chicos o > 6 galletitas de agua',
      ],
      [
        '1/4 plato diario o 1 porción de masa diario',
        '1/2 plato diario o 2 porciones de masa diario',
        '> 1/2 plato diario o > 2 porciones de masa diario',
      ],
      [
        '1/4 plato diario o 1 porción de masa diario',
        '1/2 plato al día o 2 porciones de masa',
        '> 1/2 plato al día  o > 2 porciones de masa al día',
      ],
      [
        '3/4 tz tipo desayuno diario o 2 tazas tipo té diario',
        '1/2 taza tipo desayuno diario o 1 taza tipo té diario',
        '< 1/2 taza tipo desayuno diario o < 1 taza tipo té diario',
      ],
      [
        '1 porción tamaño cajita de fósforo chica o tamaño 1/2 tarjeta SUBE o 2 cdas tipo soperas',
        '1/2 porción tamaño cajita de fósforo chica o 1 dado o 1 cda sopera',
        '< 1/2 porción tamaño cajita de fósforo chica o < 1 dado o < 1 cda sopera',
      ],
      [
        '1/2 bife mediano por día o 1 y 1/2 huevo diario o 1 emincé mediano',
        '1 bife mediano diario o hasta 2 unidades de huevo diario o 1 porción tamaño rodaja de peceto + 1 huevo diario',
        '> 1 bife mediano diario o > 2 unidades de huevo diario o > 1 porción tamaño rodaja de peceto + 1 huevo diario',
      ],
      [
        '1 porción mediana por semana o 1 lata por semana',
        '1 porción chica por semana o 1/2 lata por semana',
        '< 1 porción chica por semana o < 1/2 lata por semana',
      ],
      [
        '4 mariposas nueces  o 8 almendras o 1 cda sopera de semillas o maníes en forma diaria',
        '2 mariposas o 4 almendras o 1 cdta tipo té de semillas o maníes en forma diaria',
        '< 2 mariposas o < 4 almendras o < 1 cdta tipo té de semillas o maníes en forma diaria',
      ],
      [
        '2 cdas tipo postre diaria',
        '1 cda tipo postre diaria',
        '< 1 cda tipo postre diaria',
      ],
    ],
  ],
];
