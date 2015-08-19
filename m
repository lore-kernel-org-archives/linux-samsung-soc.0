From: Tobias Jakobi <liquid.acid@gmx.net>
Subject: Re: [PATCH] drm/exynos: Properly report supported formats for
 each device
Date: Wed, 19 Aug 2015 15:49:31 +0200
Message-ID: <55D4896B.5030200@gmx.net>
References: <1439989354-17326-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.17.21]:51455 "EHLO mout.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751042AbbHSNtj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Aug 2015 09:49:39 -0400
In-Reply-To: <1439989354-17326-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Javier Martinez Canillas <javier@dowhile0.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

Hmm,

this looks a lot like my patch from some time ago:
http://www.spinics.net/lists/linux-samsung-soc/msg43677.html

With best wishes,
Tobias


Marek Szyprowski wrote:
> Exynos DRM reported that all planes for all supported sub-devices supports
> only three pixel formats: XRGB24, ARGB24 and NV12. This patch lets each
> Exynos DRM sub-drivers to provide the list of supported pixel formats
> and registers this list to DRM core.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 10 ++++++++-
>  drivers/gpu/drm/exynos/exynos7_drm_decon.c    | 15 +++++++++++++-
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c      | 11 +++++++++-
>  drivers/gpu/drm/exynos/exynos_drm_plane.c     | 11 +++-------
>  drivers/gpu/drm/exynos/exynos_drm_plane.h     |  1 +
>  drivers/gpu/drm/exynos/exynos_drm_vidi.c      |  9 +++++++-
>  drivers/gpu/drm/exynos/exynos_mixer.c         | 30 +++++++++++++++++++++++++--
>  7 files changed, 73 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
> index 8b1225f..fc88471 100644
> --- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
> +++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
> @@ -54,6 +54,13 @@ static const char * const decon_clks_name[] = {
>  	"sclk_decon_eclk",
>  };
>  
> +static const uint32_t decon_formats[] = {
> +	DRM_FORMAT_XRGB1555,
> +	DRM_FORMAT_RGB565,
> +	DRM_FORMAT_XRGB8888,
> +	DRM_FORMAT_ARGB8888,
> +};
> +
>  static int decon_enable_vblank(struct exynos_drm_crtc *crtc)
>  {
>  	struct decon_context *ctx = crtc->ctx;
> @@ -483,7 +490,8 @@ static int decon_bind(struct device *dev, struct device *master, void *data)
>  		type = (zpos == ctx->default_win) ? DRM_PLANE_TYPE_PRIMARY :
>  							DRM_PLANE_TYPE_OVERLAY;
>  		ret = exynos_plane_init(drm_dev, &ctx->planes[zpos],
> -				1 << ctx->pipe, type, zpos);
> +				1 << ctx->pipe, type, decon_formats,
> +				ARRAY_SIZE(decon_formats), zpos);
>  		if (ret)
>  			return ret;
>  	}
> diff --git a/drivers/gpu/drm/exynos/exynos7_drm_decon.c b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
> index 362532a..c562a0c 100644
> --- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
> +++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
> @@ -70,6 +70,18 @@ static const struct of_device_id decon_driver_dt_match[] = {
>  };
>  MODULE_DEVICE_TABLE(of, decon_driver_dt_match);
>  
> +static const uint32_t decon_formats[] = {
> +	DRM_FORMAT_RGB565,
> +	DRM_FORMAT_XRGB8888,
> +	DRM_FORMAT_XBGR8888,
> +	DRM_FORMAT_RGBX8888,
> +	DRM_FORMAT_BGRX8888,
> +	DRM_FORMAT_ARGB8888,
> +	DRM_FORMAT_ABGR8888,
> +	DRM_FORMAT_RGBA8888,
> +	DRM_FORMAT_BGRA8888,
> +};
> +
>  static void decon_wait_for_vblank(struct exynos_drm_crtc *crtc)
>  {
>  	struct decon_context *ctx = crtc->ctx;
> @@ -675,7 +687,8 @@ static int decon_bind(struct device *dev, struct device *master, void *data)
>  		type = (zpos == ctx->default_win) ? DRM_PLANE_TYPE_PRIMARY :
>  						DRM_PLANE_TYPE_OVERLAY;
>  		ret = exynos_plane_init(drm_dev, &ctx->planes[zpos],
> -					1 << ctx->pipe, type, zpos);
> +					1 << ctx->pipe, type, decon_formats,
> +					ARRAY_SIZE(decon_formats), zpos);
>  		if (ret)
>  			return ret;
>  	}
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> index 794e56c..8b9ef75 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> @@ -187,6 +187,14 @@ static const struct of_device_id fimd_driver_dt_match[] = {
>  };
>  MODULE_DEVICE_TABLE(of, fimd_driver_dt_match);
>  
> +static const uint32_t fimd_formats[] = {
> +	DRM_FORMAT_C8,
> +	DRM_FORMAT_XRGB1555,
> +	DRM_FORMAT_RGB565,
> +	DRM_FORMAT_XRGB8888,
> +	DRM_FORMAT_ARGB8888,
> +};
> +
>  static inline struct fimd_driver_data *drm_fimd_get_driver_data(
>  	struct platform_device *pdev)
>  {
> @@ -949,7 +957,8 @@ static int fimd_bind(struct device *dev, struct device *master, void *data)
>  		type = (zpos == ctx->default_win) ? DRM_PLANE_TYPE_PRIMARY :
>  						DRM_PLANE_TYPE_OVERLAY;
>  		ret = exynos_plane_init(drm_dev, &ctx->planes[zpos],
> -					1 << ctx->pipe, type, zpos);
> +					1 << ctx->pipe, type, fimd_formats,
> +					ARRAY_SIZE(fimd_formats), zpos);
>  		if (ret)
>  			return ret;
>  	}
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/exynos/exynos_drm_plane.c
> index a729980..be42f21 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
> @@ -20,12 +20,6 @@
>  #include "exynos_drm_gem.h"
>  #include "exynos_drm_plane.h"
>  
> -static const uint32_t formats[] = {
> -	DRM_FORMAT_XRGB8888,
> -	DRM_FORMAT_ARGB8888,
> -	DRM_FORMAT_NV12,
> -};
> -
>  /*
>   * This function is to get X or Y size shown via screen. This needs length and
>   * start position of CRTC.
> @@ -226,13 +220,14 @@ static void exynos_plane_attach_zpos_property(struct drm_plane *plane,
>  int exynos_plane_init(struct drm_device *dev,
>  		      struct exynos_drm_plane *exynos_plane,
>  		      unsigned long possible_crtcs, enum drm_plane_type type,
> +		      const uint32_t *formats, unsigned int fcount,
>  		      unsigned int zpos)
>  {
>  	int err;
>  
>  	err = drm_universal_plane_init(dev, &exynos_plane->base, possible_crtcs,
> -				       &exynos_plane_funcs, formats,
> -				       ARRAY_SIZE(formats), type);
> +				       &exynos_plane_funcs, formats, fcount,
> +				       type);
>  	if (err) {
>  		DRM_ERROR("failed to initialize plane\n");
>  		return err;
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.h b/drivers/gpu/drm/exynos/exynos_drm_plane.h
> index 8c88ae9..476c934 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_plane.h
> +++ b/drivers/gpu/drm/exynos/exynos_drm_plane.h
> @@ -12,4 +12,5 @@
>  int exynos_plane_init(struct drm_device *dev,
>  		      struct exynos_drm_plane *exynos_plane,
>  		      unsigned long possible_crtcs, enum drm_plane_type type,
> +		      const uint32_t *formats, unsigned int fcount,
>  		      unsigned int zpos);
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
> index 3413393..fe11053 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
> @@ -85,6 +85,12 @@ static const char fake_edid_info[] = {
>  	0x00, 0x00, 0x00, 0x06
>  };
>  
> +static const uint32_t formats[] = {
> +	DRM_FORMAT_XRGB8888,
> +	DRM_FORMAT_ARGB8888,
> +	DRM_FORMAT_NV12,
> +};
> +
>  static int vidi_enable_vblank(struct exynos_drm_crtc *crtc)
>  {
>  	struct vidi_context *ctx = crtc->ctx;
> @@ -433,7 +439,8 @@ static int vidi_bind(struct device *dev, struct device *master, void *data)
>  		type = (zpos == ctx->default_win) ? DRM_PLANE_TYPE_PRIMARY :
>  						DRM_PLANE_TYPE_OVERLAY;
>  		ret = exynos_plane_init(drm_dev, &ctx->planes[zpos],
> -					1 << ctx->pipe, type, zpos);
> +					1 << ctx->pipe, type, formats,
> +					ARRAY_SIZE(formats), zpos);
>  		if (ret)
>  			return ret;
>  	}
> diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
> index 4706b56..bfeb6e6 100644
> --- a/drivers/gpu/drm/exynos/exynos_mixer.c
> +++ b/drivers/gpu/drm/exynos/exynos_mixer.c
> @@ -43,6 +43,7 @@
>  
>  #define MIXER_WIN_NR		3
>  #define MIXER_DEFAULT_WIN	0
> +#define VP_DEFAULT_WIN		2
>  
>  /* The pixelformats that are natively supported by the mixer. */
>  #define MXR_FORMAT_RGB565	4
> @@ -69,6 +70,19 @@ enum mixer_version_id {
>  	MXR_VER_128_0_0_184,
>  };
>  
> +static const uint32_t mixer_formats[] = {
> +	DRM_FORMAT_XRGB4444,
> +	DRM_FORMAT_XRGB1555,
> +	DRM_FORMAT_RGB565,
> +	DRM_FORMAT_XRGB8888,
> +	DRM_FORMAT_ARGB8888,
> +};
> +
> +static const uint32_t vp_formats[] = {
> +	DRM_FORMAT_NV12,
> +	DRM_FORMAT_NV21,
> +};
> +
>  struct mixer_context {
>  	struct platform_device *pdev;
>  	struct device		*dev;
> @@ -1184,7 +1198,6 @@ static int mixer_bind(struct device *dev, struct device *manager, void *data)
>  	struct mixer_context *ctx = dev_get_drvdata(dev);
>  	struct drm_device *drm_dev = data;
>  	struct exynos_drm_plane *exynos_plane;
> -	enum drm_plane_type type;
>  	unsigned int zpos;
>  	int ret;
>  
> @@ -1193,10 +1206,23 @@ static int mixer_bind(struct device *dev, struct device *manager, void *data)
>  		return ret;
>  
>  	for (zpos = 0; zpos < MIXER_WIN_NR; zpos++) {
> +		enum drm_plane_type type;
> +		const uint32_t *formats;
> +		unsigned int fcount;
> +
>  		type = (zpos == MIXER_DEFAULT_WIN) ? DRM_PLANE_TYPE_PRIMARY :
>  						DRM_PLANE_TYPE_OVERLAY;
> +		if (zpos < VP_DEFAULT_WIN) {
> +			formats = mixer_formats;
> +			fcount = ARRAY_SIZE(mixer_formats);
> +		} else {
> +			formats = vp_formats;
> +			fcount = ARRAY_SIZE(vp_formats);
> +		}
> +
>  		ret = exynos_plane_init(drm_dev, &ctx->planes[zpos],
> -					1 << ctx->pipe, type, zpos);
> +					1 << ctx->pipe, type, formats, fcount,
> +					zpos);
>  		if (ret)
>  			return ret;
>  	}
> 
