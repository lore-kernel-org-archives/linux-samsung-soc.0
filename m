From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: Re: [PATCH] drm/exynos: allocate non-contigous buffers when iommu is enabled
Date: Thu, 22 May 2014 10:55:11 +0530
Message-ID: <CAPdUM4OL+Kt8v1upyczDmjBPh5kT1d4gYDmYLBb=ZovQ=qOE7w@mail.gmail.com>
References: <1399463489-6925-1-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f170.google.com ([74.125.82.170]:45072 "EHLO
	mail-we0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750958AbaEVFZM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 May 2014 01:25:12 -0400
Received: by mail-we0-f170.google.com with SMTP id u57so2985355wes.29
        for <linux-samsung-soc@vger.kernel.org>; Wed, 21 May 2014 22:25:11 -0700 (PDT)
In-Reply-To: <1399463489-6925-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Inki Dae <inki.dae@samsung.com>, sunil joshi <joshi@samsung.com>, Rahul Sharma <r.sh.open@gmail.com>, Rahul Sharma <rahul.sharma@samsung.com>

Hi Inki,

The below fix doesn't affect the FB dev buffer allocation. IMO the scenario
where u-boot allocates the buffer is not disturbed.
Please review the implementation.

Regards,
Rahul Sharma.

On 7 May 2014 17:21, Rahul Sharma <rahul.sharma@samsung.com> wrote:
> From: Rahul Sharma <Rahul.Sharma@samsung.com>
>
> Allow to allocate non-contigous buffers when iommu is enabled.
> Currently, it tries to allocates contigous buffer which consistently
> fail for large buffers and then fall back to non contigous. Apart
> from being slow, this implementation is also very noisy and fills
> the screen with alloc fail logs.
>
> Change-Id: I523e95aa308122ed2edc55e065ae6eb8be996541
> Signed-off-by: Rahul Sharma <Rahul.Sharma@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_gem.c |   22 ++++++++++------------
>  1 file changed, 10 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exynos/exynos_drm_gem.c
> index 5d88924..7136945 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
> @@ -624,22 +624,20 @@ int exynos_drm_gem_dumb_create(struct drm_file *file_priv,
>         args->pitch = args->width * ((args->bpp + 7) / 8);
>         args->size = args->pitch * args->height;
>
> -       exynos_gem_obj = exynos_drm_gem_create(dev, EXYNOS_BO_CONTIG |
> -                                               EXYNOS_BO_WC, args->size);
> -       /*
> -        * If physically contiguous memory allocation fails and if IOMMU is
> -        * supported then try to get buffer from non physically contiguous
> -        * memory area.
> -        */
> -       if (IS_ERR(exynos_gem_obj) && is_drm_iommu_supported(dev)) {
> -               dev_warn(dev->dev, "contiguous FB allocation failed, falling back to non-contiguous\n");
> +       if (is_drm_iommu_supported(dev)) {
> +               exynos_gem_obj = exynos_drm_gem_create(dev,
> +                       EXYNOS_BO_NONCONTIG | EXYNOS_BO_WC,
> +                       args->size);
> +       } else {
>                 exynos_gem_obj = exynos_drm_gem_create(dev,
> -                                       EXYNOS_BO_NONCONTIG | EXYNOS_BO_WC,
> -                                       args->size);
> +                       EXYNOS_BO_CONTIG | EXYNOS_BO_WC,
> +                       args->size);
>         }
>
> -       if (IS_ERR(exynos_gem_obj))
> +       if (IS_ERR(exynos_gem_obj)) {
> +               dev_warn(dev->dev, "FB allocation failed.\n");
>                 return PTR_ERR(exynos_gem_obj);
> +       }
>
>         ret = exynos_drm_gem_handle_create(&exynos_gem_obj->base, file_priv,
>                         &args->handle);
> --
> 1.7.9.5
>
