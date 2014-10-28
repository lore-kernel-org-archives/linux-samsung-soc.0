From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH] ARM: EXYNOS: fix typo in static struct name
 "exynos5_list_diable_wfi_wfe"
Date: Tue, 28 Oct 2014 19:33:17 +0900
Message-ID: <041401cff29a$963784e0$c2a68ea0$@kernel.org>
References: <1414489832-28011-1-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:57960 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751980AbaJ1KdS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 28 Oct 2014 06:33:18 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NE500GH7HBHA100@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 28 Oct 2014 19:33:17 +0900 (KST)
In-reply-to: <1414489832-28011-1-git-send-email-pankaj.dubey@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Pankaj Dubey' <pankaj.dubey@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: linux@arm.linux.org.uk, thomas.ab@samsung.com

Pankaj Dubey wrote:
> 
> This patch fixes a typo in struct named as "exynos5_list_diable_wfi_wfe"
> by making it "exynos5_list_disable_wfi_wfe" which is more meaningful.
> 
Yes, 'disable' is more meaningful ;)

I'll apply this into non-critical-fixes for 3.19.

Thanks,
Kukjin

> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> ---
>  arch/arm/mach-exynos/pmu.c |    8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/pmu.c b/arch/arm/mach-exynos/pmu.c
> index cfc62e8..e5e1846 100644
> --- a/arch/arm/mach-exynos/pmu.c
> +++ b/arch/arm/mach-exynos/pmu.c
> @@ -330,7 +330,7 @@ static unsigned int const exynos5_list_both_cnt_feed[] = {
>  	EXYNOS5_TOP_PWR_SYSMEM_OPTION,
>  };
> 
> -static unsigned int const exynos5_list_diable_wfi_wfe[] = {
> +static unsigned int const exynos5_list_disable_wfi_wfe[] = {
>  	EXYNOS5_ARM_CORE1_OPTION,
>  	EXYNOS5_FSYS_ARM_OPTION,
>  	EXYNOS5_ISP_ARM_OPTION,
> @@ -361,11 +361,11 @@ static void exynos5_init_pmu(void)
>  	/*
>  	 * Disable WFI/WFE on XXX_OPTION
>  	 */
> -	for (i = 0 ; i < ARRAY_SIZE(exynos5_list_diable_wfi_wfe) ; i++) {
> -		tmp = pmu_raw_readl(exynos5_list_diable_wfi_wfe[i]);
> +	for (i = 0 ; i < ARRAY_SIZE(exynos5_list_disable_wfi_wfe) ; i++) {
> +		tmp = pmu_raw_readl(exynos5_list_disable_wfi_wfe[i]);
>  		tmp &= ~(EXYNOS5_OPTION_USE_STANDBYWFE |
>  			 EXYNOS5_OPTION_USE_STANDBYWFI);
> -		pmu_raw_writel(tmp, exynos5_list_diable_wfi_wfe[i]);
> +		pmu_raw_writel(tmp, exynos5_list_disable_wfi_wfe[i]);
>  	}
>  }
> 
> --
> 1.7.9.5
