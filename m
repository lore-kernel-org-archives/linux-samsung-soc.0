From: =?EUC-KR?B?sei9wr/s?= <sw0312.kim@samsung.com>
Subject: Re: [PATCH v4] drm/exynos: hdmi: use drm_display_mode to check the
 supported modes
Date: Mon, 29 Apr 2013 20:11:07 +0900
Message-ID: <517E554B.7030301@samsung.com>
References: <1367234048-14677-1-git-send-email-rahul.sharma@samsung.com>
Reply-To: sw0312.kim@samsung.com
Mime-Version: 1.0
Content-Type: text/plain; charset=EUC-KR
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:19401 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751639Ab3D2LLD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 29 Apr 2013 07:11:03 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MM0001K1KE86F11@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 29 Apr 2013 20:11:01 +0900 (KST)
In-reply-to: <1367234048-14677-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <rahul.sharma@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, inki.dae@samsung.com, seanpaul@google.com, r.sh.open@gmail.com, joshi@samsung.com, sw0312.kim@samsung.com

Hello Rahul,

I looks good to me.

On 2013=B3=E2 04=BF=F9 29=C0=CF 20:14, Rahul Sharma wrote:
> Exynos hdmi driver is using drm_display_mode for setting timing value=
s
> for a supported resolution. Conversion to fb_videomode and then compa=
ring
> with the mixer/hdmi/phy limits is not required. Instead, drm_display_=
mode
> fields cane be directly compared.
>=20
> v4:
> 1) Removed __func__ from DRM_DEBUG_KMS.
>=20
> v3:
> 1) Replaced check_timing callbacks with check_mode.
> 2) Change the type of second parameter of check_mode callback from vo=
id
> pointer paramenter to struct drm_display_mode pointer.
>=20
> v2:
> 1) Removed convert_to_video_timing().
> 2) Corrected DRM_DEBUG_KMS to print the resolution properly.
>=20
> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>

Acked-by: Seung-Woo Kim <sw0312.kim@samsung.com>

