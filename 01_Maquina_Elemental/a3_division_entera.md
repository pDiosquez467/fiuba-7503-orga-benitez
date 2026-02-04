**Objetivo:** Calcular $X / Y$.
* Cociente en `300`.
* Resto en `301`.
* Si $X - Y < 0$, terminamos (y no contamos esa resta).
* Si $X - Y \geq 0$, guardamos el nuevo valor en $X$ y sumamos 1 al Cociente.

## Código Solución

| DIR | CONTENIDO | OBS | COMENTARIOS |
| :-- | :-- | :-- | :-- |
| **4FE** | `####` | `VAR` | Variable temporal para -Y |
| **4FF** | `0001` | `CTE=1` | Constante 1 |
| **---** | **---** | **---** | **INICIALIZACIÓN** |
| **500** | `0000` | `AC=0` | Carga 0 |
| **501** | `2300` | `(300)=0` | Inicializo Cociente = 0 |
| **502** | `1150` | `(AC)=X` | Cargo X |
| **503** | `2301` | `(301)=AC` | Inicializo Resto = X |
| **---** | **---** | **---** | **PREPARAR -Y (COMPLEMENTO)** |
| **504** | `1250` | `(AC)=Y` | Cargo Y |
| **505** | `4000` | `NOT` | Invierto bits |
| **506** | `34FF` | `AC+1` | Sumo 1 -> Tengo -Y |
| **507** | `24FE` | `Store` | Guardo -Y en 4FE |
| **---** | **---** | **---** | **BUCLE DE DIVISIÓN** |
| **508** | `1301` | `(AC)=Resto` | Cargo Resto actual |
| **509** | `34FE` | `AC+(-Y)` | Resto Y (en el Acumulador) |
| **50A** | `7511` | `SI<0 GOTO` | **Check:** Si dio negativo, Termino (Voy a 511) |
| **50B** | `2301` | `Store` | Si positivo, actualizo Resto |
| **50C** | `1300` | `(AC)=Coc` | Cargo Cociente |
| **50D** | `34FF` | `AC+1` | Sumo 1 (Cuento la resta) |
| **50E** | `2300` | `Store` | Guardo Cociente |
| **50F** | `0000` | `AC=0` | Preparo salto |
| **510** | `5508` | `GOTO` | Repito el bucle |
| **511** | `F000` | `FIN` | Fin del Programa |
