From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: EXYNOS4: Enable SATA on SMDKV310
Date: Mon, 04 Jul 2011 19:27:17 +0900
Message-ID: <005901cc3a34$f68d2f60$e3a78e20$%kim@samsung.com>
References: <1306294307-17315-1-git-send-email-inderpal.s@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:65341 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754472Ab1GDK1Z (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 Jul 2011 06:27:25 -0400
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LNT00FIB10YUYS0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 04 Jul 2011 19:27:23 +0900 (KST)
Received: from kgenekim ([12.23.119.139])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LNT00MN111NO2@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 04 Jul 2011 19:27:23 +0900 (KST)
In-reply-to: <1306294307-17315-1-git-send-email-inderpal.s@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Inderpal Singh' <inderpal.singh@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: samsung@lists.linaro.org, patches@linaro.org, 'Inderpal Singh' <inderpal.s@samsung.com>

Inderpal Singh wrote:
> 
> Adds device definition to enable SATA on SMDKV310
> 
> Signed-off-by: Inderpal Singh <inderpal.s@samsung.com>
> ---
>  arch/arm/mach-exynos4/Kconfig         |    1 +
>  arch/arm/mach-exynos4/mach-smdkv310.c |    1 +
>  2 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4/Kconfig
> index 11b57a4..9cbf9b8 100644
> --- a/arch/arm/mach-exynos4/Kconfig
> +++ b/arch/arm/mach-exynos4/Kconfig
> @@ -122,6 +122,7 @@ config MACH_SMDKV310
>  	select S3C_DEV_HSMMC1
>  	select S3C_DEV_HSMMC2
>  	select S3C_DEV_HSMMC3
> +	select EXYNOS4_DEV_AHCI
>  	select SAMSUNG_DEV_KEYPAD
>  	select EXYNOS4_DEV_PD
>  	select EXYNOS4_DEV_SYSMMU
> diff --git a/arch/arm/mach-exynos4/mach-smdkv310.c b/arch/arm/mach-
> exynos4/mach-smdkv310.c
> index 1526764..666ebe5 100644
> --- a/arch/arm/mach-exynos4/mach-smdkv310.c
> +++ b/arch/arm/mach-exynos4/mach-smdkv310.c
> @@ -188,6 +188,7 @@ static struct platform_device *smdkv310_devices[]
> __initdata = {
>  	&exynos4_device_sysmmu,
>  	&samsung_asoc_dma,
>  	&smdkv310_smsc911x,
> +	&exynos4_device_ahci,
>  };
> 
>  static void __init smdkv310_smsc911x_init(void)
> --
> 1.7.1

Applied.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
