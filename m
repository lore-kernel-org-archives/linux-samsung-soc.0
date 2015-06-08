From: Lukasz Majewski <l.majewski@samsung.com>
Subject: Re: [PATCHv2 2/2] ARM: exynos_defconfig: Enable CONFIG_LEDS_PWM for
 Odroid-XU3
Date: Mon, 08 Jun 2015 17:11:16 +0200
Message-ID: <20150608171116.258b0f42@amdc2363>
References: <1433696621-4763-1-git-send-email-linux.amoon@gmail.com>
 <1433696621-4763-2-git-send-email-linux.amoon@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:56182 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752526AbbFHPL0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Jun 2015 11:11:26 -0400
In-reply-to: <1433696621-4763-2-git-send-email-linux.amoon@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Anand Moon <linux.amoon@gmail.com>
Cc: Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Andreas Faerber <afaerber@suse.de>, Sachin Kamat <sachin.kamat@samsung.com>, Sjoerd Simons <sjoerd.simons@collabora.co.uk>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Anand,

> Enable CONFIG_LEDS_PWM amd CONFIG_LEDS_TRIGGER_HEARTBEAT for
> Odroid-XU3 board.
> 
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
>  arch/arm/configs/exynos_defconfig | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm/configs/exynos_defconfig
> b/arch/arm/configs/exynos_defconfig index 1b7253b..2bbdf80 100644
> --- a/arch/arm/configs/exynos_defconfig
> +++ b/arch/arm/configs/exynos_defconfig
> @@ -165,6 +165,12 @@ CONFIG_MMC_SDHCI_S3C_DMA=y
>  CONFIG_MMC_DW=y
>  CONFIG_MMC_DW_IDMAC=y
>  CONFIG_MMC_DW_EXYNOS=y
> +CONFIG_NEW_LEDS=y
> +CONFIG_LEDS_CLASS=m
> +CONFIG_LEDS_PWM=m
> +CONFIG_LEDS_TRIGGERS=y
> +CONFIG_LEDS_TRIGGER_TIMER=m
> +CONFIG_LEDS_TRIGGER_HEARTBEAT=m
>  CONFIG_RTC_CLASS=y
>  CONFIG_RTC_DRV_MAX77686=y
>  CONFIG_RTC_DRV_MAX77802=y

Reviewed-by: Lukasz Majewski <l.majewski@samsung.com>

-- 
Best regards,

Lukasz Majewski

Samsung R&D Institute Poland (SRPOL) | Linux Platform Group
