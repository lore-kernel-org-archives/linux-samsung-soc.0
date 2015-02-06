From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH 2/4] drm/exynos: preset zpos value for overlay planes
Date: Fri, 06 Feb 2015 13:34:27 +0900
Message-ID: <54D44453.8090300@samsung.com>
References: <1423159199-16394-1-git-send-email-gustavo@padovan.org>
 <1423159199-16394-2-git-send-email-gustavo@padovan.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:26467 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753852AbbBFEeU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 5 Feb 2015 23:34:20 -0500
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NJC00LT2216ZT10@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 06 Feb 2015 13:34:18 +0900 (KST)
In-reply-to: <1423159199-16394-2-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Gustavo Padovan <gustavo@padovan.org>, linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Hi,

On 02/06/2015 02:59 AM, Gustavo Padovan wrote:
> From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> 
> Usually userspace don't want to have two overlay planes on the same zpos
> so this change assign a different zpos for each plane. Before this change
> a zpos of value zero was created for all planes so the userspace had to
> set up the zpos of every plane it wanted to use.
> 

Plane zpos should be read-only. If not, it can't do 1:1 mapping plane
and hw overlay. Let's make zpos to DRM_MODE_PROP_IMMUTABLE property.

Thanks.

> Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c  |  2 +-
>  drivers/gpu/drm/exynos/exynos_drm_plane.c | 15 ++++++++-------
>  drivers/gpu/drm/exynos/exynos_drm_plane.h |  3 ++-
>  drivers/gpu/drm/exynos/exynos_drm_vidi.c  |  2 +-
>  drivers/gpu/drm/exynos/exynos_mixer.c     |  2 +-
>  5 files changed, 13 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> index 489ce90..b49b038 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> @@ -1006,7 +1006,7 @@ static int fimd_bind(struct device *dev, struct device *master, void *data)
>  		type = (zpos == ctx->default_win) ? DRM_PLANE_TYPE_PRIMARY :
>  						DRM_PLANE_TYPE_OVERLAY;
>  		exynos_plane_init(drm_dev, &ctx->planes[zpos], 1 << ctx->pipe,
> -				  type);
> +				  type, zpos);
>  	}
>  
>  	ret = fimd_ctx_initialize(ctx, drm_dev);
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/exynos/exynos_drm_plane.c
> index 011a9b1..4c33e04 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
> @@ -211,7 +211,7 @@ static struct drm_plane_funcs exynos_plane_funcs = {
>  	.set_property	= exynos_plane_set_property,
>  };
>  
> -static void exynos_plane_attach_zpos_property(struct drm_plane *plane)
> +static void exynos_plane_attach_zpos_property(struct drm_plane *plane, int zpos)
>  {
>  	struct drm_device *dev = plane->dev;
>  	struct exynos_drm_private *dev_priv = dev->dev_private;
> @@ -227,12 +227,13 @@ static void exynos_plane_attach_zpos_property(struct drm_plane *plane)
>  		dev_priv->plane_zpos_property = prop;
>  	}
>  
> -	drm_object_attach_property(&plane->base, prop, 0);
> +	drm_object_attach_property(&plane->base, prop, zpos);
>  }
>  
>  int exynos_plane_init(struct drm_device *dev,
>  		      struct exynos_drm_plane *exynos_plane,
> -		      unsigned long possible_crtcs, enum drm_plane_type type)
> +		      unsigned long possible_crtcs, enum drm_plane_type type,
> +		      int zpos)
>  {
>  	int err;
>  
> @@ -244,10 +245,10 @@ int exynos_plane_init(struct drm_device *dev,
>  		return err;
>  	}
>  
> -	if (type == DRM_PLANE_TYPE_PRIMARY)
> -		exynos_plane->zpos = DEFAULT_ZPOS;
> -	else
> -		exynos_plane_attach_zpos_property(&exynos_plane->base);
> +	exynos_plane->zpos = zpos;
> +
> +	if (type == DRM_PLANE_TYPE_OVERLAY)
> +		exynos_plane_attach_zpos_property(&exynos_plane->base, zpos);
>  
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.h b/drivers/gpu/drm/exynos/exynos_drm_plane.h
> index d8a3494..d8a66b5 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_plane.h
> +++ b/drivers/gpu/drm/exynos/exynos_drm_plane.h
> @@ -22,4 +22,5 @@ int exynos_update_plane(struct drm_plane *plane, struct drm_crtc *crtc,
>  			uint32_t src_w, uint32_t src_h);
>  int exynos_plane_init(struct drm_device *dev,
>  		      struct exynos_drm_plane *exynos_plane,
> -		      unsigned long possible_crtcs, enum drm_plane_type type);
> +		      unsigned long possible_crtcs, enum drm_plane_type type,
> +		      int zpos);
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
> index f33974e..e545a58 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
> @@ -478,7 +478,7 @@ static int vidi_bind(struct device *dev, struct device *master, void *data)
>  		type = (zpos == ctx->default_win) ? DRM_PLANE_TYPE_PRIMARY :
>  						DRM_PLANE_TYPE_OVERLAY;
>  		exynos_plane_init(drm_dev, &ctx->planes[zpos], 1 << ctx->pipe,
> -				  type);
> +				  type, zpos);
>  	}
>  
>  	vidi_ctx_initialize(ctx, drm_dev);
> diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
> index 6e7c0cc..141d461 100644
> --- a/drivers/gpu/drm/exynos/exynos_mixer.c
> +++ b/drivers/gpu/drm/exynos/exynos_mixer.c
> @@ -1177,7 +1177,7 @@ static int mixer_bind(struct device *dev, struct device *manager, void *data)
>  		type = (zpos == MIXER_DEFAULT_WIN) ? DRM_PLANE_TYPE_PRIMARY :
>  						DRM_PLANE_TYPE_OVERLAY;
>  		exynos_plane_init(drm_dev, &ctx->planes[zpos], 1 << ctx->pipe,
> -				  type);
> +				  type, zpos);
>  	}
>  
>  	ret = mixer_initialize(ctx, drm_dev);
> 
