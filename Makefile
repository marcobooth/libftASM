# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mbooth <mbooth@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/02/24 17:06:05 by mbooth            #+#    #+#              #
#    Updated: 2015/04/05 16:16:28 by mbooth           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME		=	libfts.a

CFLAGS		=	-f macho64

OBJ_LIB		=	$(SRC_LIB:.s=.o)

all:		$(NAME)

SRC_LIB =		ft_bzero.s	 \
				ft_isalnum.s \
				ft_isalpha.s \
				ft_isascii.s \
				ft_isdigit.s \
				ft_isprint.s \
				ft_toupper.s \
				ft_tolower.s \
				ft_puts.s	 \
				ft_strcat.s	 \
				ft_strlen.s \
				ft_memcpy.s \
				ft_memset.s \
				ft_strdup.s \
				ft_cat.s \

$(NAME):	$(OBJ_LIB)
	@ar -rc $(NAME) $(OBJ_LIB)
	@ranlib $(NAME)


%.o:		%.s
	@~/.brew/bin/nasm $(CFLAGS) -s $< -o $@

clean:
	@/bin/rm -f $(OBJ_LIB)

fclean:		clean
	@/bin/rm -f $(NAME)

re:			fclean all

test:		re
	@gcc -Wl,-no_pie $(NAME) main.c
	@./a.out


.PHONY:		all re fclean clean test
