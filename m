From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH] [CPUFREQ] Move compile for S3C64XX cpufreq to /drivers/cpufreq
Date: Tue, 07 Jun 2011 08:46:18 +0530
Message-ID: <4DED9802.6080607@linaro.org>
References: <1307410981-20392-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vx0-f174.google.com ([209.85.220.174]:46672 "EHLO
	mail-vx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753053Ab1FGDQ0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 6 Jun 2011 23:16:26 -0400
Received: by vxi39 with SMTP id 39so3255219vxi.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Jun 2011 20:16:26 -0700 (PDT)
In-Reply-To: <1307410981-20392-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Mark Brown <broonie@opensource.wolfsonmicro.com>, Dave Jones <davej@redhat.com>

Hi,

On Tuesday 07 June 2011 07:13 AM, Kukjin Kim wrote:
> Cc: Mark Brown<broonie@opensource.wolfsonmicro.com>
> Cc: Dave Jones<davej@redhat.com>
> Signed-off-by: Kukjin Kim<kgene.kim@samsung.com>
> ---
>   arch/arm/Kconfig                                 |    4 ----
>   drivers/cpufreq/Kconfig.arm                      |    9 +++++++++
>   drivers/cpufreq/Makefile                         |    2 +-
>   drivers/cpufreq/{s3c64xx.c =>  s3c64xx-cpufreq.c} |    0
>   4 files changed, 10 insertions(+), 5 deletions(-)
>   rename drivers/cpufreq/{s3c64xx.c =>  s3c64xx-cpufreq.c} (100%)
>
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 9adc278..31c2899 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -1875,10 +1875,6 @@ config CPU_FREQ_PXA
>   	default y
>   	select CPU_FREQ_DEFAULT_GOV_USERSPACE
>
> -config CPU_FREQ_S3C64XX
> -	bool "CPUfreq support for Samsung S3C64XX CPUs"
> -	depends on CPU_FREQ&&  CPU_S3C6410
> -
>   config CPU_FREQ_S3C
>   	bool
>   	help
> diff --git a/drivers/cpufreq/Kconfig.arm b/drivers/cpufreq/Kconfig.arm
> index e5c56c7..500982f 100644
> --- a/drivers/cpufreq/Kconfig.arm
> +++ b/drivers/cpufreq/Kconfig.arm
> @@ -2,6 +2,15 @@
>   # ARM CPU Frequency scaling drivers
>   #
>
> +config ARM_S3C64XX_CPUFREQ
> +	bool "Samsung S3C64XX"
> +	depends on CPU_S3C6410
> +	default y
> +	help
> +	  This adds the CPUFreq driver for Samsung S5C6410 SoC.
S3C6410?
> +
> +	  If in doubt, say N.
> +
>   config ARM_S5PV210_CPUFREQ
>   	bool "Samsung S5PV210 and S5PC110"
>   	depends on CPU_S5PV210
> diff --git a/drivers/cpufreq/Makefile b/drivers/cpufreq/Makefile
> index 5419478..ab75e57 100644
> --- a/drivers/cpufreq/Makefile
> +++ b/drivers/cpufreq/Makefile
> @@ -40,6 +40,6 @@ obj-$(CONFIG_X86_CPUFREQ_NFORCE2)	+= cpufreq-nforce2.o
>   ##################################################################################
>   # ARM SoC drivers
>   obj-$(CONFIG_UX500_SOC_DB8500)		+= db8500-cpufreq.o
> -obj-$(CONFIG_CPU_FREQ_S3C64XX)		+= s3c64xx.o
> +obj-$(CONFIG_ARM_S3C64XX_CPUFREQ)	+= s3c64xx-cpufreq.o
>   obj-$(CONFIG_ARM_S5PV210_CPUFREQ)	+= s5pv210-cpufreq.o
>   obj-$(CONFIG_ARM_EXYNOS4210_CPUFREQ)	+= exynos4210-cpufreq.o
> diff --git a/drivers/cpufreq/s3c64xx.c b/drivers/cpufreq/s3c64xx-cpufreq.c
> similarity index 100%
> rename from drivers/cpufreq/s3c64xx.c
> rename to drivers/cpufreq/s3c64xx-cpufreq.c


-- 
Tushar Behera
