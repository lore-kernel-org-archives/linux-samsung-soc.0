From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] ARM: exynos_defconfig: Enable big.LITTLE CPUidle support
Date: Sat, 29 Aug 2015 18:01:39 +0900
Message-ID: <55E174F3.1030202@samsung.com>
References: <1440749769-10135-1-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1440749769-10135-1-git-send-email-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, linux-kernel@vger.kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, Thierry Reding <treding@nvidia.com>, Anand Moon <linux.amoon@gmail.com>, Russell King <linux@arm.linux.org.uk>, linux-samsung-soc@vger.kernel.org, Sjoerd Simons <sjoerd.simons@collabora.co.uk>, Lukasz Majewski <l.majewski@samsung.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

W dniu 28.08.2015 o 17:16, Javier Martinez Canillas pisze:
> Some Exynos big.LITTLE boards (i.e: Exynos5420 and Exynos5800 based
> Chromebooks) have proper firmware that allow the big.LITTLE CPUidle
> driver to work correctly, so enable support for this.
> 
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> 
> ---
> Kukjin and Krzysztof,
> 
> As you know there are other boards like the Exynos5422 based Odroid XU{3,4}
> whose firmware is broken due leaving CCI in secure mode which means that the
> kernel MCPM support can't properly manage CCI.
> 
> So if you pick this patch, it should be tested in kernelci before appearing
> in linux-next to prevent any boot issues.
> 
> But if that happens, I believe that is better to do a fix / workaround in
> those broken platforms since nothing prevents users to enable this option
> anyways. For example the CCI device node could be disabled in the DTS.
> 
>  arch/arm/configs/exynos_defconfig | 1 +
>  1 file changed, 1 insertion(+)

On Odroid XU3L (next-20150828, Hardkernel u-boot) boot hangs just after:

[    2.568650] dwmmc_exynos 12200000.mmc: num-slots property not found,
assuming 1 slot is available

... so no. NACK :). First the boards, firmware, bootloader or kernel
code have to be fixed.

Best regards,
Krzysztof

> 
> diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
> index 729e2fae3e58..228ee945b8ed 100644
> --- a/arch/arm/configs/exynos_defconfig
> +++ b/arch/arm/configs/exynos_defconfig
> @@ -30,6 +30,7 @@ CONFIG_CPU_FREQ=y
>  CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND=y
>  CONFIG_CPUFREQ_DT=y
>  CONFIG_CPU_IDLE=y
> +CONFIG_ARM_BIG_LITTLE_CPUIDLE=y
>  CONFIG_ARM_EXYNOS_CPUIDLE=y
>  CONFIG_VFP=y
>  CONFIG_NEON=y
> 
