From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v4 1/1] ARM: EXYNOS: Update CONFIG_ARCH_NR_GPIO for Exynos
Date: Wed, 24 Jul 2013 12:44:51 +0200
Message-ID: <51EFB023.6090804@samsung.com>
References: <1374655405-22998-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:44218 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750936Ab3GXKoy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 24 Jul 2013 06:44:54 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MQF00DKNSBI0V50@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 24 Jul 2013 11:44:52 +0100 (BST)
In-reply-to: <1374655405-22998-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene@kernel.org, kgene.kim@samsung.com, patches@linaro.org, Tomasz Figa <t.figa@samsung.com>

Hi Sachin,

On 07/24/2013 10:43 AM, Sachin Kamat wrote:
> With the recent cleanup in Exynos platform code notably commits
> 17859bec ("ARM: EXYNOS: Do not select legacy Kconfig symbols any
> more") and b9222210 ("ARM: EXYNOS: Remove mach/gpio.h"), the definition
> of ARCH_NR_GPIOS got removed. This started causing problems on SoCs like
> Exynos4412 which have more than the default number of GPIOs. Thus define
> this number in KConfig file which takes care of current SoC requirements
> and provides scope for GPIO expanders. Without this patch we get the
> following errors during boot:
> 
> gpiochip_add: gpios 251..258 (gpv0) failed to register
> samsung-pinctrl 106e0000.pinctrl: failed to register gpio_chip gpv0,
> error code: -22
> samsung-pinctrl: probe of 106e0000.pinctrl failed with error -22
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> Cc: Tomasz Figa <t.figa@samsung.com>
> ---
> Changes since v3:
> Rearranged different default values in single line.
> ---
>  arch/arm/Kconfig |    3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index f8fb910..ac9fa38 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -1590,8 +1590,7 @@ config ARM_PSCI
>  config ARCH_NR_GPIO
>  	int
>  	default 1024 if ARCH_SHMOBILE || ARCH_TEGRA
> -	default 512 if SOC_OMAP5
> -	default 512 if ARCH_KEYSTONE
> +	default 512 if ARCH_EXYNOS || ARCH_KEYSTONE || SOC_OMAP5

Sorry, 512 seems a bit too generous to me. Also I would rather
leave each SOC/ARCH on a separate line.

Almost half of those 512 entries would have been unused in most
cases. How about, e.g. 352 ? If anyone finds this value too low
they could always submit a patch like this one. IMHO with 352 or
392 there would be sufficient margin.

--
Regards,
Sylwester
