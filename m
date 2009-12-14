From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 3/7] ARM: S5P6440: Clock and PLL support
Date: Mon, 14 Dec 2009 17:30:15 +0900
Message-ID: <000801ca7c97$a9e82630$fdb87290$%kim@samsung.com>
References: <1260525271-4194-1-git-send-email-kgene.kim@samsung.com>
 <20091211113512.4c7d5b1e@life-in-the-fast-lane>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:44982 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752301AbZLNI22 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Dec 2009 03:28:28 -0500
Received: from epmmp2 (mailout2.samsung.com [203.254.224.25])
 by mailout1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0KUM00HUDVJE15@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 14 Dec 2009 17:28:27 +0900 (KST)
Received: from kgenekim ([12.23.109.129])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0KUM00CA7VJDHW@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 14 Dec 2009 17:28:26 +0900 (KST)
In-reply-to: <20091211113512.4c7d5b1e@life-in-the-fast-lane>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Marc Zyngier' <maz@misterjones.org>
Cc: linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, 'Adityapratap Sharma' <aditya.ps@samsung.com>, 'Thomas Abraham' <thomas.ab@samsung.com>, 'Atul Dahiya' <atul.dahiya@samsung.com>


On Fri, Dec 11, 2009 at 19:35 +0900, Marc Zyngier wrote:
> -----Original Message-----
> From: linux-samsung-soc-owner@vger.kernel.org [mailto:linux-samsung-soc-
> owner@vger.kernel.org] On Behalf Of Marc Zyngier
> Sent: Friday, December 11, 2009 7:35 PM
> To: Kukjin Kim
> Cc: linux-samsung-soc@vger.kernel.org; ben-linux@fluff.org; Kukjin Kim;
> Adityapratap Sharma; Thomas Abraham; Atul Dahiya
> Subject: Re: [PATCH 3/7] ARM: S5P6440: Clock and PLL support
> 
> On Fri, 11 Dec 2009 18:54:31 +0900
> Kukjin Kim <kgene.kim@samsung.com> wrote:
> 
> A few problems spotted here:

Hi Marc Zyngier,

Ok.

