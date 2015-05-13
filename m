From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCHv2 1/3] ARM: exynos_defconfig: Enable CONFIG_SENSORS_PWM_FAN
 for odroidxu3 pmw-fan
Date: Wed, 13 May 2015 13:09:38 +0900
Message-ID: <5552CE82.9070109@samsung.com>
References: <1431489174-4479-1-git-send-email-linux.amoon@gmail.com>
 <1431489174-4479-2-git-send-email-linux.amoon@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:38482 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753395AbbEMEJn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 May 2015 00:09:43 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NO9003DPSW5V330@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 13 May 2015 05:09:41 +0100 (BST)
In-reply-to: <1431489174-4479-2-git-send-email-linux.amoon@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Anand Moon <linux.amoon@gmail.com>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Doug Anderson <dianders@chromium.org>, Lukasz Majewski <l.majewski@samsung.com>, Andreas Faerber <afaerber@suse.de>, Sachin Kamat <sachin.kamat@samsung.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On 13.05.2015 12:52, Anand Moon wrote:
> Enable CONFIG_SENSORS_PWM_FAN on exynos_defconfig to control fan power on Odroidxu3.

s/Odroidxu3/Odroid XU3/ (or Odroid-XU3, just capitalize the symbol).

Please go back to default length of wrapping commit messages. This one
exceeds it. Default is 75 characters so git log or git show output would
fit in 80 characters terminal.

With these changes you can add my tag:
Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof

> 
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
>  arch/arm/configs/exynos_defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
> index d034c96..3c2784f 100644
> --- a/arch/arm/configs/exynos_defconfig
> +++ b/arch/arm/configs/exynos_defconfig
> @@ -101,6 +101,7 @@ CONFIG_CHARGER_MAX77693=y
>  CONFIG_CHARGER_TPS65090=y
>  CONFIG_HWMON=y
>  CONFIG_SENSORS_LM90=y
> +CONFIG_SENSORS_PWM_FAN=y
>  CONFIG_CPU_FREQ=y
>  CONFIG_CPU_THERMAL=y
>  CONFIG_THERMAL=y
> 
