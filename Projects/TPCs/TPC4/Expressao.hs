module Expressao
( Expr
, constante
, (|+|)
, (|*|)
, avalia
) where
data Expr = Value Int | MultiValueExpr Expr Char Expr

instance Eq Expr where
    (Value x) == (Value y) = x == y
    (Value x) == (MultiValueExpr expr1 op expr2) = x == (avalia $ MultiValueExpr expr1 op expr2)
    (MultiValueExpr expr1 op expr2) == (Value x) = x == (avalia $ MultiValueExpr expr1 op expr2)
    (MultiValueExpr expr1 op1 expr2) == (MultiValueExpr expr3 op2 expr4) = (avalia $ MultiValueExpr expr1 op1 expr2) == (avalia $ MultiValueExpr expr3 op2 expr4)
    
instance Show Expr where
    show = toString

toString :: Expr -> String
toString (Value x) = show x
toString (MultiValueExpr expr1 op expr2) = ['('] ++ toString expr1 ++ [' '] ++ [op] ++ [' '] ++ toString expr2 ++ [')']

constante :: Int -> Expr
constante x = Value x

charToOperation :: Char -> (Int -> Int -> Int)
charToOperation op
        | op == '+' = (+)
        | otherwise = (*)

(|+|) :: Expr -> Expr -> Expr
xs |+| ys = MultiValueExpr xs '+' ys

(|*|) :: Expr -> Expr -> Expr
xs |*| ys = MultiValueExpr xs '*' ys

avalia :: Expr -> Int
avalia (Value x) = x
avalia (MultiValueExpr expr1 op expr2) = charToOperation op (avalia expr1) (avalia expr2)
