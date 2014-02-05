From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH V2 1/3] ARM: EXYNOS: initial board support for exynos5260 SoC
Date: Wed, 5 Feb 2014 13:55:48 -0800
Message-ID: <CAOesGMi0mRWbxt6eDyiWEv5u9KWjg+SDdsi3tXdPOgQWNmouqw@mail.gmail.com>
References: <1391577375-17625-1-git-send-email-rahul.sharma@samsung.com>
	<1391577375-17625-2-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f169.google.com ([209.85.216.169]:56881 "EHLO
	mail-qc0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752212AbaBEVzt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 5 Feb 2014 16:55:49 -0500
Received: by mail-qc0-f169.google.com with SMTP id w7so1765360qcr.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 05 Feb 2014 13:55:49 -0800 (PST)
In-Reply-To: <1391577375-17625-2-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <rahul.sharma@samsung.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, sunil joshi <joshi@samsung.com>, r.sh.open@gmail.com, Pankaj Dubey <pankaj.dubey@samsung.com>

Hi,

On Tue, Feb 4, 2014 at 9:16 PM, Rahul Sharma <rahul.sharma@samsung.com> wrote:
> From: Pankaj Dubey <pankaj.dubey@samsung.com>
>
> This patch add basic arch side support for exynos5260 SoC.
>
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
> ---
>  arch/arm/mach-exynos/Kconfig                 |    9 +++++++++
>  arch/arm/mach-exynos/common.c                |   18 ++++++++++++++++++
>  arch/arm/mach-exynos/include/mach/map.h      |    1 +
>  arch/arm/mach-exynos/mach-exynos5-dt.c       |    1 +
>  arch/arm/plat-samsung/include/plat/cpu.h     |    8 ++++++++
>  arch/arm/plat-samsung/include/plat/map-s5p.h |    1 +
>  6 files changed, 38 insertions(+)
>  mode change 100644 => 100755 arch/arm/mach-exynos/include/mach/map.h
>  mode change 100644 => 100755 arch/arm/mach-exynos/mach-exynos5-dt.c
>  mode change 100644 => 100755 arch/arm/plat-samsung/include/plat/cpu.h
>
> diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
> index 4c414af..5c96248 100644
> --- a/arch/arm/mach-exynos/Kconfig
> +++ b/arch/arm/mach-exynos/Kconfig
> @@ -91,6 +91,15 @@ config SOC_EXYNOS5250
>         help
>           Enable EXYNOS5250 SoC support
>
> +config SOC_EXYNOS5260
> +       bool "SAMSUNG EXYNOS5260"
> +       default y
> +       depends on ARCH_EXYNOS5
> +       select AUTO_ZRELADDR
> +       select SAMSUNG_DMADEV
> +       help
> +         Enable EXYNOS5260 SoC support

There's no point in having one of these for every SoC any more, so
don't add new ones. The amount of code or data added by this is
Kconfig is very small, we can just always include it with any EXYNOS5
build.

> --- a/arch/arm/plat-samsung/include/plat/cpu.h
> +++ b/arch/arm/plat-samsung/include/plat/cpu.h
> @@ -46,6 +46,7 @@ extern unsigned long samsung_cpu_id;
>  #define EXYNOS4_CPU_MASK       0xFFFE0000
>
>  #define EXYNOS5250_SOC_ID      0x43520000
> +#define EXYNOS5260_SOC_ID      0xE5260000
>  #define EXYNOS5420_SOC_ID      0xE5420000
>  #define EXYNOS5440_SOC_ID      0xE5440000
>  #define EXYNOS5_SOC_MASK       0xFFFFF000
> @@ -68,6 +69,7 @@ IS_SAMSUNG_CPU(exynos4210, EXYNOS4210_CPU_ID, EXYNOS4_CPU_MASK)
>  IS_SAMSUNG_CPU(exynos4212, EXYNOS4212_CPU_ID, EXYNOS4_CPU_MASK)
>  IS_SAMSUNG_CPU(exynos4412, EXYNOS4412_CPU_ID, EXYNOS4_CPU_MASK)
>  IS_SAMSUNG_CPU(exynos5250, EXYNOS5250_SOC_ID, EXYNOS5_SOC_MASK)
> +IS_SAMSUNG_CPU(exynos5260, EXYNOS5260_SOC_ID, EXYNOS5_SOC_MASK)
>  IS_SAMSUNG_CPU(exynos5420, EXYNOS5420_SOC_ID, EXYNOS5_SOC_MASK)
>  IS_SAMSUNG_CPU(exynos5440, EXYNOS5440_SOC_ID, EXYNOS5_SOC_MASK)
>
> @@ -148,6 +150,12 @@ IS_SAMSUNG_CPU(exynos5440, EXYNOS5440_SOC_ID, EXYNOS5_SOC_MASK)
>  # define soc_is_exynos5250()   0
>  #endif
>
> +#if defined(CONFIG_SOC_EXYNOS5260)
> +# define soc_is_exynos5260()   is_samsung_exynos5260()
> +#else
> +# define soc_is_exynos5260()   0
> +#endif

This will likely conflict with cleanup patches going on right now
which should do away with these header files (or at least move them).


> diff --git a/arch/arm/plat-samsung/include/plat/map-s5p.h b/arch/arm/plat-samsung/include/plat/map-s5p.h
> index c186786..804597c 100644
> --- a/arch/arm/plat-samsung/include/plat/map-s5p.h
> +++ b/arch/arm/plat-samsung/include/plat/map-s5p.h
> @@ -23,6 +23,7 @@
>
>  #define S5P_VA_SYSRAM          S3C_ADDR(0x02400000)
>  #define S5P_VA_SYSRAM_NS       S3C_ADDR(0x02410000)
> +
>  #define S5P_VA_DMC0            S3C_ADDR(0x02440000)
>  #define S5P_VA_DMC1            S3C_ADDR(0x02480000)
>  #define S5P_VA_SROMC           S3C_ADDR(0x024C0000)

Spurious change.


-Olof