> > +static struct clk init_clocks_disable[] = {
> > +	{
> > +		.name		= "nand",
> > +		.id		= -1,
> > +		.parent		= &clk_h,
> > +		.enable		= s5p6440_mem_ctrl,
> > +		.ctrlbit	= S5P_CLKCON_MEM0_HCLK_NFCON,
> > +	}, {
> > +		.name		= "adc",
> > +		.id		= -1,
> > +		.parent		= &clk_p,
> > +		.enable		= s5p6440_pclk_ctrl,
> > +		.ctrlbit	= S5P_CLKCON_PCLK_TSADC,
> > +	}, {
> > +		.name		= "i2c",
> > +		.id		= -1,
> > +		.parent		= &clk_p,
> > +		.enable		= s5p6440_pclk_ctrl,
> > +		.ctrlbit	= S5P_CLKCON_PCLK_IIC0,
> > +	}, {
> > +		.name		= "i2s_v40",
> > +		.id		= 0,
> > +		.parent		= &clk_p,
> > +		.enable		= s5p6440_pclk_ctrl,
> > +		.ctrlbit	= S5P_CLKCON_PCLK_IIS2,
> > +	}, {
> > +		.name		= "spi",
> > +		.id		= 0,
> > +		.parent		= &clk_p,
> > +		.enable		= s5p6440_pclk_ctrl,
> > +		.ctrlbit	= S5P_CLKCON_PCLK_SPI0,
> > +	}, {
> > +		.name		= "spi",
> > +		.id		= 1,
> > +		.parent		= &clk_p,
> > +		.enable		= s5p6440_pclk_ctrl,
> > +		.ctrlbit	= S5P_CLKCON_PCLK_SPI1,
> > +	}, {
> > +		.name		= "sclk_spi_48",
> > +		.id		= 0,
> > +		.parent		= &clk_48m,
> > +		.enable		= s5p6440_sclk_ctrl,
> > +		.ctrlbit	= S5P_CLKCON_SCLK0_SPI0_48,
> > +	}, {
> > +		.name		= "sclk_spi_48",
> > +		.id		= 1,
> > +		.parent		= &clk_48m,
> > +		.enable		= s5p6440_sclk_ctrl,
> > +		.ctrlbit	= S5P_CLKCON_SCLK0_SPI1_48,
> > +	}, {
> > +		.name		= "48m",
> > +		.id		= 0,
> > +		.parent		= &clk_48m,
> > +		.enable		= s5p6440_sclk_ctrl,
> > +		.ctrlbit	= S5P_CLKCON_SCLK0_MMC0_48,
> > +	}, {
> > +		.name		= "48m",
> > +		.id		= 1,
> > +		.parent		= &clk_48m,
> > +		.enable		= s5p6440_sclk_ctrl,
> > +		.ctrlbit	= S5P_CLKCON_SCLK0_MMC1_48,
> > +	}, {
> > +		.name		= "48m",
> > +		.id		= 2,
> > +		.parent		= &clk_48m,
> > +		.enable		= s5p6440_sclk_ctrl,
> > +		.ctrlbit	= S5P_CLKCON_SCLK0_MMC2_48,
> > +	}, {
> > +		.name    	= "otg",
> > +		.id	   	= -1,
> > +		.parent  	= &clk_h,
> > +		.enable  	= s5p6440_hclk0_ctrl,
> > +		.ctrlbit 	= S5P_CLKCON_HCLK0_USB
> > +	}, {
> > +		.name    	= "post",
> > +		.id	   	= -1,
> > +		.parent  	= &clk_h,
> > +		.enable  	= s5p6440_hclk0_ctrl,
> > +		.ctrlbit 	= S5P_CLKCON_HCLK0_POST0
> > +	}, {
> > +		.name		= "lcd",
> > +		.id		= -1,
> > +		.parent		= &clk_h,
> > +		.enable		= s5p6440_hclk1_ctrl,
> > +		.ctrlbit	= S5P_CLKCON_HCLK1_DISPCON,
> > +	}, {
> > +		.name		= "hsmmc",
> > +		.id		= 0,
> > +		.parent		= &clk_h,
> > +		.enable		= s5p6440_hclk0_ctrl,
> > +		.ctrlbit	= S5P_CLKCON_HCLK0_HSMMC0,
> > +	}, {
> > +		.name		= "hsmmc",
> > +		.id		= 1,
> > +		.parent		= &clk_h,
> > +		.enable		= s5p6440_hclk0_ctrl,
> > +		.ctrlbit	= S5P_CLKCON_HCLK0_HSMMC1,
> > +	}, {
> > +		.name		= "hsmmc",
> > +		.id		= 2,
> > +		.parent		= &clk_h,
> > +		.enable		= s5p6440_hclk0_ctrl,
> > +		.ctrlbit	= S5P_CLKCON_HCLK0_HSMMC2,
> > +	}, {
> > +		.name		= "rtc",
> > +		.id		= -1,
> > +		.parent		= &clk_p,
> > +		.enable		= s5p6440_pclk_ctrl,
> > +		.ctrlbit	= S5P_CLKCON_PCLK_RTC,
> > +	}, {
> > +		.name		= "watchdog",
> > +		.id		= -1,
> > +		.parent		= &clk_p,
> > +		.enable		= s5p6440_pclk_ctrl,
> > +		.ctrlbit	= S5P_CLKCON_PCLK_WDT,
> > +	}
> > +};
> >
> > +/*
> > + * The following clocks will be enabled during clock initialization.
> > + */
> > +static struct clk init_clocks[] = {
> > +	{
> > +		.name		= "gpio",
> > +		.id		= -1,
> > +		.parent		= &clk_p,
> > +		.enable		= s5p6440_pclk_ctrl,
> > +		.ctrlbit	= S5P_CLKCON_PCLK_GPIO,
> > +	}, {
> > +		.name		= "timers",
> > +		.id		= -1,
> > +		.parent		= &clk_p,
> > +		.enable		= s5p6440_pclk_ctrl,
> > +		.ctrlbit	= S5P_CLKCON_PCLK_PWM,
> > +	}, {
> > +		.name		= "uart",
> > +		.id		= 0,
> > +		.parent		= &clk_p,
> > +		.enable		= s5p6440_pclk_ctrl,
> > +		.ctrlbit	= S5P_CLKCON_PCLK_UART0,
> > +	}, {
> > +		.name		= "uart",
> > +		.id		= 1,
> > +		.parent		= &clk_p,
> > +		.enable		= s5p6440_pclk_ctrl,
> > +		.ctrlbit	= S5P_CLKCON_PCLK_UART1,
> > +	}, {
> > +		.name		= "uart",
> > +		.id		= 2,
> > +		.parent		= &clk_p,
> > +		.enable		= s5p6440_pclk_ctrl,
> > +		.ctrlbit	= S5P_CLKCON_PCLK_UART2,
> > +	}, {
> > +		.name		= "uart",
> > +		.id		= 3,
> > +		.parent		= &clk_p,
> > +		.enable		= s5p6440_pclk_ctrl,
> > +		.ctrlbit	= S5P_CLKCON_PCLK_UART3,
> > +	}
> > +};
> The parent for most of these clocks are wrong. Looking at the user
> manual, they are connected to the low frequency domain (PCLK_LOW or
> HCLK_LOW). The parent must then be set to clk_p_low or clk_h_low.
Yes, you're right. I had thought that PCLK and HCLK were PCLK_LOW and
HCLK_LOW, respectively. However, it differs with user manual. I will change
it.

> Failure to do so leads to some "interesting" situations when HCLK and
> HCLK_LOW have different rates...
Yes, it works when HCLK and HCLK_LOW are same. But if they are different, it
doesn't work. I will change it.

