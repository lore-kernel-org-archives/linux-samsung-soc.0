From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v2 6/9] drm/exynos: introduce BYTE_PITCH capability
Date: Thu, 31 Aug 2017 12:24:37 +0200
Message-ID: <3ee9b3a1-b8ee-2f0b-5ef5-186bfd736806@samsung.com>
References: <20170822141944.8138-1-tjakobi@math.uni-bielefeld.de>
        <CGME20170822142304epcas2p160257b12e8a9f3aed71bd55f5dcd524b@epcas2p1.samsung.com>
        <20170822141944.8138-7-tjakobi@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:51130 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751323AbdHaKYn (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 31 Aug 2017 06:24:43 -0400
In-reply-to: <20170822141944.8138-7-tjakobi@math.uni-bielefeld.de>
Content-language: en-US
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: inki.dae@samsung.com, Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>

Hi Tobias,

On 2017-08-22 16:19, Tobias Jakobi wrote:
> In some of subdrivers we compute something like 'pitch / cpp' at some
> point, silently assuming that the pitch (which is in bytes) is
> divisible by the buffer's cpp. This must not be true, in particular
> it depends on the underlying hardware.
>
> If userspace should request such a setup, we should communicate this.
>
> Introduce a new cap which indicates that the hardware supports a
> pitch with 'byte-granularity'. If the cap is not set, assume that
> we need a pitch aligned to cpp.
>
> We set this cap in a later patch for the drivers/planes which
> support it.
>
> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

I briefly checked the patch and it looks fine, but I really wonder whether
drivers should support such strange formats, when pitches are not multiple
of pixel size in bytes. I cannot find any sane use case for such formats.

Maybe it would make sense to add a check for it in DRM core? I also didn't
notice a check for that in any other drivers, but some of them also
compute 'pitch / cpp' values.

> ---
>   drivers/gpu/drm/exynos/exynos_drm_drv.h   |  1 +
>   drivers/gpu/drm/exynos/exynos_drm_plane.c | 10 ++++++++++
>   2 files changed, 11 insertions(+)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
> index 43afab4bebc3..ec32632485d2 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
> @@ -92,6 +92,7 @@ struct exynos_drm_plane {
>   #define EXYNOS_DRM_PLANE_CAP_SCALE	(1 << 1)
>   #define EXYNOS_DRM_PLANE_CAP_ZPOS	(1 << 2)
>   #define EXYNOS_DRM_PLANE_CAP_TILE	(1 << 3)
> +#define EXYNOS_DRM_PLANE_CAP_BYTE_PITCH	(1 << 4)
>   
>   /*
>    * Exynos DRM plane configuration structure.
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/exynos/exynos_drm_plane.c
> index 133af72f5c90..17e47b8f0d6a 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
> @@ -185,6 +185,16 @@ exynos_drm_plane_check_format(const struct exynos_drm_plane_config *config,
>   {
>   	struct drm_framebuffer *fb = state->base.fb;
>   
> +	/*
> +	 * Some blocks only allow to specify a buffer pitch in terms
> +	 * of pixels. In these cases, we need to ensure that the pitch
> +	 * provided by userspace is divisible by the cpp.
> +	 */
> +	if (!(config->capabilities & EXYNOS_DRM_PLANE_CAP_BYTE_PITCH)) {
> +		if (fb->pitches[0] % fb->format->cpp[0])
> +			return -ENOTSUPP;
> +	}
> +
>   	switch (fb->modifier) {
>   	case DRM_FORMAT_MOD_SAMSUNG_64_32_TILE:
>   		if (!(config->capabilities & EXYNOS_DRM_PLANE_CAP_TILE))

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
