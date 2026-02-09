## Estado Inicial del Sistema
* **RPI (PC):** `231` (Hex)
* **AC:** `XXXX` (Indeterminado)
* **Memoria de Datos:**
    * `(201) = 0002`
    * `(202) = FFFE` (Equivalente a -2 en Complemento a 2)
    * `(230) = 0001` (Constante)
* **Código Fuente (desde 231):**
    * `231: 5233` | `232: 2233` | `233: 4200`
    * `234: 5200` | `235: 3201` | `236: 4200`
    * `237: 5202` | `238: 3230` | `239: 4202`
    * `23A: 1234`

---

## Traza de Ejecución Detallada

### 1. Inicialización (Limpieza)

| Dir (RPI) | RI (Instr) | Operación | Detalle | Estado Resultante |
| :--- | :--- | :--- | :--- | :--- |
| **231** | `5233` | **CARGA** `(233)` | Carga contenido de 233 (`4200`) en AC. | `AC = 4200` |
| **232** | `2233` | **RESTA** `(233)` | `AC` - `(233)` = `4200` - `4200` | `AC = 0000` |
| **233** | `4200` | **ALMACENA** `200`| Guarda `AC` (0) en la dir 200. | `(200) = 0000` |

### 2. Bucle - Iteración 1

| Dir (RPI) | RI (Instr) | Operación | Detalle | Estado Resultante |
| :--- | :--- | :--- | :--- | :--- |
| **234** | `5200` | **CARGA** `(200)` | Carga `0000` en AC. | `AC = 0000` |
| **235** | `3201` | **SUMA** `(201)` | `0000` + `0002` | `AC = 0002` |
| **236** | `4200` | **ALMACENA** `200`| Actualiza `(200)`. | `(200) = 0002` |
| **237** | `5202` | **CARGA** `(202)` | Carga `FFFE` (-2) en AC. | `AC = FFFE` |
| **238** | `3230` | **SUMA** `(230)` | `FFFE` (-2) + `0001` (1) | `AC = FFFF` (-1) |
| **239** | `4202` | **ALMACENA** `(202)`| Actualiza `(202)`. | `(202) = FFFF` |
| **23A** | `1234` | **BIFURCA** `234` | Si `AC < 0` ir a 234. (`FFFF` es -1). | **SALTA** a `234` |

### 3. Bucle - Iteración 2

| Dir (RPI) | RI (Instr) | Operación | Detalle | Estado Resultante |
| :--- | :--- | :--- | :--- | :--- |
| **234** | `5200` | **CARGA** `(200)` | Carga `0002` en AC. | `AC = 0002` |
| **235** | `3201` | **SUMA** `(201)` | `0002` + `0002` | `AC = 0004` |
| **236** | `4200` | **ALMACENA** `200`| Actualiza `(200)`. | `(200) = 0004` |
| **237** | `5202` | **CARGA** `(202)` | Carga `FFFF` (-1) en AC. | `AC = FFFF` |
| **238** | `3230` | **SUMA** `(230)` | `FFFF` (-1) + `0001` (1) | `AC = 0000` |
| **239** | `4202` | **ALMACENA** `(202)`| Actualiza `(202)`. | `(202) = 0000` |
| **23A** | `1234` | **BIFURCA** `234` | Si `AC < 0`. `AC` es 0 (No negativo). | **NO SALTA** |

---

## Estado Final de Componentes

Estado del sistema tras completarse la ejecución (instrucción 23A sin salto).

### Registros Principales
| Componente | Valor Final (Hex) | Observación |
| :--- | :--- | :--- |
| **AC** (Acumulador) | `0000` | Resultado de la última suma (-1 + 1). |
| **RPI** (Contador Prog.)| `023B` | Dirección siguiente a la última ejecutada. |
| **RI** (Instrucción) | `1234` | Última instrucción cargada (`BIF 234`). |

### Registros de Interfaz (Último ciclo Fetch)
| Componente | Valor Final (Hex) | Observación |
| :--- | :--- | :--- |
| **RM** (Direcciones) | `023A` | Dirección de la última instrucción leída. |
| **RDM** (Datos) | `1234` | Dato leído de la dirección 23A. |

### Memoria Modificada
| Dirección | Valor Final (Hex) | Descripción |
| :--- | :--- | :--- |
| **200** | `0004` | Acumulado del bucle (2 iteraciones * 2). |
| **202** | `0000` | Contador incrementado hasta cero. |
