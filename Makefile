##
## EPITECH PROJECT, 2018
## ASM - MiniLibC
## File description:
## Makefile for MiniLibC
##

NAME		=	libasm.so

NAME_TEST	=	unit_test

CC			=	gcc

ASM			=	nasm

ASMFLAGS	=	-Wall -f elf64

CFLAGS		=	-fPIC -shared

SRCS_TEST	=	./test/strlen_test.c	\

SRCS		=	./src/strlen.asm	\
				./src/strchr.asm	\
				./src/memset.asm	\
				./src/memcopy.asm	\
				./src/strcmp.asm	\
				./src/memmove.asm	\
				./src/rindex.asm	\

LDFLAGS_TEST	=	-L. -lasm -lcriterion

OBJS_TEST	=	$(SRCS_TEST:.c=.o)

OBJS		=	$(SRCS:.asm=.o)

all: $(NAME)

$(NAME): $(OBJS)
	$(LD) $(CFLAGS) $^ -o $(NAME)

%.o: %.asm
	@printf "[\033[0;32mcompiled\033[0m] % 29s\n" $< | tr ' ' '.'
	$(ASM) -o $@ $< $(ASMFLAGS)

generate_coverage: tests_run
	@lcov --directory . -c -o rapport.info
	@genhtml -o ../rapport -t "Coverage of tests" rapport.info

tests_run: $(NAME) $(OBJS_TEST)
	$(CC) $(SRCS_TEST) --coverage -o $(NAME_TEST) $(LDFLAGS_TEST)
	./unit_test -j1 --always-succeed

clean:
	@printf "[\033[0;32mRemoved\033[0m] % 29s\n" "*.gcda && *.gcno" | tr ' ' '.'
	@find -name "*.gcda" -delete -o -name "*.gcno" -delete
	@printf "[\033[0;32mRemoved\033[0m] % 29s\n" $(OBJS_TEST) | tr ' ' '.'
	@$(RM) $(OBJS_TEST)
	@printf "[\033[0;32mRemoved\033[0m] % 29s\n" $(OBJS) | tr ' ' '.'
	@$(RM) $(OBJS)

fclean: clean
	@$(RM) $(NAME_TEST)
	@$(RM) $(NAME)

re: fclean all

.PHONY: all clean fclean re
