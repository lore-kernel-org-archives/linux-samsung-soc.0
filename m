From: Sean Paul <seanpaul@chromium.org>
Subject: Re: [PATCH] drm/exynos: hdmi: use drm_display_mode to check the
 supported modes
Date: Tue, 26 Feb 2013 12:25:25 -0500
Message-ID: <CAOw6vbLQwk2a77M3ZJ1uv9fx80yx+oP=2QZRhJNKD-xEOQUE6g@mail.gmail.com>
References: <1361880975-14189-1-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f173.google.com ([209.85.217.173]:36414 "EHLO
	mail-lb0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754961Ab3BZRZu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Feb 2013 12:25:50 -0500
Received: by mail-lb0-f173.google.com with SMTP id gf7so3256904lbb.4
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Feb 2013 09:25:48 -0800 (PST)
Received: by mail-lb0-f170.google.com with SMTP id ge1so3315004lbb.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Feb 2013 09:25:46 -0800 (PST)
In-Reply-To: <1361880975-14189-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <rahul.sharma@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, "sw0312.kim" <sw0312.kim@samsung.com>, sunil joshi <joshi@samsung.com>

On Tue, Feb 26, 2013 at 7:16 AM, Rahul Sharma <rahul.sharma@samsung.com> wrote:
> Exynos hdmi driver is using drm_display_mode for setting timing values
> for a supported resolution. Conversion to fb_videomode and then comparing
> with the mixer/hdmi/phy limits is not required. Instead, drm_display_mode
> fields cane be directly compared.
>
> This patch is dependent on https://patchwork.kernel.org/patch/2176021/.
>
> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
> ---
> It is based on exynos-drm-next-todo branch at
> git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git
>
>  drivers/gpu/drm/exynos/exynos_drm_connector.c |  5 +----
>  drivers/gpu/drm/exynos/exynos_drm_hdmi.h      |  6 +++---
>  drivers/gpu/drm/exynos/exynos_hdmi.c          | 15 +++++++--------
>  drivers/gpu/drm/exynos/exynos_mixer.c         | 13 +++++++------
>  4 files changed, 18 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_connector.c b/drivers/gpu/drm/exynos/exynos_drm_connector.c
> index 4c5b685..ab0f67a 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_connector.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_connector.c
> @@ -168,15 +168,12 @@ static int exynos_drm_connector_mode_valid(struct drm_connector *connector,
>                                         to_exynos_connector(connector);
>         struct exynos_drm_manager *manager = exynos_connector->manager;
>         struct exynos_drm_display_ops *display_ops = manager->display_ops;
> -       struct fb_videomode timing;
>         int ret = MODE_BAD;
>
>         DRM_DEBUG_KMS("%s\n", __FILE__);
>
> -       convert_to_video_timing(&timing, mode);

Is this function being used any longer? If not, you should remove it.

> -
>         if (display_ops && display_ops->check_timing)
> -               if (!display_ops->check_timing(manager->dev, (void *)&timing))
> +               if (!display_ops->check_timing(manager->dev, (void *)mode))
>                         ret = MODE_OK;
>
>         return ret;
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_hdmi.h b/drivers/gpu/drm/exynos/exynos_drm_hdmi.h
> index b7faa36..844addb 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_hdmi.h
> +++ b/drivers/gpu/drm/exynos/exynos_drm_hdmi.h
> @@ -32,14 +32,14 @@ struct exynos_hdmi_ops {
>         bool (*is_connected)(void *ctx);
>         struct edid *(*get_edid)(void *ctx,
>                         struct drm_connector *connector);
> -       int (*check_timing)(void *ctx, struct fb_videomode *timing);
> +       int (*check_timing)(void *ctx, struct drm_display_mode *mode);
>         int (*power_on)(void *ctx, int mode);
>
>         /* manager */
>         void (*mode_fixup)(void *ctx, struct drm_connector *connector,
>                                 const struct drm_display_mode *mode,
>                                 struct drm_display_mode *adjusted_mode);
> -       void (*mode_set)(void *ctx, void *mode);
> +       void (*mode_set)(void *ctx, struct drm_display_mode *mode);
>         void (*get_max_resol)(void *ctx, unsigned int *width,
>                                 unsigned int *height);
>         void (*commit)(void *ctx);
> @@ -60,7 +60,7 @@ struct exynos_mixer_ops {
>         void (*win_disable)(void *ctx, int zpos);
>
>         /* display */
> -       int (*check_timing)(void *ctx, struct fb_videomode *timing);
> +       int (*check_timing)(void *ctx, struct drm_display_mode *mode);
>  };
>
>  void exynos_hdmi_drv_attach(struct exynos_drm_hdmi_context *ctx);
> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
> index c38d275..d8d78a6 100644
> --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
> +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
> @@ -798,18 +798,17 @@ static int hdmi_find_phy_conf(struct hdmi_context *hdata, u32 pixel_clock)
>         return -EINVAL;
>  }
>
> -static int hdmi_check_timing(void *ctx, struct fb_videomode *timing)
> +static int hdmi_check_timing(void *ctx, struct drm_display_mode *mode)
>  {
>         struct hdmi_context *hdata = ctx;
>         int ret;
>
> -       DRM_DEBUG_KMS("[%d] %s\n", __LINE__, __func__);
> -
> -       DRM_DEBUG_KMS("[%d]x[%d] [%d]Hz [%x]\n", timing->xres,
> -                       timing->yres, timing->refresh,
> -                       timing->vmode);
> +       DRM_DEBUG_KMS("%s : xres=%d, yres=%d, refresh=%d, intl=%d clock=%d\n",
> +               __func__, mode->hdisplay, mode->vdisplay,
> +               mode->vrefresh, (mode->flags & DRM_MODE_FLAG_INTERLACE) ? true :
> +               false, mode->clock * 1000);

I don't think passing a bool to intl=%d makes much sense. If you're
going to parse the flag, convert to a string "yes" : "no".
Alternatively, just post the flags directly.

>
> -       ret = hdmi_find_phy_conf(hdata, timing->pixclock);
> +       ret = hdmi_find_phy_conf(hdata, mode->clock * 1000);
>         if (ret < 0)
>                 return ret;
>         return 0;
> @@ -1691,7 +1690,7 @@ static void hdmi_v14_mode_set(struct hdmi_context *hdata,
>         hdmi_set_reg(tg->tg_3d, 1, 0x0);
>  }
>
> -static void hdmi_mode_set(void *ctx, void *mode)
> +static void hdmi_mode_set(void *ctx, struct drm_display_mode *mode)
>  {
>         struct hdmi_context *hdata = ctx;
>         struct drm_display_mode *m = mode;
> diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
> index b6339f9..55cfde5 100644
> --- a/drivers/gpu/drm/exynos/exynos_mixer.c
> +++ b/drivers/gpu/drm/exynos/exynos_mixer.c
> @@ -811,17 +811,17 @@ static void mixer_win_disable(void *ctx, int win)
>         mixer_ctx->win_data[win].enabled = false;
>  }
>
> -int mixer_check_timing(void *ctx, struct fb_videomode *timing)
> +int mixer_check_timing(void *ctx, struct drm_display_mode *mode)
>  {
>         u32 w, h;
>
> -       w = timing->xres;
> -       h = timing->yres;
> +       w = mode->hdisplay;
> +       h = mode->vdisplay;
>
>         DRM_DEBUG_KMS("%s : xres=%d, yres=%d, refresh=%d, intl=%d\n",
> -               __func__, timing->xres, timing->yres,
> -               timing->refresh, (timing->vmode &
> -               FB_VMODE_INTERLACED) ? true : false);
> +               __func__, mode->hdisplay, mode->vdisplay,
> +               mode->vrefresh, (mode->flags &
> +               DRM_MODE_FLAG_INTERLACE) ? true : false);

Same comment regarding flag parsing.

Sean

>
>         if ((w >= 464 && w <= 720 && h >= 261 && h <= 576) ||
>                 (w >= 1024 && w <= 1280 && h >= 576 && h <= 720) ||
> @@ -830,6 +830,7 @@ int mixer_check_timing(void *ctx, struct fb_videomode *timing)
>
>         return -EINVAL;
>  }
> +
>  static void mixer_wait_for_vblank(void *ctx)
>  {
>         struct mixer_context *mixer_ctx = ctx;
> --
> 1.8.0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
