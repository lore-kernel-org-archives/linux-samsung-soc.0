From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: Samsung: gpio-interrupts: fix incorrect loop iterator
 usage
Date: Mon, 26 Sep 2011 13:34:01 +0900
Message-ID: <00d701cc7c05$84085100$8c18f300$%kim@samsung.com>
References: <1316703918-12247-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:35494 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750881Ab1IZEeD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 Sep 2011 00:34:03 -0400
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LS4000BG4ON9KL0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 26 Sep 2011 13:34:01 +0900 (KST)
Received: from kgenekim (12-23-120-114.csky.net [12.23.120.114])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LS400BEB4OPF2@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 26 Sep 2011 13:34:01 +0900 (KST)
In-reply-to: <1316703918-12247-1-git-send-email-m.szyprowski@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Marek Szyprowski' <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: 'Kyungmin Park' <kyungmin.park@samsung.com>

Marek Szyprowski wrote:
> 
> Loop iterator value after terminating list_for_each_entry() is not NULL.
> This patch fixes incorrect iterator usage in GPIO interrupt code for
> Samsung S5P platforms.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/plat-s5p/irq-gpioint.c |    9 +++++----
>  1 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/plat-s5p/irq-gpioint.c
b/arch/arm/plat-s5p/irq-gpioint.c
> index 0455519..a566523 100644
> --- a/arch/arm/plat-s5p/irq-gpioint.c
> +++ b/arch/arm/plat-s5p/irq-gpioint.c
> @@ -114,17 +114,18 @@ static __init int s5p_gpioint_add(struct
> samsung_gpio_chip *chip)
>  {
>  	static int used_gpioint_groups = 0;
>  	int group = chip->group;
> -	struct s5p_gpioint_bank *bank = NULL;
> +	struct s5p_gpioint_bank *b, *bank = NULL;
>  	struct irq_chip_generic *gc;
>  	struct irq_chip_type *ct;
> 
>  	if (used_gpioint_groups >= S5P_GPIOINT_GROUP_COUNT)
>  		return -ENOMEM;
> 
> -	list_for_each_entry(bank, &banks, list) {
> -		if (group >= bank->start &&
> -		    group < bank->start + bank->nr_groups)
> +	list_for_each_entry(b, &banks, list) {
> +		if (group >= b->start && group < b->start + b->nr_groups) {
> +			bank = b;
>  			break;
> +		}
>  	}
>  	if (!bank)
>  		return -EINVAL;
> --
> 1.7.1.569.g6f426

OK, applied.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
