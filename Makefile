##
## EPITECH PROJECT, 2018
## ASM - MiniLibC
## File description:
## Makefile for MiniLibC
##

NAME	=	libasm.so

CC		=	ld

ASM		=	nasm

ASFLAGS	=	-Wall -f elf64

CFLAGS	=	-fPIC -shared

SRCS	=	./src/strlen.asm	\

OBJS	=	$(SRCS:.asm=.o)

all: $(NAME)

$(NAME): $(OBJS)
	$(CC) $(CFLAGS) $^ -o $(NAME)

%.o: %.asm
	$(ASM) $(ASFLAGS) $< -o $@

clean:
	$(RM) $(OBJS)

fclean: clean
	$(RM) $(NAME)

re: fclean all

.PHONY: all clean fclean re
