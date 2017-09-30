From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 3/3] ARM: exynos_defconfig: Enable UAS support for Odroid
 HC1 board
Date: Sat, 30 Sep 2017 19:31:53 +0200
Message-ID: <20170930173153.hjwyuf5vzhaanhyv@kozik-lap>
References: <1506684783-9722-1-git-send-email-m.szyprowski@samsung.com>
 <CGME20170929113314eucas1p2742039d35eb39f6d4749fe09988373d9@eucas1p2.samsung.com>
 <1506684783-9722-4-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:37340 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751243AbdI3Rb5 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 30 Sep 2017 13:31:57 -0400
Received: by mail-wm0-f68.google.com with SMTP id f4so1304178wmh.4
        for <linux-samsung-soc@vger.kernel.org>; Sat, 30 Sep 2017 10:31:56 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1506684783-9722-4-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On Fri, Sep 29, 2017 at 01:33:03PM +0200, Marek Szyprowski wrote:
> Odroid HC1 board has build-in JMicron USB to SATA bridge, which supports

s/build/built/ (also below)

> UAS protocol. Enable support for it to make sure that all build-in devices
> are available.

UAS was enabled, as a module. You made it built-in instead so the commit
should describe the reason behind this change.

Best regards,
Krzysztof


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
>  CONFIG_USB_DWC3=y
>  CONFIG_USB_DWC2=y
>  CONFIG_USB_HSIC_USB3503=y
> -- 
> 1.9.1
> 
