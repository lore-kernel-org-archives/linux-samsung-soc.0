From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCHv7] ARM: exynos_defconfig: Enable LEDS for Odroid-XU3/XU4
Date: Fri, 04 Sep 2015 08:55:09 +0900
Message-ID: <55E8DDDD.80106@samsung.com>
References: <1441303910-3266-1-git-send-email-linux.amoon@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:28835 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752591AbbICXzL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 3 Sep 2015 19:55:11 -0400
In-reply-to: <1441303910-3266-1-git-send-email-linux.amoon@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Anand Moon <linux.amoon@gmail.com>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Andreas Faerber <afaerber@suse.de>, Lukasz Majewski <l.majewski@samsung.com>, Sjoerd Simons <sjoerd.simons@collabora.co.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On 04.09.2015 03:11, Anand Moon wrote:
> Earlier design of the LED for Odroid XU3 was using gpio-leds
> Now It was change to using both pwm-leds and gpio-leds.

It is still not a reason for this change. gpio-leds were not enabled
before. This could be a valid reason of adding LEDS_PWM to existing
config LEDS_GPIO. But LEDS_GPIO were not enabled... so why the change on
the board from gpio->(gpio+pwm) means that we have to enable LEDS_GPIO?

Actually I gave up on this and I wanted to change the commit message on
myself when applying. But discussion was brought up again so... clearly
we have different understanding of the meaning of "WHY". :)

Best regards,
Krzysztof

> 
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>
> 
> ---
> Changes from last version
> dropped following option.
>   CONFIG_LEDS_CLASS_FLASH
>   CONFIG_TRIGGER_ONESHOT
>   CONFIG_LEDS_TRIGGER_TIMER
>   CONFIG_TRIGGER_GPIO
> fixed the From address
> fixed the commit message.
> ---
>  arch/arm/configs/exynos_defconfig | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
> index 9504e77..bd6b7f7 100644
> --- a/arch/arm/configs/exynos_defconfig
> +++ b/arch/arm/configs/exynos_defconfig
> @@ -163,6 +163,12 @@ CONFIG_MMC_SDHCI_S3C_DMA=y
>  CONFIG_MMC_DW=y
>  CONFIG_MMC_DW_IDMAC=y
>  CONFIG_MMC_DW_EXYNOS=y
> +CONFIG_NEW_LEDS=y
> +CONFIG_LEDS_CLASS=y
> +CONFIG_LEDS_GPIO=y
> +CONFIG_LEDS_PWM=y
> +CONFIG_LEDS_TRIGGERS=y
> +CONFIG_LEDS_TRIGGER_HEARTBEAT=y
>  CONFIG_RTC_CLASS=y
>  CONFIG_RTC_DRV_MAX77686=y
>  CONFIG_RTC_DRV_MAX77802=y
> 
