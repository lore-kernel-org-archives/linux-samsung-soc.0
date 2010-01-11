From: Ben Dooks <ben-linux@fluff.org>
Subject: Re: [PATCH 2/3] ARM: SAMSUNG: Make clk_default_setrate and
	clk_ops_def_setrate visible
Date: Mon, 11 Jan 2010 06:12:12 +0000
Message-ID: <20100111061212.GC3738@trinity.fluff.org>
References: <1263180113-31605-1-git-send-email-kgene.kim@samsung.com> <1263180113-31605-2-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:59647 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750899Ab0AKGMR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 Jan 2010 01:12:17 -0500
Content-Disposition: inline
In-Reply-To: <1263180113-31605-2-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, Adityapratap Sharma <aditya.ps@samsung.com>, Thomas Abraham <thomas.ab@samsung.com>, Atul Dahiya <atul.dahiya@samsung.com>

On Mon, Jan 11, 2010 at 12:21:52PM +0900, Kukjin Kim wrote:
> This patch makes clk_default_setrate and clk_ops_def_setrate available
> to code outside plat-samsung clock code.
> 
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> Signed-off-by: Adityapratap Sharma <aditya.ps@samsung.com>
> Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
> Signed-off-by: Atul Dahiya <atul.dahiya@samsung.com>
> ---
>  arch/arm/plat-samsung/clock.c              |    4 ++--
>  arch/arm/plat-samsung/include/plat/clock.h |    3 +++
>  2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/plat-samsung/clock.c b/arch/arm/plat-samsung/clock.c
> index 9194af9..0c746ae 100644
> --- a/arch/arm/plat-samsung/clock.c
> +++ b/arch/arm/plat-samsung/clock.c
> @@ -225,13 +225,13 @@ EXPORT_SYMBOL(clk_set_parent);
>  
>  /* base clocks */
>  
> -static int clk_default_setrate(struct clk *clk, unsigned long rate)
> +int clk_default_setrate(struct clk *clk, unsigned long rate)
>  {
>  	clk->rate = rate;
>  	return 0;
>  }
>  
> -static struct clk_ops clk_ops_def_setrate = {
> +struct clk_ops clk_ops_def_setrate = {
>  	.set_rate	= clk_default_setrate,
>  };
>  
> diff --git a/arch/arm/plat-samsung/include/plat/clock.h b/arch/arm/plat-samsung/include/plat/clock.h
> index bd41f82..22e0114 100644
> --- a/arch/arm/plat-samsung/include/plat/clock.h
> +++ b/arch/arm/plat-samsung/include/plat/clock.h
> @@ -75,6 +75,9 @@ extern struct clk clk_h2;
>  extern struct clk clk_27m;
>  extern struct clk clk_48m;
>  
> +extern int clk_default_setrate(struct clk *clk, unsigned long rate);
> +extern struct clk_ops clk_ops_def_setrate;
> +
>  /* exports for arch/arm/mach-s3c2410
>   *
>   * Please DO NOT use these outside of arch/arm/mach-s3c2410
> -- 
> 1.6.2.5

ok, this looks fine, will apply.


-- 
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.
