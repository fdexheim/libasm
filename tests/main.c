/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: fdexheim <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2018/10/31 14:59:48 by fdexheim          #+#    #+#             */
/*   Updated: 2018/11/09 14:54:28 by fdexheim         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../inc/libftasm.h"
#include <stddef.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>

int			main()
{
	int				lowcase = 'a';
	int				lowcase2 = 'z';

	int				upcase = 'a';
	int				upcase2 = 'Z';

	int				number = '0';
	int				number2 = '9';

	const char		*empty_string = "";
	const char		*short_string = "42";
	const char		*medium_string = "You there ! Let me bend your ear for a moment !";
	const char		*long_string = "Do you know where the deulist tradition came from, exile?\n\nThe Ezomytes.\n\nEarly on, those western potato munchers worked out that war was a pretty bloody stupid idea. At least the wholesale slaughter side of it. So they fashioned themselves a tradition of Championship.\n\nHere's how an Ezomyte battle would go. Both sides get dressed up in their fiercest and finest war garb. They'd all prance about, banging drums and flinging curses at each other. Then, when everyone was het up enough, a few chosen lads or lasses would step forward and fight it out...to the death usually.\n\nThe point of it all? My champions win, and I get to have that fish-filled estuary on my border. Your champions win, and I hand over a few hundred cows. Deal done, and most of us get to go home.\n\nThe Eternals pinched the idea from the Ezomytes, and the Oriathans pinched the idea from the Eternals.";

	char			receptacle[4096];
	char			receptacle2[4096];

	ft_puts("-------------------- TEST ft_cat --------------------");
	ft_bzero(receptacle, 4096);
	ft_puts("medium_string : ");
	ft_puts(medium_string);
	ft_puts("medium_string put in empty buffer : ");
	ft_strcat(receptacle, medium_string);
	ft_puts(receptacle);
	ft_puts("short string \"42\" put in buffer already filled with medium_string ");
	ft_strcat(receptacle, short_string);
	ft_puts(receptacle);

	ft_puts("-------------------- TEST ft_isalpha --------------------");
	ft_puts("Test 1 : 'a'\n Test 2 = 'z' Test3 = 'A' Test 4 = 'Z' Test 5 = '[' ");
	if (ft_isalpha(lowcase) != 0)
		ft_puts("Test 1 = alpha");
	else
		ft_puts("Test 1 = not alpha");

	int fd;
	fd = open("auteur", O_RDONLY);
	ft_cat(fd);

	return 0;
}
