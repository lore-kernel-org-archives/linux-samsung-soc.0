From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ASoC: Samsung: Update Kconfig for Exynos5250 and Exynos4412
Date: Wed, 01 Aug 2012 12:06:57 +0900
Message-ID: <030901cd6f92$b5fc6da0$21f548e0$%kim@samsung.com>
References: <1343218351-30577-1-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:32537 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753914Ab2HADG6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 31 Jul 2012 23:06:58 -0400
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M82004O33B7KJ00@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 01 Aug 2012 12:06:57 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M82006CC3BL91A0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 01 Aug 2012 12:06:57 +0900 (KST)
In-reply-to: <1343218351-30577-1-git-send-email-padma.v@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Padmavathi Venna' <padma.v@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org
Cc: rcsekar@samsung.com, sbkim73@samsung.com, sangsu4u.park@samsung.com, ben-linux@fluff.org, olofj@google.com, thutt@chromium.org, joshi@samsung.com

Padmavathi Venna wrote:
> 
> Update Kconfig file to support the Exynos5250 and Exynos4412
> 
> Signed-off-by: Sangsu Park <sangsu4u.park@samsung.com>
> Signed-off-by: Sangbeom Kim <sbkim73@samsung.com>
> Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
> ---
>  sound/soc/samsung/Kconfig |    8 ++++----
>  1 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/soc/samsung/Kconfig b/sound/soc/samsung/Kconfig
> index fe3995c..d54e400 100644
> --- a/sound/soc/samsung/Kconfig
> +++ b/sound/soc/samsung/Kconfig
> @@ -1,6 +1,6 @@
>  config SND_SOC_SAMSUNG
>  	tristate "ASoC support for Samsung"
> -	depends on ARCH_S3C24XX || ARCH_S3C64XX || ARCH_S5PC100 ||
> ARCH_S5PV210 || ARCH_S5P64X0 || ARCH_EXYNOS4
> +	depends on PLAT_SAMSUNG
>  	select S3C64XX_DMA if ARCH_S3C64XX
>  	select S3C2410_DMA if ARCH_S3C24XX
>  	help
> @@ -63,7 +63,7 @@ config SND_SOC_SAMSUNG_SMDK_WM8580
> 
>  config SND_SOC_SAMSUNG_SMDK_WM8994
>  	tristate "SoC I2S Audio support for WM8994 on SMDK"
> -	depends on SND_SOC_SAMSUNG && (MACH_SMDKV310 || MACH_SMDKC210 ||
> MACH_SMDK4212)
> +	depends on SND_SOC_SAMSUNG && (MACH_SMDKV310 || MACH_SMDKC210 ||
> MACH_SMDK4212 || MACH_SMDK4412 || SOC_EXYNOS5250)

Well, do you think _really_ all board which has a EXYNOS5250 SoC is needed
this config?

I don't think so?

[...]

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
