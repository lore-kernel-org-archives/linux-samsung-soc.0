From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH V2] drm/exynos: Fix multiplatform breakage for ipp/gsc
Date: Tue, 21 Jan 2014 13:37:46 +0900
Message-ID: <CAAQKjZO8njs_UW_mcRjtuYX8t+tdNKYWZmBcr1Xuf30t_eAYrg@mail.gmail.com>
References: <1389853677-3485-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f52.google.com ([74.125.82.52]:48129 "EHLO
	mail-wg0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751380AbaAUEhs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 20 Jan 2014 23:37:48 -0500
Received: by mail-wg0-f52.google.com with SMTP id b13so7604338wgh.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Jan 2014 20:37:47 -0800 (PST)
In-Reply-To: <1389853677-3485-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, DRI mailing list <dri-devel@lists.freedesktop.org>, Arnd Bergmann <arnd@arndb.de>, Sachin Kamat <sachin.kamat@linaro.org>

Applied.

Thanks,
Inki Dae

2014/1/16 Tushar Behera <tushar.behera@linaro.org>:
> There is no need to include "plat/map-base.h" in ipp driver. Remove
> this and enable this driver for multi-platform.
>
> However gsc driver is not multiplatform compliant yet, so make the
> compilation conditional upon !ARCH_MULTIPLATFORM.
>
> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
> ---
> Changes for V2:
> * Made compilation of exynos_drm_gsc.c conditional on
>  !ARCH_MULTIPLATFORM.
>
>  drivers/gpu/drm/exynos/Kconfig          |    4 ++--
>  drivers/gpu/drm/exynos/exynos_drm_ipp.c |    1 -
>  2 files changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/Kconfig
> index f227f54..6e1a1a2 100644
> --- a/drivers/gpu/drm/exynos/Kconfig
> +++ b/drivers/gpu/drm/exynos/Kconfig
> @@ -51,7 +51,7 @@ config DRM_EXYNOS_G2D
>
>  config DRM_EXYNOS_IPP
>         bool "Exynos DRM IPP"
> -       depends on DRM_EXYNOS && !ARCH_MULTIPLATFORM
> +       depends on DRM_EXYNOS
>         help
>           Choose this option if you want to use IPP feature for DRM.
>
> @@ -69,6 +69,6 @@ config DRM_EXYNOS_ROTATOR
>
>  config DRM_EXYNOS_GSC
>         bool "Exynos DRM GSC"
> -       depends on DRM_EXYNOS_IPP && ARCH_EXYNOS5
> +       depends on DRM_EXYNOS_IPP && ARCH_EXYNOS5 && !ARCH_MULTIPLATFORM
>         help
>           Choose this option if you want to use Exynos GSC for DRM.
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_ipp.c b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
> index d519a4e..eefb429 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_ipp.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
> @@ -16,7 +16,6 @@
>  #include <linux/types.h>
>  #include <linux/clk.h>
>  #include <linux/pm_runtime.h>
> -#include <plat/map-base.h>
>
>  #include <drm/drmP.h>
>  #include <drm/exynos_drm.h>
> --
> 1.7.9.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
