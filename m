From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2 3/3] ARM: S5P: Add support for common MIPI CSIS/DSIM
 D-PHY	control
Date: Thu, 10 Mar 2011 07:55:12 +0900
Message-ID: <002601cbdead$0f1cb840$2d5628c0$%kim@samsung.com>
References: <01a701cbd95d$9873c160$c95b4420$%kim@samsung.com>
 <1299179061-30959-4-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:23590 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751189Ab1CIWzT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 Mar 2011 17:55:19 -0500
Received: from epmmp1 (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LHT007YSBO5RSB0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 10 Mar 2011 07:55:17 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LHT003RNBO57C@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 10 Mar 2011 07:55:17 +0900 (KST)
In-reply-to: <1299179061-30959-4-git-send-email-s.nawrocki@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, m.szyprowski@samsung.com, kyungmin.park@samsung.com, inki.dae@samsung.com

Sylwester Nawrocki wrote:
> 
> Add common code for MIPI-CSIS and MIPI-DSIM drivers to support
> their corresponding D-PHY's enable and reset control.
> Tested with S5PV210 and EXYNOS4 SoCs.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/mach-exynos4/include/mach/regs-pmu.h   |    5 ++
>  arch/arm/mach-s5pv210/include/mach/regs-clock.h |    5 +-
>  arch/arm/plat-s5p/Kconfig                       |    5 ++
>  arch/arm/plat-s5p/Makefile                      |    1 +
>  arch/arm/plat-s5p/setup-mipi.c                  |   68
> +++++++++++++++++++++++
>  5 files changed, 83 insertions(+), 1 deletions(-)
>  create mode 100644 arch/arm/plat-s5p/setup-mipi.c
> 
> diff --git a/arch/arm/mach-exynos4/include/mach/regs-pmu.h
b/arch/arm/mach-
> exynos4/include/mach/regs-pmu.h
> index 2ddd617..985416d 100644
> --- a/arch/arm/mach-exynos4/include/mach/regs-pmu.h
> +++ b/arch/arm/mach-exynos4/include/mach/regs-pmu.h
> @@ -17,6 +17,11 @@
> 
>  #define S5P_PMUREG(x)			(S5P_VA_PMU + (x))
> 
> +#define S5P_MIPI_DPHY_CONTROL(n)	S5P_PMUREG(0x0710 + (n) * 4)
> +#define S5P_MIPI_DPHY_ENABLE		(1 << 0)
> +#define S5P_MIPI_DPHY_SRESETN		(1 << 1)
> +#define S5P_MIPI_DPHY_MRESETN		(1 << 2)
> +
>  #define S5P_PMU_CAM_CONF		S5P_PMUREG(0x3C00)
>  #define S5P_PMU_TV_CONF			S5P_PMUREG(0x3C20)
>  #define S5P_PMU_MFC_CONF		S5P_PMUREG(0x3C40)
> diff --git a/arch/arm/mach-s5pv210/include/mach/regs-clock.h
b/arch/arm/mach-
> s5pv210/include/mach/regs-clock.h
> index 4c45b74..78925c5 100644
> --- a/arch/arm/mach-s5pv210/include/mach/regs-clock.h
> +++ b/arch/arm/mach-s5pv210/include/mach/regs-clock.h
> @@ -146,6 +146,10 @@
>  #define S5P_OM_STAT		S5P_CLKREG(0xE100)
>  #define S5P_USB_PHY_CONTROL	S5P_CLKREG(0xE80C)
>  #define S5P_DAC_CONTROL		S5P_CLKREG(0xE810)
> +#define S5P_MIPI_DPHY_CONTROL(x) S5P_CLKREG(0xE814)
> +#define S5P_MIPI_DPHY_ENABLE	(1 << 0)
> +#define S5P_MIPI_DPHY_SRESETN	(1 << 1)
> +#define S5P_MIPI_DPHY_MRESETN	(1 << 2)
> 
>  #define S5P_INFORM0		S5P_CLKREG(0xF000)
>  #define S5P_INFORM1		S5P_CLKREG(0xF004)
> @@ -161,7 +165,6 @@
>  #define S5P_MDNIE_SEL		S5P_CLKREG(0x7008)
>  #define S5P_MIPI_PHY_CON0	S5P_CLKREG(0x7200)
>  #define S5P_MIPI_PHY_CON1	S5P_CLKREG(0x7204)
> -#define S5P_MIPI_DPHY_CONTROL	S5P_CLKREG(0xE814)
> 
>  #define S5P_IDLE_CFG_TL_MASK	(3 << 30)
>  #define S5P_IDLE_CFG_TM_MASK	(3 << 28)
> diff --git a/arch/arm/plat-s5p/Kconfig b/arch/arm/plat-s5p/Kconfig
> index 6390ac7..be316d7 100644
> --- a/arch/arm/plat-s5p/Kconfig
> +++ b/arch/arm/plat-s5p/Kconfig
> @@ -74,3 +74,8 @@ config S5P_DEV_CSIS1
>  	bool
>  	help
>  	  Compile in platform device definitions for MIPI-CSIS channel 1
> +
> +config S5P_SETUP_MIPI

How about S5P_SETUP_MIPIPHY ?

> +	bool
> +	help
> +	  Compile in common setup code for MIPI-CSIS and MIPI-DSIM devices.
> diff --git a/arch/arm/plat-s5p/Makefile b/arch/arm/plat-s5p/Makefile
> index 4bd5cf9..84651af 100644
> --- a/arch/arm/plat-s5p/Makefile
> +++ b/arch/arm/plat-s5p/Makefile
> @@ -31,3 +31,4 @@ obj-$(CONFIG_S5P_DEV_FIMC2)	+= dev-fimc2.o
>  obj-$(CONFIG_S5P_DEV_ONENAND)	+= dev-onenand.o
>  obj-$(CONFIG_S5P_DEV_CSIS0)	+= dev-csis0.o
>  obj-$(CONFIG_S5P_DEV_CSIS1)	+= dev-csis1.o
> +obj-$(CONFIG_S5P_SETUP_MIPI)	+= setup-mipi.o
> diff --git a/arch/arm/plat-s5p/setup-mipi.c
b/arch/arm/plat-s5p/setup-mipi.c
> new file mode 100644
> index 0000000..4d8ae96
> --- /dev/null
> +++ b/arch/arm/plat-s5p/setup-mipi.c

I think, "setup-mipiphy.c" is more clearly :)

