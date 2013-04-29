From: Chander Kashyap <chander.kashyap@linaro.org>
Subject: Re: [PATCH] ARM: EXYNOS5: Fix kernel dump in AFTR idle mode
Date: Mon, 29 Apr 2013 17:24:34 +0530
Message-ID: <CANuQgHEkbs1m+Q1XEy0_rZyd+qeTyGcXdq3sw0GBOLBDRaNKew@mail.gmail.com>
References: <1367235107-31328-1-git-send-email-inderpal.singh@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f42.google.com ([209.85.219.42]:34497 "EHLO
	mail-oa0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753363Ab3D2Lyf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 29 Apr 2013 07:54:35 -0400
Received: by mail-oa0-f42.google.com with SMTP id i10so6006189oag.29
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Apr 2013 04:54:34 -0700 (PDT)
In-Reply-To: <1367235107-31328-1-git-send-email-inderpal.singh@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inderpal Singh <inderpal.singh@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, arnd@arndb.de, olof@lixom.net, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Patch Tracking <patches@linaro.org>

On 29 April 2013 17:01, Inderpal Singh <inderpal.singh@linaro.org> wrote:
>
> The kernel crashes while resuming from AFTR idle mode. It happens
> because L2 cache was not going into retention state.
>
> This patch configures the USE_RETENTION bit of ARM_L2_OPTION register
> so that it does not depend on MANUAL_L2RSTDISABLE_CONTROL of
> ARM_COMMON_OPTION register for L2RSTDISABLE signal.
>
> Signed-off-by: Inderpal Singh <inderpal.singh@linaro.org>
> ---
>
> Tested on arndale board on arm-soc next/soc branch.
>
>  arch/arm/mach-exynos/include/mach/regs-pmu.h |    1 +
>  arch/arm/mach-exynos/pmu.c                   |    5 ++---
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm/mach-exynos/include/mach/regs-pmu.h b/arch/arm/mach-exynos/include/mach/regs-pmu.h
> index 3f30aa1..57344b7 100644
> --- a/arch/arm/mach-exynos/include/mach/regs-pmu.h
> +++ b/arch/arm/mach-exynos/include/mach/regs-pmu.h
> @@ -344,6 +344,7 @@
>  #define EXYNOS5_FSYS_ARM_OPTION                                        S5P_PMUREG(0x2208)
>  #define EXYNOS5_ISP_ARM_OPTION                                 S5P_PMUREG(0x2288)
>  #define EXYNOS5_ARM_COMMON_OPTION                              S5P_PMUREG(0x2408)
> +#define EXYNOS5_ARM_L2_OPTION                                  S5P_PMUREG(0x2608)
>  #define EXYNOS5_TOP_PWR_OPTION                                 S5P_PMUREG(0x2C48)
>  #define EXYNOS5_TOP_PWR_SYSMEM_OPTION                          S5P_PMUREG(0x2CC8)
>  #define EXYNOS5_JPEG_MEM_OPTION                                        S5P_PMUREG(0x2F48)
> diff --git a/arch/arm/mach-exynos/pmu.c b/arch/arm/mach-exynos/pmu.c
> index daebc1a..97d6885 100644
> --- a/arch/arm/mach-exynos/pmu.c
> +++ b/arch/arm/mach-exynos/pmu.c
> @@ -228,6 +228,7 @@ static struct exynos_pmu_conf exynos5250_pmu_config[] = {
>         { EXYNOS5_DIS_IRQ_ISP_ARM_CENTRAL_SYS_PWR_REG,  { 0x0, 0x0, 0x0} },
>         { EXYNOS5_ARM_COMMON_SYS_PWR_REG,               { 0x0, 0x0, 0x2} },
>         { EXYNOS5_ARM_L2_SYS_PWR_REG,                   { 0x3, 0x3, 0x3} },
> +       { EXYNOS5_ARM_L2_OPTION,                        { 0x10, 0x10, 0x0 } },
>         { EXYNOS5_CMU_ACLKSTOP_SYS_PWR_REG,             { 0x1, 0x0, 0x1} },
>         { EXYNOS5_CMU_SCLKSTOP_SYS_PWR_REG,             { 0x1, 0x0, 0x1} },
>         { EXYNOS5_CMU_RESET_SYS_PWR_REG,                { 0x1, 0x1, 0x0} },
> @@ -353,11 +354,9 @@ static void exynos5_init_pmu(void)
>
>         /*
>          * SKIP_DEACTIVATE_ACEACP_IN_PWDN_BITFIELD Enable
> -        * MANUAL_L2RSTDISABLE_CONTROL_BITFIELD Enable
>          */
>         tmp = __raw_readl(EXYNOS5_ARM_COMMON_OPTION);
> -       tmp |= (EXYNOS5_MANUAL_L2RSTDISABLE_CONTROL |
> -               EXYNOS5_SKIP_DEACTIVATE_ACEACP_IN_PWDN);
> +       tmp |= EXYNOS5_SKIP_DEACTIVATE_ACEACP_IN_PWDN;
>         __raw_writel(tmp, EXYNOS5_ARM_COMMON_OPTION);
>
>         /*
> --
> 1.7.9.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

working fine.
Tested-by: Chander Kashyap <chander.kashyap@linaro.org>



--
with warm regards,
Chander Kashyap
