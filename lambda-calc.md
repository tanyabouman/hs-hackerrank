# Lambda Calculus

## Lambda Calculus - Reductions #2
((λx.((λy.(x y))x))(λz.w))

((λy.((λz.w) y))(λz.w))

((λy.((λz.w) y))(λz.w))

(λz.w) (λz.w)





(λx.(x x))(λz.w))

(λz.w) (λz.w)

w

## Lambda Calculus - Reductions #4
(λg.((λf.((λx.(f (x x)))(λx.(f (x x))))) g))

(λg.(((λx.(g (x x)))(λx.(g (x x))))))

CAN'T REDUCE

## Lambda Calculus - Evaluating Expressions #1
(λx.x+1)3

3+1

4

## Lambda Calculus - Evaluating Expressions #2
(λx.x+1)((λy.y+2)3)

(λx.x+1)(3+2)

(λx.x+1)5

5+1

6
