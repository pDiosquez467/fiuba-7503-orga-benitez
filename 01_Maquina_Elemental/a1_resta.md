**Objetivo:** Realizar la operación X - Y (150 - 250) y guardar en 300.
**Carga:** El programa inicia en la dirección 500(16).

## Análisis de Componentes (Arquitectura)
* **Tamaño de Palabra (Datos):** 16 bits (definido por el AC).
* **Bus de Direcciones:** 12 bits (definido por el RPI).
* **Memoria Total:** $2^{12} = 4096$ celdas (4K).
* **Formato de Instrucción:** 16 bits (4 bits OpCode + 12 bits Dirección).

## Código Solución

| DIR | CONTENIDO | OBS | COMENTARIOS |
| :-- | :-- | :-- | :-- |
| **4FF** | `0001` | `CTE=1` | Constante para Complemento a 2 |
| **---** | **---** | **---** | **INICIO DEL PROGRAMA** |
| **500** | `1250` | `(AC)=(250)` | Cargo Y |
| **501** | `4000` | `NOT` | Invierto bits (Complemento a 1) |
| **502** | `34FF` | `AC+(4FF)` | Sumo 1 -> Obtengo -Y (C2) |
| **503** | `3150` | `AC+(150)` | Sumo X -> (X - Y) |
| **504** | `2300` | `(300)=AC` | Guardo el Resultado |
| **505** | `F000` | `FIN` | Detener ejecución |
