From: Sangsu Park <sangsu4u.park@samsung.com>
Subject: RE: [PATCH v2] ASoC: Samsung: Update Kconfig for Exynos5250 and
 Exynos4412
Date: Fri, 28 Sep 2012 18:53:20 +0900
Message-ID: <003401cd9d5f$179495c0$46bdc140$@samsung.com>
References: <1348741777-29569-1-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:47790 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753858Ab2I1Jxd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 28 Sep 2012 05:53:33 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MB200E7N0SS5N10@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 28 Sep 2012 18:53:20 +0900 (KST)
Received: from DOSANGSU4UP02 ([12.23.118.226])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MB200HC20SWE480@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 28 Sep 2012 18:53:20 +0900 (KST)
In-reply-to: <1348741777-29569-1-git-send-email-padma.v@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Padmavathi Venna' <padma.v@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: sbkim73@samsung.com, ben-linux@fluff.org, kgene.kim@samsung.com, olofj@google.com


On Thu, Sep 27, 2012 at 07:30 PM, Padmavathi Venna wrote:

> diff --git a/sound/soc/samsung/Kconfig b/sound/soc/samsung/Kconfig
> index fe3995c..430783b 100644
> --- a/sound/soc/samsung/Kconfig
> +++ b/sound/soc/samsung/Kconfig
> @@ -1,6 +1,6 @@
>  config SND_SOC_SAMSUNG
>  	tristate "ASoC support for Samsung"
> -	depends on ARCH_S3C24XX || ARCH_S3C64XX || ARCH_S5PC100 || ARCH_S5PV210
> || ARCH_S5P64X0 || ARCH_EXYNOS4
> +	depends on PLAT_SAMSUNG
>  	select S3C64XX_DMA if ARCH_S3C64XX
>  	select S3C2410_DMA if ARCH_S3C24XX
>  	help

This code is already updated.

> @@ -63,7 +63,7 @@ config SND_SOC_SAMSUNG_SMDK_WM8580
> 
>  config SND_SOC_SAMSUNG_SMDK_WM8994
>  	tristate "SoC I2S Audio support for WM8994 on SMDK"
> -	depends on SND_SOC_SAMSUNG && (MACH_SMDKV310 || MACH_SMDKC210 ||
> MACH_SMDK4212)
> +	depends on SND_SOC_SAMSUNG && (MACH_SMDKV310 || MACH_SMDKC210 ||
> MACH_SMDK4212 || MACH_SMDK4412 || MACH_EXYNOS5_DT)
>  	depends on I2C=y && GENERIC_HARDIRQS
>  	select MFD_WM8994
>  	select SND_SOC_WM8994

I'm not sure about this since MACH_EXYNOS5_DT can have others instead of SMDK.

Thanks,
Sangsu.
