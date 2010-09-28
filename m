From: Ben Dooks <ben@trinity.fluff.org>
Subject: Re: [PATCH] ARM: S5PC100: Bug fix EPLL_CON MASK settings
Date: Wed, 29 Sep 2010 00:05:56 +0100
Message-ID: <20100928230556.GO27885@trinity.fluff.org>
References: <1285665804-8922-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:39262 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754242Ab0I1XF6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 28 Sep 2010 19:05:58 -0400
Content-Disposition: inline
In-Reply-To: <1285665804-8922-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, Seungwhan Youn <sw.youn@samsung.com>

On Tue, Sep 28, 2010 at 06:23:24PM +0900, Kukjin Kim wrote:
> From: Seungwhan Youn <sw.youn@samsung.com>
> 
> This patch fixes EPLL_CON MASK settings which did not contain its
> shift values when set epll rate on S5PC100.
> 
> Signed-off-by: Seungwhan Youn <sw.youn@samsung.com>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
>  arch/arm/mach-s5pc100/clock.c |    4 +++-
>  1 files changed, 3 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/arm/mach-s5pc100/clock.c b/arch/arm/mach-s5pc100/clock.c
> index 084abd1..ff125b4 100644
> --- a/arch/arm/mach-s5pc100/clock.c
> +++ b/arch/arm/mach-s5pc100/clock.c
> @@ -323,7 +323,9 @@ static int s5pc100_epll_set_rate(struct clk *clk, unsigned long rate)
>  
>  	epll_con = __raw_readl(S5P_EPLL_CON);
>  
> -	epll_con &= ~(PLL65XX_MDIV_MASK | PLL65XX_PDIV_MASK | PLL65XX_SDIV_MASK);
> +	epll_con &= ~((PLL65XX_MDIV_MASK << PLL65XX_MDIV_SHIFT) |
> +		      (PLL65XX_PDIV_MASK << PLL65XX_PDIV_SHIFT) |
> +		      (PLL65XX_SDIV_MASK << PLL65XX_SDIV_SHIFT));

you know, it'd probably be easier to calculatet what you need to keep
from this register.

-- 
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.
