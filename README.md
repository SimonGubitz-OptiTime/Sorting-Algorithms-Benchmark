# Sorting Algorithm Benchmark

## Ziele

1. Größe eingeben
2. Zufällig füllen (auf Knopfdruck)
3. Startknopf
4. Alle Sortierverfahren nacheinander und Zeit messen

## Implementierte Algorithmen

- [x] bubblesort
- [ ] heapsort
- [x] insertion-sort
- [x] mergesort
- [x] quicksort
- [x] selection-sort

## Wie kann man es ausführen?

### Option 1

`test` in der CLI mit [FPC](https://www.freepascal.org)

`make run`

### Option 2

`Main` mit Delphi und der Embarcadero RAD Studio

## Output

```bash
-- Quicksort --
- For 100000 Elements
- Time: 387ms
- Read Accesses: 328338
- Write Accesses: 28338
- Total Array Accesses: 356676 <- Write + Read
```

## Technische Überlegungen

### TArray oder TList

Beide Varianten wurden getestet, und bei einer Liste mit 10000 Elementen konnte ein

- TList: ~140ms
- TArray: ~15ms

Unterschied beobachtet werden.

### TBenchmarkArray

Um den Array Read & Write Access zu zählen, wurde eine eigene TBenchmarkArray Klasse, wobei der default-access mit `[]` praktisch overloaded wurde, und ein Counter in die `Getter`und `Setter` Funktionen implementiert wurde.
