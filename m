From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/1] ARM: EXYNOS: Add support to reserve memory for MFC-v7
Date: Thu, 20 Mar 2014 11:10:12 +0900
Message-ID: <019e01cf43e1$86e3c390$94ab4ab0$@samsung.com>
References: <1395046487-21249-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:15331 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750717AbaCTCKO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Mar 2014 22:10:14 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N2P00KH1Q100N80@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 20 Mar 2014 11:10:12 +0900 (KST)
In-reply-to: <1395046487-21249-1-git-send-email-sachin.kamat@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org

Sachin Kamat wrote:
> 
> Reserve memory for MFC-v7 IP.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
> Based on top of Tushar's patch:
> [PATCH V2] ARM: SAMSUNG: Reorganize calls to reserve memory for MFC
> http://www.spinics.net/lists/linux-samsung-soc/msg25501.html
> ---
>  arch/arm/mach-exynos/mach-exynos5-dt.c |   10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-exynos/mach-exynos5-dt.c
b/arch/arm/mach-exynos/mach-
> exynos5-dt.c
> index 9586439b2d0e..9a8a798d2ad0 100644
> --- a/arch/arm/mach-exynos/mach-exynos5-dt.c
> +++ b/arch/arm/mach-exynos/mach-exynos5-dt.c
> @@ -59,7 +59,15 @@ static char const *exynos5_dt_compat[] __initdata = {
>  static void __init exynos5_reserve(void)
>  {
>  #ifdef CONFIG_S5P_DEV_MFC
> -	of_scan_flat_dt(s5p_fdt_alloc_mfc_mem, "samsung,mfc-v6");
> +	int i;
> +	char *mfc_mem[] = {
> +		"samsung,mfc-v6",
> +		"samsung,mfc-v7",
> +	};
> +
> +	for (i = 0; i < ARRAY_SIZE(mfc_mem); i++)
> +		if (of_scan_flat_dt(s5p_fdt_alloc_mfc_mem, mfc_mem[i]))
> +			break;
>  #endif
>  }
> 
> --
> 1.7.9.5

Looks OK, will apply.

Thanks,
Kukjin
