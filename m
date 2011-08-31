From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: EXYNOS4: Add FIMC device on Origen board
Date: Wed, 31 Aug 2011 09:55:32 +0900
Message-ID: <000401cc6778$afdbb610$0f932230$%kim@samsung.com>
References: <1314014518-10516-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:55832 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754375Ab1HaAzq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 30 Aug 2011 20:55:46 -0400
Received: from epcpsbgm1.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LQR00GVZP334SK0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 31 Aug 2011 09:55:33 +0900 (KST)
Received: from kgenekim (12-23-120-114.csky.net [12.23.120.114])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LQR002GKP8LLK@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 31 Aug 2011 09:55:33 +0900 (KST)
In-reply-to: <1314014518-10516-1-git-send-email-sachin.kamat@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: linaro-dev@lists.linaro.org, patches@linaro.org

Sachin Kamat wrote:
> 
> This patch adds definitions to enable support for s5p-fimc driver on
> Origen board.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  arch/arm/mach-exynos4/Kconfig       |    4 ++++
>  arch/arm/mach-exynos4/mach-origen.c |    4 ++++
>  2 files changed, 8 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4/Kconfig
> index e6925de..a3d92a8 100644
> --- a/arch/arm/mach-exynos4/Kconfig
> +++ b/arch/arm/mach-exynos4/Kconfig
> @@ -227,6 +227,10 @@ config MACH_NURI
>  config MACH_ORIGEN
>  	bool "ORIGEN"
>  	select CPU_EXYNOS4210
> +	select S5P_DEV_FIMC0
> +	select S5P_DEV_FIMC1
> +	select S5P_DEV_FIMC2
> +	select S5P_DEV_FIMC3
>  	select S3C_DEV_RTC
>  	select S3C_DEV_WDT
>  	select S3C_DEV_HSMMC2
> diff --git a/arch/arm/mach-exynos4/mach-origen.c
b/arch/arm/mach-exynos4/mach-
> origen.c
> index ed59f86..4a2ac49 100644
> --- a/arch/arm/mach-exynos4/mach-origen.c
> +++ b/arch/arm/mach-exynos4/mach-origen.c
> @@ -80,6 +80,10 @@ static struct s3c_sdhci_platdata origen_hsmmc2_pdata
> __initdata = {
>  };
> 
>  static struct platform_device *origen_devices[] __initdata = {
> +	&s5p_device_fimc0,
> +	&s5p_device_fimc1,
> +	&s5p_device_fimc2,
> +	&s5p_device_fimc3,
>  	&s3c_device_hsmmc2,
>  	&s3c_device_rtc,
>  	&s3c_device_wdt,
> --
> 1.7.4.1

OK, will apply.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
