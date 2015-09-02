From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCHv4] ARM: exynos_defconfig: Enable CONFIG_LEDS_PWM for
 Odroid-XU3/XU4
Date: Thu, 03 Sep 2015 08:48:16 +0900
Message-ID: <55E78AC0.10006@samsung.com>
References: <1441212107-3993-1-git-send-email-linux.amoon@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1441212107-3993-1-git-send-email-linux.amoon@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anand Moon <linux.amoon@gmail.com>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Lukasz Majewski <l.majewski@samsung.com>, Andreas Faerber <afaerber@suse.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 03.09.2015 01:41, Anand Moon wrote:
> Enable CONFIG_LEDS_PWM amd CONFIG_LEDS_TRIGGER_HEARTBEAT for
> Odroid-XU3/XU4 board.
> 
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> 
> ---
> Changes from last version.
>   Make all modules build-in.
>   Enabled LEDS_GPIO
> ---
>  arch/arm/configs/exynos_defconfig | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
> index 2263cd9..c285975 100644
> --- a/arch/arm/configs/exynos_defconfig
> +++ b/arch/arm/configs/exynos_defconfig
> @@ -168,6 +168,16 @@ CONFIG_MMC_SDHCI_S3C_DMA=y
>  CONFIG_MMC_DW=y
>  CONFIG_MMC_DW_IDMAC=y
>  CONFIG_MMC_DW_EXYNOS=y
> +CONFIG_NEW_LEDS=y
> +CONFIG_LEDS_CLASS=y
> +CONFIG_LEDS_CLASS_FLASH=y
> +CONFIG_LEDS_GPIO=y
> +CONFIG_LEDS_PWM=y
> +CONFIG_LEDS_TRIGGERS=y
> +CONFIG_LEDS_TRIGGER_TIMER=y
> +CONFIG_LEDS_TRIGGER_ONESHOT=y
> +CONFIG_LEDS_TRIGGER_HEARTBEAT=y
> +CONFIG_LEDS_TRIGGER_GPIO=y

This is getting boring. I asked about enabling LEDS_GPIO, which you
confirmed in changelog. Good!
So what are LEDS_CLASS_FLASH, TRIGGER_ONESHOT and TRIGGER_GPIO doing
here? They are not mentioned in commit message, changelog and previous
discussions.

Beside that commit message seems to be far away from the contents now...

Best regards,
Krzysztof


>  CONFIG_RTC_CLASS=y
>  CONFIG_RTC_DRV_MAX77686=y
>  CONFIG_RTC_DRV_MAX77802=y
> 
