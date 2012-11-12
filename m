From: Maarten Lankhorst <m.b.lankhorst@gmail.com>
Subject: Re: [PATCH] ARM: EXYNOS: use BUG_ON where possible
Date: Mon, 12 Nov 2012 16:12:29 +0100
Message-ID: <50A111DD.6080504@gmail.com>
References: <1352406191-14303-1-git-send-email-sasha.levin@oracle.com> <1352406191-14303-5-git-send-email-sasha.levin@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f174.google.com ([209.85.217.174]:51599 "EHLO
	mail-lb0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753620Ab2KLPMf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Nov 2012 10:12:35 -0500
In-Reply-To: <1352406191-14303-5-git-send-email-sasha.levin@oracle.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sasha Levin <sasha.levin@oracle.com>
Cc: linux-kernel@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Op 08-11-12 21:23, Sasha Levin schreef:
> Just use BUG_ON() instead of constructions such as:
>
> 	if (...)
> 		BUG()
>
> A simplified version of the semantic patch that makes this transformation
> is as follows: (http://coccinelle.lip6.fr/)
>
> // <smpl>
> @@
> expression e;
> @@
> - if (e) BUG();
> + BUG_ON(e);
> // </smpl>
>
> Signed-off-by: Sasha Levin <sasha.levin@oracle.com>
> ---
>  arch/arm/mach-exynos/common.c |    6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/common.c
> index 4e577f6..6a55a5a 100644
> --- a/arch/arm/mach-exynos/common.c
> +++ b/arch/arm/mach-exynos/common.c
> @@ -465,10 +465,8 @@ static void __init combiner_cascade_irq(unsigned int combiner_nr, unsigned int i
>  	else
>  		max_nr = EXYNOS4_MAX_COMBINER_NR;
>  
> -	if (combiner_nr >= max_nr)
> -		BUG();
> -	if (irq_set_handler_data(irq, &combiner_data[combiner_nr]) != 0)
> -		BUG();
> +	BUG_ON(combiner_nr >= max_nr);
> +	BUG_ON(irq_set_handler_data(irq, &combiner_data[combiner_nr]) != 0);
Is it really a good idea to put functions that perform work in a BUG_ON?
I don't know, but for some reason it just feels wrong. I'd expect code to
compile fine if BUG_ON was a noop, so doing verification calls only, not
actual work..

~Maarten
