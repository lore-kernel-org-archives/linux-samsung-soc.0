From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v9 06/12] ARM64: EXYNOS: enable exynos_chipid for ARCH_EXYNOS
Date: Thu, 30 Mar 2017 15:51:27 +0200
Message-ID: <CAK8P3a2+DVK8gdFs_QVtdQvi_mej9hWVXuDOtg=HwoyrY-b70Q@mail.gmail.com>
References: <CGME20170330131431epcas5p447a730e1bb194162f262a819ae665efb@epcas5p4.samsung.com>
 <1490879826-16754-1-git-send-email-pankaj.dubey@samsung.com> <1490879826-16754-7-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oi0-f67.google.com ([209.85.218.67]:33755 "EHLO
        mail-oi0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933626AbdC3Nve (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 30 Mar 2017 09:51:34 -0400
Received: by mail-oi0-f67.google.com with SMTP id f193so4692229oib.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Mar 2017 06:51:33 -0700 (PDT)
In-Reply-To: <1490879826-16754-7-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, Krzysztof Kozlowski <krzk@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, m.reichl@fivetechno.de, a.hajda@samsung.com, cwchoi00@gmail.com, Javier Martinez Canillas <javier@osg.samsung.com>

On Thu, Mar 30, 2017 at 3:17 PM, Pankaj Dubey <pankaj.dubey@samsung.com> wrote:
> This patch enables exynos_chipid driver for ARCH_EXYNOS
> based SoC.
>
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> ---
>  arch/arm64/Kconfig.platforms | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index 9cdaecd..b238204 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -54,6 +54,7 @@ config ARCH_BRCMSTB
>  config ARCH_EXYNOS
>         bool "ARMv8 based Samsung Exynos SoC family"
>         select COMMON_CLK_SAMSUNG
> +       select EXYNOS_CHIPID

If you check for ARCH_EXYNOS in the driver Kconfig entry, then
this patch is not needed.

       Arnd
