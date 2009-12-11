From: Marc Zyngier <maz@misterjones.org>
Subject: Re: [PATCH 3/7] ARM: S5P6440: Clock and PLL support
Date: Fri, 11 Dec 2009 11:35:12 +0100
Message-ID: <20091211113512.4c7d5b1e@life-in-the-fast-lane>
References: <1260525271-4194-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from inca-roads.misterjones.org ([213.251.177.50]:36687 "EHLO
	inca-roads.misterjones.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754156AbZLKKgI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 11 Dec 2009 05:36:08 -0500
In-Reply-To: <1260525271-4194-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, Kukjin Kim <kgene.kim@samsung.com>, Adityapratap Sharma <aditya.ps@samsung.com>, Thomas Abraham <thomas.ab@samsung.com>, Atul Dahiya <atul.dahiya@samsung.com>

On Fri, 11 Dec 2009 18:54:31 +0900
Kukjin Kim <kgene.kim@samsung.com> wrote:

A few problems spotted here:

> +static struct clk init_clocks_disable[] = {
> +	{
> +		.name		= "nand",
> +		.id		= -1,
> +		.parent		= &clk_h,
> +		.enable		= s5p6440_mem_ctrl,
> +		.ctrlbit	= S5P_CLKCON_MEM0_HCLK_NFCON,
> +	}, {
> +		.name		= "adc",
> +		.id		= -1,
> +		.parent		= &clk_p,
> +		.enable		= s5p6440_pclk_ctrl,
> +		.ctrlbit	= S5P_CLKCON_PCLK_TSADC,
> +	}, {
> +		.name		= "i2c",
> +		.id		= -1,
> +		.parent		= &clk_p,
> +		.enable		= s5p6440_pclk_ctrl,
> +		.ctrlbit	= S5P_CLKCON_PCLK_IIC0,
> +	}, {
> +		.name		= "i2s_v40",
> +		.id		= 0,
> +		.parent		= &clk_p,
> +		.enable		= s5p6440_pclk_ctrl,
> +		.ctrlbit	= S5P_CLKCON_PCLK_IIS2,
> +	}, {
> +		.name		= "spi",
> +		.id		= 0,
> +		.parent		= &clk_p,
> +		.enable		= s5p6440_pclk_ctrl,
> +		.ctrlbit	= S5P_CLKCON_PCLK_SPI0,
> +	}, {
> +		.name		= "spi",
> +		.id		= 1,
> +		.parent		= &clk_p,
> +		.enable		= s5p6440_pclk_ctrl,
> +		.ctrlbit	= S5P_CLKCON_PCLK_SPI1,
> +	}, {
> +		.name		= "sclk_spi_48",
> +		.id		= 0,
> +		.parent		= &clk_48m,
> +		.enable		= s5p6440_sclk_ctrl,
> +		.ctrlbit	= S5P_CLKCON_SCLK0_SPI0_48,
> +	}, {
> +		.name		= "sclk_spi_48",
> +		.id		= 1,
> +		.parent		= &clk_48m,
> +		.enable		= s5p6440_sclk_ctrl,
> +		.ctrlbit	= S5P_CLKCON_SCLK0_SPI1_48,
> +	}, {
> +		.name		= "48m",
> +		.id		= 0,
> +		.parent		= &clk_48m,
> +		.enable		= s5p6440_sclk_ctrl,
> +		.ctrlbit	= S5P_CLKCON_SCLK0_MMC0_48,
> +	}, {
> +		.name		= "48m",
> +		.id		= 1,
> +		.parent		= &clk_48m,
> +		.enable		= s5p6440_sclk_ctrl,
> +		.ctrlbit	= S5P_CLKCON_SCLK0_MMC1_48,
> +	}, {
> +		.name		= "48m",
> +		.id		= 2,
> +		.parent		= &clk_48m,
> +		.enable		= s5p6440_sclk_ctrl,
> +		.ctrlbit	= S5P_CLKCON_SCLK0_MMC2_48,
> +	}, {
> +		.name    	= "otg",
> +		.id	   	= -1,
> +		.parent  	= &clk_h,
> +		.enable  	= s5p6440_hclk0_ctrl,
> +		.ctrlbit 	= S5P_CLKCON_HCLK0_USB
> +	}, {
> +		.name    	= "post",
> +		.id	   	= -1,
> +		.parent  	= &clk_h,
> +		.enable  	= s5p6440_hclk0_ctrl,
> +		.ctrlbit 	= S5P_CLKCON_HCLK0_POST0
> +	}, {
> +		.name		= "lcd",
> +		.id		= -1,
> +		.parent		= &clk_h,
> +		.enable		= s5p6440_hclk1_ctrl,
> +		.ctrlbit	= S5P_CLKCON_HCLK1_DISPCON,
> +	}, {
> +		.name		= "hsmmc",
> +		.id		= 0,
> +		.parent		= &clk_h,
> +		.enable		= s5p6440_hclk0_ctrl,
> +		.ctrlbit	= S5P_CLKCON_HCLK0_HSMMC0,
> +	}, {
> +		.name		= "hsmmc",
> +		.id		= 1,
> +		.parent		= &clk_h,
> +		.enable		= s5p6440_hclk0_ctrl,
> +		.ctrlbit	= S5P_CLKCON_HCLK0_HSMMC1,
> +	}, {
> +		.name		= "hsmmc",
> +		.id		= 2,
> +		.parent		= &clk_h,
> +		.enable		= s5p6440_hclk0_ctrl,
> +		.ctrlbit	= S5P_CLKCON_HCLK0_HSMMC2,
> +	}, {
> +		.name		= "rtc",
> +		.id		= -1,
> +		.parent		= &clk_p,
> +		.enable		= s5p6440_pclk_ctrl,
> +		.ctrlbit	= S5P_CLKCON_PCLK_RTC,
> +	}, {
> +		.name		= "watchdog",
> +		.id		= -1,
> +		.parent		= &clk_p,
> +		.enable		= s5p6440_pclk_ctrl,
> +		.ctrlbit	= S5P_CLKCON_PCLK_WDT,
> +	}
> +};
>
> +/*
> + * The following clocks will be enabled during clock initialization.
> + */
> +static struct clk init_clocks[] = {
> +	{
> +		.name		= "gpio",
> +		.id		= -1,
> +		.parent		= &clk_p,
> +		.enable		= s5p6440_pclk_ctrl,
> +		.ctrlbit	= S5P_CLKCON_PCLK_GPIO,
> +	}, {
> +		.name		= "timers",
> +		.id		= -1,
> +		.parent		= &clk_p,
> +		.enable		= s5p6440_pclk_ctrl,
> +		.ctrlbit	= S5P_CLKCON_PCLK_PWM,
> +	}, {
> +		.name		= "uart",
> +		.id		= 0,
> +		.parent		= &clk_p,
> +		.enable		= s5p6440_pclk_ctrl,
> +		.ctrlbit	= S5P_CLKCON_PCLK_UART0,
> +	}, {
> +		.name		= "uart",
> +		.id		= 1,
> +		.parent		= &clk_p,
> +		.enable		= s5p6440_pclk_ctrl,
> +		.ctrlbit	= S5P_CLKCON_PCLK_UART1,
> +	}, {
> +		.name		= "uart",
> +		.id		= 2,
> +		.parent		= &clk_p,
> +		.enable		= s5p6440_pclk_ctrl,
> +		.ctrlbit	= S5P_CLKCON_PCLK_UART2,
> +	}, {
> +		.name		= "uart",
> +		.id		= 3,
> +		.parent		= &clk_p,
> +		.enable		= s5p6440_pclk_ctrl,
> +		.ctrlbit	= S5P_CLKCON_PCLK_UART3,
> +	}
> +};

The parent for most of these clocks are wrong. Looking at the user
manual, they are connected to the low frequency domain (PCLK_LOW or
HCLK_LOW). The parent must then be set to clk_p_low or clk_h_low.

Failure to do so leads to some "interesting" situations when HCLK and
HCLK_LOW have different rates...

> +void __init_or_cpufreq s5p6440_setup_clocks(void)
> +{
> +	struct clk *xtal_clk;
> +	unsigned long xtal;
> +	unsigned long fclk;
> +	unsigned long hclk;
> +	unsigned long hclk_low;
> +	unsigned long pclk;
> +	unsigned long pclk_low;
> +	unsigned long epll;
> +	unsigned long apll;
> +	unsigned long mpll;
> +	unsigned int ptr;
> +	u32 clkdiv0;
> +	u32 clkdiv3;
> +
> +	/* Set S5P6440 functions for clk_fout_epll */
> +	clk_fout_epll.enable = s5p6440_epll_enable;
> +	clk_fout_epll.ops = &s5p6440_epll_ops;
> +
> +	/* Set S5P6440 functions for arm clock */
> +	clk_arm.parent = &clk_mout_apll.clk;
> +	clk_arm.ops = &s5p6440_clkarm_ops;
> +
> +	clkdiv0 = __raw_readl(S5P_CLK_DIV0);
> +	clkdiv3 = __raw_readl(S5P_CLK_DIV3);
> +
> +	xtal_clk = clk_get(NULL, "ext_xtal");
> +	BUG_ON(IS_ERR(xtal_clk));
> +
> +	xtal = clk_get_rate(xtal_clk);
> +	clk_put(xtal_clk);
> +
> +	epll = s5p6440_get_epll(xtal);
> +	mpll = s5p_get_pll(xtal, __raw_readl(S5P_MPLL_CON));
> +	apll = s5p_get_pll(xtal, __raw_readl(S5P_APLL_CON));
> +
> +	printk(KERN_INFO "S5P6440: PLL settings, A=%ld.%ldMHz, M=%ld.%ldMHz," \
> +			" E=%ld.%ldMHz\n",
> +			print_mhz(apll), print_mhz(mpll), print_mhz(epll));
> +
> +	fclk = apll / GET_DIV(clkdiv0, S5P_CLKDIV0_ARM);
> +	hclk = fclk / GET_DIV(clkdiv0, S5P_CLKDIV0_HCLK);
> +	pclk = hclk / GET_DIV(clkdiv0, S5P_CLKDIV0_PCLK);
> +
> +	if (__raw_readl(S5P_OTHERS) & S5P_OTHERS_HCLK_LOW_SEL_MPLL) {
> +		/* Synchronous mode */
> +		hclk_low = apll / GET_DIV(clkdiv3, S5P_CLKDIV3_HCLK_LOW);
> +	} else {
> +		/* Asynchronous mode */
> +		hclk_low = mpll / GET_DIV(clkdiv3, S5P_CLKDIV3_HCLK_LOW);
> +	}

The test is inverted. S5P_OTHERS::S5P_OTHERS_HCLK_LOW_SEL_MPLL is set
when MPLL is the source clock for HCLK_LOW.

> +	pclk_low = hclk_low / GET_DIV(clkdiv3, S5P_CLKDIV3_PCLK_LOW);
> +
> +	printk(KERN_INFO "S5P6440: HCLK=%ld.%ldMHz, HCLK_LOW=%ld.%ldMHz," \
> +			" PCLK=%ld.%ldMHz, PCLK_LOW=%ld.%ldMHz\n",
> +			print_mhz(hclk), print_mhz(hclk_low),
> +			print_mhz(pclk), print_mhz(pclk_low));
> +
> +	clk_fout_mpll.rate = mpll;
> +	clk_fout_epll.rate = epll;
> +	clk_fout_apll.rate = apll;
> +
> +	clk_f.rate = fclk;
> +	clk_h.rate = hclk;
> +	clk_p.rate = pclk;
> +	clk_h_low.rate = hclk_low;
> +	clk_p_low.rate = pclk_low;
> +
> +	for (ptr = 0; ptr < ARRAY_SIZE(init_parents); ptr++)
> +		s3c_set_clksrc(init_parents[ptr]);
> +
> +	for (ptr = 0; ptr < ARRAY_SIZE(clksrcs); ptr++)
> +		s3c_set_clksrc(&clksrcs[ptr]);
> +}

-- 
Fast. Cheap. Reliable. Pick two.
