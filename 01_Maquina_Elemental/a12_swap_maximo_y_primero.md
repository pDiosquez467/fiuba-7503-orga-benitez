# El bucle arranca desde el 2do elemento (ahorrando una comparación inútil).

| DIR | CONT | OBS | COMENTARIOS |
| :-- | :-- | :-- | :-- |
| **4F8** | `0001` | `CTE 1` | Constante 1 |
| **4F9** | `1000` | `OP_LOAD`| Máscara OpCode LOAD (1xxx) |
| **4FA** | `####` | `VAL_ACT`| Valor Actual (Temp) |
| **4FB** | `####` | `PTR_ACT`| Puntero al elemento actual |
| **4FC** | `0200` | `BASE` | Dirección Base del Arreglo |
| **4FD** | `####` | `VAL_MAX`| Valor del Máximo |
| **4FE** | `####` | `DIR_MAX`| Dirección del Máximo |
| **4FF** | `0005` | `LEN` | Longitud del Arreglo |
| **---** | **---** | **---** | **INICIALIZACIÓN (MAX = PRIMERO)** |
| **500** | `14FC` | `LOAD` | Carga BASE |
| **501** | `24FE` | `STORE` | Inicializo DIR_MAX = BASE |
| **502** | `34F9` | `ADD OP` | Genero instrucción `LOAD BASE` |
| **503** | `2505` | `STORE` | Guardo instrucción en 505 |
| **504** | `0000` | `NOP` | (Alineación) |
| **505** | `0000` | `EXEC` | **[DIN]** Cargo Valor[0] |
| **506** | `24FD` | `STORE` | Inicializo VAL_MAX = Valor[0] |
| **---** | **---** | **---** | **PREPARAR PUNTERO (PTR = BASE + 1)** |
| **507** | `14FC` | `LOAD` | Carga BASE |
| **508** | `34F8` | `ADD 1` | BASE + 1 (Empezamos del 2do) |
| **509** | `24FB` | `STORE` | Guardo en PTR_ACT |
| **50A** | `14FF` | `LOAD` | Carga LEN |
| **50B** | `34FA` | `ADD -1`| Resto 1 (Ya procesamos el primero) |
| **50C** | `24FF` | `STORE` | Actualizo LEN (Contador) |
| **---** | **---** | **---** | **BUCLE DE BÚSQUEDA** |
| **50D** | `14FF` | `LOAD` | Carga Contador |
| **50E** | `34FA` | `ADD -1`| Decremento (Pre-decremento para check) |
| **50F** | `24FF` | `STORE` | Actualizo Contador |
| **510** | `7523` | `SI<0` | **Si Contador < 0, FIN BUCLE (Ir a SWAP)** |
| **---** | **---** | **---** | **LEER ELEMENTO ACTUAL** |
| **511** | `14FB` | `LOAD` | Carga PTR_ACT |
| **512** | `34F9` | `ADD OP` | Genero `LOAD [PTR]` |
| **513** | `2515` | `STORE` | Inyecto instrucción |
| **514** | `0000` | `NOP` | |
| **515** | `0000` | `EXEC` | **[DIN]** Cargo Valor Actual |
| **516** | `24FA` | `STORE` | Guardo en VAL_ACT |
| **---** | **---** | **---** | **COMPARAR (MAX - ACTUAL)** |
| **517** | `4000` | `NOT` | Invierto Actual |
| **518** | `34F8` | `ADD 1` | (-Actual) |
| **519** | `34FD` | `ADD MAX`| MAX - ACTUAL |
| **51A** | `651F` | `SI>0` | Si MAX > ACT, Salto |
| **51B** | `551F` | `SI=0` | Si MAX == ACT, Salto |
| **---** | **---** | **---** | **ACTUALIZAR MÁXIMO** |
| **51C** | `14FA` | `LOAD` | Carga VAL_ACT |
| **51D** | `24FD` | `STORE` | Actualizo VAL_MAX |
| **51E** | `14FB` | `LOAD` | Carga PTR_ACT |
| **51F** | `24FE` | `STORE` | Actualizo DIR_MAX |
| **---** | **---** | **---** | **AVANZAR** |
| **520** | `14FB` | `LOAD` | Carga PTR_ACT |
| **521** | `34F8` | `ADD 1` | PTR++ |
| **522** | `24FB` | `STORE` | Guardo PTR_ACT |
| **523** | `550D` | `GOTO` | Vuelta al inicio |
| **---** | **---** | **---** | **SWAP (Tu lógica optimizada)** |
| **524** | `14FC` | `LOAD` | Carga BASE |
| **525** | `34F9` | `ADD OP` | Genero `LOAD BASE` |
| **526** | `2529` | `STORE` | Guardo instr. en 529 |
| **527** | `34F9` | `ADD OP` | Sumo 1000 más -> `STORE BASE` |
| **528** | `252C` | `STORE` | Guardo instr. en 52C |
| **529** | `0000` | `EXEC` | **[DIN]** Leo Valor[0] |
| **52A** | `24FA` | `STORE` | Guardo en Temp (VAL_ACT) |
| **52B** | `14FD` | `LOAD` | Carga VAL_MAX |
| **52C** | `0000` | `EXEC` | **[DIN]** Escribo MAX en BASE |
| **52D** | `14FE` | `LOAD` | Carga DIR_MAX |
| **52E** | `34F9` | `ADD OP` | ... + 1000 |
| **52F** | `34F9` | `ADD OP` | ... + 1000 -> `STORE [DIR_MAX]` |
| **530** | `2532` | `STORE` | Inyecto instrucción |
| **531** | `14FA` | `LOAD` | Carga Temp (Valor[0] original) |
| **532** | `0000` | `EXEC` | **[DIN]** Escribo Temp en DIR_MAX |
| **533** | `F000` | `FIN` | |
