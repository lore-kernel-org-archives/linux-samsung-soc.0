From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 2/2] ARM: exynos_defconfig: Enable UAS support for
 Odroid HC1 board
Date: Mon, 2 Oct 2017 18:57:29 +0200
Message-ID: <20171002165729.ydeoipiattyx4e4c@kozik-lap>
References: <1506926375-5782-1-git-send-email-m.szyprowski@samsung.com>
 <CGME20171002063945eucas1p1a4f32bcd2e31435cd613086b95c5a5d0@eucas1p1.samsung.com>
 <1506926375-5782-3-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:34734 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751902AbdJBQ5d (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 2 Oct 2017 12:57:33 -0400
Received: by mail-wm0-f66.google.com with SMTP id l10so1072483wmg.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 02 Oct 2017 09:57:33 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1506926375-5782-3-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On Mon, Oct 02, 2017 at 08:39:35AM +0200, Marek Szyprowski wrote:
> Odroid HC1 board has built-in JMicron USB to SATA bridge, which supports
> UAS protocol. Compile-in support for it (instead of enabling it as module)
> to make sure that all built-in storage devices are available for rootfs.
> The bridge itself also supports fallback to standard USB Mass Storage
> protocol, but USB Mass Storage class doesn't bind to it when UAS is
> compiled as module and modules are not (yet) available.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/configs/exynos_defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
> index 8c2a2619971b..f1d7834990ec 100644
> --- a/arch/arm/configs/exynos_defconfig
> +++ b/arch/arm/configs/exynos_defconfig
> @@ -244,7 +244,7 @@ CONFIG_USB_STORAGE_ONETOUCH=m
>  CONFIG_USB_STORAGE_KARMA=m
>  CONFIG_USB_STORAGE_CYPRESS_ATACB=m
>  CONFIG_USB_STORAGE_ENE_UB6250=m
> -CONFIG_USB_UAS=m
> +CONFIG_USB_UAS=y

One more thing, how about doing the same for multi_v7?

Best regards,
Krzysztof
