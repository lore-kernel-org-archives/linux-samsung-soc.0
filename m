From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH v3] drm/exynos: Add fallback option to get non physically
 continous memory for fb
Date: Tue, 6 Aug 2013 11:45:43 +0530
Message-ID: <CAK9yfHxoWkV5qROkr+TpWA+m1-K3mEUo2sp6HbZXSRTi-v3LMA@mail.gmail.com>
References: <1375766604-15455-1-git-send-email-vikas.sajjan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <1375766604-15455-1-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-media-owner@vger.kernel.org
To: Vikas Sajjan <vikas.sajjan@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, kgene.kim@samsung.com, inki.dae@samsung.com, s.nawrocki@samsung.com, m.szyprowski@samsung.com, tomasz.figa@gmail.com, robdclark@gmail.com, arun.kk@samsung.com, patches@linaro.org, linaro-kernel@lists.linaro.org, joshi@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Hi Vikas,

On 6 August 2013 10:53, Vikas Sajjan <vikas.sajjan@linaro.org> wrote:
> While trying to get boot-logo up on exynos5420 SMDK which has eDP panel
> connected with resolution 2560x1600, following error occured even with
> IOMMU enabled:
> [0.880000] [drm:lowlevel_buffer_allocate] *ERROR* failed to allocate buffer.
> [0.890000] [drm] Initialized exynos 1.0.0 20110530 on minor 0
>
> To address the cases where physically continous memory MAY NOT be a
> mandatory requirement for fb, the patch adds a feature to get non physically
> continous memory for fb if IOMMU is supported and if CONTIG memory allocation
> fails.

The patch looks fine. Just a small nit. Please use the word contiguous
instead of continuous to refer to memory locations consistently in
this patch.

>
> Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
> Signed-off-by: Arun Kumar <arun.kk@samsung.com>
> Reviewed-by: Rob Clark <robdclark@gmail.com>
> ---
> changes since v2:
>         - addressed comments given by Tomasz Figa <tomasz.figa@gmail.com>.
>
> changes since v1:
>          - Modified to add the fallback patch if CONTIG alloc fails as suggested
>          by Rob Clark robdclark@gmail.com and Tomasz Figa <tomasz.figa@gmail.com>.
>
>          - changed the commit message.
> ---
>  drivers/gpu/drm/exynos/exynos_drm_fbdev.c |   14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
> index 8e60bd6..faec77e 100644
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
> @@ -165,8 +166,17 @@ static int exynos_drm_fbdev_create(struct drm_fb_helper *helper,
>
>         size = mode_cmd.pitches[0] * mode_cmd.height;
>
> -       /* 0 means to allocate physically continuous memory */
> -       exynos_gem_obj = exynos_drm_gem_create(dev, 0, size);
> +       exynos_gem_obj = exynos_drm_gem_create(dev, EXYNOS_BO_CONTIG, size);
> +       /*
> +        * If IOMMU is supported then try to get buffer from non physically
> +        * continous memory area.
> +        */

To make this more clear, you could say,
"If physically contiguous memory allocation fails and if IOMMU is
supported, try to ....."


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
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
With warm regards,
Sachin
