From: Markus Reichl <m.reichl@fivetechno.de>
Subject: Re: [PATCH] ARM: exynos_defconfig: Disable big.LITTLE switcher
Date: Thu, 28 Apr 2016 16:55:06 +0200
Message-ID: <5722244A.5070608@fivetechno.de>
References: <1493315.8NlXQFsEtt@amdc1976>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1493315.8NlXQFsEtt@amdc1976>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Bartlomiej,

Tested on Odroid XU3 and XU4.

Tested-by: Markus Reichl <m.reichl@fivetechno.de>

Am 28.04.2016 um 16:44 schrieb Bartlomiej Zolnierkiewicz:
> Disable big.LITTLE switcher in order to allow automatic usage of
> cpufreq-dt driver on Exynos542x/Exynos5800 SoCs based boards.
> 
> This change should not cause any problems as arm_big_little[_dt]
> driver (which is using big.LITTLE switcher support to do the "real"
> big.LITTLE switching work) is not used on any Exynos SoC based
> board currently.
> 
> Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> ---
>  arch/arm/configs/exynos_defconfig | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
> index a8cf295..07d4168 100644
> --- a/arch/arm/configs/exynos_defconfig
> +++ b/arch/arm/configs/exynos_defconfig
> @@ -13,8 +13,6 @@ CONFIG_ARCH_EXYNOS3=y
>  CONFIG_EXYNOS5420_MCPM=y
>  CONFIG_SMP=y
>  CONFIG_BIG_LITTLE=y
> -CONFIG_BL_SWITCHER=y
> -CONFIG_BL_SWITCHER_DUMMY_IF=y
>  CONFIG_NR_CPUS=8
>  CONFIG_PREEMPT=y
>  CONFIG_AEABI=y
> 

Thanks,