> @@ -0,0 +1,68 @@
> +/*
> + * Copyright (C) 2011 Samsung Electronics Co., Ltd
> + *
> + * S5P - Helper functions for MIPI-CSIS and MIPI-DSIM D-PHY control
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/platform_device.h>
> +#include <linux/io.h>
> +#include <linux/spinlock.h>
> +
> +#ifdef CONFIG_ARCH_EXYNOS4
> +#include <mach/regs-pmu.h>
> +#else
> +#include <mach/regs-clock.h>
> +#endif

How about following?

--- a/arch/arm/mach-exynos4/include/mach/regs-clock.h
+++ b/arch/arm/mach-exynos4/include/mach/regs-clock.h
@@ -160,7 +160,9 @@
 #define S5P_CLKDIV_BUS_GPLR_SHIFT      (4)
 #define S5P_CLKDIV_BUS_GPLR_MASK       (0x7 << S5P_CLKDIV_BUS_GPLR_SHIFT)

-/* Compatibility defines */
+/* Compatibility defines and inclusion */
+
+#include <mach/regs-pmu.h>

 #define S5P_EPLL_CON                   S5P_EPLL_CON0

Then, just adding regs-clock.h here.

+#include <mach/regs-clock.h>

> +
> +static int __s5p_mipi_phy_control(struct platform_device *pdev,
> +				  bool on, u32 reset)
> +{
> +	static DEFINE_SPINLOCK(lock);
> +	void __iomem *addr;
> +	unsigned long flags;
> +	int pid;
> +	u32 cfg;
> +
> +	if (!pdev)
> +		return -EINVAL;
> +
> +	pid = (pdev->id == -1) ? 0 : pdev->id;
> +
> +	if (pid != 0 && pid != 1)
> +		return -EINVAL;
> +
> +	addr = S5P_MIPI_DPHY_CONTROL(pid);
> +
> +	spin_lock_irqsave(&lock, flags);
> +
> +	cfg = __raw_readl(addr);
> +	cfg = on ? (cfg | reset) : (cfg & ~reset);
> +	__raw_writel(cfg, addr);
> +
> +	if (on) {
> +		cfg |= S5P_MIPI_DPHY_ENABLE;
> +	} else if (!(cfg & (S5P_MIPI_DPHY_SRESETN |
> +			    S5P_MIPI_DPHY_MRESETN) & ~reset)) {
> +		cfg &= ~S5P_MIPI_DPHY_ENABLE;
> +	}
> +
> +	__raw_writel(cfg, addr);
> +	spin_unlock_irqrestore(&lock, flags);
> +
> +	return 0;
> +}
> +
> +int s5p_csis_phy_enable(struct platform_device *pdev, bool on)
> +{
> +	return __s5p_mipi_phy_control(pdev, on, S5P_MIPI_DPHY_SRESETN);
> +}
> +
> +int s5p_dsim_phy_enable(struct platform_device *pdev, bool on)
> +{
> +	return __s5p_mipi_phy_control(pdev, on, S5P_MIPI_DPHY_MRESETN);
> +}
> --

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
