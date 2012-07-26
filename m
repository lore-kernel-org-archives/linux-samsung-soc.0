From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 1/2] ARM: EXYNOS: Fix ARM PMU irq numbers
Date: Thu, 26 Jul 2012 09:22:43 +0530
Message-ID: <CAK9yfHyXzSp1Q75neuC0Q2=7RhXQXmKAQOPxE522SCsupwixTw@mail.gmail.com>
References: <1343262902-19073-1-git-send-email-chanho61.park@samsung.com>
	<1343262902-19073-2-git-send-email-chanho61.park@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f174.google.com ([209.85.220.174]:57820 "EHLO
	mail-vc0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751345Ab2GZDwo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Jul 2012 23:52:44 -0400
Received: by vcbfk26 with SMTP id fk26so1280313vcb.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Jul 2012 20:52:43 -0700 (PDT)
In-Reply-To: <1343262902-19073-2-git-send-email-chanho61.park@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanho Park <chanho61.park@samsung.com>
Cc: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org, Kyungmin Park <kyungmin.park@samsung.com>

On 26 July 2012 06:05, Chanho Park <chanho61.park@samsung.com> wrote:
> This patch fixes irq numbers of ARM PMU(Perfromance Monitoring Unit).
> We need to seperate arm-pmu(performance measurement unit) and exynos-pmu(power
> management unit). I decide to change EXYNOS4_IRQ_PMU to EXYNOS4_IRQ_POWER_PMU
> because there are no one use it.
> A max cpu number of exynos4 is four in case of exynos44xx. So we should define 3
> additional pmu irq numbers and enable it according to the number of cpus.
>
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/mach-exynos/include/mach/irqs.h |   18 ++++++++++++++++--
>  arch/arm/plat-samsung/devs.c             |    9 ++++++++-
>  2 files changed, 24 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm/mach-exynos/include/mach/irqs.h b/arch/arm/mach-exynos/include/mach/irqs.h
> index 35bced6..329b07d 100644
> --- a/arch/arm/mach-exynos/include/mach/irqs.h
> +++ b/arch/arm/mach-exynos/include/mach/irqs.h
> @@ -128,7 +128,7 @@
>  #define EXYNOS4_IRQ_ADC1               IRQ_SPI(107)
>  #define EXYNOS4_IRQ_PEN1               IRQ_SPI(108)
>  #define EXYNOS4_IRQ_KEYPAD             IRQ_SPI(109)
> -#define EXYNOS4_IRQ_PMU                        IRQ_SPI(110)
> +#define EXYNOS4_IRQ_POWER_PMU          IRQ_SPI(110)
>  #define EXYNOS4_IRQ_GPS                        IRQ_SPI(111)
>  #define EXYNOS4_IRQ_INTFEEDCTRL_SSS    IRQ_SPI(112)
>  #define EXYNOS4_IRQ_SLIMBUS            IRQ_SPI(113)
> @@ -136,6 +136,11 @@
>  #define EXYNOS4_IRQ_TSI                        IRQ_SPI(115)
>  #define EXYNOS4_IRQ_SATA               IRQ_SPI(116)
>
> +#define EXYNOS4_IRQ_PMU                        COMBINER_IRQ(2, 2)
> +#define EXYNOS4_IRQ_PMU_CPU1           COMBINER_IRQ(3, 2)
> +#define EXYNOS4_IRQ_PMU_CPU2           COMBINER_IRQ(18, 2)
> +#define EXYNOS4_IRQ_PMU_CPU3           COMBINER_IRQ(19, 2)
> +
>  #define EXYNOS4_IRQ_SYSMMU_MDMA0_0     COMBINER_IRQ(4, 0)
>  #define EXYNOS4_IRQ_SYSMMU_SSS_0       COMBINER_IRQ(4, 1)
>  #define EXYNOS4_IRQ_SYSMMU_FIMC0_0     COMBINER_IRQ(4, 2)
> @@ -230,7 +235,6 @@
>  #define IRQ_TC                         EXYNOS4_IRQ_PEN0
>
>  #define IRQ_KEYPAD                     EXYNOS4_IRQ_KEYPAD
> -#define IRQ_PMU                                EXYNOS4_IRQ_PMU
>
>  #define IRQ_FIMD0_FIFO                 EXYNOS4_IRQ_FIMD0_FIFO
>  #define IRQ_FIMD0_VSYNC                        EXYNOS4_IRQ_FIMD0_VSYNC
> @@ -453,6 +457,16 @@
>  #define EXYNOS5_IRQ_GPIO3_NR_GROUPS    5
>  #define EXYNOS5_IRQ_GPIO4_NR_GROUPS    1
>
> +#if defined(CONFIG_ARCH_EXYNOS4)
> +#define IRQ_PMU                                EXYNOS4_IRQ_PMU
> +#define IRQ_PMU1                       EXYNOS4_IRQ_PMU_CPU1
> +#define IRQ_PMU2                       EXYNOS4_IRQ_PMU_CPU2
> +#define IRQ_PMU3                       EXYNOS4_IRQ_PMU_CPU3
> +#elif defined(CONFIG_ARCH_EXYNOS5)
> +#define IRQ_PMU                                EXYNOS5_IRQ_PMU
> +#define IRQ_PMU1                       EXYNOS5_IRQ_PMU_CPU1
> +#endif

This will not work when both Exynos 4 and 5 are enabled.

> +
>  #define MAX_COMBINER_NR                        (EXYNOS4_MAX_COMBINER_NR > EXYNOS5_MAX_COMBINER_NR ? \
>                                         EXYNOS4_MAX_COMBINER_NR : EXYNOS5_MAX_COMBINER_NR)
>
> diff --git a/arch/arm/plat-samsung/devs.c b/arch/arm/plat-samsung/devs.c
> index 74e31ce..91048a6 100644
> --- a/arch/arm/plat-samsung/devs.c
> +++ b/arch/arm/plat-samsung/devs.c
> @@ -1100,7 +1100,14 @@ struct platform_device s5p_device_onenand = {
>
>  #ifdef CONFIG_PLAT_S5P
>  static struct resource s5p_pmu_resource[] = {
> -       DEFINE_RES_IRQ(IRQ_PMU)
> +       DEFINE_RES_IRQ(IRQ_PMU),
> +#if (CONFIG_NR_CPUS > 1)
> +       DEFINE_RES_IRQ(IRQ_PMU1),
> +#elif (CONFIG_NR_CPUS > 2)
> +       DEFINE_RES_IRQ(IRQ_PMU2),
> +#elif (CONFIG_NR_CPUS > 3)
> +       DEFINE_RES_IRQ(IRQ_PMU3),
> +#endif
>  };
>
>  static struct platform_device s5p_device_pmu = {
> --
> 1.7.9.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
With warm regards,
Sachin
