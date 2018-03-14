##
## EPITECH PROJECT, 2018
## ASM - MiniLibC
## File description:
## Makefile for MiniLibC
##

NAME	=	libasm.so

NAME_TEST	=	unit_test

CC		=	gcc

ASM		=	nasm

ASFLAGS	=	-Wall -f elf64

CFLAGS	=	-fPIC -shared

SRCS_TEST	=	./test/strlen_test.c	\

SRCS	=	./src/strlen.asm	\

LDFLAGS_TEST	=	-lcriterion -L. -lasm

OBJS_TEST	=	$(SRCS_TEST:.c=.o)

OBJS	=	$(SRCS:.asm=.o)

all: $(NAME)

$(NAME): $(OBJS)
	$(LD) $(CFLAGS) $^ -o $(NAME)

%.o: %.asm
	$(ASM) $(ASFLAGS) $< -o $@

tests_run: $(NAME) $(OBJS_TEST)
	$(CC) $(OBJS_TEST) $(LDFLAGS_TEST) -o $(NAME_TEST)
	./unit_test -j1 --always-succeed

clean:
	$(RM) $(OBJS)

fclean: clean
	$(RM) $(NAME_TEST)
	$(RM) $(NAME)

re: fclean all

.PHONY: all clean fclean re
