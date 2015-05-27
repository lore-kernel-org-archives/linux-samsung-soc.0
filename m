From: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 2/5] ARM: EXYNOS: Remove SROM related register settings
 from mach-exynos
Date: Wed, 27 May 2015 20:56:01 +0900
Message-ID: <5565B0D1.80004@samsung.com>
References: <1430296712-10287-1-git-send-email-pankaj.dubey@samsung.com> <1430296712-10287-3-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1430296712-10287-3-git-send-email-pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pankaj Dubey <pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: thomas.ab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

W dniu 29.04.2015 o 17:38, Pankaj Dubey pisze:
> As now we have dedicated driver for SROM controller, it will take care
> of saving register banks during S2R so we can safely remove these
> settings from mach-exynos.
> 
> Signed-off-by: Pankaj Dubey <pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  arch/arm/mach-exynos/Kconfig                   |  2 +
>  arch/arm/mach-exynos/exynos.c                  | 10 -----
>  arch/arm/mach-exynos/include/mach/map.h        |  3 --
>  arch/arm/mach-exynos/suspend.c                 | 20 +---------
>  arch/arm/plat-samsung/include/plat/map-s5p.h   |  1 -
>  arch/arm/plat-samsung/include/plat/regs-srom.h | 54 --------------------------
>  6 files changed, 4 insertions(+), 86 deletions(-)
>  delete mode 100644 arch/arm/plat-samsung/include/plat/regs-srom.h
> 
> diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
> index 603820e..e842b23 100644
> --- a/arch/arm/mach-exynos/Kconfig
> +++ b/arch/arm/mach-exynos/Kconfig
> @@ -25,6 +25,8 @@ menuconfig ARCH_EXYNOS
>  	select S5P_DEV_MFC
>  	select SRAM
>  	select MFD_SYSCON
> +	select SOC_SAMSUNG
> +	select EXYNOS_SROM

What about the difference of execution time? The suspend/resume of
device may not be called in the same time as previous syscore ops. Does
this have any impact?

Best regards,
Krzysztof

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
