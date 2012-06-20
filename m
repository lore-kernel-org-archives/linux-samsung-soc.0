From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2] ARM: EXYNOS: add FIMD1 support for EXYNOS5
Date: Wed, 20 Jun 2012 13:27:41 +0900
Message-ID: <028b01cd4e9d$083b2be0$18b183a0$%kim@samsung.com>
References: <000601cd450e$24a53d40$6defb7c0$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:37151 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752751Ab2FTE1p (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 Jun 2012 00:27:45 -0400
Received: from epcpsbgm2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M5W00JSNEYLN9H0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 20 Jun 2012 13:27:43 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M5W0039UF255540@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 20 Jun 2012 13:27:43 +0900 (KST)
In-reply-to: <000601cd450e$24a53d40$6defb7c0$%han@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Jingoo Han' <jg1.han@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: 'Thomas Abraham' <thomas.abraham@linaro.org>

Jingoo Han wrote:
> 
> This patch adds platform device s5p_device_fimd1 for EXYNOS FIMD1.
> EXYNOS has two FIMDs(FIMD0, FIMD1). Some definitions used to enable
> EXYNOS FIMD1 are added.
> 
> This patch also adds resource definitions for EXYNOS5 FIMD1.
> FIMD1 clock and SFR definitions are added.
> 
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>
> ---
>  arch/arm/mach-exynos/clock-exynos5.c         |   11 ++++++++++-
>  arch/arm/mach-exynos/common.c                |    2 ++
>  arch/arm/mach-exynos/include/mach/irqs.h     |    4 ++++
>  arch/arm/mach-exynos/include/mach/map.h      |    2 ++
>  arch/arm/plat-samsung/Kconfig                |    5 +++++
>  arch/arm/plat-samsung/devs.c                 |   23
+++++++++++++++++++++++
>  arch/arm/plat-samsung/include/plat/devs.h    |    1 +
>  arch/arm/plat-samsung/include/plat/fb-core.h |    5 +++++
>  8 files changed, 52 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/clock-exynos5.c b/arch/arm/mach-
> exynos/clock-exynos5.c
> index fefa336..49e2ad2 100644
> --- a/arch/arm/mach-exynos/clock-exynos5.c
> +++ b/arch/arm/mach-exynos/clock-exynos5.c
> @@ -868,6 +868,13 @@ static struct clk exynos5_clk_mdma1 = {
>  	.ctrlbit	= (1 << 4),
>  };
> 
> +static struct clk exynos5_clk_fimd1 = {
> +	.name		= "fimd",
> +	.devname	= "exynos5-fb.1",
> +	.enable		= exynos5_clk_ip_disp1_ctrl,
> +	.ctrlbit	= (1 << 0),
> +};
> +
>  struct clk *exynos5_clkset_group_list[] = {
>  	[0] = &clk_ext_xtal_mux,
>  	[1] = NULL,
> @@ -1046,7 +1053,7 @@ static struct clksrc_clk exynos5_clksrcs[] = {
>  	}, {
>  		.clk	= {
>  			.name		= "sclk_fimd",
> -			.devname	= "s3cfb.1",
> +			.devname	= "exynos5-fb.1",
>  			.enable		= exynos5_clksrc_mask_disp1_0_ctrl,
>  			.ctrlbit	= (1 << 0),
>  		},
> @@ -1154,6 +1161,7 @@ static struct clk *exynos5_clk_cdev[] = {
>  	&exynos5_clk_pdma0,
>  	&exynos5_clk_pdma1,
>  	&exynos5_clk_mdma1,
> +	&exynos5_clk_fimd1,
>  };
> 
>  static struct clksrc_clk *exynos5_clksrc_cdev[] = {
> @@ -1176,6 +1184,7 @@ static struct clk_lookup exynos5_clk_lookup[] = {
>  	CLKDEV_INIT("exynos4-sdhci.1", "mmc_busclk.2",
> &exynos5_clk_sclk_mmc1.clk),
>  	CLKDEV_INIT("exynos4-sdhci.2", "mmc_busclk.2",
> &exynos5_clk_sclk_mmc2.clk),
>  	CLKDEV_INIT("exynos4-sdhci.3", "mmc_busclk.2",
> &exynos5_clk_sclk_mmc3.clk),
> +	CLKDEV_INIT("exynos5-fb.1", "lcd", &exynos5_clk_fimd1),
>  	CLKDEV_INIT("dma-pl330.0", "apb_pclk", &exynos5_clk_pdma0),
>  	CLKDEV_INIT("dma-pl330.1", "apb_pclk", &exynos5_clk_pdma1),
>  	CLKDEV_INIT("dma-pl330.2", "apb_pclk", &exynos5_clk_mdma1),
> diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/common.c
> index 742edd3..84a187d 100644
> --- a/arch/arm/mach-exynos/common.c
> +++ b/arch/arm/mach-exynos/common.c
> @@ -366,6 +366,8 @@ static void __init exynos5_map_io(void)
>  	s3c_i2c0_setname("s3c2440-i2c");
>  	s3c_i2c1_setname("s3c2440-i2c");
>  	s3c_i2c2_setname("s3c2440-i2c");
> +
> +	s5p_fb_setname(1, "exynos5-fb");
>  }
> 
>  static void __init exynos4_init_clocks(int xtal)
> diff --git a/arch/arm/mach-exynos/include/mach/irqs.h b/arch/arm/mach-
> exynos/include/mach/irqs.h
> index 7a4b478..608b0c6 100644
> --- a/arch/arm/mach-exynos/include/mach/irqs.h
> +++ b/arch/arm/mach-exynos/include/mach/irqs.h
> @@ -232,6 +232,10 @@
>  #define IRQ_FIMD0_VSYNC			EXYNOS4_IRQ_FIMD0_VSYNC
>  #define IRQ_FIMD0_SYSTEM		EXYNOS4_IRQ_FIMD0_SYSTEM
> 
> +#define IRQ_FIMD1_FIFO			EXYNOS5_IRQ_FIMD1_FIFO
> +#define IRQ_FIMD1_VSYNC			EXYNOS5_IRQ_FIMD1_VSYNC
> +#define IRQ_FIMD1_SYSTEM		EXYNOS5_IRQ_FIMD1_SYSTEM
> +
>  #define IRQ_GPIO1_NR_GROUPS		EXYNOS4_IRQ_GPIO1_NR_GROUPS
>  #define IRQ_GPIO2_NR_GROUPS		EXYNOS4_IRQ_GPIO2_NR_GROUPS
> 
> diff --git a/arch/arm/mach-exynos/include/mach/map.h b/arch/arm/mach-
> exynos/include/mach/map.h
> index ca4aa89..07d0028 100644
> --- a/arch/arm/mach-exynos/include/mach/map.h
> +++ b/arch/arm/mach-exynos/include/mach/map.h
> @@ -167,6 +167,7 @@
>  #define EXYNOS4_PA_MIPI_CSIS1		0x11890000
> 
>  #define EXYNOS4_PA_FIMD0		0x11C00000
> +#define EXYNOS5_PA_FIMD1		0x14400000
> 
>  #define EXYNOS4_PA_HSMMC(x)		(0x12510000 + ((x) * 0x10000))
>  #define EXYNOS4_PA_DWMCI		0x12550000
> @@ -240,6 +241,7 @@
>  #define S5P_PA_JPEG			EXYNOS4_PA_JPEG
>  #define S5P_PA_G2D			EXYNOS4_PA_G2D
>  #define S5P_PA_FIMD0			EXYNOS4_PA_FIMD0
> +#define S5P_PA_FIMD1			EXYNOS5_PA_FIMD1
>  #define S5P_PA_HDMI			EXYNOS4_PA_HDMI
>  #define S5P_PA_IIC_HDMIPHY		EXYNOS4_PA_IIC_HDMIPHY
>  #define S5P_PA_MFC			EXYNOS4_PA_MFC
> diff --git a/arch/arm/plat-samsung/Kconfig b/arch/arm/plat-samsung/Kconfig
> index a2fae4e..63d3435 100644
> --- a/arch/arm/plat-samsung/Kconfig
> +++ b/arch/arm/plat-samsung/Kconfig
> @@ -362,6 +362,11 @@ config S5P_DEV_FIMD0
>  	help
>  	  Compile in platform device definitions for FIMD controller 0
> 
> +config S5P_DEV_FIMD1
> +	bool
> +	help
> +	  Compile in platform device definitions for FIMD controller 1
> +
>  config S5P_DEV_G2D
>  	bool
>  	help
> diff --git a/arch/arm/plat-samsung/devs.c b/arch/arm/plat-samsung/devs.c
> index 1d214cb..71d96eb 100644
> --- a/arch/arm/plat-samsung/devs.c
> +++ b/arch/arm/plat-samsung/devs.c
> @@ -334,6 +334,29 @@ void __init s5p_fimd0_set_platdata(struct
> s3c_fb_platdata *pd)
>  }
>  #endif /* CONFIG_S5P_DEV_FIMD0 */
> 
> +/* FIMD1 */
> +
> +#ifdef CONFIG_S5P_DEV_FIMD1
> +static struct resource s5p_fimd1_resource[] = {
> +	[0] = DEFINE_RES_MEM(S5P_PA_FIMD1, SZ_32K),
> +	[1] = DEFINE_RES_IRQ(IRQ_FIMD1_VSYNC),
> +	[2] = DEFINE_RES_IRQ(IRQ_FIMD1_FIFO),
> +	[3] = DEFINE_RES_IRQ(IRQ_FIMD1_SYSTEM),
> +};
> +
> +struct platform_device s5p_device_fimd1 = {
> +	.name		= "s5p-fb",
> +	.id		= 1,
> +	.num_resources	= ARRAY_SIZE(s5p_fimd1_resource),
> +	.resource	= s5p_fimd1_resource,
> +	.dev		= {
> +		.dma_mask		= &samsung_device_dma_mask,
> +		.coherent_dma_mask	= DMA_BIT_MASK(32),
> +	},
> +};
> +
> +#endif /* CONFIG_S5P_DEV_FIMD1 */
> +
>  /* HWMON */
> 
>  #ifdef CONFIG_S3C_DEV_HWMON
> diff --git a/arch/arm/plat-samsung/include/plat/devs.h b/arch/arm/plat-
> samsung/include/plat/devs.h
> index 61ca2f3..f06980f 100644
> --- a/arch/arm/plat-samsung/include/plat/devs.h
> +++ b/arch/arm/plat-samsung/include/plat/devs.h
> @@ -84,6 +84,7 @@ extern struct platform_device s5p_device_fimc_md;
>  extern struct platform_device s5p_device_jpeg;
>  extern struct platform_device s5p_device_g2d;
>  extern struct platform_device s5p_device_fimd0;
> +extern struct platform_device s5p_device_fimd1;
>  extern struct platform_device s5p_device_hdmi;
>  extern struct platform_device s5p_device_i2c_hdmiphy;
>  extern struct platform_device s5p_device_mfc;
> diff --git a/arch/arm/plat-samsung/include/plat/fb-core.h b/arch/arm/plat-
> samsung/include/plat/fb-core.h
> index 6abcbf1..8766794 100644
> --- a/arch/arm/plat-samsung/include/plat/fb-core.h
> +++ b/arch/arm/plat-samsung/include/plat/fb-core.h
> @@ -35,6 +35,11 @@ static inline void s5p_fb_setname(int id, char *name)
>  		s5p_device_fimd0.name = name;
>  	break;
>  #endif
> +#ifdef CONFIG_S5P_DEV_FIMD1
> +	case 1:
> +		s5p_device_fimd1.name = name;
> +	break;
> +#endif
>  	default:
>  		printk(KERN_ERR "%s: invalid device id(%d)\n", __func__,
id);
>  	break;
> --
> 1.7.1

I think, this is still including platform_device stuff. Please test your
patch with DT on EXYNOS5 boards and re-submit :)

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
