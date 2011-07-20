From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 5/8] ARM: Exynos4: add support for TV device
Date: Thu, 21 Jul 2011 03:21:37 +0900
Message-ID: <000301cc4709$e1166200$a3432600$%kim@samsung.com>
References: <1311065067-20324-1-git-send-email-m.szyprowski@samsung.com>
 <1311065067-20324-6-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:49822 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752619Ab1GTSVq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 Jul 2011 14:21:46 -0400
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LON00KU29O8IHD0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 21 Jul 2011 03:21:44 +0900 (KST)
Received: from kgenekim ([12.23.119.139])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LON00K7Z9O86J@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 21 Jul 2011 03:21:45 +0900 (KST)
In-reply-to: <1311065067-20324-6-git-send-email-m.szyprowski@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Marek Szyprowski' <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: 'Kyungmin Park' <kyungmin.park@samsung.com>, 'Tomasz Stanislawski' <t.stanislaws@samsung.com>

Marek Szyprowski wrote:
> 
> From: Tomasz Stanislawski <t.stanislaws@samsung.com>
> 
> This patch adds clocks and definitions needed by TV driver
> infrastructure for Samsung Exynos4 platform.
> 
> Signed-off-by: Tomasz Stanislawski <t.stanislaws@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> Reviewed-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/mach-exynos4/clock.c                   |  205
> +++++++++++++++++++++++
>  arch/arm/mach-exynos4/cpu.c                     |    4 +
>  arch/arm/mach-exynos4/include/mach/irqs.h       |    4 +-
>  arch/arm/mach-exynos4/include/mach/map.h        |   26 +++
>  arch/arm/mach-exynos4/include/mach/regs-clock.h |    1 +
>  arch/arm/mach-exynos4/include/mach/regs-pmu.h   |    6 +
>  6 files changed, 245 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos4/clock.c b/arch/arm/mach-exynos4/clock.c
> index b5e6d9d..f61a82d 100644
> --- a/arch/arm/mach-exynos4/clock.c
> +++ b/arch/arm/mach-exynos4/clock.c
> @@ -83,6 +83,11 @@ static int exynos4_clk_ip_mfc_ctrl(struct clk *clk, int
enable)
>  	return s5p_gatectrl(S5P_CLKGATE_IP_MFC, clk, enable);
>  }
> 
> +static int exynos4_clksrc_mask_tv_ctrl(struct clk *clk, int enable)
> +{
> +	return s5p_gatectrl(S5P_CLKSRC_MASK_TV, clk, enable);
> +}
> +
>  static int exynos4_clk_ip_cam_ctrl(struct clk *clk, int enable)
>  {
>  	return s5p_gatectrl(S5P_CLKGATE_IP_CAM, clk, enable);
> @@ -123,6 +128,16 @@ static int exynos4_clk_ip_perir_ctrl(struct clk *clk,
int
> enable)
>  	return s5p_gatectrl(S5P_CLKGATE_IP_PERIR, clk, enable);
>  }
> 
> +static int exynos4_clk_hdmiphy_ctrl(struct clk *clk, int enable)
> +{
> +	return s5p_gatectrl(S5P_HDMI_PHY_CONTROL, clk, enable);
> +}
> +
> +static int exynos4_clk_dac_ctrl(struct clk *clk, int enable)
> +{
> +	return s5p_gatectrl(S5P_DAC_PHY_CONTROL, clk, enable);
> +}
> +
>  /* Core list of CMU_CPU side */
> 
>  static struct clksrc_clk clk_mout_apll = {
> @@ -449,6 +464,36 @@ static struct clk init_clocks_off[] = {
>  		.enable		= exynos4_clk_ip_fsys_ctrl,
>  		.ctrlbit	= (1 << 9),
>  	}, {
> +		.name		= "dac",
> +		.devname	= "s5p-sdo",
> +		.enable		= exynos4_clk_ip_tv_ctrl,
> +		.ctrlbit	= (1 << 2),
> +	}, {
> +		.name		= "mixer",
> +		.devname	= "s5p-mixer",
> +		.enable		= exynos4_clk_ip_tv_ctrl,
> +		.ctrlbit	= (1 << 1),
> +	}, {
> +		.name		= "vp",
> +		.devname	= "s5p-mixer",
> +		.enable		= exynos4_clk_ip_tv_ctrl,
> +		.ctrlbit	= (1 << 0),
> +	}, {
> +		.name		= "hdmi",
> +		.devname	= "s5p-hdmi",
> +		.enable		= exynos4_clk_ip_tv_ctrl,
> +		.ctrlbit	= (1 << 3),
> +	}, {
> +		.name		= "hdmiphy",
> +		.devname	= "s5p-hdmi",
> +		.enable		= exynos4_clk_hdmiphy_ctrl,
> +		.ctrlbit	= (1 << 0),
> +	}, {
> +		.name		= "dacphy",
> +		.devname	= "s5p-sdo",
> +		.enable		= exynos4_clk_dac_ctrl,
> +		.ctrlbit	= (1 << 0),
> +	}, {
>  		.name		= "sata",
>  		.parent		= &clk_aclk_133.clk,
>  		.enable		= exynos4_clk_ip_fsys_ctrl,
> @@ -788,6 +833,82 @@ static struct clksrc_sources clkset_mout_mfc = {
>  	.nr_sources	= ARRAY_SIZE(clkset_mout_mfc_list),
>  };
> 
> +static struct clk *clkset_sclk_dac_list[] = {
> +	[0] = &clk_sclk_vpll.clk,
> +	[1] = &clk_sclk_hdmiphy,
> +};
> +
> +static struct clksrc_sources clkset_sclk_dac = {
> +	.sources	= clkset_sclk_dac_list,
> +	.nr_sources	= ARRAY_SIZE(clkset_sclk_dac_list),
> +};
> +
> +static struct clksrc_clk clk_sclk_dac = {
> +	.clk		= {
> +		.name		= "sclk_dac",
> +		.enable		= exynos4_clksrc_mask_tv_ctrl,
> +		.ctrlbit	= (1 << 8),
> +	},
> +	.sources = &clkset_sclk_dac,
> +	.reg_src = { .reg = S5P_CLKSRC_TV, .shift = 8, .size = 1 },
> +};
> +
> +static struct clksrc_clk clk_sclk_pixel = {
> +	.clk		= {
> +		.name		= "sclk_pixel",
> +		.parent = &clk_sclk_vpll.clk,
> +	},
> +	.reg_div = { .reg = S5P_CLKDIV_TV, .shift = 0, .size = 4 },
> +};
> +
> +static struct clk *clkset_sclk_hdmi_list[] = {
> +	[0] = &clk_sclk_pixel.clk,
> +	[1] = &clk_sclk_hdmiphy,
> +};
> +
> +static struct clksrc_sources clkset_sclk_hdmi = {
> +	.sources	= clkset_sclk_hdmi_list,
> +	.nr_sources	= ARRAY_SIZE(clkset_sclk_hdmi_list),
> +};
> +
> +static struct clksrc_clk clk_sclk_hdmi = {
> +	.clk		= {
> +		.name		= "sclk_hdmi",
> +		.enable		= exynos4_clksrc_mask_tv_ctrl,
> +		.ctrlbit	= (1 << 0),
> +	},
> +	.sources = &clkset_sclk_hdmi,
> +	.reg_src = { .reg = S5P_CLKSRC_TV, .shift = 0, .size = 1 },
> +};
> +
> +static struct clk *clkset_sclk_mixer_list[] = {
> +	[0] = &clk_sclk_dac.clk,
> +	[1] = &clk_sclk_hdmi.clk,
> +};
> +
> +static struct clksrc_sources clkset_sclk_mixer = {
> +	.sources	= clkset_sclk_mixer_list,
> +	.nr_sources	= ARRAY_SIZE(clkset_sclk_mixer_list),
> +};
> +
> +static struct clksrc_clk clk_sclk_mixer = {
> +	.clk		= {
> +		.name		= "sclk_mixer",
> +		.enable		= exynos4_clksrc_mask_tv_ctrl,
> +		.ctrlbit	= (1 << 4),
> +	},
> +	.sources = &clkset_sclk_mixer,
> +	.reg_src = { .reg = S5P_CLKSRC_TV, .shift = 4, .size = 1 },
> +};
> +
> +static struct clksrc_clk *sclk_tv[] = {
> +	&clk_sclk_dac,
> +	&clk_sclk_pixel,
> +	&clk_sclk_hdmi,
> +	&clk_sclk_mixer,
> +	NULL,
> +};
> +
>  static struct clksrc_clk clk_dout_mmc0 = {
>  	.clk		= {
>  		.name		= "dout_mmc0",
> @@ -1129,6 +1250,81 @@ static struct clk_ops exynos4_fout_apll_ops = {
>  	.get_rate = exynos4_fout_apll_get_rate,
>  };
> 
> +struct vpll_div_data {
> +	u32 rate;
> +	u32 pdiv;
> +	u32 mdiv;
> +	u32 sdiv;
> +	u32 k;
> +	u32 mfr;
> +	u32 mrr;
> +	u32 vsel;
> +
> +};
> +
> +static struct vpll_div_data vpll_div[] = {
> +	{  54000000, 3, 53, 3, 1024, 0, 17, 0 },
> +	{ 108000000, 3, 53, 2, 1024, 0, 17, 0 },
> +};
> +
> +static unsigned long exynos4_vpll_get_rate(struct clk *clk)
> +{
> +	return clk->rate;
> +}

Please refer to my reply on s5pv210/clock.c.

> +
> +static int exynos4_vpll_set_rate(struct clk *clk, unsigned long rate)
> +{
> +	unsigned int vpll_con0, vpll_con1;
> +	unsigned int i;
> +
> +	/* Return if nothing changed */
> +	if (clk->rate == rate)
> +		return 0;
> +
> +	vpll_con0 = __raw_readl(S5P_VPLL_CON0);
> +	vpll_con0 &= ~(0x1 << 27 |					\
> +			PLL90XX_MDIV_MASK << PLL90XX_MDIV_SHIFT |	\
> +			PLL90XX_PDIV_MASK << PLL90XX_PDIV_SHIFT |	\
> +			PLL90XX_SDIV_MASK << PLL90XX_SDIV_SHIFT);
> +
> +	vpll_con1 = __raw_readl(S5P_VPLL_CON1);
> +	vpll_con1 &= ~(0x1f << 24 |	\
> +			0x3f << 16 |	\
> +			0xfff << 0);
> +
> +	for (i = 0; i < ARRAY_SIZE(vpll_div); i++) {
> +		if (vpll_div[i].rate == rate) {
> +			vpll_con0 |= vpll_div[i].vsel << 27;
> +			vpll_con0 |= vpll_div[i].pdiv << PLL90XX_PDIV_SHIFT;
> +			vpll_con0 |= vpll_div[i].mdiv << PLL90XX_MDIV_SHIFT;
> +			vpll_con0 |= vpll_div[i].sdiv << PLL90XX_SDIV_SHIFT;
> +
> +			vpll_con1 |= vpll_div[i].mrr << 24;
> +			vpll_con1 |= vpll_div[i].mfr << 16;
> +			vpll_con1 |= vpll_div[i].k << 0;
> +			break;
> +		}
> +	}
> +
> +	if (i == ARRAY_SIZE(vpll_div)) {
> +		printk(KERN_ERR "%s: Invalid Clock VPLL Frequency\n",
> +				__func__);
> +		return -EINVAL;
> +	}
> +
> +	__raw_writel(vpll_con0, S5P_VPLL_CON0);
> +	__raw_writel(vpll_con1, S5P_VPLL_CON1);
> +
Same.

> +	clk->rate = rate;
> +
> +	return 0;
> +}
Same.

> +
> +static struct clk_ops exynos4_vpll_ops = {
> +	.get_rate = exynos4_vpll_get_rate,
> +	.set_rate = exynos4_vpll_set_rate,
> +};
Same...

> +
>  void __init_or_cpufreq exynos4_setup_clocks(void)
>  {
>  	struct clk *xtal_clk;
> @@ -1171,6 +1367,7 @@ void __init_or_cpufreq exynos4_setup_clocks(void)
>  	clk_fout_apll.ops = &exynos4_fout_apll_ops;
>  	clk_fout_mpll.rate = mpll;
>  	clk_fout_epll.rate = epll;
> +	clk_fout_vpll.ops = &exynos4_vpll_ops;
>  	clk_fout_vpll.rate = vpll;
> 
>  	printk(KERN_INFO "EXYNOS4: PLL settings, A=%ld, M=%ld, E=%ld
> V=%ld",
> @@ -1199,6 +1396,10 @@ void __init_or_cpufreq exynos4_setup_clocks(void)
> 
>  static struct clk *clks[] __initdata = {
>  	/* Nothing here yet */
> +	&clk_sclk_hdmi27m,
> +	&clk_sclk_hdmiphy,
> +	&clk_sclk_usbphy0,
> +	&clk_sclk_usbphy1,
>  };
> 
>  void __init exynos4_register_clocks(void)
> @@ -1210,6 +1411,10 @@ void __init exynos4_register_clocks(void)
>  	for (ptr = 0; ptr < ARRAY_SIZE(sysclks); ptr++)
>  		s3c_register_clksrc(sysclks[ptr], 1);
> 
> +	/* register TV clocks */
> +	for (ptr = 0; sclk_tv[ptr]; ++ptr)
> +		s3c_register_clksrc(sclk_tv[ptr], 1);
> +
>  	s3c_register_clksrc(clksrcs, ARRAY_SIZE(clksrcs));
>  	s3c_register_clocks(init_clocks, ARRAY_SIZE(init_clocks));
> 
> diff --git a/arch/arm/mach-exynos4/cpu.c b/arch/arm/mach-exynos4/cpu.c
> index 3df6739..f57d281 100644
> --- a/arch/arm/mach-exynos4/cpu.c
> +++ b/arch/arm/mach-exynos4/cpu.c
> @@ -25,6 +25,7 @@
>  #include <plat/devs.h>
>  #include <plat/fimc-core.h>
>  #include <plat/iic-core.h>
> +#include <plat/tv-core.h>
> 
>  #include <mach/regs-irq.h>
> 
> @@ -151,6 +152,9 @@ void __init exynos4_map_io(void)
>  	s3c_i2c0_setname("s3c2440-i2c");
>  	s3c_i2c1_setname("s3c2440-i2c");
>  	s3c_i2c2_setname("s3c2440-i2c");
> +
> +	/* setup TV devices */
> +	s5p_hdmi_setname("exynos4-hdmi");
>  }
> 
>  void __init exynos4_init_clocks(int xtal)
> diff --git a/arch/arm/mach-exynos4/include/mach/irqs.h b/arch/arm/mach-
> exynos4/include/mach/irqs.h
> index c342ba1..c2077ce 100644
> --- a/arch/arm/mach-exynos4/include/mach/irqs.h
> +++ b/arch/arm/mach-exynos4/include/mach/irqs.h
> @@ -93,10 +93,12 @@
>  #define IRQ_2D			IRQ_SPI(89)
>  #define IRQ_PCIE		IRQ_SPI(90)
> 
> +#define IRQ_MIXER		IRQ_SPI(91)
> +#define IRQ_HDMI		IRQ_SPI(92)
>  #define IRQ_HDMI_I2C		IRQ_SPI(93)
>  #define IRQ_IIC8		IRQ_HDMI_I2C
> -
>  #define IRQ_MFC			IRQ_SPI(94)
> +#define IRQ_SDO			IRQ_SPI(95)
> 
>  #define IRQ_AUDIO_SS		IRQ_SPI(96)
>  #define IRQ_I2S0		IRQ_SPI(97)
> diff --git a/arch/arm/mach-exynos4/include/mach/map.h b/arch/arm/mach-
> exynos4/include/mach/map.h
> index 1fd986b..79ec1f9 100644
> --- a/arch/arm/mach-exynos4/include/mach/map.h
> +++ b/arch/arm/mach-exynos4/include/mach/map.h
> @@ -168,4 +168,30 @@
> 
>  #define S5P_SZ_UART			SZ_256
> 
> +/* CEC */
> +#define S5PV210_PA_CEC		(0x100B0000)
> +#define S5P_PA_CEC		S5PV210_PA_CEC
> +#define S5P_SZ_CEC		SZ_4K
> +
> +/* TVOUT */
> +#define S5PV210_PA_SDO		(0x12C20000)
> +#define S5P_PA_SDO		S5PV210_PA_SDO
> +#define S5P_SZ_SDO		SZ_64K
> +
> +#define S5PV210_PA_VP		(0x12C00000)
> +#define S5P_PA_VP		S5PV210_PA_VP
> +#define S5P_SZ_VP		SZ_64K
> +
> +#define S5PV210_PA_MIXER	(0x12C10000)
> +#define S5P_PA_MIXER		S5PV210_PA_MIXER
> +#define S5P_SZ_MIXER		SZ_64K
> +
> +#define S5PV210_PA_HDMI		(0x12D00000)
> +#define S5P_PA_HDMI		S5PV210_PA_HDMI
> +#define S5P_SZ_HDMI		SZ_1M
> +
> +#define S5PV210_I2C_HDMI_PHY	(0x138E0000)
> +#define S5P_I2C_HDMI_PHY	S5PV210_I2C_HDMI_PHY
> +#define S5P_I2C_HDMI_SZ_PHY	SZ_1K
> +
>  #endif /* __ASM_ARCH_MAP_H */
> diff --git a/arch/arm/mach-exynos4/include/mach/regs-clock.h
b/arch/arm/mach-
> exynos4/include/mach/regs-clock.h
> index 64bdd24..854c736 100644
> --- a/arch/arm/mach-exynos4/include/mach/regs-clock.h
> +++ b/arch/arm/mach-exynos4/include/mach/regs-clock.h
> @@ -36,6 +36,7 @@
>  #define S5P_CLKSRC_TOP0			S5P_CLKREG(0x0C210)
>  #define S5P_CLKSRC_TOP1			S5P_CLKREG(0x0C214)
>  #define S5P_CLKSRC_CAM			S5P_CLKREG(0x0C220)
> +#define S5P_CLKSRC_TV			S5P_CLKREG(0x0C224)
>  #define S5P_CLKSRC_MFC			S5P_CLKREG(0x0C228)
>  #define S5P_CLKSRC_IMAGE		S5P_CLKREG(0x0C230)
>  #define S5P_CLKSRC_LCD0			S5P_CLKREG(0x0C234)
> diff --git a/arch/arm/mach-exynos4/include/mach/regs-pmu.h
b/arch/arm/mach-
> exynos4/include/mach/regs-pmu.h
> index fa49bbb..faf9b98 100644
> --- a/arch/arm/mach-exynos4/include/mach/regs-pmu.h
> +++ b/arch/arm/mach-exynos4/include/mach/regs-pmu.h
> @@ -33,9 +33,15 @@
>  #define S5P_EINT_WAKEUP_MASK
> 	S5P_PMUREG(0x0604)
>  #define S5P_WAKEUP_MASK
> 	S5P_PMUREG(0x0608)
> 
> +#define S5P_HDMI_PHY_CONTROL
> 	S5P_PMUREG(0x0700)
> +#define S5P_HDMI_PHY_ENABLE			(1 << 0)
> +
>  #define S5P_USBHOST_PHY_CONTROL
> 	S5P_PMUREG(0x0708)
>  #define S5P_USBHOST_PHY_ENABLE			(1 << 0)
> 
> +#define S5P_DAC_PHY_CONTROL
> 	S5P_PMUREG(0x070C)
> +#define S5P_DAC_PHY_ENABLE			(1 << 0)
> +
>  #define S5P_MIPI_DPHY_CONTROL(n)		S5P_PMUREG(0x0710 + (n) *
> 4)
>  #define S5P_MIPI_DPHY_ENABLE			(1 << 0)
>  #define S5P_MIPI_DPHY_SRESETN			(1 << 1)
> --
> 1.7.1.569.g6f426



Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
