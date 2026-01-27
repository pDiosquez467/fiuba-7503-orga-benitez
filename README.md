# 75.03 Organización del Computador - FIUBA

Este repositorio contiene la resolución de guías prácticas, ejercicios de programación en ensamblador y documentación teórica de la materia **Organización del Computador (75.03)** de la Facultad de Ingeniería de la Universidad de Buenos Aires (FIUBA).

## 🎯 Objetivos del Repositorio
El objetivo principal es profundizar en los conceptos fundamentales de la arquitectura de computadoras, con un fuerte énfasis en la **comparación de arquitecturas CISC vs. RISC**:

* **Programación Multi-Arquitectura:** Desarrollo de algoritmos tanto en **Intel x86** como en **ARM**.
* **Bajo Nivel:** Manejo directo de registros, memoria, pila (stack frames) e interrupciones.
* **Teoría de Arquitectura:** Comprensión del ciclo de instrucción, jerarquía de memoria y lógica digital.

## 📚 Temario y Contenido
El repositorio sigue el programa oficial de la materia (Cátedra Benítez), abarcando las siguientes unidades:

### 🔹 Unidad 1: Sistemas de Numeración y Formatos
* Conversión y aritmética en sistemas binario, octal y hexadecimal.
* Representación de enteros (C2, Signo-Valor, BCD) y Punto Flotante (IEEE 754).

### 🔹 Unidad 2 & 3: Máquina Elemental y Arquitectura (ISA)
* Arquitectura Von Neumann vs. Harvard.
* Ciclo de instrucción y DataPath.
* Simulaciones en máquinas hipotéticas (Abacus).

### 🔹 Unidad 4: Lenguaje Ensamblador (CISC vs RISC)
Esta es la sección central del repositorio, dividida en dos grandes bloques:
1.  **Intel x86 (CISC):**
    * Arquitectura IA-32.
    * Registros de propósito general y segmentos.
    * Manejo complejo de instrucciones y modos de direccionamiento.
2.  **ARM (RISC) - Laboratorio:**
    * Arquitectura ARM v7/v8.
    * Uso de registros (R0-R15), CPSR y subrutinas.
    * Interrupciones de Software (SWI).

### 🔹 Unidad 5 & 6: Componentes y Almacenamiento
* Comparativa de procesadores, Pipelining y SIMD.
* Jerarquía de Memoria (Caché, Virtual) y Almacenamiento (HDD, SSD, RAID).

---

## 🛠 Tecnologías y Herramientas

### Arquitectura ARM (RISC)
* **Lenguaje:** Assembly ARMv4/v5.
* **Herramienta:** ARMSim# (Simulador y Debugger).

### Arquitectura Intel x86 (CISC)
* **Lenguaje:** Assembly x86 (Sintaxis Intel).
* **Herramienta:** SASM / NASM (según entorno de prácticas).

---

## 📂 Estructura del Proyecto
* `/Guia_ARM`: Ejercicios y prácticas sobre arquitectura ARM.
* `/Guia_Intel_x86`: Ejercicios y prácticas sobre arquitectura Intel (Próximamente).
* `/Teoria`: Resúmenes y apuntes sobre sistemas de numeración y hardware.

---
*Repositorio mantenido con fines académicos y de portafolio profesional en arquitectura de computadoras y sistemas de bajo nivel.*
