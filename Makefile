##
## EPITECH PROJECT, 2021
## task01
## File description:
## D10
##

SRC		=	Main.hs 							\
			src/tree/Tree.hs 					\
			src/error/Exit.hs					\
			src/pushswap/PushswapFunctions.hs	\
			src/checker/Checker.hs

NAME	=	pushswap_checker

all:	$(NAME)

FLAGS = -Wall -O

$(NAME):
	ghc -o $(NAME) $(SRC) $(FLAGS)

clean:
	find . -name "*.hi" -delete
	find . -name "*.o" -delete

fclean: clean
	rm -f $(NAME)

re:	fclean all

.PHONY: re fclean clean all
