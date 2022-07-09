/*
Q. Harry Potter and his friends are at Ollivander's with Ron, finally replacing Charlie's old broken wand.

Hermione decides the best way to choose is by determining the minimum number of gold galleons needed to buy each non-evil wand of high power and age. Write a query to print the id, age, coins_needed, and power of the wands that Ron's interested in, sorted in order of descending power. If more than one wand has same power, sort the result in order of descending age.
*\

SELECT 
    W.ID, P.AGE, W.COINS_NEEDED, W.POWER 
FROM 
    WANDS AS W 
INNER JOIN 
    WANDS_PROPERTY AS P ON W.CODE = P.CODE
WHERE 
    W.COINS_NEEDED = (SELECT 
                        MIN(COINS_NEEDED)
                      FROM 
                        WANDS W2 
                      INNER JOIN 
                        WANDS_PROPERTY P2 ON W2.CODE = P2.CODE 
                      WHERE 
                        P2.IS_EVIL = 0 AND 
                        P.AGE = P2.AGE AND 
                        W.POWER = W2.POWER)
ORDER BY 
    W.POWER DESC, P.AGE DESC;
