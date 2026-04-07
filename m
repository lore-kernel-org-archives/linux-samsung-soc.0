Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3B626FA5B
	for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Apr 2026 14:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775573046; cv=pass; b=pweE4lxdpdIQtByCTB6im6Rz3qV2J4OEPN5oV2R7h7024/UgT1gwkU+0l/+BPEVOK9ng+iwAiwbDrDCtqC3E0OVnIKGZnbq66Xxrmd1UqpAx27inlRH2RFNUpDEzUAvlxI72gonKy09uVHomeQ27ioMSnsIZlTvtIOL7wCJcjHQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775573046; c=relaxed/simple;
	bh=1HjsbEpSJCBD7/AUH4BIJwyqI/UiDkNE3e7HM1z1CSg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aPEsP/Oc76RthMqHmFXeQ0g/4hYorYySEUO2aL1zdlUUnscCQNEd1b70PLS31SORziWph7BrZCkPTuBtl28GneQFnGn0inCeKQcLDwLcDurFxR+24A7mlCfAMcQveZLu5Zk/mX/Q+O9x6HEM/XaKxN5eU+jh4Z3sKhooZhCfK4w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QaFYSPGf; arc=pass smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QaFYSPGf"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-89f1e767f92so47464616d6.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Apr 2026 07:44:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775573044; cv=none;
        d=google.com; s=arc-20240605;
        b=B/9CtxHpr/kisffKobsV45DDsOsS5ojqnS9namPci6BfNMf/94bBeLM98TI4LJVyqn
         BcAdR8/kjGXPubdwDkM5xSrawfGPDqJlTDk6Eht3JybowerWFrKrAPr21zkor/yOxYRX
         aDC+nP8Vk9fhw9OHgO0Ej6zYbbzBRF3zOMqfq/9ogyCKb4RAXE7QNELhbYWXOO8J26YQ
         IwnPZOjNr1fpv8/vd6mvQvapPCooP2BoW/KGnQtvu0aYcmA2OvaEPkZYPsgmxncPs9ZD
         oUp/PGDxsh34t0MrqVhc0g+lekdc+7ap5rX3a8Cvj/JGVaV6J/Tm2ItVd9p3IGHFH+CL
         dnFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Zl+ybDcUVtik8d9nb2gVdt0WS3xrV20DIN3DouokInQ=;
        fh=ZOSEctEY7iglAfyWQxJuAXiccYNx+cq/uBnnXlq0ucw=;
        b=clxl9lDtH0BCmFUmxHfIXya7Wigm58RzqOS7mdvHqt0VuFF1Qhwk6v9afN7hB9w4H5
         TgMY2yNhfXZjlN5PGAgZgRHNT5BocoffOfMQgWlqVPxeeyD170v6R4RPHzx4a+DQUMRg
         RowGRlHtuhbSvhrowZFrv88UBrjqXS/SZAawC7xJIAaJGw2zfd9GImVyBeYmhtJ6GaTu
         by9g/8Owcd7Quq6xSqwCs9vi7M0qhb70slwGMvDapbj/kQzaThrlew0s6Z6mK++ORY+E
         xrm3Kn2eO3iijLsS8foQ5XSGBQZTam8etC9yUkt4uJpOFG+8irJVO/VIlawxaGt1Ap6v
         fPEg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775573044; x=1776177844; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zl+ybDcUVtik8d9nb2gVdt0WS3xrV20DIN3DouokInQ=;
        b=QaFYSPGfjdB3rH1ek9bOp/U/y5345jb/pFhHtaNtiYpQGLDsrRfBdTtJ1kqz/Ar0H1
         a4cdHIB8wt8GbpSRfWGaxfol+yYMuBE+neKRMRkMTZRdOF2nN8Uy8Df5+88mWXcI4nXT
         SU0HhzlMlmD1D7tnPhWBAT75zrW96CNJi/wB/n3R3HAi3r68Z8XWRMjY3a+Pojp6hn8u
         N2mCdKHuqq5vpK4w7VmqpcrYUyAv2cBmLgnhGtQx6gy2lI0rXUrnhVRNirn13dRiSvZK
         8Ibm9Ea2cXGtgqfbcuVKIIEWOyEI/gQnqLPwjbGVGhDSGNP7J/PPscC4eDFiLVa56Gsp
         7Q3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775573044; x=1776177844;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Zl+ybDcUVtik8d9nb2gVdt0WS3xrV20DIN3DouokInQ=;
        b=IcGIsFO9UrLYK/xd8xSNIq8g979qu3xgsSjMwqSW6r4F+Sb4KPLgMOQuSqeylwj7k2
         Y+3krPFSee9lJoIj8HJvl2SPrxjO7e0b9ueGgCe18zs+eFesPQ6VPMvF4IoHYnspG5ae
         dO/qK/q7Iofk/U5cBKGoSewzBELm8EvOPTicAaY/xKBwLKtgMUiMdds9XneIXLxDBLKU
         7+4+240N3ri9umNwGIbbFqvIjz52qBp9dOuBWhBQV0+To5p03Ra/QdRyMgeUOxre2EyH
         16VtyhO1M3iYhVoCFpD47RCS83szXYz5Hs97sVjzIW6y8IE817TMb1mkGqlHHbXggnru
         cRQA==
