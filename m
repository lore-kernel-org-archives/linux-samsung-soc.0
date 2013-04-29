From: =?UTF-8?B?6rmA7Iq57Jqw?= <sw0312.kim@samsung.com>
Subject: Re: [PATCH v2] drm/exynos: hdmi: use drm_display_mode to check the
 supported modes
Date: Mon, 29 Apr 2013 13:34:07 +0900
Message-ID: <517DF83F.4020405@samsung.com>
References: <1366985038-2801-1-git-send-email-rahul.sharma@samsung.com>
Reply-To: sw0312.kim@samsung.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:10153 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752549Ab3D2EeD convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 29 Apr 2013 00:34:03 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MM0009XQ2019LF0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 29 Apr 2013 13:34:01 +0900 (KST)
In-reply-to: <1366985038-2801-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <rahul.sharma@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, seanpaul@google.com, joshi@samsung.com, sw0312.kim@samsung.com, =?UTF-8?B?64yA7J246riw?= <inki.dae@samsung.com>

Hello Rahul,

I agree with basic idea of this patch.

However, to avoid confusion, how do you think about fixing all
check_timing as check_mode and its second parameter as mode including
struct exynos_drm_display_ops?

Regards,
- Seung-Woo Kim

On 2013=EB=85=84 04=EC=9B=94 26=EC=9D=BC 23:03, Rahul Sharma wrote:
> Exynos hdmi driver is using drm_display_mode for setting timing value=
s
> for a supported resolution. Conversion to fb_videomode and then compa=
ring
> with the mixer/hdmi/phy limits is not required. Instead, drm_display_=
mode
> fields cane be directly compared.
>=20
> v2:
> 1) Removed convert_to_video_timing().
> 2) Corrected DRM_DEBUG_KMS to print the resolution properly.
>=20
> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_connector.c |   36 +--------------=
----------
>  drivers/gpu/drm/exynos/exynos_drm_hdmi.h      |    6 ++---
>  drivers/gpu/drm/exynos/exynos_hdmi.c          |   15 +++++------
>  drivers/gpu/drm/exynos/exynos_mixer.c         |   13 ++++-----
>  4 files changed, 18 insertions(+), 52 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_connector.c b/drivers/=
gpu/drm/exynos/exynos_drm_connector.c
> index 8bcc13a..7259fff 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_connector.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_connector.c
> @@ -58,37 +58,6 @@ convert_to_display_mode(struct drm_display_mode *m=
ode,
>  		mode->flags |=3D DRM_MODE_FLAG_DBLSCAN;
>  }
> =20
> -/* convert drm_display_mode to exynos_video_timings */
> -static inline void
> -convert_to_video_timing(struct fb_videomode *timing,
> -			struct drm_display_mode *mode)
> -{
> -	DRM_DEBUG_KMS("%s\n", __FILE__);
> -
> -	memset(timing, 0, sizeof(*timing));
> -
> -	timing->pixclock =3D mode->clock * 1000;
> -	timing->refresh =3D drm_mode_vrefresh(mode);
> -
> -	timing->xres =3D mode->hdisplay;
> -	timing->right_margin =3D mode->hsync_start - mode->hdisplay;
> -	timing->hsync_len =3D mode->hsync_end - mode->hsync_start;
> -	timing->left_margin =3D mode->htotal - mode->hsync_end;
> -
> -	timing->yres =3D mode->vdisplay;
> -	timing->lower_margin =3D mode->vsync_start - mode->vdisplay;
> -	timing->vsync_len =3D mode->vsync_end - mode->vsync_start;
> -	timing->upper_margin =3D mode->vtotal - mode->vsync_end;
> -
> -	if (mode->flags & DRM_MODE_FLAG_INTERLACE)
> -		timing->vmode =3D FB_VMODE_INTERLACED;
> -	else
> -		timing->vmode =3D FB_VMODE_NONINTERLACED;
> -
> -	if (mode->flags & DRM_MODE_FLAG_DBLSCAN)
> -		timing->vmode |=3D FB_VMODE_DOUBLE;
> -}
> -
>  static int exynos_drm_connector_get_modes(struct drm_connector *conn=
ector)
>  {
>  	struct exynos_drm_connector *exynos_connector =3D
> @@ -168,15 +137,12 @@ static int exynos_drm_connector_mode_valid(stru=
ct drm_connector *connector,
>  					to_exynos_connector(connector);
>  	struct exynos_drm_manager *manager =3D exynos_connector->manager;
>  	struct exynos_drm_display_ops *display_ops =3D manager->display_ops=
;
> -	struct fb_videomode timing;
>  	int ret =3D MODE_BAD;
> =20
>  	DRM_DEBUG_KMS("%s\n", __FILE__);
> =20
> -	convert_to_video_timing(&timing, mode);
> -
>  	if (display_ops && display_ops->check_timing)
> -		if (!display_ops->check_timing(manager->dev, (void *)&timing))
> +		if (!display_ops->check_timing(manager->dev, (void *)mode))
>  			ret =3D MODE_OK;
> =20
>  	return ret;
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_hdmi.h b/drivers/gpu/d=
rm/exynos/exynos_drm_hdmi.h
> index 6b70944..fd2ff9f 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_hdmi.h
> +++ b/drivers/gpu/drm/exynos/exynos_drm_hdmi.h
> @@ -32,11 +32,11 @@ struct exynos_hdmi_ops {
>  	bool (*is_connected)(void *ctx);
>  	struct edid *(*get_edid)(void *ctx,
>  			struct drm_connector *connector);
> -	int (*check_timing)(void *ctx, struct fb_videomode *timing);
> +	int (*check_timing)(void *ctx, struct drm_display_mode *mode);
>  	int (*power_on)(void *ctx, int mode);
> =20
>  	/* manager */
> -	void (*mode_set)(void *ctx, void *mode);
> +	void (*mode_set)(void *ctx, struct drm_display_mode *mode);
>  	void (*get_max_resol)(void *ctx, unsigned int *width,
>  				unsigned int *height);
>  	void (*commit)(void *ctx);
> @@ -57,7 +57,7 @@ struct exynos_mixer_ops {
>  	void (*win_disable)(void *ctx, int zpos);
> =20
>  	/* display */
> -	int (*check_timing)(void *ctx, struct fb_videomode *timing);
> +	int (*check_timing)(void *ctx, struct drm_display_mode *mode);
>  };
> =20
>  void exynos_hdmi_drv_attach(struct exynos_drm_hdmi_context *ctx);
> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/e=
xynos/exynos_hdmi.c
> index 93b70e9..aeca603 100644
> --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
> +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
> @@ -796,18 +796,17 @@ static int hdmi_find_phy_conf(struct hdmi_conte=
xt *hdata, u32 pixel_clock)
>  	return -EINVAL;
>  }
> =20
> -static int hdmi_check_timing(void *ctx, struct fb_videomode *timing)
> +static int hdmi_check_timing(void *ctx, struct drm_display_mode *mod=
e)
>  {
>  	struct hdmi_context *hdata =3D ctx;
>  	int ret;
> =20
> -	DRM_DEBUG_KMS("[%d] %s\n", __LINE__, __func__);
> -
> -	DRM_DEBUG_KMS("[%d]x[%d] [%d]Hz [%x]\n", timing->xres,
> -			timing->yres, timing->refresh,
> -			timing->vmode);
> +	DRM_DEBUG_KMS("[WxH@HzI/P at Pixel Clk]: %dx%d@%d%s at %d\n",
> +		mode->hdisplay, mode->vdisplay, mode->vrefresh,
> +		(mode->flags & DRM_MODE_FLAG_INTERLACE) ? "I" : "P",
> +		mode->clock * 1000);
> =20
> -	ret =3D hdmi_find_phy_conf(hdata, timing->pixclock);
> +	ret =3D hdmi_find_phy_conf(hdata, mode->clock * 1000);
>  	if (ret < 0)
>  		return ret;
>  	return 0;
> @@ -1643,7 +1642,7 @@ static void hdmi_v14_mode_set(struct hdmi_conte=
xt *hdata,
>  	hdmi_set_reg(tg->tg_3d, 1, 0x0);
>  }
> =20
> -static void hdmi_mode_set(void *ctx, void *mode)
> +static void hdmi_mode_set(void *ctx, struct drm_display_mode *mode)
>  {
>  	struct hdmi_context *hdata =3D ctx;
>  	struct drm_display_mode *m =3D mode;
> diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/=
exynos/exynos_mixer.c
> index f08e251..67c4fd8 100644
> --- a/drivers/gpu/drm/exynos/exynos_mixer.c
> +++ b/drivers/gpu/drm/exynos/exynos_mixer.c
> @@ -818,17 +818,17 @@ static void mixer_win_disable(void *ctx, int wi=
n)
>  	mixer_ctx->win_data[win].enabled =3D false;
>  }
> =20
> -static int mixer_check_timing(void *ctx, struct fb_videomode *timing=
)
> +static int mixer_check_timing(void *ctx, struct drm_display_mode *mo=
de)
>  {
>  	u32 w, h;
> =20
> -	w =3D timing->xres;
> -	h =3D timing->yres;
> +	w =3D mode->hdisplay;
> +	h =3D mode->vdisplay;
> =20
>  	DRM_DEBUG_KMS("%s : xres=3D%d, yres=3D%d, refresh=3D%d, intl=3D%d\n=
",
> -		__func__, timing->xres, timing->yres,
> -		timing->refresh, (timing->vmode &
> -		FB_VMODE_INTERLACED) ? true : false);
> +		__func__, mode->hdisplay, mode->vdisplay,
> +		mode->vrefresh, (mode->flags &
> +		DRM_MODE_FLAG_INTERLACE) ? true : false);
> =20
>  	if ((w >=3D 464 && w <=3D 720 && h >=3D 261 && h <=3D 576) ||
>  		(w >=3D 1024 && w <=3D 1280 && h >=3D 576 && h <=3D 720) ||
> @@ -837,6 +837,7 @@ static int mixer_check_timing(void *ctx, struct f=
b_videomode *timing)
> =20
>  	return -EINVAL;
>  }
> +
>  static void mixer_wait_for_vblank(void *ctx)
>  {
>  	struct mixer_context *mixer_ctx =3D ctx;
>=20

--=20
Seung-Woo Kim
Samsung Software R&D Center
--
