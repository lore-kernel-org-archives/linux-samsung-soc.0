From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/1] ARM: EXYNOS: Add missing static storage class
 specifier in pmu.c file
Date: Thu, 12 Jul 2012 18:10:25 +0900
Message-ID: <0fac01cd600e$2c97d8d0$85c78a70$%kim@samsung.com>
References: <1341575543-19521-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:28683 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932960Ab2GLJK1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Jul 2012 05:10:27 -0400
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M7100G3VITEUSW0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 12 Jul 2012 18:10:26 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M71004UUITDPI30@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 12 Jul 2012 18:10:25 +0900 (KST)
In-reply-to: <1341575543-19521-1-git-send-email-sachin.kamat@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: patches@linaro.org

Sachin Kamat wrote:
> 
> arch/arm/mach-exynos/pmu.c:318:14: warning:
> symbol 'exynos5_list_both_cnt_feed' was not declared. Should it be static?
> arch/arm/mach-exynos/pmu.c:332:14: warning:
> symbol 'exynos5_list_diable_wfi_wfe' was not declared. Should it be
static?
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  arch/arm/mach-exynos/pmu.c |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/pmu.c b/arch/arm/mach-exynos/pmu.c
> index bb4c522..3a48c85 100644
> --- a/arch/arm/mach-exynos/pmu.c
> +++ b/arch/arm/mach-exynos/pmu.c
> @@ -315,7 +315,7 @@ static struct exynos_pmu_conf exynos5250_pmu_config[]
> = {
>  	{ PMU_TABLE_END,},
>  };
> 
> -void __iomem *exynos5_list_both_cnt_feed[] = {
> +static void __iomem *exynos5_list_both_cnt_feed[] = {
>  	EXYNOS5_ARM_CORE0_OPTION,
>  	EXYNOS5_ARM_CORE1_OPTION,
>  	EXYNOS5_ARM_COMMON_OPTION,
> @@ -329,7 +329,7 @@ void __iomem *exynos5_list_both_cnt_feed[] = {
>  	EXYNOS5_TOP_PWR_SYSMEM_OPTION,
>  };
> 
> -void __iomem *exynos5_list_diable_wfi_wfe[] = {
> +static void __iomem *exynos5_list_diable_wfi_wfe[] = {
>  	EXYNOS5_ARM_CORE1_OPTION,
>  	EXYNOS5_FSYS_ARM_OPTION,
>  	EXYNOS5_ISP_ARM_OPTION,
> --
> 1.7.4.1

OK, applied.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
