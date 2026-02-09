# Ejercicio: Ordenamiento de 3 Números (Sort 3)
**Objetivo:** Leer X, Y, Z de 100, 200, 300 y guardarlos ordenados ascendentemente en 700, 701, 702.

DIR | CONT | OBS | COMENTARIOS
| :-- | :-- | :-- | :-- |
| **400** | `0000` | `TEMP` | Variable temporal para Swaps |
| **401** | `0001` | `CTE 1` | Constante 1 (para complemento a 2) |
| **---** | **---** | **---** | **1. COPIA DE DATOS (INPUT -> OUTPUT)** |
| **500** | `1100` | `LOAD` | Carga X (100) |
| **501** | `2700` | `STORE` | Guarda en 700 |
| **502** | `1200` | `LOAD` | Carga Y (200) |
| **503** | `2701` | `STORE` | Guarda en 701 |
| **504** | `1300` | `LOAD` | Carga Z (300) |
| **505** | `2702` | `STORE` | Guarda en 702 |
| **---** | **---** | **---** | **2. PRIMERA PASADA (700 vs 701)** |
| **506** | `1701` | `LOAD` | Carga (701) |
| **507** | `4000` | `NOT` | Invierto bits |
| **508** | `3401` | `ADD 1` | +1 (Tengo -701) |
| **509** | `3700` | `ADD` | (700) - (701) |
| **50A** | `7512` | `SI<0` | Si 700 < 701, salto a SIGUIENTE |
| **50B** | `5512` | `SI=0` | Si son iguales, salto a SIGUIENTE |
| **---** | **---** | **---** | **SWAP (700, 701)** |
| **50C** | `1700` | `LOAD` | Carga (700) |
| **50D** | `2400` | `STORE` | Guarda en TEMP |
| **50E** | `1701` | `LOAD` | Carga (701) |
| **50F** | `2700` | `STORE` | Guarda en 700 |
| **510** | `1400` | `LOAD` | Carga TEMP |
| **511** | `2701` | `STORE` | Guarda en 701 |
| **---** | **---** | **---** | **3. SEGUNDA PASADA (701 vs 702)** |
| **512** | `1702` | `LOAD` | Carga (702) |
| **513** | `4000` | `NOT` | Invierto |
| **514** | `3401` | `ADD 1` | (-702) |
| **515** | `3701` | `ADD` | (701) - (702) |
| **516** | `751E` | `SI<0` | Si 701 < 702, salto (Ya está ordenado) |
| **517** | `551E` | `SI=0` | Si iguales, salto |
| **---** | **---** | **---** | **SWAP (701, 702)** |
| **518** | `1701` | `LOAD` | Carga (701) |
| **519** | `2400` | `STORE` | Guarda en TEMP |
| **51A** | `1702` | `LOAD` | Carga (702) |
| **51B** | `2701` | `STORE` | Guarda en 701 |
| **51C** | `1400` | `LOAD` | Carga TEMP |
| **51D** | `2702` | `STORE` | Guarda en 702 |
| **---** | **---** | **---** | **4. TERCERA PASADA (700 vs 701 REVISIÓN)** |
| **51E** | `1701` | `LOAD` | Carga (701) |
| **51F** | `4000` | `NOT` | Invierto |
| **520** | `3401` | `ADD 1` | (-701) |
| **521** | `3700` | `ADD` | (700) - (701) |
| **522** | `752A` | `SI<0` | Si 700 < 701, salto a FIN |
| **523** | `552A` | `SI=0` | Si iguales, salto a FIN |
| **---** | **---** | **---** | **SWAP FINAL (700, 701)** |
| **524** | `1700` | `LOAD` | Carga (700) |
| **525** | `2400` | `STORE` | Guarda en TEMP |
| **526** | `1701` | `LOAD` | Carga (701) |
| **527** | `2700` | `STORE` | Guarda en 700 |
| **528** | `1400` | `LOAD` | Carga TEMP |
| **529** | `2701` | `STORE` | Guarda en 701 |
| **---** | **---** | **---** | **FIN** |
| **52A** | `F000` | `FIN` | Detener ejecución |
