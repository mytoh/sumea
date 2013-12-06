

(define-module sumea
  (export fuzzy-match)

  (use srfi-13)

  (begin

    (define (find-char char string)
      (let ((i (string-index string char)))
        (if i
          (string-drop string i)
          #f)))

    (define (find-char-all clist target)
      (if (null? clist)
        target
        (if (find-char (car clist) target)
          (find-char-all (cdr clist) target)
          #f)))

    (define (fuzzy-match string target)
      (let ((clist (string->list string)))
        (if (find-char-all clist target)
          target
          #f)))

    ))
