From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: EXYNOS4: Enable system MMU support on Origen
Date: Wed, 31 Aug 2011 10:22:48 +0900
Message-ID: <000901cc677c$7ee738f0$7cb5aad0$%kim@samsung.com>
References: <1313564551-1196-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:11981 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754155Ab1HaBWv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 30 Aug 2011 21:22:51 -0400
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LQR003J0QI08S70@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 31 Aug 2011 10:22:49 +0900 (KST)
Received: from kgenekim (12-23-120-114.csky.net [12.23.120.114])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LQR006JKQI12B@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 31 Aug 2011 10:22:49 +0900 (KST)
In-reply-to: <1313564551-1196-1-git-send-email-sachin.kamat@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: linaro-dev@lists.linaro.org, patches@linaro.org

Sachin Kamat wrote:
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  arch/arm/mach-exynos4/Kconfig       |    1 +
>  arch/arm/mach-exynos4/mach-origen.c |    1 +
>  2 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4/Kconfig
> index 3ab0f18..bdb76e2 100644
> --- a/arch/arm/mach-exynos4/Kconfig
> +++ b/arch/arm/mach-exynos4/Kconfig
> @@ -192,6 +192,7 @@ config MACH_ORIGEN
>  	select S3C_DEV_RTC
>  	select S3C_DEV_WDT
>  	select S3C_DEV_HSMMC2
> +	select EXYNOS4_DEV_SYSMMU
>  	select EXYNOS4_SETUP_SDHCI
>  	help
>  	  Machine support for ORIGEN based on Samsung EXYNOS4210
> diff --git a/arch/arm/mach-exynos4/mach-origen.c
b/arch/arm/mach-exynos4/mach-
> origen.c
> index ed59f86..d04f7ee 100644
> --- a/arch/arm/mach-exynos4/mach-origen.c
> +++ b/arch/arm/mach-exynos4/mach-origen.c
> @@ -83,6 +83,7 @@ static struct platform_device *origen_devices[]
__initdata = {
>  	&s3c_device_hsmmc2,
>  	&s3c_device_rtc,
>  	&s3c_device_wdt,
> +	&exynos4_device_sysmmu,
>  };
> 
>  static void __init origen_map_io(void)
> --
> 1.7.4.1

Hi Sachin,

Hmm, do you _really_ use this feature on ORIGEN board now?

As I know, the EXYNOS System MMU driver will be changed like a form of omap
and msm soon maybe it's within 1 or 2 weeks. So if this is not required on
ORIGEN now, I'd like to wait for new EXYNOS System MMU driver.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
