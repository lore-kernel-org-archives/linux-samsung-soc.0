From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: Exynos5: fix clock initialization for exynos5250
Date: Mon, 26 Nov 2012 08:22:14 +0900
Message-ID: <12b301cdcb63$b3f60ca0$1be225e0$%kim@samsung.com>
References: <1353750810-21953-1-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:41855 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753573Ab2KYXWX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 25 Nov 2012 18:22:23 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0ME200IAMGX2AU30@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 26 Nov 2012 08:22:14 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0ME20049HGX28S80@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 26 Nov 2012 08:22:14 +0900 (KST)
In-reply-to: <1353750810-21953-1-git-send-email-thomas.abraham@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Thomas Abraham' <thomas.abraham@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org

Thomas Abraham wrote:
> 
> The machine compatible value cannot be checked in exynos5_dt_map_io
> function
> since the tree is not unflattened yet. Fix this by using soc_is_exynos5250
> macro.
> 
> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
> ---
>  arch/arm/mach-exynos/mach-exynos5-dt.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/mach-exynos5-dt.c b/arch/arm/mach-
> exynos/mach-exynos5-dt.c
> index 77010f8..845d8e2 100644
> --- a/arch/arm/mach-exynos/mach-exynos5-dt.c
> +++ b/arch/arm/mach-exynos/mach-exynos5-dt.c
> @@ -117,7 +117,7 @@ static void __init exynos5_dt_map_io(void)
>  {
>  	exynos_init_io(NULL, 0);
> 
> -	if (of_machine_is_compatible("samsung,exynos5250"))
> +	if (soc_is_exynos5250())
>  		s3c24xx_init_clocks(24000000);
>  }
> 
> --

Correct, applied.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
