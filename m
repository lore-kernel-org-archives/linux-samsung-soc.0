From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCHv6] ARM: exynos_defconfig: Enable LEDS for Odroid-XU3/XU4
Date: Thu, 03 Sep 2015 14:42:33 +0900
Message-ID: <55E7DDC9.7090603@samsung.com>
References: <1441258696-3699-1-git-send-email-linux.amoon@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:41410 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750712AbbICFmf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 3 Sep 2015 01:42:35 -0400
In-reply-to: <1441258696-3699-1-git-send-email-linux.amoon@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Anand Moon <linux.amoon@gmail.com>
Cc: Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Andreas Faerber <afaerber@suse.de>, Lukasz Majewski <l.majewski@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On 03.09.2015 14:38, Anand Moon wrote:
> Enable config option NEW_LEDS, LEDS_CLASS, LEDS_GPIO, LEDS_PWM,
> LEDS_TRIGGERS, LEDS_TRIGGER_TIMER, LEDS_TRIGGER_HEARTBEAT for
> Odroid-XU3/XU4 board.
> 
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> 
> ---
> Changes from last version
> dropped following option.
>   CONFIG_LEDS_CLASS_FLASH
>   CONFIG_TRIGGER_ONESHOT
>   CONFIG_TRIGGER_GPIO
> fixed the From address
> ---
>  arch/arm/configs/exynos_defconfig | 7 +++++++
>  1 file changed, 7 insertions(+)

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

BTW, Javier's email is different. All you previous mails bounced. I
cc-ed here the proper one.

Best regards,
Krzysztof

> 
> diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
> index 9504e77..aaf7aa4 100644
> --- a/arch/arm/configs/exynos_defconfig
> +++ b/arch/arm/configs/exynos_defconfig
> @@ -163,6 +163,13 @@ CONFIG_MMC_SDHCI_S3C_DMA=y
>  CONFIG_MMC_DW=y
>  CONFIG_MMC_DW_IDMAC=y
>  CONFIG_MMC_DW_EXYNOS=y
> +CONFIG_NEW_LEDS=y
> +CONFIG_LEDS_CLASS=y
> +CONFIG_LEDS_GPIO=y
> +CONFIG_LEDS_PWM=y
> +CONFIG_LEDS_TRIGGERS=y
> +CONFIG_LEDS_TRIGGER_TIMER=y
> +CONFIG_LEDS_TRIGGER_HEARTBEAT=y
>  CONFIG_RTC_CLASS=y
>  CONFIG_RTC_DRV_MAX77686=y
>  CONFIG_RTC_DRV_MAX77802=y
> 
