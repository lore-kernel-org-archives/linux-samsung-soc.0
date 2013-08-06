From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH v4] drm/exynos: Add fallback option to get non physically
 contiguous memory for fb
Date: Tue, 6 Aug 2013 17:27:11 +0530
Message-ID: <CAK9yfHya4a2Wxofs8wMpkgY5MWxqpseL65u9QqOLuVb2a_26LA@mail.gmail.com>
References: <1375789924-10515-1-git-send-email-vikas.sajjan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f52.google.com ([209.85.219.52]:39885 "EHLO
	mail-oa0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753947Ab3HFL5L (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 6 Aug 2013 07:57:11 -0400
Received: by mail-oa0-f52.google.com with SMTP id n12so483269oag.25
        for <linux-samsung-soc@vger.kernel.org>; Tue, 06 Aug 2013 04:57:11 -0700 (PDT)
In-Reply-To: <1375789924-10515-1-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vikas Sajjan <vikas.sajjan@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, kgene.kim@samsung.com, inki.dae@samsung.com, s.nawrocki@samsung.com, m.szyprowski@samsung.com, tomasz.figa@gmail.com, robdclark@gmail.com, arun.kk@samsung.com, patches@linaro.org, linaro-kernel@lists.linaro.org, joshi@samsung.com

On 6 August 2013 17:22, Vikas Sajjan <vikas.sajjan@linaro.org> wrote:
> While trying to get boot-logo up on exynos5420 SMDK which has eDP panel
> connected with resolution 2560x1600, following error occured even with
> IOMMU enabled:
> [0.880000] [drm:lowlevel_buffer_allocate] *ERROR* failed to allocate buffer.
> [0.890000] [drm] Initialized exynos 1.0.0 20110530 on minor 0
>
> To address the cases where physically contiguous memory MAY NOT be a
> mandatory requirement for fb, the patch adds a feature to get non physically
> contiguous memory for fb if physically contiguous memory allocation fails
> and if IOMMU is supported.
>
> Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
> Signed-off-by: Arun Kumar <arun.kk@samsung.com>
> Reviewed-by: Rob Clark <robdclark@gmail.com>
> ---
> changes since v3:
>         - addressed nits pointed out by Sylwester Nawrocki <s.nawrocki@samsung.com>
>         and Sachin Kamat <sachin.kamat@linaro.org>.
>
> changes since v2:
>         - addressed comments given by Tomasz Figa <tomasz.figa@gmail.com>.
>
> changes since v1:
>          - Modified to add the fallback patch if CONTIG alloc fails as suggested
>          by Rob Clark robdclark@gmail.com and Tomasz Figa <tomasz.figa@gmail.com>.
>
>          - changed the commit message.
> ---
>  drivers/gpu/drm/exynos/exynos_drm_fbdev.c |   15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
> index 8e60bd6..5292fc7 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
> @@ -16,6 +16,7 @@
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_fb_helper.h>
>  #include <drm/drm_crtc_helper.h>
> +#include <drm/exynos_drm.h>
>
>  #include "exynos_drm_drv.h"
>  #include "exynos_drm_fb.h"
> @@ -165,8 +166,18 @@ static int exynos_drm_fbdev_create(struct drm_fb_helper *helper,
>
>         size = mode_cmd.pitches[0] * mode_cmd.height;
>
> -       /* 0 means to allocate physically continuous memory */
> -       exynos_gem_obj = exynos_drm_gem_create(dev, 0, size);
> +       exynos_gem_obj = exynos_drm_gem_create(dev, EXYNOS_BO_CONTIG, size);
> +       /*
> +        * If physically contiguous memory allocation fails and if IOMMU is
> +        * supported then try to get buffer from non physically contiguous
> +        * memory area.
> +        */
> +       if (IS_ERR(exynos_gem_obj) && is_drm_iommu_supported(dev)) {
> +               dev_warn(&pdev->dev, "contiguous FB allocation failed, falling back to non-contiguous\n");
> +               exynos_gem_obj = exynos_drm_gem_create(dev, EXYNOS_BO_NONCONTIG,
> +                                                       size);
> +       }
> +
>         if (IS_ERR(exynos_gem_obj)) {
>                 ret = PTR_ERR(exynos_gem_obj);
>                 goto err_release_framebuffer;
> --
> 1.7.9.5

Looks good to me.

-- 
With warm regards,
Sachin
