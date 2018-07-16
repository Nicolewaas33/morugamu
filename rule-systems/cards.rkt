#lang racket

(provide render-example
         render-symbols)

(require 2htdp/image)
(require racket-bricks/renderer)
(require (rename-in "./card-designs.rkt"
                    [render-symbol design-1]))

(require "../util/config.rkt")



(define (example->image-list e (render-symbol design-1))
  (cond [(not (list? e)) (render-symbol e)]
        [(not (ormap list? e)) (map render-symbol e)]
        [(map example->image-list e)]))



(define (render-symbols)
  (define clear (color 0 0 0 0))
  (render-bricks 10
                 clear
                 clear
                 clear
                 
                 clear ;(pen clear 1 "solid" "butt" "bevel")
                 clear
                 clear
                 clear
                 clear
                 ;( CURSOR-COLOR "red")
                 ;( CONTAINER rectangle)
                 #:container-padding 0
                 #:container-padding-left 20
                 #:cursor (circle 5 "solid" "red")
                 #:show-parens? (list lparen rparen)
                 ))

(define (render-example e)
  ((render-symbols)
   (example->image-list e)))

