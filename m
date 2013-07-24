From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH v3 1/1] ARM: EXYNOS: Update CONFIG_ARCH_NR_GPIO for Exynos
Date: Wed, 24 Jul 2013 15:20:57 +0900
Message-ID: <0e4301ce8835$f5bef5e0$e13ce1a0$@org>
References: <1374636693-32336-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:55317 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750876Ab3GXGU7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 24 Jul 2013 02:20:59 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MQF0010PGAH53R0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 24 Jul 2013 15:20:58 +0900 (KST)
In-reply-to: <1374636693-32336-1-git-send-email-sachin.kamat@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kgene@kernel.org, patches@linaro.org, 'Tomasz Figa' <t.figa@samsung.com>

Sachin Kamat wrote:
> 
> With the recent cleanup in Exynos platform code notably commits
> 17859bec ("ARM: EXYNOS: Do not select legacy Kconfig symbols any
> more") and b9222210 ("ARM: EXYNOS: Remove mach/gpio.h"), the definition
> of ARCH_NR_GPIOS got removed. This started causing problems on SoCs like
> Exynos4412 which have more than the default number of GPIOs. Thus define
> this number in KConfig file which takes care of current SoC requirements
> and provides scope for GPIO expanders. Without this patch we get the
> following
> errors during boot:
> 
> gpiochip_add: gpios 251..258 (gpv0) failed to register
> samsung-pinctrl 106e0000.pinctrl: failed to register gpio_chip gpv0,
> error code: -22
> samsung-pinctrl: probe of 106e0000.pinctrl failed with error -22
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> Cc: Tomasz Figa <t.figa@samsung.com>
> ---
> Changes since v2:
> Changed the default number to 512 to accomodate GPIO exapnders.
> ---
>  arch/arm/Kconfig |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index ccc388d..b3c4fa4 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -1601,6 +1601,7 @@ config ARCH_NR_GPIO
>  	int
>  	default 1024 if ARCH_SHMOBILE || ARCH_TEGRA
>  	default 512 if SOC_OMAP5
> +	default 512 if ARCH_EXYNOS
>  	default 512 if ARCH_KEYSTONE

+	default 512 if ARCH_EXYNOS || ARCH_KEYSTONE || SOC_OMAP5 ?

Thanks,
Kukjin

>  	default 392 if ARCH_U8500
>  	default 352 if ARCH_VT8500
> --
> 1.7.9.5
