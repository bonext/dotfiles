#lang pollen
◊(define (c rrggbb) (format "#~a" rrggbb))

window {
    background-color: ◊(c base00);
}

label {
    color: ◊(c base05);
}

entry {
    border-color: ◊(c base00);
    background-color: ◊(c base01);
    color: ◊(c base05);
}

button {
}
