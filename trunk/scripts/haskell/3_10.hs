import IO

main = do	
	mylist <- askForNumbers
	putStrLn (show (sum mylist))
	putStrLn (show (product mylist))
	showFact mylist

askForNumbers = do
	putStrLn "Give me a number (or 0 to stop):"
	input <- getLine
	let number = read input
	if number == 0
		then return []
		else do 
			rest <- askForNumbers 
			return (number : rest)

showFact [] = return ()
showFact (x:xs) = do
	putStrLn (show x ++ " " ++ show (factorial x))
	showFact xs

factorial 1=1
factorial n=n*factorial(n-1)
