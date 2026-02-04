**Objetivo:** Calcular $X \times Y$ (150 $\times$ 250) y guardar en 300.
**Manejo de Caso Borde:** Si $Y=0$, el programa salta directamente al fin sin sumar.

## Código Solución

| DIR | CONTENIDO | OBS | COMENTARIOS |
| :-- | :-- | :-- | :-- |
| **4FF** | `FFFF` | `CTE=-1` | Constante para decrementar |
| **---** | **---** | **---** | **INICIALIZACIÓN** |
| **500** | `0000` | `AC=0` | Carga Cero |
| **501** | `2300` | `(300)=0` | Inicializo Resultado en 0 |
| **502** | `1250` | `(AC)=(250)` | Cargo Y |
| **503** | `2100` | `(100)=AC` | Copio Y a contador temporal |
| **---** | **---** | **---** | **BUCLE PRINCIPAL** |
| **504** | `1100` | `(AC)=Cont` | Cargo Contador |
| **505** | `550D` | `SI=0 GOTO` | **Check:** Si Contador es 0, termino |
| **506** | `34FF` | `AC+(-1)` | Decremento Contador |
| **507** | `2100` | `Store` | Guardo nuevo Contador |
| **508** | `1150` | `(AC)=X` | Cargo X |
| **509** | `3300` | `AC+Res` | Sumo X al Resultado Parcial |
| **50A** | `2300` | `Store` | Guardo Resultado Actualizado |
| **50B** | `0000` | `AC=0` | Preparo salto incondicional |
| **50C** | `5504` | `GOTO` | Vuelvo al inicio del bucle |
| **50D** | `F000` | `FIN` | Fin del Programa |
