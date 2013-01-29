From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 2/6] ARM: dts: Add MFC codec support for Exynos4 DT machines
Date: Tue, 29 Jan 2013 14:36:47 +0100
Message-ID: <5107D06F.4000002@samsung.com>
References: <1359432822-23846-1-git-send-email-sachin.kamat@linaro.org>
 <1359432822-23846-3-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:56297 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751386Ab3A2Ngy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 29 Jan 2013 08:36:54 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MHE005HN31ZT570@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 29 Jan 2013 13:36:51 +0000 (GMT)
Received: from [106.116.147.32] by eusync1.samsung.com
 (Oracle Communications Messaging Server 7u4-23.01(7.0.4.23.0) 64bit (built Aug
 10 2011)) with ESMTPA id <0MHE008SV35FWW50@eusync1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 29 Jan 2013 13:36:51 +0000 (GMT)
In-reply-to: <1359432822-23846-3-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, patches@linaro.org

On 01/29/2013 05:13 AM, Sachin Kamat wrote:
> This patch adds MFC codec support for Exynos4 DT machines.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  arch/arm/boot/dts/exynos4.dtsi         |    7 +++++++
>  arch/arm/mach-exynos/mach-exynos4-dt.c |   17 +++++++++++++++++
>  2 files changed, 24 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
> index e1347fc..1122fb1 100644
> --- a/arch/arm/boot/dts/exynos4.dtsi
> +++ b/arch/arm/boot/dts/exynos4.dtsi
> @@ -289,4 +289,11 @@
>  			interrupts = <0 34 0>;
>  		};
>  	};
> +
> +	mfc: codec@13400000 {
> +		compatible = "samsung,mfc-v5";
> +		reg = <0x13400000 0x10000>;
> +		interrupts = <0 94 0>;
> +		samsung,power-domain = <&pd_mfc>;

Please add:
		status = "disabled";

> +	};
>  };
> diff --git a/arch/arm/mach-exynos/mach-exynos4-dt.c b/arch/arm/mach-exynos/mach-exynos4-dt.c
> index ab1dacc..8ae8da1 100644
> --- a/arch/arm/mach-exynos/mach-exynos4-dt.c
> +++ b/arch/arm/mach-exynos/mach-exynos4-dt.c
> @@ -12,7 +12,9 @@
>  */
>  
>  #include <linux/of_platform.h>
> +#include <linux/of_fdt.h>
>  #include <linux/serial_core.h>
> +#include <linux/memblock.h>
>  
>  #include <asm/mach/arch.h>
>  #include <asm/hardware/gic.h>
> @@ -20,6 +22,7 @@
>  
>  #include <plat/cpu.h>
>  #include <plat/regs-serial.h>
> +#include <plat/mfc.h>
>  
>  #include "common.h"
>  
> @@ -80,6 +83,7 @@ static const struct of_dev_auxdata exynos4_auxdata_lookup[] __initconst = {
>  	OF_DEV_AUXDATA("arm,pl330", EXYNOS4_PA_MDMA1, "dma-pl330.2", NULL),
>  	OF_DEV_AUXDATA("samsung,exynos4210-tmu", EXYNOS4_PA_TMU,
>  				"exynos-tmu", NULL),
> +	OF_DEV_AUXDATA("samsung,mfc-v5", 0x13400000, "s5p-mfc", NULL),
>  	{},
>  };
>  
> @@ -102,6 +106,18 @@ static char const *exynos4_dt_compat[] __initdata = {
>  	NULL
>  };
>  
> +static void __init exynos4_reserve(void)
> +{
> +#ifdef CONFIG_S5P_DEV_MFC

Where is this symbol supposed to be enabled ?

Don't you need a change like this as a part of this patch ?

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index 1d9312a..1ae72d9 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -413,6 +413,7 @@ config MACH_EXYNOS4_DT
        select USE_OF
        select EXYNOS4_SETUP_USB_PHY
        select ARM_DMA_USE_IOMMU if EXYNOS_IOMMU
+       select S5P_DEV_MFC
        help
          Machine support for Samsung Exynos4 machine with device tree enabled.
          Select this if a fdt blob is available for the Exynos4 SoC based board.

--

Thanks,
Sylwester
