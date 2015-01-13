From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v3] ARM: exynos_defconfig Enable CONFIG_LOCKUP_DETECTOR.
Date: Tue, 13 Jan 2015 09:18:08 +0100
Message-ID: <1421137088.8355.1.camel@AMDC1943>
References: <1421088614-4662-1-git-send-email-moon.linux@yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:16370 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751054AbbAMISN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 13 Jan 2015 03:18:13 -0500
In-reply-to: <1421088614-4662-1-git-send-email-moon.linux@yahoo.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Anand Moon <moon.linux@yahoo.com>
Cc: Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Doug Anderson <dianders@chromium.org>, Sachin Kamat <sachin.kamat@samsung.com>, Vivek Gautam <gautam.vivek@samsung.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Tushar Behera <tushar.behera@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On wto, 2015-01-13 at 00:20 +0530, Anand Moon wrote:
> On enabling CONFIG_LOCKUP_DETECTOR the kernel to act as a watchdog
> to detect hard and soft lockups. Enabling CONFIG_LOCKUP_DETECTOR
> don't introduce much overhead on exyons SOC.
> 
> CONFIG_LOCKUP_DETECTOR is enabled on multi_v7_defconfig.
> 
> Changes since v3:
>  * Made commit message more clear
>  * Corrected difference between CONFIG_LOCKUP_DETECTOR and CONFIG_LOCKDEP.
> 
> Tested on Exynos5422 ODROID XU3 board.
> 
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Signed-off-by: Anand Moon <moon.linux@yahoo.com>

Now it looks okay. My reviewed-by may stay on.

Best regards,
Krzysztof

> ---
>  arch/arm/configs/exynos_defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
> index 5ef14de..64b2fe9 100644
> --- a/arch/arm/configs/exynos_defconfig
> +++ b/arch/arm/configs/exynos_defconfig
> @@ -182,6 +182,7 @@ CONFIG_DETECT_HUNG_TASK=y
>  CONFIG_DEBUG_RT_MUTEXES=y
>  CONFIG_DEBUG_SPINLOCK=y
>  CONFIG_DEBUG_MUTEXES=y
> +CONFIG_LOCKUP_DETECTOR=y
>  CONFIG_DEBUG_INFO=y
>  CONFIG_DEBUG_USER=y
>  CONFIG_CRYPTO_SHA256=y
