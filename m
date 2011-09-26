From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] GPIO: Samsung: fix GPIO interrupt registration for Exynos4
 SoCs
Date: Mon, 26 Sep 2011 13:24:32 +0900
Message-ID: <00d401cc7c04$318365b0$948a3110$%kim@samsung.com>
References: <1316703888-11986-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:16473 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750881Ab1IZEYf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 Sep 2011 00:24:35 -0400
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LS4009TV48T9HB0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 26 Sep 2011 13:24:33 +0900 (KST)
Received: from kgenekim (12-23-120-114.csky.net [12.23.120.114])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LS4009XG48XMX@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 26 Sep 2011 13:24:33 +0900 (KST)
In-reply-to: <1316703888-11986-1-git-send-email-m.szyprowski@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Marek Szyprowski' <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: 'Kyungmin Park' <kyungmin.park@samsung.com>, 'Angus Ainslie' <angus.ainslie@linaro.org>, 'Grant Likely' <grant.likely@secretlab.ca>

Marek Szyprowski wrote:
> 
> Commit 1b39d5f2cc introduced new common gpio driver for all Samsung GPIO
> SoCs. The new driver doesn't correctly register GPIO interrupts on
> Samsung Exynos4 SoCs. This is caused by a typo in define name. This
> patch fixes this issue.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  drivers/gpio/gpio-samsung.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-samsung.c b/drivers/gpio/gpio-samsung.c
> index be13580..cdffb0c 100644
> --- a/drivers/gpio/gpio-samsung.c
> +++ b/drivers/gpio/gpio-samsung.c
> @@ -2461,7 +2461,7 @@ static __init int samsung_gpiolib_init(void)
>  		}
>  		samsung_gpiolib_add_4bit_chips(exynos4_gpios_3, nr_chips,
> S5P_VA_GPIO3);
> 
> -#if defined(CONFIG_SOC_EXYNOS4210) && defined(CONFIG_S5P_GPIO_INT)
> +#if defined(CONFIG_CPU_EXYNOS4210) && defined(CONFIG_S5P_GPIO_INT)
>  		s5p_register_gpioint_bank(IRQ_GPIO_XA, 0,
> IRQ_GPIO1_NR_GROUPS);
>  		s5p_register_gpioint_bank(IRQ_GPIO_XB,
> IRQ_GPIO1_NR_GROUPS, IRQ_GPIO2_NR_GROUPS);
>  #endif
> --
> 1.7.1.569.g6f426

Hi Marek,

Applied, thanks for pointing out typo.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
