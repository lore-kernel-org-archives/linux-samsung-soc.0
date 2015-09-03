From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCHv6] ARM: exynos_defconfig: Enable LEDS for Odroid-XU3/XU4
Date: Thu, 3 Sep 2015 11:20:35 +0200
Message-ID: <55E810E3.6080709@osg.samsung.com>
References: <1441258696-3699-1-git-send-email-linux.amoon@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:33833 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751972AbbICJUn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 3 Sep 2015 05:20:43 -0400
In-Reply-To: <1441258696-3699-1-git-send-email-linux.amoon@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Anand Moon <linux.amoon@gmail.com>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Andreas Faerber <afaerber@suse.de>, Lukasz Majewski <l.majewski@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Hello Anand,

On 09/03/2015 07:38 AM, Anand Moon wrote:
> Enable config option NEW_LEDS, LEDS_CLASS, LEDS_GPIO, LEDS_PWM,
> LEDS_TRIGGERS, LEDS_TRIGGER_TIMER, LEDS_TRIGGER_HEARTBEAT for
> Odroid-XU3/XU4 board.
> 
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> 
> ---

I think Krzysztof already mentioned but a commit message shouln't
describe what the change is (one can look to the patch for that)
but why the change is needed.

So I would had expect something along these lines:

Many Exynos boards (i.e: the Exynos5422 Odroid XU3/XU4) have GPIO
and PWM based LEDs, so enable the needed Kconfig options to have
support for these. Also, some boards use the heartbeat LED trigger
so enable support for this as well.

> Changes from last version
> dropped following option.
>   CONFIG_LEDS_CLASS_FLASH
>   CONFIG_TRIGGER_ONESHOT
>   CONFIG_TRIGGER_GPIO
> fixed the From address
> ---
>  arch/arm/configs/exynos_defconfig | 7 +++++++
>  1 file changed, 7 insertions(+)
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

I don't see an Exynos board using the timer trigger. Do you need it for
some user-space application that uses the sysfs interface? I'm OK with
enabling it but again this should be mentioned in the commit message.

> +CONFIG_LEDS_TRIGGER_HEARTBEAT=y
>  CONFIG_RTC_CLASS=y
>  CONFIG_RTC_DRV_MAX77686=y
>  CONFIG_RTC_DRV_MAX77802=y
> 

The change looks good to me though so with a better commit message:

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
