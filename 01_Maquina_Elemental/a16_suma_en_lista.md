**Objetivo:** Recorrer una lista enlazada y sumar los valores de sus nodos.
* **Inicio de Lista:** Dirección almacenada en `3A0`.
* **Estructura del Nodo:**
  * Celda 1: Valor (16 bits con signo).
  * Celda 2: Dirección del siguiente nodo (o -1 si es el fin).
* **Resultado:** Almacenar la sumatoria en `400`.

## Código Solución

| DIR | CONTENIDO | OBS | COMENTARIOS |
| :-- | :-- | :-- | :-- |
| **100** | `0000` | `PUNTERO` | Dirección del nodo actual |
| **104** | `1000` | `OPCODE` | Base para instrucción LOAD (1xxx) |
| **---** | **---** | **---** | **INICIALIZACIÓN** |
| **105** | `0000` | `AC=0` | Limpio Acumulador |
| **106** | `2400` | `(400)=0` | Inicializo Suma Total en 0 |
| **107** | `13A0` | `(AC)=(3A0)` | Cargo dir. del primer nodo |
| **108** | `2100` | `(100)=AC` | Inicializo Puntero |
| **---** | **---** | **---** | **BUCLE DE RECORRIDO** |
| **109** | `1100` | `(AC)=Ptr` | Cargo dirección actual |
| **10A** | `7118` | `SI<0 GOTO` | **Check Fin:** Si es -1, voy a FIN (118) |
| **---** | **---** | **---** | **LEER VALOR (Automodificación)** |
| **10B** | `3104` | `AC+1000` | Fabrico instrucción `LOAD DirActual` |
| **10C** | `210D` | `Store` | Guardo instrucción en 10D |
| **10D** | `0000` | `EJECUCION` | **[Dinámico]** Carga el valor del nodo |
| **10E** | `3400` | `AC+Suma` | Sumo al total acumulado |
| **10F** | `2400` | `Store` | Actualizo Suma Total en 400 |
| **---** | **---** | **---** | **LEER SIGUIENTE NODO** |
| **110** | `0001` | `AC=1` | Carga constante 1 |
| **111** | `3100` | `AC+Ptr` | Calculo `DirActual + 1` (Campo Siguiente) |
| **112** | `3104` | `AC+1000` | Fabrico instrucción `LOAD Siguiente` |
| **113** | `2114` | `Store` | Guardo instrucción en 114 |
| **114** | `0000` | `EJECUCION` | **[Dinámico]** Carga la dir. del próximo nodo |
| **115** | `2100` | `(100)=AC` | Actualizo Puntero con la nueva dirección |
| **116** | `0000` | `AC=0` | Limpio para salto |
| **117** | `5109` | `GOTO` | Vuelvo al inicio del bucle |
| **118** | `F000` | `FIN` | Fin del Programa |
