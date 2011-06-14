From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 3/5] ARM: EXYNOS4: fix improper gpio configuration
Date: Tue, 14 Jun 2011 15:53:02 +0900
Message-ID: <007601cc2a5f$bb4c47e0$31e4d7a0$%kim@samsung.com>
References: <1307687667-9127-1-git-send-email-ch.naveen@samsung.com>
 <1307687667-9127-4-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:37882 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753666Ab1FNGxP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 14 Jun 2011 02:53:15 -0400
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LMR00MJYPSNF080@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 14 Jun 2011 15:53:14 +0900 (KST)
Received: from kgenekim ([12.23.119.139])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LMR00BBHPSPUN@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 14 Jun 2011 15:53:14 +0900 (KST)
In-reply-to: <1307687667-9127-4-git-send-email-ch.naveen@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Naveen Krishna Chatradhi' <ch.naveen@samsung.com>, broonie@opensource.wolfsonmicro.com, jassisinghbrar@gmail.com, lrg@ti.com, sbkim73@samsung.com, sw.youn@samsung.com, linux-samsung-

Naveen Krishna Chatradhi wrote:
> 
> These pins are incorrectly configured for PCM2
> configure them to SPDIF(_OUT & _EXT_CLK)
> 
> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
> ---
>  arch/arm/mach-exynos4/dev-audio.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos4/dev-audio.c
b/arch/arm/mach-exynos4/dev-
> audio.c
> index 6347594..5add5fa 100644
> --- a/arch/arm/mach-exynos4/dev-audio.c
> +++ b/arch/arm/mach-exynos4/dev-audio.c
> @@ -335,7 +335,7 @@ struct platform_device exynos4_device_ac97 = {
> 
>  static int exynos4_spdif_cfg_gpio(struct platform_device *pdev)
>  {
> -	s3c_gpio_cfgpin_range(EXYNOS4_GPC1(0), 2, S3C_GPIO_SFN(3));
> +	s3c_gpio_cfgpin_range(EXYNOS4_GPC1(0), 2, S3C_GPIO_SFN(4));
> 
>  	return 0;
>  }
> --

OK, will apply into s5p-fixes-for-linus branch with Jassi's ack.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
