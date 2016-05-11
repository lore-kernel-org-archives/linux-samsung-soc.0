From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 4/4] drm: rcar: use generic code for managing zpos plane property
Date: Wed, 11 May 2016 13:49:25 +0300
Message-ID: <4457905.DGxQthB9uu@avalon>
References: <1462962308-13410-1-git-send-email-benjamin.gaignard@linaro.org> <1462962308-13410-4-git-send-email-benjamin.gaignard@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:49209 "EHLO
	galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752447AbcEKKta (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 May 2016 06:49:30 -0400
In-Reply-To: <1462962308-13410-4-git-send-email-benjamin.gaignard@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, daniel@ffwll.ch, Ville Syrjala <ville.syrjala@linux.intel.com>, Marek Szyprowski <m.szyprowski@samsung.com>

Hi Benjamin,

Thank you for the patch.

On Wednesday 11 May 2016 12:25:08 Benjamin Gaignard wrote:
> This patch replaces zpos property handling custom code in rcar DRM
> driver with calls to generic DRM code.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@linaro.org>
> 
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c  | 2 +-
>  drivers/gpu/drm/rcar-du/rcar_du_drv.h   | 1 -
>  drivers/gpu/drm/rcar-du/rcar_du_kms.c   | 5 -----
>  drivers/gpu/drm/rcar-du/rcar_du_plane.c | 9 ++-------
>  drivers/gpu/drm/rcar-du/rcar_du_plane.h | 2 --
>  5 files changed, 3 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c index 0d8bdda..28d2cb6 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> @@ -196,7 +196,7 @@ void rcar_du_crtc_route_output(struct drm_crtc *crtc,
> 
>  static unsigned int plane_zpos(struct rcar_du_plane *plane)
>  {
> -	return to_rcar_plane_state(plane->plane.state)->zpos;
> +	return plane->plane.state->normalized_zpos;
>  }

More code can be removed from the driver as the core now normalizes the zpos, 
but I can handle that as a follow-up patch.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> 
>  static const struct rcar_du_format_info *
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> b/drivers/gpu/drm/rcar-du/rcar_du_drv.h index ed35467..c843c31 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> @@ -92,7 +92,6 @@ struct rcar_du_device {
>  	struct {
>  		struct drm_property *alpha;
>  		struct drm_property *colorkey;
> -		struct drm_property *zpos;
>  	} props;
> 
>  	unsigned int dpad0_source;
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> b/drivers/gpu/drm/rcar-du/rcar_du_kms.c index e70a4f3..4ace0aa 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> @@ -527,11 +527,6 @@ static int rcar_du_properties_init(struct
> rcar_du_device *rcdu) if (rcdu->props.colorkey == NULL)
>  		return -ENOMEM;
> 
> -	rcdu->props.zpos =
> -		drm_property_create_range(rcdu->ddev, 0, "zpos", 1, 7);
> -	if (rcdu->props.zpos == NULL)
> -		return -ENOMEM;
> -
>  	return 0;
>  }
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> b/drivers/gpu/drm/rcar-du/rcar_du_plane.c index 8460ae1..4764afc 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> @@ -656,7 +656,7 @@ static void rcar_du_plane_reset(struct drm_plane *plane)
> state->source = RCAR_DU_PLANE_MEMORY;
>  	state->alpha = 255;
>  	state->colorkey = RCAR_DU_COLORKEY_NONE;
> -	state->zpos = plane->type == DRM_PLANE_TYPE_PRIMARY ? 0 : 1;
> +	plane->state->zpos = plane->type == DRM_PLANE_TYPE_PRIMARY ? 0 : 1;
> 
>  	plane->state = &state->state;
>  	plane->state->plane = plane;
> @@ -674,8 +674,6 @@ static int rcar_du_plane_atomic_set_property(struct
> drm_plane *plane, rstate->alpha = val;
>  	else if (property == rcdu->props.colorkey)
>  		rstate->colorkey = val;
> -	else if (property == rcdu->props.zpos)
> -		rstate->zpos = val;
>  	else
>  		return -EINVAL;
> 
> @@ -694,8 +692,6 @@ static int rcar_du_plane_atomic_get_property(struct
> drm_plane *plane, *val = rstate->alpha;
>  	else if (property == rcdu->props.colorkey)
>  		*val = rstate->colorkey;
> -	else if (property == rcdu->props.zpos)
> -		*val = rstate->zpos;
>  	else
>  		return -EINVAL;
> 
> @@ -767,8 +763,7 @@ int rcar_du_planes_init(struct rcar_du_group *rgrp)
>  		drm_object_attach_property(&plane->plane.base,
>  					   rcdu->props.colorkey,
>  					   RCAR_DU_COLORKEY_NONE);
> -		drm_object_attach_property(&plane->plane.base,
> -					   rcdu->props.zpos, 1);
> +		drm_plane_create_zpos_property(&plane->plane, 1, 7);
>  	}
> 
>  	return 0;
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.h
> b/drivers/gpu/drm/rcar-du/rcar_du_plane.h index b18b7b2..8b91dd3 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_plane.h
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.h
> @@ -51,7 +51,6 @@ static inline struct rcar_du_plane *to_rcar_plane(struct
> drm_plane *plane) * @hwindex: 0-based hardware plane index, -1 means unused
>   * @alpha: value of the plane alpha property
>   * @colorkey: value of the plane colorkey property
> - * @zpos: value of the plane zpos property
>   */
>  struct rcar_du_plane_state {
>  	struct drm_plane_state state;
> @@ -62,7 +61,6 @@ struct rcar_du_plane_state {
> 
>  	unsigned int alpha;
>  	unsigned int colorkey;
> -	unsigned int zpos;
>  };
> 
>  static inline struct rcar_du_plane_state *

-- 
Regards,

Laurent Pinchart
