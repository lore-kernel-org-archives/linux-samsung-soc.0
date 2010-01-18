From: Ben Dooks <ben-linux@fluff.org>
Subject: Re: [PATCH] ARM: SAMSUNG: s3c_set_clksrc returns for single parent
	clock.
Date: Mon, 18 Jan 2010 01:10:28 +0000
Message-ID: <20100118011028.GC10014@trinity.fluff.org>
References: <1263775097-16062-1-git-send-email-thomas.ab@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:53586 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755578Ab0ARBKa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 17 Jan 2010 20:10:30 -0500
Content-Disposition: inline
In-Reply-To: <1263775097-16062-1-git-send-email-thomas.ab@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.ab@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

On Mon, Jan 18, 2010 at 09:38:17AM +0900, Thomas Abraham wrote:
> The function s3c_set_clksrc should return if the clksrc_clk clock has
> only one possible parent clock.

Does this actually relate to a real bug or is this something that you've
come across whilst reading the code?

>From arch/arm/plat-samnsung/clock-clksrc.c:

   181                          if (!clksrc->reg_div.reg)
   182                                  clksrc->clk.ops = &clksrc_ops_nodiv;
   183                          else if (!clksrc->reg_src.reg)
   184                                  clksrc->clk.ops = &clksrc_ops_nosrc;
   185                          else
   186                                  clksrc->clk.ops = &clksrc_ops;

So we change the ops dependant on which register(s) we have availalbe.
 
> Signed-of-by:  Thomas Abraham <thomas.ab@samsung.com>
> ---
>  arch/arm/plat-samsung/clock-clksrc.c |    5 +++--
>  1 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/plat-samsung/clock-clksrc.c b/arch/arm/plat-samsung/clock-clksrc.c
> index 33c633a..80da4c4 100644
> --- a/arch/arm/plat-samsung/clock-clksrc.c
> +++ b/arch/arm/plat-samsung/clock-clksrc.c
> @@ -131,9 +131,10 @@ void __init_or_cpufreq s3c_set_clksrc(struct clksrc_clk *clk, bool announce)
>  	u32 mask = bit_mask(clk->reg_src.shift, clk->reg_src.size);
>  	u32 clksrc = 0;
>  
> -	if (clk->reg_src.reg)
> -		clksrc = __raw_readl(clk->reg_src.reg);
> +	if (!clk->reg_src.reg)
> +		return;
>  
> +	clksrc = __raw_readl(clk->reg_src.reg);
>  	clksrc &= mask;
>  	clksrc >>= clk->reg_src.shift;
>  
> -- 
> 1.6.3.3
> 

-- 
-- 
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.
