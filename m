From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v4] drm/exynos: hdmi: use drm_display_mode to check the
	supported modes
Date: Wed, 12 Jun 2013 11:04:59 +0900
Message-ID: <CAAQKjZMto3Hgi3NwTNLEm77TZHqWnZGCiyjHr1bH75V9dpP6dg@mail.gmail.com>
References: <1370856000-6902-1-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0556551116=="
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <1370856000-6902-1-git-send-email-rahul.sharma@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Rahul Sharma <rahul.sharma@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Sean Paul <seanpaul@google.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, sunil joshi <joshi@samsung.com>, DRI mailing list <dri-devel@lists.freedesktop.org>
List-Id: linux-samsung-soc@vger.kernel.org

--===============0556551116==
Content-Type: multipart/alternative; boundary=001a11c3715cebefda04deeb7067

--001a11c3715cebefda04deeb7067
Content-Type: text/plain; charset=ISO-8859-1

Applied.

Thanks,
Inki Dae


2013/6/10 Rahul Sharma <rahul.sharma@samsung.com>

> This patch renames check_timing to check_mode and removes the
> unnecessary conversion of drm_display_mode to/from fb_videomode in
> the hdmi driver.
>
> v4:
> 1) Changed the commit message to add information related to renaming
> the callbacks to check_mode.
> 2) Changed debug message to print 1/0 for interlace mode.
>
> v3:
> 1) Replaced check_timing callbacks with check_mode.
> 2) Change the type of second parameter of check_mode callback from void
> pointer paramenter to struct drm_display_mode pointer.
>
> v2:
> 1) Removed convert_to_video_timing().
> 2) Corrected DRM_DEBUG_KMS to print the resolution properly.
>
> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_connector.c |   38
> ++-----------------------
>  drivers/gpu/drm/exynos/exynos_drm_drv.h       |    4 +--
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c      |    4 +--
>  drivers/gpu/drm/exynos/exynos_drm_hdmi.c      |   17 +++++------
>  drivers/gpu/drm/exynos/exynos_drm_hdmi.h      |    6 ++--
>  drivers/gpu/drm/exynos/exynos_drm_vidi.c      |    4 +--
>  drivers/gpu/drm/exynos/exynos_hdmi.c          |   29 +++++++++----------
>  drivers/gpu/drm/exynos/exynos_mixer.c         |   15 +++++-----
>  8 files changed, 41 insertions(+), 76 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_connector.c
> b/drivers/gpu/drm/exynos/exynos_drm_connector.c
> index 8bcc13a..ab3c6d4 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_connector.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_connector.c
> @@ -58,37 +58,6 @@ convert_to_display_mode(struct drm_display_mode *mode,
>                 mode->flags |= DRM_MODE_FLAG_DBLSCAN;
>  }
>
> -/* convert drm_display_mode to exynos_video_timings */
> -static inline void
> -convert_to_video_timing(struct fb_videomode *timing,
> -                       struct drm_display_mode *mode)
> -{
> -       DRM_DEBUG_KMS("%s\n", __FILE__);
> -
> -       memset(timing, 0, sizeof(*timing));
> -
> -       timing->pixclock = mode->clock * 1000;
> -       timing->refresh = drm_mode_vrefresh(mode);
> -
> -       timing->xres = mode->hdisplay;
> -       timing->right_margin = mode->hsync_start - mode->hdisplay;
> -       timing->hsync_len = mode->hsync_end - mode->hsync_start;
> -       timing->left_margin = mode->htotal - mode->hsync_end;
> -
> -       timing->yres = mode->vdisplay;
> -       timing->lower_margin = mode->vsync_start - mode->vdisplay;
> -       timing->vsync_len = mode->vsync_end - mode->vsync_start;
> -       timing->upper_margin = mode->vtotal - mode->vsync_end;
> -
> -       if (mode->flags & DRM_MODE_FLAG_INTERLACE)
> -               timing->vmode = FB_VMODE_INTERLACED;
> -       else
> -               timing->vmode = FB_VMODE_NONINTERLACED;
> -
> -       if (mode->flags & DRM_MODE_FLAG_DBLSCAN)
> -               timing->vmode |= FB_VMODE_DOUBLE;
> -}
> -
>  static int exynos_drm_connector_get_modes(struct drm_connector *connector)
>  {
>         struct exynos_drm_connector *exynos_connector =
> @@ -168,15 +137,12 @@ static int exynos_drm_connector_mode_valid(struct
> drm_connector *connector,
>                                         to_exynos_connector(connector);
>         struct exynos_drm_manager *manager = exynos_connector->manager;
>         struct exynos_drm_display_ops *display_ops = manager->display_ops;
> -       struct fb_videomode timing;
>         int ret = MODE_BAD;
>
>         DRM_DEBUG_KMS("%s\n", __FILE__);
>
> -       convert_to_video_timing(&timing, mode);
> -
> -       if (display_ops && display_ops->check_timing)
> -               if (!display_ops->check_timing(manager->dev, (void
> *)&timing))
> +       if (display_ops && display_ops->check_mode)
> +               if (!display_ops->check_mode(manager->dev, mode))
>                         ret = MODE_OK;
>
>         return ret;
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h
> b/drivers/gpu/drm/exynos/exynos_drm_drv.h
> index 680a7c1..eaa1966 100644
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
>         struct edid *(*get_edid)(struct device *dev,
>                         struct drm_connector *connector);
>         void *(*get_panel)(struct device *dev);
> -       int (*check_timing)(struct device *dev, void *timing);
> +       int (*check_mode)(struct device *dev, struct drm_display_mode
> *mode);
>         int (*power_on)(struct device *dev, int mode);
>  };
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> index 279c3f8..d33e17d 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> @@ -153,7 +153,7 @@ static void *fimd_get_panel(struct device *dev)
>         return ctx->panel;
>  }
>
> -static int fimd_check_timing(struct device *dev, void *timing)
> +static int fimd_check_mode(struct device *dev, struct drm_display_mode
> *mode)
>  {
>         DRM_DEBUG_KMS("%s\n", __FILE__);
>
> @@ -175,7 +175,7 @@ static struct exynos_drm_display_ops fimd_display_ops
> = {
>         .type = EXYNOS_DISPLAY_TYPE_LCD,
>         .is_connected = fimd_display_is_connected,
>         .get_panel = fimd_get_panel,
> -       .check_timing = fimd_check_timing,
> +       .check_mode = fimd_check_mode,
>         .power_on = fimd_display_power_on,
>  };
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_hdmi.c
> b/drivers/gpu/drm/exynos/exynos_drm_hdmi.c
> index b9b2726..59acdc0 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_hdmi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_hdmi.c
> @@ -127,7 +127,8 @@ static struct edid *drm_hdmi_get_edid(struct device
> *dev,
>         return NULL;
>  }
>
> -static int drm_hdmi_check_timing(struct device *dev, void *timing)
> +static int drm_hdmi_check_mode(struct device *dev,
> +               struct drm_display_mode *mode)
>  {
>         struct drm_hdmi_context *ctx = to_context(dev);
>         int ret = 0;
> @@ -139,14 +140,14 @@ static int drm_hdmi_check_timing(struct device *dev,
> void *timing)
>         * If any of the two fails, return mode as BAD.
>         */
>
> -       if (mixer_ops && mixer_ops->check_timing)
> -               ret = mixer_ops->check_timing(ctx->mixer_ctx->ctx, timing);
> +       if (mixer_ops && mixer_ops->check_mode)
> +               ret = mixer_ops->check_mode(ctx->mixer_ctx->ctx, mode);
>
>         if (ret)
>                 return ret;
>
> -       if (hdmi_ops && hdmi_ops->check_timing)
> -               return hdmi_ops->check_timing(ctx->hdmi_ctx->ctx, timing);
> +       if (hdmi_ops && hdmi_ops->check_mode)
> +               return hdmi_ops->check_mode(ctx->hdmi_ctx->ctx, mode);
>
>         return 0;
>  }
> @@ -167,7 +168,7 @@ static struct exynos_drm_display_ops
> drm_hdmi_display_ops = {
>         .type = EXYNOS_DISPLAY_TYPE_HDMI,
>         .is_connected = drm_hdmi_is_connected,
>         .get_edid = drm_hdmi_get_edid,
> -       .check_timing = drm_hdmi_check_timing,
> +       .check_mode = drm_hdmi_check_mode,
>         .power_on = drm_hdmi_power_on,
>  };
>
> @@ -218,7 +219,7 @@ static void drm_hdmi_mode_fixup(struct device
> *subdrv_dev,
>
>         drm_mode_set_crtcinfo(adjusted_mode, 0);
>
> -       mode_ok = drm_hdmi_check_timing(subdrv_dev, adjusted_mode);
> +       mode_ok = drm_hdmi_check_mode(subdrv_dev, adjusted_mode);
>
>         /* just return if user desired mode exists. */
>         if (mode_ok == 0)
> @@ -229,7 +230,7 @@ static void drm_hdmi_mode_fixup(struct device
> *subdrv_dev,
>          * to adjusted_mode.
>          */
>         list_for_each_entry(m, &connector->modes, head) {
> -               mode_ok = drm_hdmi_check_timing(subdrv_dev, m);
> +               mode_ok = drm_hdmi_check_mode(subdrv_dev, m);
>
>                 if (mode_ok == 0) {
>                         struct drm_mode_object base;
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_hdmi.h
> b/drivers/gpu/drm/exynos/exynos_drm_hdmi.h
> index 6b70944..724cab1 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_hdmi.h
> +++ b/drivers/gpu/drm/exynos/exynos_drm_hdmi.h
> @@ -32,11 +32,11 @@ struct exynos_hdmi_ops {
>         bool (*is_connected)(void *ctx);
>         struct edid *(*get_edid)(void *ctx,
>                         struct drm_connector *connector);
> -       int (*check_timing)(void *ctx, struct fb_videomode *timing);
> +       int (*check_mode)(void *ctx, struct drm_display_mode *mode);
>         int (*power_on)(void *ctx, int mode);
>
>         /* manager */
> -       void (*mode_set)(void *ctx, void *mode);
> +       void (*mode_set)(void *ctx, struct drm_display_mode *mode);
>         void (*get_max_resol)(void *ctx, unsigned int *width,
>                                 unsigned int *height);
>         void (*commit)(void *ctx);
> @@ -57,7 +57,7 @@ struct exynos_mixer_ops {
>         void (*win_disable)(void *ctx, int zpos);
>
>         /* display */
> -       int (*check_timing)(void *ctx, struct fb_videomode *timing);
> +       int (*check_mode)(void *ctx, struct drm_display_mode *mode);
>  };
>
>  void exynos_hdmi_drv_attach(struct exynos_drm_hdmi_context *ctx);
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
> b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
> index 11a016d..294ba35 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
> @@ -135,7 +135,7 @@ static void *vidi_get_panel(struct device *dev)
>         return NULL;
>  }
>
> -static int vidi_check_timing(struct device *dev, void *timing)
> +static int vidi_check_mode(struct device *dev, struct drm_display_mode
> *mode)
>  {
>         DRM_DEBUG_KMS("%s\n", __FILE__);
>
> @@ -158,7 +158,7 @@ static struct exynos_drm_display_ops vidi_display_ops
> = {
>         .is_connected = vidi_display_is_connected,
>         .get_edid = vidi_get_edid,
>         .get_panel = vidi_get_panel,
> -       .check_timing = vidi_check_timing,
> +       .check_mode = vidi_check_mode,
>         .power_on = vidi_display_power_on,
>  };
>
> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c
> b/drivers/gpu/drm/exynos/exynos_hdmi.c
> index 4dfe829..04255fe 100644
> --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
> +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
> @@ -796,18 +796,17 @@ static int hdmi_find_phy_conf(struct hdmi_context
> *hdata, u32 pixel_clock)
>         return -EINVAL;
>  }
>
> -static int hdmi_check_timing(void *ctx, struct fb_videomode *timing)
> +static int hdmi_check_mode(void *ctx, struct drm_display_mode *mode)
>  {
>         struct hdmi_context *hdata = ctx;
>         int ret;
>
> -       DRM_DEBUG_KMS("[%d] %s\n", __LINE__, __func__);
> -
> -       DRM_DEBUG_KMS("[%d]x[%d] [%d]Hz [%x]\n", timing->xres,
> -                       timing->yres, timing->refresh,
> -                       timing->vmode);
> +       DRM_DEBUG_KMS("xres=%d, yres=%d, refresh=%d, intl=%d clock=%d\n",
> +               mode->hdisplay, mode->vdisplay, mode->vrefresh,
> +               (mode->flags & DRM_MODE_FLAG_INTERLACE) ? true :
> +               false, mode->clock * 1000);
>
> -       ret = hdmi_find_phy_conf(hdata, timing->pixclock);
> +       ret = hdmi_find_phy_conf(hdata, mode->clock * 1000);
>         if (ret < 0)
>                 return ret;
>         return 0;
> @@ -1042,7 +1041,7 @@ static void hdmi_conf_init(struct hdmi_context
> *hdata)
>         }
>  }
>
> -static void hdmi_v13_timing_apply(struct hdmi_context *hdata)
> +static void hdmi_v13_mode_apply(struct hdmi_context *hdata)
>  {
>         const struct hdmi_tg_regs *tg = &hdata->mode_conf.conf.v13_conf.tg
> ;
>         const struct hdmi_v13_core_regs *core =
> @@ -1131,7 +1130,7 @@ static void hdmi_v13_timing_apply(struct
> hdmi_context *hdata)
>                 hdmi_reg_writemask(hdata, HDMI_TG_CMD, ~0, HDMI_TG_EN);
>  }
>
> -static void hdmi_v14_timing_apply(struct hdmi_context *hdata)
> +static void hdmi_v14_mode_apply(struct hdmi_context *hdata)
>  {
>         const struct hdmi_tg_regs *tg = &hdata->mode_conf.conf.v14_conf.tg
> ;
>         const struct hdmi_v14_core_regs *core =
> @@ -1298,12 +1297,12 @@ static void hdmi_v14_timing_apply(struct
> hdmi_context *hdata)
>                 hdmi_reg_writemask(hdata, HDMI_TG_CMD, ~0, HDMI_TG_EN);
>  }
>
> -static void hdmi_timing_apply(struct hdmi_context *hdata)
> +static void hdmi_mode_apply(struct hdmi_context *hdata)
>  {
>         if (hdata->type == HDMI_TYPE13)
> -               hdmi_v13_timing_apply(hdata);
> +               hdmi_v13_mode_apply(hdata);
>         else
> -               hdmi_v14_timing_apply(hdata);
> +               hdmi_v14_mode_apply(hdata);
>  }
>
>  static void hdmiphy_conf_reset(struct hdmi_context *hdata)
> @@ -1423,7 +1422,7 @@ static void hdmi_conf_apply(struct hdmi_context
> *hdata)
>         hdmi_audio_init(hdata);
>
>         /* setting core registers */
> -       hdmi_timing_apply(hdata);
> +       hdmi_mode_apply(hdata);
>         hdmi_audio_control(hdata, true);
>
>         hdmi_regs_dump(hdata, "start");
> @@ -1642,7 +1641,7 @@ static void hdmi_v14_mode_set(struct hdmi_context
> *hdata,
>         hdmi_set_reg(tg->tg_3d, 1, 0x0);
>  }
>
> -static void hdmi_mode_set(void *ctx, void *mode)
> +static void hdmi_mode_set(void *ctx, struct drm_display_mode *mode)
>  {
>         struct hdmi_context *hdata = ctx;
>         struct drm_display_mode *m = mode;
> @@ -1767,7 +1766,7 @@ static struct exynos_hdmi_ops hdmi_ops = {
>         /* display */
>         .is_connected   = hdmi_is_connected,
>         .get_edid       = hdmi_get_edid,
> -       .check_timing   = hdmi_check_timing,
> +       .check_mode     = hdmi_check_mode,
>
>         /* manager */
>         .mode_set       = hdmi_mode_set,
> diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c
> b/drivers/gpu/drm/exynos/exynos_mixer.c
> index de5c735..b0882b3 100644
> --- a/drivers/gpu/drm/exynos/exynos_mixer.c
> +++ b/drivers/gpu/drm/exynos/exynos_mixer.c
> @@ -820,17 +820,16 @@ static void mixer_win_disable(void *ctx, int win)
>         mixer_ctx->win_data[win].enabled = false;
>  }
>
> -static int mixer_check_timing(void *ctx, struct fb_videomode *timing)
> +static int mixer_check_mode(void *ctx, struct drm_display_mode *mode)
>  {
>         u32 w, h;
>
> -       w = timing->xres;
> -       h = timing->yres;
> +       w = mode->hdisplay;
> +       h = mode->vdisplay;
>
> -       DRM_DEBUG_KMS("%s : xres=%d, yres=%d, refresh=%d, intl=%d\n",
> -               __func__, timing->xres, timing->yres,
> -               timing->refresh, (timing->vmode &
> -               FB_VMODE_INTERLACED) ? true : false);
> +       DRM_DEBUG_KMS("xres=%d, yres=%d, refresh=%d, intl=%d\n",
> +               mode->hdisplay, mode->vdisplay, mode->vrefresh,
> +               (mode->flags & DRM_MODE_FLAG_INTERLACE) ? 1 : 0);
>
>         if ((w >= 464 && w <= 720 && h >= 261 && h <= 576) ||
>                 (w >= 1024 && w <= 1280 && h >= 576 && h <= 720) ||
> @@ -978,7 +977,7 @@ static struct exynos_mixer_ops mixer_ops = {
>         .win_disable            = mixer_win_disable,
>
>         /* display */
> -       .check_timing           = mixer_check_timing,
> +       .check_mode             = mixer_check_mode,
>  };
>
>  static irqreturn_t mixer_irq_handler(int irq, void *arg)
> --
> 1.7.10.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe
> linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

--001a11c3715cebefda04deeb7067
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Applied.<br><br>Thanks,<br>Inki Dae<br></div><div class=3D=
"gmail_extra"><br><br><div class=3D"gmail_quote">2013/6/10 Rahul Sharma <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:rahul.sharma@samsung.com" target=3D"_b=
lank">rahul.sharma@samsung.com</a>&gt;</span><br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">This patch renames check_timing to check_mod=
e and removes the<br>
unnecessary conversion of drm_display_mode to/from fb_videomode in<br>
the hdmi driver.<br>
<br>
v4:<br>
1) Changed the commit message to add information related to renaming<br>
the callbacks to check_mode.<br>
2) Changed debug message to print 1/0 for interlace mode.<br>
<br>
v3:<br>
1) Replaced check_timing callbacks with check_mode.<br>
2) Change the type of second parameter of check_mode callback from void<br>
pointer paramenter to struct drm_display_mode pointer.<br>
<br>
v2:<br>
1) Removed convert_to_video_timing().<br>
2) Corrected DRM_DEBUG_KMS to print the resolution properly.<br>
<br>
Signed-off-by: Rahul Sharma &lt;<a href=3D"mailto:rahul.sharma@samsung.com"=
>rahul.sharma@samsung.com</a>&gt;<br>
---<br>
=A0drivers/gpu/drm/exynos/exynos_drm_connector.c | =A0 38 ++---------------=
--------<br>
=A0drivers/gpu/drm/exynos/exynos_drm_drv.h =A0 =A0 =A0 | =A0 =A04 +--<br>
=A0drivers/gpu/drm/exynos/exynos_drm_fimd.c =A0 =A0 =A0| =A0 =A04 +--<br>
=A0drivers/gpu/drm/exynos/exynos_drm_hdmi.c =A0 =A0 =A0| =A0 17 +++++------=
<br>
=A0drivers/gpu/drm/exynos/exynos_drm_hdmi.h =A0 =A0 =A0| =A0 =A06 ++--<br>
=A0drivers/gpu/drm/exynos/exynos_drm_vidi.c =A0 =A0 =A0| =A0 =A04 +--<br>
=A0drivers/gpu/drm/exynos/exynos_hdmi.c =A0 =A0 =A0 =A0 =A0| =A0 29 +++++++=
++----------<br>
=A0drivers/gpu/drm/exynos/exynos_mixer.c =A0 =A0 =A0 =A0 | =A0 15 +++++----=
-<br>
=A08 files changed, 41 insertions(+), 76 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/exynos/exynos_drm_connector.c b/drivers/gpu/dr=
m/exynos/exynos_drm_connector.c<br>
index 8bcc13a..ab3c6d4 100644<br>
--- a/drivers/gpu/drm/exynos/exynos_drm_connector.c<br>
+++ b/drivers/gpu/drm/exynos/exynos_drm_connector.c<br>
@@ -58,37 +58,6 @@ convert_to_display_mode(struct drm_display_mode *mode,<b=
r>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mode-&gt;flags |=3D DRM_MODE_FLAG_DBLSCAN;<=
br>
=A0}<br>
<br>
-/* convert drm_display_mode to exynos_video_timings */<br>
-static inline void<br>
-convert_to_video_timing(struct fb_videomode *timing,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct drm_display_mode *mode=
)<br>
-{<br>
- =A0 =A0 =A0 DRM_DEBUG_KMS(&quot;%s\n&quot;, __FILE__);<br>
-<br>
- =A0 =A0 =A0 memset(timing, 0, sizeof(*timing));<br>
-<br>
- =A0 =A0 =A0 timing-&gt;pixclock =3D mode-&gt;clock * 1000;<br>
- =A0 =A0 =A0 timing-&gt;refresh =3D drm_mode_vrefresh(mode);<br>
-<br>
- =A0 =A0 =A0 timing-&gt;xres =3D mode-&gt;hdisplay;<br>
- =A0 =A0 =A0 timing-&gt;right_margin =3D mode-&gt;hsync_start - mode-&gt;h=
display;<br>
- =A0 =A0 =A0 timing-&gt;hsync_len =3D mode-&gt;hsync_end - mode-&gt;hsync_=
start;<br>
- =A0 =A0 =A0 timing-&gt;left_margin =3D mode-&gt;htotal - mode-&gt;hsync_e=
nd;<br>
-<br>
- =A0 =A0 =A0 timing-&gt;yres =3D mode-&gt;vdisplay;<br>
- =A0 =A0 =A0 timing-&gt;lower_margin =3D mode-&gt;vsync_start - mode-&gt;v=
display;<br>
- =A0 =A0 =A0 timing-&gt;vsync_len =3D mode-&gt;vsync_end - mode-&gt;vsync_=
start;<br>
- =A0 =A0 =A0 timing-&gt;upper_margin =3D mode-&gt;vtotal - mode-&gt;vsync_=
end;<br>
-<br>
- =A0 =A0 =A0 if (mode-&gt;flags &amp; DRM_MODE_FLAG_INTERLACE)<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 timing-&gt;vmode =3D FB_VMODE_INTERLACED;<br>
- =A0 =A0 =A0 else<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 timing-&gt;vmode =3D FB_VMODE_NONINTERLACED;<=
br>
-<br>
- =A0 =A0 =A0 if (mode-&gt;flags &amp; DRM_MODE_FLAG_DBLSCAN)<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 timing-&gt;vmode |=3D FB_VMODE_DOUBLE;<br>
-}<br>
-<br>
=A0static int exynos_drm_connector_get_modes(struct drm_connector *connecto=
r)<br>
=A0{<br>
=A0 =A0 =A0 =A0 struct exynos_drm_connector *exynos_connector =3D<br>
@@ -168,15 +137,12 @@ static int exynos_drm_connector_mode_valid(struct drm=
_connector *connector,<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 to_exynos_connector(connector);<br>
=A0 =A0 =A0 =A0 struct exynos_drm_manager *manager =3D exynos_connector-&gt=
;manager;<br>
=A0 =A0 =A0 =A0 struct exynos_drm_display_ops *display_ops =3D manager-&gt;=
display_ops;<br>
- =A0 =A0 =A0 struct fb_videomode timing;<br>
=A0 =A0 =A0 =A0 int ret =3D MODE_BAD;<br>
<br>
=A0 =A0 =A0 =A0 DRM_DEBUG_KMS(&quot;%s\n&quot;, __FILE__);<br>
<br>
- =A0 =A0 =A0 convert_to_video_timing(&amp;timing, mode);<br>
-<br>
- =A0 =A0 =A0 if (display_ops &amp;&amp; display_ops-&gt;check_timing)<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!display_ops-&gt;check_timing(manager-&gt=
;dev, (void *)&amp;timing))<br>
+ =A0 =A0 =A0 if (display_ops &amp;&amp; display_ops-&gt;check_mode)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!display_ops-&gt;check_mode(manager-&gt;d=
ev, mode))<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D MODE_OK;<br>
<br>
=A0 =A0 =A0 =A0 return ret;<br>
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exyn=
os/exynos_drm_drv.h<br>
index 680a7c1..eaa1966 100644<br>
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h<br>
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h<br>
@@ -142,7 +142,7 @@ struct exynos_drm_overlay {<br>
=A0 * @is_connected: check for that display is connected or not.<br>
=A0 * @get_edid: get edid modes from display driver.<br>
=A0 * @get_panel: get panel object from display driver.<br>
- * @check_timing: check if timing is valid or not.<br>
+ * @check_mode: check if mode is valid or not.<br>
=A0 * @power_on: display device on or off.<br>
=A0 */<br>
=A0struct exynos_drm_display_ops {<br>
@@ -151,7 +151,7 @@ struct exynos_drm_display_ops {<br>
=A0 =A0 =A0 =A0 struct edid *(*get_edid)(struct device *dev,<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct drm_connector *conne=
ctor);<br>
=A0 =A0 =A0 =A0 void *(*get_panel)(struct device *dev);<br>
- =A0 =A0 =A0 int (*check_timing)(struct device *dev, void *timing);<br>
+ =A0 =A0 =A0 int (*check_mode)(struct device *dev, struct drm_display_mode=
 *mode);<br>
=A0 =A0 =A0 =A0 int (*power_on)(struct device *dev, int mode);<br>
=A0};<br>
<br>
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exy=
nos/exynos_drm_fimd.c<br>
index 279c3f8..d33e17d 100644<br>
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c<br>
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c<br>
@@ -153,7 +153,7 @@ static void *fimd_get_panel(struct device *dev)<br>
=A0 =A0 =A0 =A0 return ctx-&gt;panel;<br>
=A0}<br>
<br>
-static int fimd_check_timing(struct device *dev, void *timing)<br>
+static int fimd_check_mode(struct device *dev, struct drm_display_mode *mo=
de)<br>
=A0{<br>
=A0 =A0 =A0 =A0 DRM_DEBUG_KMS(&quot;%s\n&quot;, __FILE__);<br>
<br>
@@ -175,7 +175,7 @@ static struct exynos_drm_display_ops fimd_display_ops =
=3D {<br>
=A0 =A0 =A0 =A0 .type =3D EXYNOS_DISPLAY_TYPE_LCD,<br>
=A0 =A0 =A0 =A0 .is_connected =3D fimd_display_is_connected,<br>
=A0 =A0 =A0 =A0 .get_panel =3D fimd_get_panel,<br>
- =A0 =A0 =A0 .check_timing =3D fimd_check_timing,<br>
+ =A0 =A0 =A0 .check_mode =3D fimd_check_mode,<br>
=A0 =A0 =A0 =A0 .power_on =3D fimd_display_power_on,<br>
=A0};<br>
<br>
diff --git a/drivers/gpu/drm/exynos/exynos_drm_hdmi.c b/drivers/gpu/drm/exy=
nos/exynos_drm_hdmi.c<br>
index b9b2726..59acdc0 100644<br>
--- a/drivers/gpu/drm/exynos/exynos_drm_hdmi.c<br>
+++ b/drivers/gpu/drm/exynos/exynos_drm_hdmi.c<br>
@@ -127,7 +127,8 @@ static struct edid *drm_hdmi_get_edid(struct device *de=
v,<br>
=A0 =A0 =A0 =A0 return NULL;<br>
=A0}<br>
<br>
-static int drm_hdmi_check_timing(struct device *dev, void *timing)<br>
+static int drm_hdmi_check_mode(struct device *dev,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct drm_display_mode *mode)<br>
=A0{<br>
=A0 =A0 =A0 =A0 struct drm_hdmi_context *ctx =3D to_context(dev);<br>
=A0 =A0 =A0 =A0 int ret =3D 0;<br>
@@ -139,14 +140,14 @@ static int drm_hdmi_check_timing(struct device *dev, =
void *timing)<br>
=A0 =A0 =A0 =A0 * If any of the two fails, return mode as BAD.<br>
=A0 =A0 =A0 =A0 */<br>
<br>
- =A0 =A0 =A0 if (mixer_ops &amp;&amp; mixer_ops-&gt;check_timing)<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D mixer_ops-&gt;check_timing(ctx-&gt;mi=
xer_ctx-&gt;ctx, timing);<br>
+ =A0 =A0 =A0 if (mixer_ops &amp;&amp; mixer_ops-&gt;check_mode)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D mixer_ops-&gt;check_mode(ctx-&gt;mixe=
r_ctx-&gt;ctx, mode);<br>
<br>
=A0 =A0 =A0 =A0 if (ret)<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;<br>
<br>
- =A0 =A0 =A0 if (hdmi_ops &amp;&amp; hdmi_ops-&gt;check_timing)<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 return hdmi_ops-&gt;check_timing(ctx-&gt;hdmi=
_ctx-&gt;ctx, timing);<br>
+ =A0 =A0 =A0 if (hdmi_ops &amp;&amp; hdmi_ops-&gt;check_mode)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 return hdmi_ops-&gt;check_mode(ctx-&gt;hdmi_c=
tx-&gt;ctx, mode);<br>
<br>
=A0 =A0 =A0 =A0 return 0;<br>
=A0}<br>
@@ -167,7 +168,7 @@ static struct exynos_drm_display_ops drm_hdmi_display_o=
ps =3D {<br>
=A0 =A0 =A0 =A0 .type =3D EXYNOS_DISPLAY_TYPE_HDMI,<br>
=A0 =A0 =A0 =A0 .is_connected =3D drm_hdmi_is_connected,<br>
=A0 =A0 =A0 =A0 .get_edid =3D drm_hdmi_get_edid,<br>
- =A0 =A0 =A0 .check_timing =3D drm_hdmi_check_timing,<br>
+ =A0 =A0 =A0 .check_mode =3D drm_hdmi_check_mode,<br>
=A0 =A0 =A0 =A0 .power_on =3D drm_hdmi_power_on,<br>
=A0};<br>
<br>
@@ -218,7 +219,7 @@ static void drm_hdmi_mode_fixup(struct device *subdrv_d=
ev,<br>
<br>
=A0 =A0 =A0 =A0 drm_mode_set_crtcinfo(adjusted_mode, 0);<br>
<br>
- =A0 =A0 =A0 mode_ok =3D drm_hdmi_check_timing(subdrv_dev, adjusted_mode);=
<br>
+ =A0 =A0 =A0 mode_ok =3D drm_hdmi_check_mode(subdrv_dev, adjusted_mode);<b=
r>
<br>
=A0 =A0 =A0 =A0 /* just return if user desired mode exists. */<br>
=A0 =A0 =A0 =A0 if (mode_ok =3D=3D 0)<br>
@@ -229,7 +230,7 @@ static void drm_hdmi_mode_fixup(struct device *subdrv_d=
ev,<br>
=A0 =A0 =A0 =A0 =A0* to adjusted_mode.<br>
=A0 =A0 =A0 =A0 =A0*/<br>
=A0 =A0 =A0 =A0 list_for_each_entry(m, &amp;connector-&gt;modes, head) {<br=
>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 mode_ok =3D drm_hdmi_check_timing(subdrv_dev,=
 m);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 mode_ok =3D drm_hdmi_check_mode(subdrv_dev, m=
);<br>
<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (mode_ok =3D=3D 0) {<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct drm_mode_object base=
;<br>
diff --git a/drivers/gpu/drm/exynos/exynos_drm_hdmi.h b/drivers/gpu/drm/exy=
nos/exynos_drm_hdmi.h<br>
index 6b70944..724cab1 100644<br>
--- a/drivers/gpu/drm/exynos/exynos_drm_hdmi.h<br>
+++ b/drivers/gpu/drm/exynos/exynos_drm_hdmi.h<br>
@@ -32,11 +32,11 @@ struct exynos_hdmi_ops {<br>
=A0 =A0 =A0 =A0 bool (*is_connected)(void *ctx);<br>
=A0 =A0 =A0 =A0 struct edid *(*get_edid)(void *ctx,<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct drm_connector *conne=
ctor);<br>
- =A0 =A0 =A0 int (*check_timing)(void *ctx, struct fb_videomode *timing);<=
br>
+ =A0 =A0 =A0 int (*check_mode)(void *ctx, struct drm_display_mode *mode);<=
br>
=A0 =A0 =A0 =A0 int (*power_on)(void *ctx, int mode);<br>
<br>
=A0 =A0 =A0 =A0 /* manager */<br>
- =A0 =A0 =A0 void (*mode_set)(void *ctx, void *mode);<br>
+ =A0 =A0 =A0 void (*mode_set)(void *ctx, struct drm_display_mode *mode);<b=
r>
=A0 =A0 =A0 =A0 void (*get_max_resol)(void *ctx, unsigned int *width,<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned in=
t *height);<br>
=A0 =A0 =A0 =A0 void (*commit)(void *ctx);<br>
@@ -57,7 +57,7 @@ struct exynos_mixer_ops {<br>
=A0 =A0 =A0 =A0 void (*win_disable)(void *ctx, int zpos);<br>
<br>
=A0 =A0 =A0 =A0 /* display */<br>
- =A0 =A0 =A0 int (*check_timing)(void *ctx, struct fb_videomode *timing);<=
br>
+ =A0 =A0 =A0 int (*check_mode)(void *ctx, struct drm_display_mode *mode);<=
br>
=A0};<br>
<br>
=A0void exynos_hdmi_drv_attach(struct exynos_drm_hdmi_context *ctx);<br>
diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exy=
nos/exynos_drm_vidi.c<br>
index 11a016d..294ba35 100644<br>
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c<br>
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c<br>
@@ -135,7 +135,7 @@ static void *vidi_get_panel(struct device *dev)<br>
=A0 =A0 =A0 =A0 return NULL;<br>
=A0}<br>
<br>
-static int vidi_check_timing(struct device *dev, void *timing)<br>
+static int vidi_check_mode(struct device *dev, struct drm_display_mode *mo=
de)<br>
=A0{<br>
=A0 =A0 =A0 =A0 DRM_DEBUG_KMS(&quot;%s\n&quot;, __FILE__);<br>
<br>
@@ -158,7 +158,7 @@ static struct exynos_drm_display_ops vidi_display_ops =
=3D {<br>
=A0 =A0 =A0 =A0 .is_connected =3D vidi_display_is_connected,<br>
=A0 =A0 =A0 =A0 .get_edid =3D vidi_get_edid,<br>
=A0 =A0 =A0 =A0 .get_panel =3D vidi_get_panel,<br>
- =A0 =A0 =A0 .check_timing =3D vidi_check_timing,<br>
+ =A0 =A0 =A0 .check_mode =3D vidi_check_mode,<br>
=A0 =A0 =A0 =A0 .power_on =3D vidi_display_power_on,<br>
=A0};<br>
<br>
diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/=
exynos_hdmi.c<br>
index 4dfe829..04255fe 100644<br>
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c<br>
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c<br>
@@ -796,18 +796,17 @@ static int hdmi_find_phy_conf(struct hdmi_context *hd=
ata, u32 pixel_clock)<br>
=A0 =A0 =A0 =A0 return -EINVAL;<br>
=A0}<br>
<br>
-static int hdmi_check_timing(void *ctx, struct fb_videomode *timing)<br>
+static int hdmi_check_mode(void *ctx, struct drm_display_mode *mode)<br>
=A0{<br>
=A0 =A0 =A0 =A0 struct hdmi_context *hdata =3D ctx;<br>
=A0 =A0 =A0 =A0 int ret;<br>
<br>
- =A0 =A0 =A0 DRM_DEBUG_KMS(&quot;[%d] %s\n&quot;, __LINE__, __func__);<br>
-<br>
- =A0 =A0 =A0 DRM_DEBUG_KMS(&quot;[%d]x[%d] [%d]Hz [%x]\n&quot;, timing-&gt=
;xres,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 timing-&gt;yres, timing-&gt;r=
efresh,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 timing-&gt;vmode);<br>
+ =A0 =A0 =A0 DRM_DEBUG_KMS(&quot;xres=3D%d, yres=3D%d, refresh=3D%d, intl=
=3D%d clock=3D%d\n&quot;,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 mode-&gt;hdisplay, mode-&gt;vdisplay, mode-&g=
t;vrefresh,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 (mode-&gt;flags &amp; DRM_MODE_FLAG_INTERLACE=
) ? true :<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 false, mode-&gt;clock * 1000);<br>
<br>
- =A0 =A0 =A0 ret =3D hdmi_find_phy_conf(hdata, timing-&gt;pixclock);<br>
+ =A0 =A0 =A0 ret =3D hdmi_find_phy_conf(hdata, mode-&gt;clock * 1000);<br>
=A0 =A0 =A0 =A0 if (ret &lt; 0)<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;<br>
=A0 =A0 =A0 =A0 return 0;<br>
@@ -1042,7 +1041,7 @@ static void hdmi_conf_init(struct hdmi_context *hdata=
)<br>
=A0 =A0 =A0 =A0 }<br>
=A0}<br>
<br>
-static void hdmi_v13_timing_apply(struct hdmi_context *hdata)<br>
+static void hdmi_v13_mode_apply(struct hdmi_context *hdata)<br>
=A0{<br>
=A0 =A0 =A0 =A0 const struct hdmi_tg_regs *tg =3D &amp;hdata-&gt;<a href=3D=
"http://mode_conf.conf.v13_conf.tg" target=3D"_blank">mode_conf.conf.v13_co=
nf.tg</a>;<br>
=A0 =A0 =A0 =A0 const struct hdmi_v13_core_regs *core =3D<br>
@@ -1131,7 +1130,7 @@ static void hdmi_v13_timing_apply(struct hdmi_context=
 *hdata)<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 hdmi_reg_writemask(hdata, HDMI_TG_CMD, ~0, =
HDMI_TG_EN);<br>
=A0}<br>
<br>
-static void hdmi_v14_timing_apply(struct hdmi_context *hdata)<br>
+static void hdmi_v14_mode_apply(struct hdmi_context *hdata)<br>
=A0{<br>
=A0 =A0 =A0 =A0 const struct hdmi_tg_regs *tg =3D &amp;hdata-&gt;<a href=3D=
"http://mode_conf.conf.v14_conf.tg" target=3D"_blank">mode_conf.conf.v14_co=
nf.tg</a>;<br>
=A0 =A0 =A0 =A0 const struct hdmi_v14_core_regs *core =3D<br>
@@ -1298,12 +1297,12 @@ static void hdmi_v14_timing_apply(struct hdmi_conte=
xt *hdata)<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 hdmi_reg_writemask(hdata, HDMI_TG_CMD, ~0, =
HDMI_TG_EN);<br>
=A0}<br>
<br>
-static void hdmi_timing_apply(struct hdmi_context *hdata)<br>
+static void hdmi_mode_apply(struct hdmi_context *hdata)<br>
=A0{<br>
=A0 =A0 =A0 =A0 if (hdata-&gt;type =3D=3D HDMI_TYPE13)<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 hdmi_v13_timing_apply(hdata);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 hdmi_v13_mode_apply(hdata);<br>
=A0 =A0 =A0 =A0 else<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 hdmi_v14_timing_apply(hdata);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 hdmi_v14_mode_apply(hdata);<br>
=A0}<br>
<br>
=A0static void hdmiphy_conf_reset(struct hdmi_context *hdata)<br>
@@ -1423,7 +1422,7 @@ static void hdmi_conf_apply(struct hdmi_context *hdat=
a)<br>
=A0 =A0 =A0 =A0 hdmi_audio_init(hdata);<br>
<br>
=A0 =A0 =A0 =A0 /* setting core registers */<br>
- =A0 =A0 =A0 hdmi_timing_apply(hdata);<br>
+ =A0 =A0 =A0 hdmi_mode_apply(hdata);<br>
=A0 =A0 =A0 =A0 hdmi_audio_control(hdata, true);<br>
<br>
=A0 =A0 =A0 =A0 hdmi_regs_dump(hdata, &quot;start&quot;);<br>
@@ -1642,7 +1641,7 @@ static void hdmi_v14_mode_set(struct hdmi_context *hd=
ata,<br>
=A0 =A0 =A0 =A0 hdmi_set_reg(tg-&gt;tg_3d, 1, 0x0);<br>
=A0}<br>
<br>
-static void hdmi_mode_set(void *ctx, void *mode)<br>
+static void hdmi_mode_set(void *ctx, struct drm_display_mode *mode)<br>
=A0{<br>
=A0 =A0 =A0 =A0 struct hdmi_context *hdata =3D ctx;<br>
=A0 =A0 =A0 =A0 struct drm_display_mode *m =3D mode;<br>
@@ -1767,7 +1766,7 @@ static struct exynos_hdmi_ops hdmi_ops =3D {<br>
=A0 =A0 =A0 =A0 /* display */<br>
=A0 =A0 =A0 =A0 .is_connected =A0 =3D hdmi_is_connected,<br>
=A0 =A0 =A0 =A0 .get_edid =A0 =A0 =A0 =3D hdmi_get_edid,<br>
- =A0 =A0 =A0 .check_timing =A0 =3D hdmi_check_timing,<br>
+ =A0 =A0 =A0 .check_mode =A0 =A0 =3D hdmi_check_mode,<br>
<br>
=A0 =A0 =A0 =A0 /* manager */<br>
=A0 =A0 =A0 =A0 .mode_set =A0 =A0 =A0 =3D hdmi_mode_set,<br>
diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos=
/exynos_mixer.c<br>
index de5c735..b0882b3 100644<br>
--- a/drivers/gpu/drm/exynos/exynos_mixer.c<br>
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c<br>
@@ -820,17 +820,16 @@ static void mixer_win_disable(void *ctx, int win)<br>
=A0 =A0 =A0 =A0 mixer_ctx-&gt;win_data[win].enabled =3D false;<br>
=A0}<br>
<br>
-static int mixer_check_timing(void *ctx, struct fb_videomode *timing)<br>
+static int mixer_check_mode(void *ctx, struct drm_display_mode *mode)<br>
=A0{<br>
=A0 =A0 =A0 =A0 u32 w, h;<br>
<br>
- =A0 =A0 =A0 w =3D timing-&gt;xres;<br>
- =A0 =A0 =A0 h =3D timing-&gt;yres;<br>
+ =A0 =A0 =A0 w =3D mode-&gt;hdisplay;<br>
+ =A0 =A0 =A0 h =3D mode-&gt;vdisplay;<br>
<br>
- =A0 =A0 =A0 DRM_DEBUG_KMS(&quot;%s : xres=3D%d, yres=3D%d, refresh=3D%d, =
intl=3D%d\n&quot;,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 __func__, timing-&gt;xres, timing-&gt;yres,<b=
r>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 timing-&gt;refresh, (timing-&gt;vmode &amp;<b=
r>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 FB_VMODE_INTERLACED) ? true : false);<br>
+ =A0 =A0 =A0 DRM_DEBUG_KMS(&quot;xres=3D%d, yres=3D%d, refresh=3D%d, intl=
=3D%d\n&quot;,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 mode-&gt;hdisplay, mode-&gt;vdisplay, mode-&g=
t;vrefresh,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 (mode-&gt;flags &amp; DRM_MODE_FLAG_INTERLACE=
) ? 1 : 0);<br>
<br>
=A0 =A0 =A0 =A0 if ((w &gt;=3D 464 &amp;&amp; w &lt;=3D 720 &amp;&amp; h &g=
t;=3D 261 &amp;&amp; h &lt;=3D 576) ||<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (w &gt;=3D 1024 &amp;&amp; w &lt;=3D 1280 &=
amp;&amp; h &gt;=3D 576 &amp;&amp; h &lt;=3D 720) ||<br>
@@ -978,7 +977,7 @@ static struct exynos_mixer_ops mixer_ops =3D {<br>
=A0 =A0 =A0 =A0 .win_disable =A0 =A0 =A0 =A0 =A0 =A0=3D mixer_win_disable,<=
br>
<br>
=A0 =A0 =A0 =A0 /* display */<br>
- =A0 =A0 =A0 .check_timing =A0 =A0 =A0 =A0 =A0 =3D mixer_check_timing,<br>
+ =A0 =A0 =A0 .check_mode =A0 =A0 =A0 =A0 =A0 =A0 =3D mixer_check_mode,<br>
=A0};<br>
<br>
=A0static irqreturn_t mixer_irq_handler(int irq, void *arg)<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.7.10.4<br>
<br>
--<br>
To unsubscribe from this list: send the line &quot;unsubscribe linux-samsun=
g-soc&quot; in<br>
the body of a message to <a href=3D"mailto:majordomo@vger.kernel.org">major=
domo@vger.kernel.org</a><br>
More majordomo info at =A0<a href=3D"http://vger.kernel.org/majordomo-info.=
html" target=3D"_blank">http://vger.kernel.org/majordomo-info.html</a><br>
</font></span></blockquote></div><br></div>

--001a11c3715cebefda04deeb7067--

--===============0556551116==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0556551116==--
