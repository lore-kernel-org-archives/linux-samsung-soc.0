From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] ARM: exynos_defconfig: Make S3C2410_WATCHDOG as loadable
 module
Date: Thu, 03 Sep 2015 14:02:48 +0900
Message-ID: <55E7D478.2020200@samsung.com>
References: <1441253429-3264-1-git-send-email-linux.amoon@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:51042 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752399AbbICFCw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 3 Sep 2015 01:02:52 -0400
In-reply-to: <1441253429-3264-1-git-send-email-linux.amoon@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Anand Moon <linux.amoon@gmail.com>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Andreas Faerber <afaerber@suse.de>, Lukasz Majewski <l.majewski@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On 03.09.2015 13:10, Anand Moon wrote:
> S3C2410_WATCHDOG watchdog drivers should not be loaded automatically,
> but only if a watchdog daemon is installed.

First of all: why?

Secondly: even as a module driver could be loaded automatically to match
enabled device (it has MODULE_DEVICE_TABLE). In the same time loading it
does not hurt - watchdog should be inactive:

s3c2410-wdt 10060000.watchdog: watchdog inactive, reset disabled, irq
disabled

Best regards,
Krzysztof

> 
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
>  arch/arm/configs/exynos_defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
> index aaf7aa4..b5d382e 100644
> --- a/arch/arm/configs/exynos_defconfig
> +++ b/arch/arm/configs/exynos_defconfig
> @@ -101,7 +101,7 @@ CONFIG_CPU_THERMAL=y
>  CONFIG_THERMAL_EMULATION=y
>  CONFIG_EXYNOS_THERMAL=y
>  CONFIG_WATCHDOG=y
> -CONFIG_S3C2410_WATCHDOG=y
> +CONFIG_S3C2410_WATCHDOG=m
>  CONFIG_MFD_CROS_EC=y
>  CONFIG_MFD_CROS_EC_I2C=y
>  CONFIG_MFD_CROS_EC_SPI=y
> 