X-Forwarded-Encrypted: i=1; AJvYcCVJXNIHINFcwJzX+y6fquUxhdY3eLki/KBFll1eUKkfHy+HlVijZsZ3JMuS4oF4fNzIulrc7WGp7FzUOXsva0kZFA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywge8ZjYtjQN/2r29VHMAgUhyctz59rWkXkD/ZPOhc4CKmYfOEK
	Kh2Zu9Iw7Ug9P2gXkaCLUsy+omGoMN+MO0e3TSeMYwwwBqJOTeQQw25rHCpmT3HrYc0OEDX72P1
	7vmZLwY7kEXoT2LARcAgsor5I5hiBhrg=
X-Gm-Gg: AeBDies6rUd0ZouPbLkicXWkg4BQxZiL59pcZLccITgMSG3jq+1KV+9CbZOOSIDACAx
	qST5i+lLMuWEII73+W3SYlrJ8FVNdAWbPKyi54McSXGU9jD1/6VNPz3DgXQ96khsDhvhrZKM2s5
	bogjMJtlyq1Xt21+hMt8oYMeBba4yROUvUMSrvJ3Ulj63I+X0mEDG17hS5lClArUEDfO/H5hb0i
	AUo+cThPqXQGImMh2NzDzHrowTC1ASepHonV7I98BOY9TeTOI2gGZqLOAPiVngFeFDCwyxhXRU0
	8Mf24w==
X-Received: by 2002:ad4:5bc3:0:b0:8a5:fcce:4c with SMTP id 6a1803df08f44-8a7043edff1mr287526516d6.27.1775573043645;
 Tue, 07 Apr 2026 07:44:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326094308.1161335-1-wenst@chromium.org> <20260326094308.1161335-3-wenst@chromium.org>
