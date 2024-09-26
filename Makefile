# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: afarachi <afarachi@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/08/10 12:45:12 by afarachi          #+#    #+#              #
#    Updated: 2024/08/10 12:59:03 by afarachi         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME 			= push_swap
CC 				= cc
CFLAGS 			= -Wall -Wextra -Werror

FT_PRINTF_LIB 	= ft_printf/libftprintf.a
FT_PRINTF 		= ft_printf

SRCS 			=	push_swap.c \
					sort_stacks.c \
					error_handling.c \
					sort_algorithms.c \
					stack_rotations.c \
					stack_swap.c \
					init_a_to_b.c \
					stack_init.c \
					stack_utils.c \
					init_b_to_a.c \
					reverse_rotation.c \
					stack_push.c \
					string_split.c

	
OBJS 			= $(SRCS:.c=.o)

all: $(NAME)

$(NAME): $(OBJS)
	make -C $(FT_PRINTF)
	$(CC) $(CFLAGS) -o $(NAME) $(OBJS) $(FT_PRINTF_LIB)


.c.o:
	$(CC) $(CFLAGS) -c $< -o $(<:.c=.o)

clean:
	make -C $(FT_PRINTF) clean
	rm -f $(OBJS)

fclean:	clean
	make -C $(FT_PRINTF) fclean
	rm -f $(NAME)

re:	fclean all

.PHONY:	all clean fclean re