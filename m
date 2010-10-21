From: Ben Dooks <ben-linux@fluff.org>
Subject: Re: [PATCH 1/5] ARM: S5P6442: Add DMA operation clock
Date: Thu, 21 Oct 2010 23:22:11 +0100
Message-ID: <4CC0BD13.5060303@fluff.org>
References: <1287622713-1657-1-git-send-email-kgene.kim@samsung.com> <1287622713-1657-2-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from dsl78-143-211-26.in-addr.fast.co.uk ([78.143.211.26]:57316 "EHLO
	ben-laptop" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751149Ab0JUWWN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 Oct 2010 18:22:13 -0400
In-Reply-To: <1287622713-1657-2-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, Seungwhan Youn <sw.youn@samsung.com>

On 21/10/10 01:58, Kukjin Kim wrote:
> From: Seungwhan Youn <sw.youn@samsung.com>
> 
> This patch adds DMA operation clock which is disabled as default.
> 
> Signed-off-by: Seungwhan Youn <sw.youn@samsung.com>
> Acked-by: Jassi Brar <jassi.brar@samsung.com>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
>  arch/arm/mach-s5p6442/clock.c                   |   28 +++++++++++++++++++++++
>  arch/arm/mach-s5p6442/include/mach/regs-clock.h |    1 +
>  2 files changed, 29 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-s5p6442/clock.c b/arch/arm/mach-s5p6442/clock.c
> index dcd20f1..16d6e7e 100644
> --- a/arch/arm/mach-s5p6442/clock.c
> +++ b/arch/arm/mach-s5p6442/clock.c
> @@ -192,6 +192,11 @@ static struct clk clk_pclkd1 = {
>  	.parent		= &clk_hclkd1,
>  };
>  
> +int s5p6442_clk_ip0_ctrl(struct clk *clk, int enable)
> +{
> +	return s5p_gatectrl(S5P_CLKGATE_IP0, clk, enable);
> +}
> +
>  int s5p6442_clk_ip3_ctrl(struct clk *clk, int enable)
>  {
>  	return s5p_gatectrl(S5P_CLKGATE_IP3, clk, enable);
> @@ -335,6 +340,16 @@ void __init_or_cpufreq s5p6442_setup_clocks(void)
>  	clk_pclkd1.rate = pclkd1;
>  }
>  
> +static struct clk init_clocks_disable[] = {
> +	{
> +		.name		= "pdma",
> +		.id		= -1,
> +		.parent		= &clk_pclkd1,
> +		.enable		= s5p6442_clk_ip0_ctrl,
> +		.ctrlbit	= (1 << 3),
> +	},
> +};
> +
>  static struct clk init_clocks[] = {
>  	{
>  		.name		= "systimer",
> @@ -393,10 +408,23 @@ static struct clk *clks[] __initdata = {
>  
>  void __init s5p6442_register_clocks(void)
>  {
> +	struct clk *clkptr;
> +	int i, ret;
> +
>  	s3c24xx_register_clocks(clks, ARRAY_SIZE(clks));
>  
>  	s3c_register_clksrc(clksrcs, ARRAY_SIZE(clksrcs));
>  	s3c_register_clocks(init_clocks, ARRAY_SIZE(init_clocks));
>  
> +	clkptr = init_clocks_disable;
> +	for (i = 0; i < ARRAY_SIZE(init_clocks_disable); i++, clkptr++) {
> +		ret = s3c24xx_register_clock(clkptr);
> +		if (ret < 0) {
> +			printk(KERN_ERR "Fail to register clock %s (%d)\n",
> +					clkptr->name, ret);
> +		} else
> +			(clkptr->enable)(clkptr, 0);
> +	}

how about using s3c_register_clocks and then s3c_disable_clocks() ?
