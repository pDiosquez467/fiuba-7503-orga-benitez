
@ PRE: El valor contenido en la celda (250) (16) debe ser
distinto de cero.

DIR | CONT | OBS.

4FE | #### | OPUESTO DE (250)
4FF | 0001 | CTE = 1 (10)

500 | 0000 | (AC)  = 0000
501 | 2300 | (300) = 0000

-- Copia defensiva --
502 | 1150 | (AC)  = (150)
503 | 2301 | (301) = (150)

504 | 1250 | (AC)  = (250)
505 | 4000 | (AC)  = NOT[(250)]
506 | 34FF | (AC)  = -(250)
507 | 24FE | (4FE) = -(250)

508 | 1301 | (AC)  = (301)
509 | 34FE | (AC)  = (301) - (4FE)
50A | 7511 | BIF. SI (AC) < 0
50B | 2301 | (301) = (301) - (4FE)
50C | 0001 | (AC)  = 0001
50D | 3300 | (AC)  = (300) + 1
50E | 2300 | (300)++
50F | 0000 | (AC) = 0000
510 | 5508 | BIF. INCONDICIONAL
511 | F000 | FIN 
 
