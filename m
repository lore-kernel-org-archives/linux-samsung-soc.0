From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH -v3 11/11] drm/exynos: atomic dpms support
Date: Sun, 5 Apr 2015 23:42:24 +0900
Message-ID: <CAAQKjZMYXR7TxkGDKt=RTpE=ZpYyp7VveH_M6kEEB4EzcfCmcg@mail.gmail.com>
References: <1428084583-14616-1-git-send-email-gustavo@padovan.org>
	<1428084583-14616-12-git-send-email-gustavo@padovan.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f177.google.com ([209.85.217.177]:35692 "EHLO
	mail-lb0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751989AbbDEOm0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 5 Apr 2015 10:42:26 -0400
Received: by lbbuc2 with SMTP id uc2so3322549lbb.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 05 Apr 2015 07:42:24 -0700 (PDT)
In-Reply-To: <1428084583-14616-12-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Gustavo Padovan <gustavo@padovan.org>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, DRI mailing list <dri-devel@lists.freedesktop.org>

Hi,

2015-04-04 3:09 GMT+09:00 Gustavo Padovan <gustavo@padovan.org>:
> From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
>
> Run dpms operations through the atomic intefaces. This basically removes
> the .dpms() callback from econders and crtcs and use .disable() and
> .enable() to turn the crtc on and off.
>
> v2: Address comments by Joonyoung:
>         - make hdmi code call ->disable() instead of ->dpms()
>         - do not use WARN_ON on crtc enable/disable
>
> Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> ---
>  drivers/gpu/drm/exynos/exynos_dp_core.c       |  2 +-
>  drivers/gpu/drm/exynos/exynos_drm_connector.c |  2 +-
>  drivers/gpu/drm/exynos/exynos_drm_crtc.c      | 99 +++++++++++++++------------
>  drivers/gpu/drm/exynos/exynos_drm_dpi.c       |  2 +-
>  drivers/gpu/drm/exynos/exynos_drm_drv.h       |  4 +-
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c       |  2 +-
>  drivers/gpu/drm/exynos/exynos_drm_encoder.c   | 27 ++------
>  drivers/gpu/drm/exynos/exynos_drm_vidi.c      |  2 +-
>  drivers/gpu/drm/exynos/exynos_hdmi.c          |  6 +-
>  9 files changed, 70 insertions(+), 76 deletions(-)
>

...snip...

> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
> index 5b597bc..2ea7d01 100644
> --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
> +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
> @@ -1051,7 +1051,7 @@ static void hdmi_connector_destroy(struct drm_connector *connector)
>  }
>
>  static struct drm_connector_funcs hdmi_connector_funcs = {
> -       .dpms = drm_helper_connector_dpms,
> +       .dpms = drm_atomic_helper_connector_dpms,
>         .fill_modes = drm_helper_probe_single_connector_modes,
>         .detect = hdmi_detect,
>         .destroy = hdmi_connector_destroy,
> @@ -2127,8 +2127,8 @@ static void hdmi_dpms(struct exynos_drm_display *display, int mode)
>                  */
>                 if (crtc)
>                         funcs = crtc->helper_private;
> -               if (funcs && funcs->dpms)
> -                       (*funcs->dpms)(crtc, mode);
> +               if (funcs && funcs->disable)
> +                       (*funcs->disable)(crtc, mode);

This patch makes funcs->disable callback to be called instead of
funcs->dpms callback. However, funcs->disable callback isn't required
for second argument so the build is failed like below,

drivers/gpu/drm/exynos/exynos_hdmi.c: In function 'hdmi_dpms':
drivers/gpu/drm/exynos/exynos_hdmi.c:2131:4: error: too many arguments
to function 'funcs->disable'

Please, keep in mind that you should build it and at least have a
basic test before posting.

Thanks,
Inki Dae

>
>                 hdmi_poweroff(hdata);
>                 break;
> --
> 2.1.0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
