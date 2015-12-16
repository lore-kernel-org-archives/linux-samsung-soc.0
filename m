From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v3 2/7] drm/exynos: make zpos property configurable
Date: Wed, 16 Dec 2015 14:28:36 +0100
Message-ID: <20151216132836.GM30437@phenom.ffwll.local>
References: <1450268508-15028-1-git-send-email-m.szyprowski@samsung.com>
 <1450268508-15028-3-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f47.google.com ([74.125.82.47]:36981 "EHLO
	mail-wm0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933803AbbLPN2j (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Dec 2015 08:28:39 -0500
Received: by mail-wm0-f47.google.com with SMTP id p187so1197972wmp.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 16 Dec 2015 05:28:38 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1450268508-15028-3-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

On Wed, Dec 16, 2015 at 01:21:43PM +0100, Marek Szyprowski wrote:
> This patch adds all infrastructure to make zpos plane property
> configurable from userspace.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Imo zpos should be a generic atomic property with well-defined semantics
shared across drivers. So
- storead (in decoded form) in drm_plane_state
- common functions to register/attach zpos prop to a plane, with
  full-blown kerneldoc explaining how it should work
- generic kms igt to validate that interface

One of the big things that always comes up when we talk about zpos is how
equal zpos should be handled, and how exactly they should be sorted. I
think for that we should have a drm function which computes a normalized
zpos. Or the core check code should reject such nonsense.
-Daniel

> ---
>  drivers/gpu/drm/exynos/exynos_drm_drv.h   |  4 ++-
>  drivers/gpu/drm/exynos/exynos_drm_plane.c | 51 ++++++++++++++++++++++++++++---
>  2 files changed, 49 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
> index 588b6763f9c7..f0827dbebb7d 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
> @@ -64,6 +64,7 @@ struct exynos_drm_plane_state {
>  	struct exynos_drm_rect src;
>  	unsigned int h_ratio;
>  	unsigned int v_ratio;
> +	unsigned int zpos;
>  };
>  
>  static inline struct exynos_drm_plane_state *
> @@ -91,11 +92,12 @@ struct exynos_drm_plane {
>  
>  #define EXYNOS_DRM_PLANE_CAP_DOUBLE	(1 << 0)
>  #define EXYNOS_DRM_PLANE_CAP_SCALE	(1 << 1)
> +#define EXYNOS_DRM_PLANE_CAP_ZPOS	(1 << 2)
>  
>  /*
>   * Exynos DRM plane configuration structure.
>   *
> - * @zpos: z-position of the plane.
> + * @zpos: initial z-position of the plane.
>   * @type: type of the plane (primary, cursor or overlay).
>   * @pixel_formats: supported pixel formats.
>   * @num_pixel_formats: number of elements in 'pixel_formats'.
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/exynos/exynos_drm_plane.c
> index fd6cb4cee01a..a2bdab836b50 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
> @@ -124,6 +124,7 @@ static void exynos_plane_mode_set(struct exynos_drm_plane_state *exynos_state)
>  
>  static void exynos_drm_plane_reset(struct drm_plane *plane)
>  {
> +	struct exynos_drm_plane *exynos_plane = to_exynos_plane(plane);
>  	struct exynos_drm_plane_state *exynos_state;
>  
>  	if (plane->state) {
> @@ -136,6 +137,7 @@ static void exynos_drm_plane_reset(struct drm_plane *plane)
>  
>  	exynos_state = kzalloc(sizeof(*exynos_state), GFP_KERNEL);
>  	if (exynos_state) {
> +		exynos_state->zpos = exynos_plane->config->zpos;
>  		plane->state = &exynos_state->base;
>  		plane->state->plane = plane;
>  	}
> @@ -153,6 +155,7 @@ exynos_drm_plane_duplicate_state(struct drm_plane *plane)
>  		return NULL;
>  
>  	__drm_atomic_helper_plane_duplicate_state(plane, &copy->base);
> +	copy->zpos = exynos_state->zpos;
>  	return &copy->base;
>  }
>  
> @@ -165,13 +168,53 @@ static void exynos_drm_plane_destroy_state(struct drm_plane *plane,
>  	kfree(old_exynos_state);
>  }
>  
> +static int exynos_drm_plane_atomic_set_property(struct drm_plane *plane,
> +						struct drm_plane_state *state,
> +						struct drm_property *property,
> +						uint64_t val)
> +{
> +	struct exynos_drm_plane *exynos_plane = to_exynos_plane(plane);
> +	struct exynos_drm_plane_state *exynos_state =
> +					to_exynos_plane_state(state);
> +	struct exynos_drm_private *dev_priv = plane->dev->dev_private;
> +	const struct exynos_drm_plane_config *config = exynos_plane->config;
> +
> +	if (property == dev_priv->plane_zpos_property &&
> +	    (config->capabilities & EXYNOS_DRM_PLANE_CAP_ZPOS))
> +		exynos_state->zpos = val;
> +	else
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static int exynos_drm_plane_atomic_get_property(struct drm_plane *plane,
> +					  const struct drm_plane_state *state,
> +					  struct drm_property *property,
> +					  uint64_t *val)
> +{
> +	const struct exynos_drm_plane_state *exynos_state =
> +		container_of(state, const struct exynos_drm_plane_state, base);
> +	struct exynos_drm_private *dev_priv = plane->dev->dev_private;
> +
> +	if (property == dev_priv->plane_zpos_property)
> +		*val = exynos_state->zpos;
> +	else
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
>  static struct drm_plane_funcs exynos_plane_funcs = {
>  	.update_plane	= drm_atomic_helper_update_plane,
>  	.disable_plane	= drm_atomic_helper_disable_plane,
>  	.destroy	= drm_plane_cleanup,
> +	.set_property	= drm_atomic_helper_plane_set_property,
>  	.reset		= exynos_drm_plane_reset,
>  	.atomic_duplicate_state = exynos_drm_plane_duplicate_state,
>  	.atomic_destroy_state = exynos_drm_plane_destroy_state,
> +	.atomic_set_property = exynos_drm_plane_atomic_set_property,
> +	.atomic_get_property = exynos_drm_plane_atomic_get_property,
>  };
>  
>  static int
> @@ -267,8 +310,8 @@ static void exynos_plane_attach_zpos_property(struct drm_plane *plane,
>  
>  	prop = dev_priv->plane_zpos_property;
>  	if (!prop) {
> -		prop = drm_property_create_range(dev, DRM_MODE_PROP_IMMUTABLE,
> -						 "zpos", 0, MAX_PLANE - 1);
> +		prop = drm_property_create_range(dev, 0, "zpos",
> +						 0, MAX_PLANE - 1);
>  		if (!prop)
>  			return;
>  
> @@ -302,9 +345,7 @@ int exynos_plane_init(struct drm_device *dev,
>  	exynos_plane->index = index;
>  	exynos_plane->config = config;
>  
> -	if (config->type == DRM_PLANE_TYPE_OVERLAY)
> -		exynos_plane_attach_zpos_property(&exynos_plane->base,
> -						  config->zpos);
> +	exynos_plane_attach_zpos_property(&exynos_plane->base, config->zpos);
>  
>  	return 0;
>  }
> -- 
> 1.9.2
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
