From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2 6/6] ARM: EXYNOS4: Limit usage of pl330 device instance
 to non-dt build
Date: Mon, 05 Sep 2011 14:17:08 +0900
Message-ID: <001901cc6b8b$0f450730$2dcf1590$%kim@samsung.com>
References: <1314867882-11755-1-git-send-email-thomas.abraham@linaro.org>
 <1314867882-11755-2-git-send-email-thomas.abraham@linaro.org>
 <1314867882-11755-3-git-send-email-thomas.abraham@linaro.org>
 <1314867882-11755-4-git-send-email-thomas.abraham@linaro.org>
 <1314867882-11755-5-git-send-email-thomas.abraham@linaro.org>
 <1314867882-11755-6-git-send-email-thomas.abraham@linaro.org>
 <1314867882-11755-7-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:8981 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751064Ab1IEFRK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 5 Sep 2011 01:17:10 -0400
Received: from epcpsbgm2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LR100M2IAO65X90@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 05 Sep 2011 14:17:09 +0900 (KST)
Received: from kgenekim ([12.23.120.114])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LR100M09AOKWY60@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Mon, 05 Sep 2011 14:17:08 +0900 (KST)
In-reply-to: <1314867882-11755-7-git-send-email-thomas.abraham@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Thomas Abraham' <thomas.abraham@linaro.org>, devicetree-discuss@lists.ozlabs.org
Cc: grant.likely@secretlab.ca, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, robherring2@gmail.com, vinod.koul@intel.com, patches@linaro.org, jassisinghbrar@gmail.com, boojin.kim@samsung.com

> -----Original Message-----
> From: Thomas Abraham [mailto:thomas.abraham@linaro.org]
> Sent: Thursday, September 01, 2011 6:05 PM
> To: devicetree-discuss@lists.ozlabs.org
> Cc: grant.likely@secretlab.ca; linux-arm-kernel@lists.infradead.org;
linux-samsung-
> soc@vger.kernel.org; kgene.kim@samsung.com; robherring2@gmail.com;
> vinod.koul@intel.com; patches@linaro.org; jassisinghbrar@gmail.com;
> boojin.kim@samsung.com
> Subject: [PATCH v2 6/6] ARM: EXYNOS4: Limit usage of pl330 device instance
to
> non-dt build
> 
> The pl330 device instances and associated platform data is required only
> for non-device-tree builds. With device tree, all of this information is
> obtained from the device tree.
> 
> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
> ---
>  arch/arm/mach-exynos4/Kconfig  |    7 +++++++
>  arch/arm/mach-exynos4/Makefile |    3 ++-
>  2 files changed, 9 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4/Kconfig
> index d4d401c..3edbf37 100644
> --- a/arch/arm/mach-exynos4/Kconfig
> +++ b/arch/arm/mach-exynos4/Kconfig
> @@ -21,6 +21,13 @@ config EXYNOS4_MCT
>  	help
>  	  Use MCT (Multi Core Timer) as kernel timers
> 
> +config EXYNOS4_DEV_DMA
> +	bool
> +	default y if !OF
> +	help
> +	  Compile in amba device definitions for DMA controller if OF
> +	  is not enabled.
> +
>  config EXYNOS4_DEV_AHCI
>  	bool
>  	help
> diff --git a/arch/arm/mach-exynos4/Makefile
b/arch/arm/mach-exynos4/Makefile
> index d2bf5bf..a2f33dc 100644
> --- a/arch/arm/mach-exynos4/Makefile
> +++ b/arch/arm/mach-exynos4/Makefile
> @@ -13,7 +13,8 @@ obj-				:=
>  # Core support for EXYNOS4 system
> 
>  obj-$(CONFIG_CPU_EXYNOS4210)	+= cpu.o init.o clock.o irq-combiner.o
> -obj-$(CONFIG_CPU_EXYNOS4210)	+= setup-i2c0.o irq-eint.o dma.o
> pmu.o
> +obj-$(CONFIG_CPU_EXYNOS4210)	+= setup-i2c0.o irq-eint.o pmu.o
> +obj-$(CONFIG_EXYNOS4_DEV_DMA)	+= dma.o

Do we need _really_ EXYNOS4_DEV_DMA here?
How about to use like following?

+obj-$(!CONFIG_OF)		+= dma.o

If any problems, let me know.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.


>  obj-$(CONFIG_PM)		+= pm.o sleep.o
>  obj-$(CONFIG_CPU_IDLE)		+= cpuidle.o
> 
> --
> 1.6.6.rc2
