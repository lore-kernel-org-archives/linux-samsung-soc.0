From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v3] ARM: EXYNOS4: add support for i2c PMICs on
 Universal_C210	board
Date: Fri, 04 Mar 2011 10:53:05 +0900
Message-ID: <022f01cbda0e$ea1d30d0$be579270$%kim@samsung.com>
References: <018901cbd949$c86e8f80$594bae80$%kim@samsung.com>
 <1299164371-23398-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:64406 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759156Ab1CDBxM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 3 Mar 2011 20:53:12 -0500
Received: from epmmp2 (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LHI007TCFWMOR30@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 04 Mar 2011 10:53:10 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LHI00A3IFWMAW@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 04 Mar 2011 10:53:10 +0900 (KST)
In-reply-to: <1299164371-23398-1-git-send-email-m.szyprowski@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Marek Szyprowski' <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kyungmin.park@samsung.com, broonie@opensource.wolfsonmicro.com, linux@arm.linux.org.uk

Marek Szyprowski wrote:
> 
> This patch adds basic definitions for MAX8952 & LP3974 (MAX8998
> compatible) PMICs for UniversalC210 board. Power consumers for the
> device drivers will be added later. These two PMICs occupy I2C5 bus.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/mach-exynos4/Kconfig               |    2 +
>  arch/arm/mach-exynos4/mach-universal_c210.c |  413
> +++++++++++++++++++++++++++
>  2 files changed, 415 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4/Kconfig
> index ad03840..d58cbb5 100644
> --- a/arch/arm/mach-exynos4/Kconfig
> +++ b/arch/arm/mach-exynos4/Kconfig
> @@ -116,8 +116,10 @@ config MACH_UNIVERSAL_C210
>  	select S3C_DEV_HSMMC2
>  	select S3C_DEV_HSMMC3
>  	select S3C_DEV_I2C1
> + 	select S3C_DEV_I2C5
   ^
Used 1 white space + tab here.
As you know, just 1 tab is enough :)

>  	select S5P_DEV_ONENAND
>  	select EXYNOS4_SETUP_I2C1
> + 	select EXYNOS4_SETUP_I2C5
   ^
Same as above.

>  	select EXYNOS4_SETUP_SDHCI
>  	help
>  	  Machine support for Samsung Mobile Universal S5PC210 Reference

Thanks for your re-working.
Ok, will apply with above fixing.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