> ---
>  drivers/gpu/drm/exynos/exynos_drm_connector.c |   38 ++-------------=
----------
>  drivers/gpu/drm/exynos/exynos_drm_drv.h       |    4 +--
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c      |    4 +--
>  drivers/gpu/drm/exynos/exynos_drm_hdmi.c      |   17 +++++------
>  drivers/gpu/drm/exynos/exynos_drm_hdmi.h      |    6 ++--
>  drivers/gpu/drm/exynos/exynos_drm_vidi.c      |    4 +--
>  drivers/gpu/drm/exynos/exynos_hdmi.c          |   29 +++++++++------=
----
>  drivers/gpu/drm/exynos/exynos_mixer.c         |   17 +++++------
>  8 files changed, 43 insertions(+), 76 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_connector.c b/drivers/=
gpu/drm/exynos/exynos_drm_connector.c
> index 8bcc13a..ab3c6d4 100644
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
> -	if (display_ops && display_ops->check_timing)
> -		if (!display_ops->check_timing(manager->dev, (void *)&timing))
> +	if (display_ops && display_ops->check_mode)
> +		if (!display_ops->check_mode(manager->dev, mode))
>  			ret =3D MODE_OK;
> =20
>  	return ret;
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/dr=
m/exynos/exynos_drm_drv.h
> index 4606fac..9650b3b 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
> @@ -142,7 +142,7 @@ struct exynos_drm_overlay {
>   * @is_connected: check for that display is connected or not.
>   * @get_edid: get edid modes from display driver.
>   * @get_panel: get panel object from display driver.
> - * @check_timing: check if timing is valid or not.
> + * @check_mode: check if mode is valid or not.
>   * @power_on: display device on or off.
>   */
>  struct exynos_drm_display_ops {
> @@ -151,7 +151,7 @@ struct exynos_drm_display_ops {
>  	struct edid *(*get_edid)(struct device *dev,
>  			struct drm_connector *connector);
>  	void *(*get_panel)(struct device *dev);
> -	int (*check_timing)(struct device *dev, void *timing);
> +	int (*check_mode)(struct device *dev, struct drm_display_mode *mode=
);
>  	int (*power_on)(struct device *dev, int mode);
>  };
> =20
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/d=
rm/exynos/exynos_drm_fimd.c
> index 15e58f5..98bbe1e 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> @@ -153,7 +153,7 @@ static void *fimd_get_panel(struct device *dev)
>  	return ctx->panel;
>  }
> =20
> -static int fimd_check_timing(struct device *dev, void *timing)
> +static int fimd_check_mode(struct device *dev, struct drm_display_mo=
de *mode)
>  {
>  	DRM_DEBUG_KMS("%s\n", __FILE__);
> =20
> @@ -175,7 +175,7 @@ static struct exynos_drm_display_ops fimd_display=
_ops =3D {
>  	.type =3D EXYNOS_DISPLAY_TYPE_LCD,
>  	.is_connected =3D fimd_display_is_connected,
>  	.get_panel =3D fimd_get_panel,
> -	.check_timing =3D fimd_check_timing,
> +	.check_mode =3D fimd_check_mode,
>  	.power_on =3D fimd_display_power_on,
>  };
> =20
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_hdmi.c b/drivers/gpu/d=
rm/exynos/exynos_drm_hdmi.c
> index 5285509..8a07e8b 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_hdmi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_hdmi.c
> @@ -121,7 +121,8 @@ static struct edid *drm_hdmi_get_edid(struct devi=
ce *dev,
>  	return NULL;
>  }
> =20
> -static int drm_hdmi_check_timing(struct device *dev, void *timing)
> +static int drm_hdmi_check_mode(struct device *dev,
> +		struct drm_display_mode *mode)
>  {
>  	struct drm_hdmi_context *ctx =3D to_context(dev);
>  	int ret =3D 0;
> @@ -133,14 +134,14 @@ static int drm_hdmi_check_timing(struct device =
*dev, void *timing)
>  	* If any of the two fails, return mode as BAD.
>  	*/
> =20
> -	if (mixer_ops && mixer_ops->check_timing)
> -		ret =3D mixer_ops->check_timing(ctx->mixer_ctx->ctx, timing);
> +	if (mixer_ops && mixer_ops->check_mode)
> +		ret =3D mixer_ops->check_mode(ctx->mixer_ctx->ctx, mode);
> =20
>  	if (ret)
>  		return ret;
> =20
> -	if (hdmi_ops && hdmi_ops->check_timing)
> -		return hdmi_ops->check_timing(ctx->hdmi_ctx->ctx, timing);
> +	if (hdmi_ops && hdmi_ops->check_mode)
> +		return hdmi_ops->check_mode(ctx->hdmi_ctx->ctx, mode);
> =20
>  	return 0;
>  }
> @@ -161,7 +162,7 @@ static struct exynos_drm_display_ops drm_hdmi_dis=
play_ops =3D {
>  	.type =3D EXYNOS_DISPLAY_TYPE_HDMI,
>  	.is_connected =3D drm_hdmi_is_connected,
>  	.get_edid =3D drm_hdmi_get_edid,
> -	.check_timing =3D drm_hdmi_check_timing,
> +	.check_mode =3D drm_hdmi_check_mode,
>  	.power_on =3D drm_hdmi_power_on,
>  };
> =20
> @@ -212,7 +213,7 @@ static void drm_hdmi_mode_fixup(struct device *su=
bdrv_dev,
> =20
>  	drm_mode_set_crtcinfo(adjusted_mode, 0);
> =20
> -	mode_ok =3D drm_hdmi_check_timing(subdrv_dev, adjusted_mode);
> +	mode_ok =3D drm_hdmi_check_mode(subdrv_dev, adjusted_mode);
> =20
>  	/* just return if user desired mode exists. */
>  	if (mode_ok =3D=3D 0)
> @@ -223,7 +224,7 @@ static void drm_hdmi_mode_fixup(struct device *su=
bdrv_dev,
>  	 * to adjusted_mode.
>  	 */
>  	list_for_each_entry(m, &connector->modes, head) {
> -		mode_ok =3D drm_hdmi_check_timing(subdrv_dev, m);
> +		mode_ok =3D drm_hdmi_check_mode(subdrv_dev, m);
> =20
>  		if (mode_ok =3D=3D 0) {
>  			struct drm_mode_object base;
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_hdmi.h b/drivers/gpu/d=
rm/exynos/exynos_drm_hdmi.h
> index 6b70944..724cab1 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_hdmi.h
> +++ b/drivers/gpu/drm/exynos/exynos_drm_hdmi.h
> @@ -32,11 +32,11 @@ struct exynos_hdmi_ops {
>  	bool (*is_connected)(void *ctx);
>  	struct edid *(*get_edid)(void *ctx,
>  			struct drm_connector *connector);
> -	int (*check_timing)(void *ctx, struct fb_videomode *timing);
> +	int (*check_mode)(void *ctx, struct drm_display_mode *mode);
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
> +	int (*check_mode)(void *ctx, struct drm_display_mode *mode);
>  };
> =20
>  void exynos_hdmi_drv_attach(struct exynos_drm_hdmi_context *ctx);
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/d=
rm/exynos/exynos_drm_vidi.c
> index 9504b0c..6043700 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
> @@ -135,7 +135,7 @@ static void *vidi_get_panel(struct device *dev)
>  	return NULL;
>  }
> =20
> -static int vidi_check_timing(struct device *dev, void *timing)
> +static int vidi_check_mode(struct device *dev, struct drm_display_mo=
de *mode)
>  {
>  	DRM_DEBUG_KMS("%s\n", __FILE__);
> =20
> @@ -158,7 +158,7 @@ static struct exynos_drm_display_ops vidi_display=
_ops =3D {
>  	.is_connected =3D vidi_display_is_connected,
>  	.get_edid =3D vidi_get_edid,
>  	.get_panel =3D vidi_get_panel,
> -	.check_timing =3D vidi_check_timing,
> +	.check_mode =3D vidi_check_mode,
>  	.power_on =3D vidi_display_power_on,
>  };
> =20
> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/e=
xynos/exynos_hdmi.c
> index 93b70e9..4b99dcd 100644
> --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
> +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
> @@ -796,18 +796,17 @@ static int hdmi_find_phy_conf(struct hdmi_conte=
xt *hdata, u32 pixel_clock)
>  	return -EINVAL;
>  }
> =20
> -static int hdmi_check_timing(void *ctx, struct fb_videomode *timing)
> +static int hdmi_check_mode(void *ctx, struct drm_display_mode *mode)
>  {
>  	struct hdmi_context *hdata =3D ctx;
>  	int ret;
> =20
> -	DRM_DEBUG_KMS("[%d] %s\n", __LINE__, __func__);
> -
> -	DRM_DEBUG_KMS("[%d]x[%d] [%d]Hz [%x]\n", timing->xres,
> -			timing->yres, timing->refresh,
> -			timing->vmode);
> +	DRM_DEBUG_KMS("xres=3D%d, yres=3D%d, refresh=3D%d, intl=3D%d clock=3D=
%d\n",
> +		mode->hdisplay, mode->vdisplay, mode->vrefresh,
> +		(mode->flags & DRM_MODE_FLAG_INTERLACE) ? true :
> +		false, mode->clock * 1000);
> =20
> -	ret =3D hdmi_find_phy_conf(hdata, timing->pixclock);
> +	ret =3D hdmi_find_phy_conf(hdata, mode->clock * 1000);
>  	if (ret < 0)
>  		return ret;
>  	return 0;
> @@ -1042,7 +1041,7 @@ static void hdmi_conf_init(struct hdmi_context =
*hdata)
>  	}
>  }
> =20
> -static void hdmi_v13_timing_apply(struct hdmi_context *hdata)
> +static void hdmi_v13_mode_apply(struct hdmi_context *hdata)
>  {
>  	const struct hdmi_tg_regs *tg =3D &hdata->mode_conf.conf.v13_conf.t=
g;
>  	const struct hdmi_v13_core_regs *core =3D
> @@ -1131,7 +1130,7 @@ static void hdmi_v13_timing_apply(struct hdmi_c=
ontext *hdata)
>  		hdmi_reg_writemask(hdata, HDMI_TG_CMD, ~0, HDMI_TG_EN);
>  }
> =20
> -static void hdmi_v14_timing_apply(struct hdmi_context *hdata)
> +static void hdmi_v14_mode_apply(struct hdmi_context *hdata)
>  {
>  	const struct hdmi_tg_regs *tg =3D &hdata->mode_conf.conf.v14_conf.t=
g;
>  	const struct hdmi_v14_core_regs *core =3D
> @@ -1298,12 +1297,12 @@ static void hdmi_v14_timing_apply(struct hdmi=
_context *hdata)
>  		hdmi_reg_writemask(hdata, HDMI_TG_CMD, ~0, HDMI_TG_EN);
>  }
> =20
> -static void hdmi_timing_apply(struct hdmi_context *hdata)
> +static void hdmi_mode_apply(struct hdmi_context *hdata)
>  {
>  	if (hdata->type =3D=3D HDMI_TYPE13)
> -		hdmi_v13_timing_apply(hdata);
> +		hdmi_v13_mode_apply(hdata);
>  	else
> -		hdmi_v14_timing_apply(hdata);
> +		hdmi_v14_mode_apply(hdata);
>  }
> =20
>  static void hdmiphy_conf_reset(struct hdmi_context *hdata)
> @@ -1424,7 +1423,7 @@ static void hdmi_conf_apply(struct hdmi_context=
 *hdata)
>  	hdmi_audio_init(hdata);
> =20
>  	/* setting core registers */
> -	hdmi_timing_apply(hdata);
> +	hdmi_mode_apply(hdata);
>  	hdmi_audio_control(hdata, true);
> =20
>  	hdmi_regs_dump(hdata, "start");
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
> @@ -1767,7 +1766,7 @@ static struct exynos_hdmi_ops hdmi_ops =3D {
>  	/* display */
>  	.is_connected	=3D hdmi_is_connected,
>  	.get_edid	=3D hdmi_get_edid,
> -	.check_timing	=3D hdmi_check_timing,
> +	.check_mode	=3D hdmi_check_mode,
> =20
>  	/* manager */
>  	.mode_set	=3D hdmi_mode_set,
> diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/=
exynos/exynos_mixer.c
> index f08e251..ffcc690 100644
> --- a/drivers/gpu/drm/exynos/exynos_mixer.c
> +++ b/drivers/gpu/drm/exynos/exynos_mixer.c
> @@ -818,17 +818,17 @@ static void mixer_win_disable(void *ctx, int wi=
n)
>  	mixer_ctx->win_data[win].enabled =3D false;
>  }
> =20
> -static int mixer_check_timing(void *ctx, struct fb_videomode *timing=
)
> +static int mixer_check_mode(void *ctx, struct drm_display_mode *mode=
)
>  {
>  	u32 w, h;
> =20
> -	w =3D timing->xres;
> -	h =3D timing->yres;
> +	w =3D mode->hdisplay;
> +	h =3D mode->vdisplay;
> =20
> -	DRM_DEBUG_KMS("%s : xres=3D%d, yres=3D%d, refresh=3D%d, intl=3D%d\n=
",
> -		__func__, timing->xres, timing->yres,
> -		timing->refresh, (timing->vmode &
> -		FB_VMODE_INTERLACED) ? true : false);
> +	DRM_DEBUG_KMS("xres=3D%d, yres=3D%d, refresh=3D%d, intl=3D%d\n",
> +		mode->hdisplay, mode->vdisplay, mode->vrefresh,
> +		(mode->flags & DRM_MODE_FLAG_INTERLACE) ? true :
> +		false);
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
> @@ -976,7 +977,7 @@ static struct exynos_mixer_ops mixer_ops =3D {
>  	.win_disable		=3D mixer_win_disable,
> =20
>  	/* display */
> -	.check_timing		=3D mixer_check_timing,
> +	.check_mode		=3D mixer_check_mode,
>  };
> =20
>  static irqreturn_t mixer_irq_handler(int irq, void *arg)
>=20

--=20
Seung-Woo Kim
Samsung Software R&D Center
--