> > +void __init_or_cpufreq s5p6440_setup_clocks(void)
> > +{
> > +	struct clk *xtal_clk;
> > +	unsigned long xtal;
> > +	unsigned long fclk;
> > +	unsigned long hclk;
> > +	unsigned long hclk_low;
> > +	unsigned long pclk;
> > +	unsigned long pclk_low;
> > +	unsigned long epll;
> > +	unsigned long apll;
> > +	unsigned long mpll;
> > +	unsigned int ptr;
> > +	u32 clkdiv0;
> > +	u32 clkdiv3;
> > +
> > +	/* Set S5P6440 functions for clk_fout_epll */
> > +	clk_fout_epll.enable = s5p6440_epll_enable;
> > +	clk_fout_epll.ops = &s5p6440_epll_ops;
> > +
> > +	/* Set S5P6440 functions for arm clock */
> > +	clk_arm.parent = &clk_mout_apll.clk;
> > +	clk_arm.ops = &s5p6440_clkarm_ops;
> > +
> > +	clkdiv0 = __raw_readl(S5P_CLK_DIV0);
> > +	clkdiv3 = __raw_readl(S5P_CLK_DIV3);
> > +
> > +	xtal_clk = clk_get(NULL, "ext_xtal");
> > +	BUG_ON(IS_ERR(xtal_clk));
> > +
> > +	xtal = clk_get_rate(xtal_clk);
> > +	clk_put(xtal_clk);
> > +
> > +	epll = s5p6440_get_epll(xtal);
> > +	mpll = s5p_get_pll(xtal, __raw_readl(S5P_MPLL_CON));
> > +	apll = s5p_get_pll(xtal, __raw_readl(S5P_APLL_CON));
> > +
> > +	printk(KERN_INFO "S5P6440: PLL settings, A=%ld.%ldMHz,
> M=%ld.%ldMHz," \
> > +			" E=%ld.%ldMHz\n",
> > +			print_mhz(apll), print_mhz(mpll), print_mhz(epll));
> > +
> > +	fclk = apll / GET_DIV(clkdiv0, S5P_CLKDIV0_ARM);
> > +	hclk = fclk / GET_DIV(clkdiv0, S5P_CLKDIV0_HCLK);
> > +	pclk = hclk / GET_DIV(clkdiv0, S5P_CLKDIV0_PCLK);
> > +
> > +	if (__raw_readl(S5P_OTHERS) & S5P_OTHERS_HCLK_LOW_SEL_MPLL) {
> > +		/* Synchronous mode */
> > +		hclk_low = apll / GET_DIV(clkdiv3, S5P_CLKDIV3_HCLK_LOW);
> > +	} else {
> > +		/* Asynchronous mode */
> > +		hclk_low = mpll / GET_DIV(clkdiv3, S5P_CLKDIV3_HCLK_LOW);
> > +	}
> 
> The test is inverted. S5P_OTHERS::S5P_OTHERS_HCLK_LOW_SEL_MPLL is set
> when MPLL is the source clock for HCLK_LOW.
Yes, you're right. They inverted. I will change them as follows :

+	if (__raw_readl(S5P_OTHERS) & S5P_OTHERS_HCLK_LOW_SEL_MPLL) {
+		hclk_low = mpll / GET_DIV(clkdiv3, S5P_CLKDIV3_HCLK_LOW);
+	} else {
+		hclk_low = apll / GET_DIV(clkdiv3, S5P_CLKDIV3_HCLK_LOW);
+	}

> > +	pclk_low = hclk_low / GET_DIV(clkdiv3, S5P_CLKDIV3_PCLK_LOW);
> > +
> > +	printk(KERN_INFO "S5P6440: HCLK=%ld.%ldMHz,
> HCLK_LOW=%ld.%ldMHz," \
> > +			" PCLK=%ld.%ldMHz, PCLK_LOW=%ld.%ldMHz\n",
> > +			print_mhz(hclk), print_mhz(hclk_low),
> > +			print_mhz(pclk), print_mhz(pclk_low));
> > +
> > +	clk_fout_mpll.rate = mpll;
> > +	clk_fout_epll.rate = epll;
> > +	clk_fout_apll.rate = apll;
> > +
> > +	clk_f.rate = fclk;
> > +	clk_h.rate = hclk;
> > +	clk_p.rate = pclk;
> > +	clk_h_low.rate = hclk_low;
> > +	clk_p_low.rate = pclk_low;
> > +
> > +	for (ptr = 0; ptr < ARRAY_SIZE(init_parents); ptr++)
> > +		s3c_set_clksrc(init_parents[ptr]);
> > +
> > +	for (ptr = 0; ptr < ARRAY_SIZE(clksrcs); ptr++)
> > +		s3c_set_clksrc(&clksrcs[ptr]);
> > +}
> 
> --

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
System LSI Division, SAMSUNG ELECTRONICS CO., LTD.
