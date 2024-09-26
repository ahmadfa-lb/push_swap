/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   push_swap.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: afarachi <afarachi@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/07/27 10:16:01 by afarachi          #+#    #+#             */
/*   Updated: 2024/08/10 12:44:40 by afarachi         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "push_swap.h"

void	last_free(t_stack_node *a, char **split_argv)
{
	free_stack(&a);
	if (split_argv)
		free_split(split_argv);
}

void	parse_arguments(int argc, char ***argv, char ***split_argv)
{
	if (argc == 2)
	{
		*split_argv = split((*argv)[1], ' ');
		*argv = *split_argv;
	}
}

int	main(int argc, char **argv)
{
	t_stack_node	*a;
	t_stack_node	*b;
	char			**split_argv;

	a = NULL;
	b = NULL;
	split_argv = NULL;
	if (argc == 1 || (argc == 2 && !argv[1][0]))
		return (1);
	parse_arguments(argc, &argv, &split_argv);
	init_stack_a(&a, argv + 1, split_argv);
	if (!stack_sorted(a))
	{
		if (stack_len(a) == 2)
			sa(&a, false);
		else if (stack_len(a) == 3)
			sort_three(&a);
		else
			sort_stacks(&a, &b);
	}
	last_free(a, split_argv);
	return (0);
}