In-Reply-To: <20260326094308.1161335-3-wenst@chromium.org>
From: Inki Dae <daeinki@gmail.com>
Date: Tue, 7 Apr 2026 23:43:26 +0900
X-Gm-Features: AQROBzBGt340ZHEJc4Xn02uKsIv90vik5xWrVoDE6tBxFh2VJoHTruSbBo3C7_4
Message-ID: <CAAQKjZM5NC6svNX=7QpXzsfS-xAsCV2GdLDDdSTDpArwqg=o7g@mail.gmail.com>
Subject: Re: [PATCH 2/4] drm/exynos: Use DRM core dedicated DMA device
 tracking facility
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 3=EC=9B=94 26=EC=9D=BC (=EB=AA=A9) =EC=98=A4=ED=9B=84 6:51, C=
hen-Yu Tsai <wenst@chromium.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> The exynos driver tracks a dedicated DMA device in its private data.
> The DRM core already has facilities to do this, and it is integrated
> into DRM PRIME imports and GEM DMA helpers.
>
> Convert the exynos driver to use the core's dedicated DMA device
> tracking facility. Also get rid of exynos_drm_gem_prime_import() as
> it is identical to drm_gem_prime_import() after the conversion.
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_dma.c | 11 +++++-----
>  drivers/gpu/drm/exynos/exynos_drm_drv.c |  1 -
>  drivers/gpu/drm/exynos/exynos_drm_drv.h |  8 --------
>  drivers/gpu/drm/exynos/exynos_drm_g2d.c | 11 +++++-----
>  drivers/gpu/drm/exynos/exynos_drm_gem.c | 27 ++++++++++---------------
>  drivers/gpu/drm/exynos/exynos_drm_gem.h |  2 --
>  6 files changed, 23 insertions(+), 37 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dma.c b/drivers/gpu/drm/ex=
ynos/exynos_drm_dma.c
> index ccc6b852ee7d..734741c80cbe 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dma.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dma.c
> @@ -8,6 +8,7 @@
>  #include <linux/iommu.h>
>  #include <linux/platform_device.h>
>
> +#include <drm/drm_device.h>
>  #include <drm/drm_print.h>
>  #include <drm/exynos_drm.h>
>
> @@ -41,7 +42,7 @@ static int drm_iommu_attach_device(struct drm_device *d=
rm_dev,
>         struct exynos_drm_private *priv =3D drm_dev->dev_private;
>         int ret =3D 0;
>
> -       if (get_dma_ops(priv->dma_dev) !=3D get_dma_ops(subdrv_dev)) {
> +       if (get_dma_ops(drm_dev_dma_dev(drm_dev)) !=3D get_dma_ops(subdrv=
_dev)) {
>                 DRM_DEV_ERROR(subdrv_dev, "Device %s lacks support for IO=
MMU\n",
>                           dev_name(subdrv_dev));
>                 return -EINVAL;
> @@ -93,8 +94,8 @@ int exynos_drm_register_dma(struct drm_device *drm, str=
uct device *dev,
>  {
>         struct exynos_drm_private *priv =3D drm->dev_private;
>
> -       if (!priv->dma_dev) {
> -               priv->dma_dev =3D dev;
> +       if (drm_dev_dma_dev(drm) =3D=3D drm->dev) {
> +               drm_dev_set_dma_dev(drm, dev);
>                 DRM_INFO("Exynos DRM: using %s device for DMA mapping ope=
rations\n",
>                          dev_name(dev));
>         }
> @@ -109,7 +110,7 @@ int exynos_drm_register_dma(struct drm_device *drm, s=
truct device *dev,
>                         mapping =3D arm_iommu_create_mapping(dev,
>                                 EXYNOS_DEV_ADDR_START, EXYNOS_DEV_ADDR_SI=
ZE);
>                 else if (IS_ENABLED(CONFIG_IOMMU_DMA))
> -                       mapping =3D iommu_get_domain_for_dev(priv->dma_de=
v);
> +                       mapping =3D iommu_get_domain_for_dev(dev);
>
>                 if (!mapping)
>                         return -ENODEV;
> @@ -135,5 +136,5 @@ void exynos_drm_cleanup_dma(struct drm_device *drm)
>
>         arm_iommu_release_mapping(priv->mapping);
>         priv->mapping =3D NULL;
> -       priv->dma_dev =3D NULL;
> +       drm_dev_set_dma_dev(drm, NULL);
>  }
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/ex=
ynos/exynos_drm_drv.c
> index 2101a74dc1ed..9ee30086879f 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> @@ -109,7 +109,6 @@ static const struct drm_driver exynos_drm_driver =3D =
{
>         .open                   =3D exynos_drm_open,
>         .postclose              =3D exynos_drm_postclose,
>         .dumb_create            =3D exynos_drm_gem_dumb_create,
> -       .gem_prime_import       =3D exynos_drm_gem_prime_import,
>         .gem_prime_import_sg_table      =3D exynos_drm_gem_prime_import_s=
g_table,
>         EXYNOS_DRM_FBDEV_DRIVER_OPS,
>         .ioctls                 =3D exynos_ioctls,
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/ex=
ynos/exynos_drm_drv.h
> index 06c29ff2aac0..1ab7195d09ae 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
> @@ -198,7 +198,6 @@ struct drm_exynos_file_private {
>   */
>  struct exynos_drm_private {
>         struct device *g2d_dev;
> -       struct device *dma_dev;
>         struct device *vidi_dev;
>         void *mapping;
>
> @@ -208,13 +207,6 @@ struct exynos_drm_private {
>         wait_queue_head_t       wait;
>  };
>
> -static inline struct device *to_dma_dev(struct drm_device *dev)
> -{
> -       struct exynos_drm_private *priv =3D dev->dev_private;
> -
> -       return priv->dma_dev;
> -}
> -
>  static inline bool is_drm_iommu_supported(struct drm_device *drm_dev)
>  {
>         struct exynos_drm_private *priv =3D drm_dev->dev_private;
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c b/drivers/gpu/drm/ex=
ynos/exynos_drm_g2d.c
> index 348603262af0..85a3a247dfca 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
> @@ -20,6 +20,7 @@
>  #include <linux/uaccess.h>
>  #include <linux/workqueue.h>
>
> +#include <drm/drm_device.h>
>  #include <drm/drm_file.h>
>  #include <drm/drm_print.h>
>  #include <drm/exynos_drm.h>
> @@ -278,7 +279,7 @@ static int g2d_init_cmdlist(struct g2d_data *g2d)
>
>         g2d->cmdlist_dma_attrs =3D DMA_ATTR_WRITE_COMBINE;
>
> -       g2d->cmdlist_pool_virt =3D dma_alloc_attrs(to_dma_dev(g2d->drm_de=
v),
> +       g2d->cmdlist_pool_virt =3D dma_alloc_attrs(drm_dev_dma_dev(g2d->d=
rm_dev),
>                                                 G2D_CMDLIST_POOL_SIZE,
>                                                 &g2d->cmdlist_pool, GFP_K=
ERNEL,
>                                                 g2d->cmdlist_dma_attrs);
> @@ -311,7 +312,7 @@ static int g2d_init_cmdlist(struct g2d_data *g2d)
>         return 0;
>
>  err:
> -       dma_free_attrs(to_dma_dev(g2d->drm_dev), G2D_CMDLIST_POOL_SIZE,
> +       dma_free_attrs(drm_dev_dma_dev(g2d->drm_dev), G2D_CMDLIST_POOL_SI=
ZE,

to_dma_dev returns only the dedicated DMA device explicitly stored by
the Exynos driver, whereas drm_dev_dma_dev falls back to the DRM
master device when no dedicated DMA device has been set. So this does
change the existing behavior, but it does not look problematic to me.

Thanks,
Inki Dae
