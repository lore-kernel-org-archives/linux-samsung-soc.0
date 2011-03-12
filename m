From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: EXYNOS4: Add support for SATA on ARMLEX4210
Date: Sat, 12 Mar 2011 12:13:25 +0900
Message-ID: <002a01cbe063$77dbf8c0$6793ea40$%kim@samsung.com>
References: <1299575771-2047-1-git-send-email-a.kesavan@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:45911 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752947Ab1CLDNe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 11 Mar 2011 22:13:34 -0500
Received: from epmmp1 (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LHX00J2HCYK5W90@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 12 Mar 2011 12:13:32 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LHX0038LCYKSU@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 12 Mar 2011 12:13:32 +0900 (KST)
In-reply-to: <1299575771-2047-1-git-send-email-a.kesavan@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Abhilash Kesavan' <a.kesavan@samsung.com>, linux-samsung-soc@vger.kernel.org

Abhilash Kesavan wrote:
> 
> Adds the device definitions, platform specific initialization and
> clocks for SATA on ARMLEX4210.
> 
> Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
> ---
>  arch/arm/mach-exynos4/Kconfig                 |    1 +
>  arch/arm/mach-exynos4/Makefile                |    1 +
>  arch/arm/mach-exynos4/clock.c                 |    7 +
>  arch/arm/mach-exynos4/dev-ahci.c              |  260
> +++++++++++++++++++++++++
>  arch/arm/mach-exynos4/include/mach/map.h      |    4 +
>  arch/arm/mach-exynos4/include/mach/regs-pmu.h |    3 +
>  arch/arm/mach-exynos4/mach-armlex4210.c       |    1 +
>  arch/arm/plat-samsung/include/plat/devs.h     |    1 +
>  8 files changed, 278 insertions(+), 0 deletions(-)
>  create mode 100644 arch/arm/mach-exynos4/dev-ahci.c
> 
> diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4/Kconfig
> index d3893f6..19b3bc6 100644
> --- a/arch/arm/mach-exynos4/Kconfig
> +++ b/arch/arm/mach-exynos4/Kconfig
> @@ -119,6 +119,7 @@ config MACH_ARMLEX4210
>  	select S3C_DEV_HSMMC3
>  	select EXYNOS4_DEV_SYSMMU
>  	select EXYNOS4_SETUP_SDHCI
> +	select SATA_AHCI_PLATFORM
>  	help
>  	  Machine support for Samsung ARMLEX4210 based on EXYNOS4210
> 
> diff --git a/arch/arm/mach-exynos4/Makefile
b/arch/arm/mach-exynos4/Makefile
> index 45422cb..d3b7cff 100644
> --- a/arch/arm/mach-exynos4/Makefile
> +++ b/arch/arm/mach-exynos4/Makefile
> @@ -43,3 +43,4 @@ obj-$(CONFIG_EXYNOS4_SETUP_I2C6)	+= setup-i2c6.o
>  obj-$(CONFIG_EXYNOS4_SETUP_I2C7)	+= setup-i2c7.o
>  obj-$(CONFIG_EXYNOS4_SETUP_SDHCI)	+= setup-sdhci.o
>  obj-$(CONFIG_EXYNOS4_SETUP_SDHCI_GPIO)	+= setup-sdhci-gpio.o
> +obj-$(CONFIG_SATA_AHCI_PLATFORM)	+= dev-ahci.o
> diff --git a/arch/arm/mach-exynos4/clock.c b/arch/arm/mach-exynos4/clock.c
> index 72d53d5..a6bca06 100644
> --- a/arch/arm/mach-exynos4/clock.c
> +++ b/arch/arm/mach-exynos4/clock.c
> @@ -432,6 +432,12 @@ static struct clk init_clocks_off[] = {
>  		.enable		= exynos4_clk_ip_lcd1_ctrl,
>  		.ctrlbit	= (1 << 0),
>  	}, {
> +		.name		= "sataphy",
> +		.id		= -1,
> +		.parent		= &clk_aclk_133.clk,
> +		.enable		= exynos4_clk_ip_fsys_ctrl,
> +		.ctrlbit	= (1 << 3),
> +	}, {
>  		.name		= "hsmmc",
>  		.id		= 0,
>  		.parent		= &clk_aclk_133.clk,
> @@ -464,6 +470,7 @@ static struct clk init_clocks_off[] = {
>  	}, {
>  		.name		= "sata",
>  		.id		= -1,
> +		.parent		= &clk_aclk_133.clk,
>  		.enable		= exynos4_clk_ip_fsys_ctrl,
>  		.ctrlbit	= (1 << 10),
>  	}, {
> diff --git a/arch/arm/mach-exynos4/dev-ahci.c b/arch/arm/mach-exynos4/dev-
> ahci.c
> new file mode 100644
> index 0000000..c43d8c6
> --- /dev/null
> +++ b/arch/arm/mach-exynos4/dev-ahci.c
> @@ -0,0 +1,260 @@
> +/* linux/arch/arm/mach-exynos4/dev-ahci.c
> + *
> + * Copyright (c) 2011 Samsung Electronics Co., Ltd.
> + *		http://www.samsung.com
> + *
> + * EXYNOS4 - AHCI support
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/platform_device.h>
> +#include <linux/ahci_platform.h>
> +
> +#include <plat/cpu.h>
> +
> +#include <mach/irqs.h>
> +#include <mach/map.h>
> +#include <mach/regs-pmu.h>
> +
> +/* PHY Control Register */
> +#define SATA_CTRL0		0x0
> +/* PHY Link Control Register */
> +#define SATA_CTRL1		0x4
> +/* PHY Status Register */
> +#define SATA_PHY_STATUS		0x8
> +
> +#define SATA_CTRL0_RX_DATA_VALID(x)	(x << 27)
> +#define SATA_CTRL0_SPEED_MODE		(1 << 26)
> +#define SATA_CTRL0_M_PHY_CAL		(1 << 19)
> +#define SATA_CTRL0_PHY_CMU_RST_N	(1 << 10)
> +#define SATA_CTRL0_M_PHY_LN_RST_N	(1 << 9)
> +#define SATA_CTRL0_PHY_POR_N		(1 << 8)
> +
> +#define SATA_CTRL1_RST_PMALIVE_N	(1 << 8)
> +#define SATA_CTRL1_RST_RXOOB_N		(1 << 7)
> +#define SATA_CTRL1_RST_RX_N		(1 << 6)
> +#define SATA_CTRL1_RST_TX_N		(1 << 5)
> +
> +#define SATA_PHY_STATUS_CMU_OK		(1 << 18)
> +#define SATA_PHY_STATUS_LANE_OK		(1 << 16)
> +
> +#define LANE0		0x200
> +#define COM_LANE	0xA00
> +
> +#define HOST_PORTS_IMPL	0xC
> +#define SCLK_SATA_FREQ	(67 * MHZ)
> +
> +static void __iomem *phy_base, *phy_ctrl;
> +
> +struct phy_reg {
> +	u8	reg;
> +	u8	val;
> +};
> +
> +/* SATA PHY setup */
> +static const struct phy_reg exynos4_sataphy_cmu[] = {
> +	{ 0x00, 0x06 }, { 0x02, 0x80 }, { 0x22, 0xa0 }, { 0x23, 0x42 },
> +	{ 0x2e, 0x04 }, { 0x2f, 0x50 }, { 0x30, 0x70 }, { 0x31, 0x02 },
> +	{ 0x32, 0x25 }, { 0x33, 0x40 }, { 0x34, 0x01 }, { 0x35, 0x40 },
> +	{ 0x61, 0x2e }, { 0x63, 0x5e }, { 0x65, 0x42 }, { 0x66, 0xd1 },
> +	{ 0x67, 0x20 }, { 0x68, 0x28 }, { 0x69, 0x78 }, { 0x6a, 0x04 },
> +	{ 0x6b, 0xc8 }, { 0x6c, 0x06 },
> +};
> +
> +static const struct phy_reg exynos4_sataphy_lane[] = {
> +	{ 0x00, 0x02 }, { 0x05, 0x10 }, { 0x06, 0x84 }, { 0x07, 0x04 },
> +	{ 0x08, 0xe0 }, { 0x10, 0x23 }, { 0x13, 0x05 }, { 0x14, 0x30 },
> +	{ 0x15, 0x00 }, { 0x17, 0x70 }, { 0x18, 0xf2 }, { 0x19, 0x1e },
> +	{ 0x1a, 0x18 }, { 0x1b, 0x0d }, { 0x1c, 0x08 }, { 0x50, 0x60 },
> +	{ 0x51, 0x0f },
> +};
> +
> +static const struct phy_reg exynos4_sataphy_comlane[] = {
> +	{ 0x01, 0x20 }, { 0x03, 0x40 }, { 0x04, 0x3c }, { 0x05, 0x7d },
> +	{ 0x06, 0x1d }, { 0x07, 0xcf }, { 0x08, 0x05 }, { 0x09, 0x63 },
> +	{ 0x0a, 0x29 }, { 0x0b, 0xc4 }, { 0x0c, 0x01 }, { 0x0d, 0x03 },
> +	{ 0x0e, 0x28 }, { 0x0f, 0x98 }, { 0x10, 0x19 }, { 0x13, 0x80 },
> +	{ 0x14, 0xf0 }, { 0x15, 0xd0 }, { 0x39, 0xa0 }, { 0x3a, 0xa0 },
> +	{ 0x3b, 0xa0 }, { 0x3c, 0xa0 }, { 0x3d, 0xa0 }, { 0x3e, 0xa0 },
> +	{ 0x3f, 0xa0 }, { 0x40, 0x42 }, { 0x42, 0x80 }, { 0x43, 0x58 },
> +	{ 0x45, 0x44 }, { 0x46, 0x5c }, { 0x47, 0x86 }, { 0x48, 0x8d },
> +	{ 0x49, 0xd0 }, { 0x4a, 0x09 }, { 0x4b, 0x90 }, { 0x4c, 0x07 },
> +	{ 0x4d, 0x40 }, { 0x51, 0x20 }, { 0x52, 0x32 }, { 0x7f, 0xd8 },
> +	{ 0x80, 0x1a }, { 0x81, 0xff }, { 0x82, 0x11 }, { 0x83, 0x00 },
> +	{ 0x87, 0xf0 }, { 0x87, 0xff }, { 0x87, 0xff }, { 0x87, 0xff },
> +	{ 0x87, 0xff }, { 0x8c, 0x1c }, { 0x8d, 0xc2 }, { 0x8e, 0xc3 },
> +	{ 0x8f, 0x3f }, { 0x90, 0x0a }, { 0x96, 0xf8 },
> +};
> +
> +static int wait_for_phy_ready(void __iomem *reg, unsigned long bit)
> +{
> +	unsigned long timeout;
> +
> +	/* wait for maximum of 3 sec */
> +	timeout = jiffies + msecs_to_jiffies(3000);
> +	while (!(__raw_readl(reg) & bit)) {
> +		if (time_after(jiffies, timeout))
> +			return -1;
> +		cpu_relax();
> +	}
> +	return 0;
> +}
> +
> +/* SLSI-Guided PHY Initialization Sequence */
> +static int ahci_phy_init(void __iomem *mmio)
> +{
> +	int i, ctrl0;
> +
> +	for (i = 0; i < ARRAY_SIZE(exynos4_sataphy_cmu); i++)
> +		__raw_writeb(exynos4_sataphy_cmu[i].val,
> +		phy_base + (exynos4_sataphy_cmu[i].reg * 4));
> +
> +	for (i = 0; i < ARRAY_SIZE(exynos4_sataphy_lane); i++)
> +		__raw_writeb(exynos4_sataphy_lane[i].val,
> +		phy_base + (LANE0 + exynos4_sataphy_lane[i].reg) * 4);
> +
> +	for (i = 0; i < ARRAY_SIZE(exynos4_sataphy_comlane); i++)
> +		__raw_writeb(exynos4_sataphy_comlane[i].val,
> +		phy_base + (COM_LANE + exynos4_sataphy_comlane[i].reg) * 4);
> +
> +	__raw_writeb(0x07, phy_base);
> +
> +	ctrl0 = __raw_readl(phy_ctrl + SATA_CTRL0);
> +	ctrl0 |= SATA_CTRL0_PHY_CMU_RST_N;
> +	__raw_writel(ctrl0, phy_ctrl + SATA_CTRL0);
> +
> +	if (wait_for_phy_ready(phy_ctrl + SATA_PHY_STATUS,
> +				SATA_PHY_STATUS_CMU_OK) < 0) {
> +		printk(KERN_ERR "PHY CMU not ready\n");
> +		return -EBUSY;
> +	}
> +
> +	__raw_writeb(0x03, phy_base + (COM_LANE * 4));
> +
> +	ctrl0 = __raw_readl(phy_ctrl + SATA_CTRL0);
> +	ctrl0 |= SATA_CTRL0_M_PHY_LN_RST_N;
> +	__raw_writel(ctrl0, phy_ctrl + SATA_CTRL0);
> +
> +	if (wait_for_phy_ready(phy_ctrl + SATA_PHY_STATUS,
> +				SATA_PHY_STATUS_LANE_OK) < 0) {
> +		printk(KERN_ERR "PHY LANE not ready\n");
> +		return -EBUSY;
> +	}
> +
> +	ctrl0 = __raw_readl(phy_ctrl + SATA_CTRL0);
> +	ctrl0 |= SATA_CTRL0_M_PHY_CAL;
> +	__raw_writel(ctrl0, phy_ctrl + SATA_CTRL0);
> +
> +	return 0;
> +}
> +
> +static int exynos4_ahci_init(struct device *dev, void __iomem *mmio)
> +{
> +	struct clk *clk_sata, *clk_sataphy, *clk_sclk_sata;
> +	int val, ret;
> +
> +	phy_base = ioremap(EXYNOS4_PA_SATAPHY, SZ_64K);
> +	if (!phy_base) {
> +		dev_err(dev, "failed to allocate memory for SATA PHY\n");
> +		return -ENOMEM;
> +	}
> +
> +	phy_ctrl = ioremap(EXYNOS4_PA_SATAPHY_CTRL, SZ_16);
> +	if (!phy_ctrl) {
> +		dev_err(dev, "failed to allocate memory for SATA PHY
CTRL\n");
> +		ret = -ENOMEM;
> +		goto err1;
> +	}
> +
> +	clk_sata = clk_get(dev, "sata");
> +	if (IS_ERR(clk_sata)) {
> +		dev_err(dev, "failed to get sata clock\n");
> +		ret = PTR_ERR(clk_sata);
> +		clk_sata = NULL;
> +		goto err2;
> +
> +	}
> +	clk_enable(clk_sata);
> +
> +	clk_sataphy = clk_get(dev, "sataphy");
> +	if (IS_ERR(clk_sataphy)) {
> +		dev_err(dev, "failed to get sataphy clock\n");
> +		ret = PTR_ERR(clk_sataphy);
> +		clk_sataphy = NULL;
> +		goto err3;
> +	}
> +	clk_enable(clk_sataphy);
> +
> +	clk_sclk_sata = clk_get(dev, "sclk_sata");
> +	if (IS_ERR(clk_sclk_sata)) {
> +		dev_err(dev, "failed to get sclk_sata\n");
> +		ret = PTR_ERR(clk_sclk_sata);
> +		clk_sclk_sata = NULL;
> +		goto err4;
> +	}
> +	clk_enable(clk_sclk_sata);
> +	clk_set_rate(clk_sclk_sata, SCLK_SATA_FREQ);
> +
> +	__raw_writel(S5P_PMU_SATA_PHY_CONTROL_EN, S5P_PMU_SATA_PHY_CONTROL);
> +
> +	/* Enable PHY link control */
> +	val = SATA_CTRL1_RST_PMALIVE_N | SATA_CTRL1_RST_RXOOB_N |
> +			SATA_CTRL1_RST_RX_N | SATA_CTRL1_RST_TX_N;
> +	__raw_writel(val, phy_ctrl + SATA_CTRL1);
> +
> +	/* Set communication speed as 3Gbps and enable PHY power */
> +	val = SATA_CTRL0_RX_DATA_VALID(3) | SATA_CTRL0_SPEED_MODE |
> +			SATA_CTRL0_PHY_POR_N;
> +	__raw_writel(val, phy_ctrl + SATA_CTRL0);
> +
> +	/* Port0 is available */
> +	__raw_writel(0x1, mmio + HOST_PORTS_IMPL);
> +
> +	return ahci_phy_init(mmio);
> +
> +err4:
> +	clk_disable(clk_sataphy);
> +	clk_put(clk_sataphy);
> +err3:
> +	clk_disable(clk_sata);
> +	clk_put(clk_sata);
> +err2:
> +	iounmap(phy_ctrl);
> +err1:
> +	iounmap(phy_base);
> +
> +	return ret;
> +}
> +
> +static struct ahci_platform_data exynos4_ahci_pdata = {
> +	.init = exynos4_ahci_init,
> +};
> +
> +static struct resource exynos4_ahci_resource[] = {
> +	[0] = {
> +		.start	= EXYNOS4_PA_SATA,
> +		.end	= EXYNOS4_PA_SATA + SZ_64K - 1,
> +		.flags	= IORESOURCE_MEM,
> +	},
> +	[1] = {
> +		.start	= IRQ_SATA,
> +		.end	= IRQ_SATA,
> +		.flags	= IORESOURCE_IRQ,
> +	},
> +};
> +
> +struct platform_device exynos4_device_ahci = {
> +	.name			= "ahci",
> +	.id			= -1,
> +	.resource		= exynos4_ahci_resource,
> +	.num_resources		= ARRAY_SIZE(exynos4_ahci_resource),
> +	.dev.dma_mask		=
&exynos4_device_ahci.dev.coherent_dma_mask,
> +	.dev.coherent_dma_mask	= DMA_BIT_MASK(32),
> +	.dev.platform_data	= &exynos4_ahci_pdata,
> +};

static u64 exynos4_ahci_dmamask = DMA_BIT_MASK(32);

struct platform_device exynos4_device_ahci = {
	.name			= "ahci",
	.id			= -1,
	.resource		= exynos4_ahci_resource,
	.num_resources		= ARRAY_SIZE(exynos4_ahci_resource),
	.dev = {
		.platform_data = &exynos4_ahci_pdata,
		.dma_mask = &exynos4_ahci_dmamask,
		.coherent_dma_mask = DMA_BIT_MASK(32),
	},
};

> diff --git a/arch/arm/mach-exynos4/include/mach/map.h b/arch/arm/mach-
> exynos4/include/mach/map.h
> index 80a41e0..234b4ed 100644
> --- a/arch/arm/mach-exynos4/include/mach/map.h
> +++ b/arch/arm/mach-exynos4/include/mach/map.h
> @@ -89,6 +89,10 @@
> 
>  #define EXYNOS4_PA_SROMC		0x12570000
> 
> +#define EXYNOS4_PA_SATA			0x12560000
> +#define EXYNOS4_PA_SATAPHY		0x125D0000
> +#define EXYNOS4_PA_SATAPHY_CTRL		0x126B0000
> +
>  #define EXYNOS4_PA_UART			0x13800000
> 
>  #define EXYNOS4_PA_IIC(x)		(0x13860000 + ((x) * 0x10000))
> diff --git a/arch/arm/mach-exynos4/include/mach/regs-pmu.h
b/arch/arm/mach-
> exynos4/include/mach/regs-pmu.h
> index 2ddd617..b334132 100644
> --- a/arch/arm/mach-exynos4/include/mach/regs-pmu.h
> +++ b/arch/arm/mach-exynos4/include/mach/regs-pmu.h
> @@ -17,6 +17,7 @@
> 
>  #define S5P_PMUREG(x)			(S5P_VA_PMU + (x))
> 
> +#define S5P_PMU_SATA_PHY_CONTROL	S5P_PMUREG(0x720)
>  #define S5P_PMU_CAM_CONF		S5P_PMUREG(0x3C00)
>  #define S5P_PMU_TV_CONF			S5P_PMUREG(0x3C20)
>  #define S5P_PMU_MFC_CONF		S5P_PMUREG(0x3C40)
> @@ -25,6 +26,8 @@
>  #define S5P_PMU_LCD1_CONF		S5P_PMUREG(0x3CA0)
>  #define S5P_PMU_GPS_CONF		S5P_PMUREG(0x3CE0)
> 
> +#define S5P_PMU_SATA_PHY_CONTROL_EN	0x1
> +
>  #define S5P_INT_LOCAL_PWR_EN		0x7
> 
>  #endif /* __ASM_ARCH_REGS_PMU_H */
> diff --git a/arch/arm/mach-exynos4/mach-armlex4210.c b/arch/arm/mach-
> exynos4/mach-armlex4210.c
> index 1ec7e77..b482c62 100644
> --- a/arch/arm/mach-exynos4/mach-armlex4210.c
> +++ b/arch/arm/mach-exynos4/mach-armlex4210.c
> @@ -158,6 +158,7 @@ static struct platform_device *armlex4210_devices[]
> __initdata = {
>  	&exynos4_device_sysmmu,
>  	&samsung_asoc_dma,
>  	&armlex4210_smsc911x,
> +	&exynos4_device_ahci,
>  };
> 
>  static void __init armlex4210_smsc911x_init(void)
> diff --git a/arch/arm/plat-samsung/include/plat/devs.h b/arch/arm/plat-
> samsung/include/plat/devs.h
> index e2b3ab9..b6157cf 100644
> --- a/arch/arm/plat-samsung/include/plat/devs.h
> +++ b/arch/arm/plat-samsung/include/plat/devs.h
> @@ -108,6 +108,7 @@ extern struct platform_device exynos4_device_i2s1;
>  extern struct platform_device exynos4_device_i2s2;
>  extern struct platform_device exynos4_device_spdif;
>  extern struct platform_device exynos4_device_pd[];
> +extern struct platform_device exynos4_device_ahci;
> 
>  extern struct platform_device s5p6442_device_pcm0;
>  extern struct platform_device s5p6442_device_pcm1;
> --
> 1.6.6.1

Abhilash,

Looks ok, could you please re-work based on latest my for-next?

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
