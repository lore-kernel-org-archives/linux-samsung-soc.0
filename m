From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v8 3/8] ARM64: EXYNOS: enable exynos_chipid for
 ARCH_EXYNOS
Date: Fri, 16 Dec 2016 19:38:50 +0200
Message-ID: <20161216173850.GB3746@kozik-lap>
References: <1481375323-29724-1-git-send-email-pankaj.dubey@samsung.com>
 <1481375323-29724-4-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wj0-f196.google.com ([209.85.210.196]:34914 "EHLO
        mail-wj0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752866AbcLPRjC (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 16 Dec 2016 12:39:02 -0500
Received: by mail-wj0-f196.google.com with SMTP id he10so15327034wjc.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Dec 2016 09:39:01 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1481375323-29724-4-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, krzk@kernel.org, arnd@arndb.de, geert+renesas@glider.be, m.szyprowski@samsung.com, javier@osg.samsung.com, kgene@kernel.org, thomas.ab@samsung.com

On Sat, Dec 10, 2016 at 06:38:38PM +0530, Pankaj Dubey wrote:
> This patch enables exynos_chipid driver for ARCH_EXYNOS
> based SoC.
> 
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> ---
>  arch/arm64/Kconfig.platforms | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index 72f4eac..e6aa5c2 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -53,6 +53,7 @@ config ARCH_BRCMSTB
>  
>  config ARCH_EXYNOS
>  	bool "ARMv8 based Samsung Exynos SoC family"
> +	select EXYNOS_CHIPID

You allowed CHIPID only on ARMv7, not ARMv8.

Best regards,
Krzysztof

>  	select COMMON_CLK_SAMSUNG
>  	select HAVE_S3C2410_WATCHDOG if WATCHDOG
>  	select HAVE_S3C_RTC if RTC_CLASS
> -- 
> 2.7.4
> 
