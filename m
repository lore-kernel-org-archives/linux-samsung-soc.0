From: Gustavo Padovan <gustavo@padovan.org>
Subject: Re: [PATCH v3] drm/exynos: calculate vrefresh instead of use a fixed
 value
Date: Thu, 21 May 2015 11:06:35 -0300
Message-ID: <20150521140635.GB10615@joana>
References: <1432155399-5586-1-git-send-email-gustavo@padovan.org>
 <555D086F.4000104@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qg0-f54.google.com ([209.85.192.54]:34030 "EHLO
	mail-qg0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755899AbbEUOGp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 May 2015 10:06:45 -0400
Received: by qgez61 with SMTP id z61so36395095qge.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 21 May 2015 07:06:44 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <555D086F.4000104@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, daniel@fooishbar.org, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Hi Tobias,

2015-05-21 Tobias Jakobi <tjakobi@math.uni-bielefeld.de>:

> Gustavo Padovan wrote:
> > From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> > 
> > When mode's vrefresh is zero we should ask DRM core to calculate vrefresh
> > for us so we can get the correct value instead of relying on fixed value
> > defined in a macro. But if vrefresh is still zero we should fail the
> > update.
> This works better for me:
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> index dc834b8..26e8ae4 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> @@ -346,11 +346,16 @@ static bool fimd_mode_fixup(struct exynos_drm_crtc
> *crtc,
>  static void fimd_commit(struct exynos_drm_crtc *crtc)
>  {
>         struct fimd_context *ctx = crtc->ctx;
> -       struct drm_display_mode *mode = &crtc->base.mode;
> +       struct drm_display_mode *mode;
>         struct fimd_driver_data *driver_data = ctx->driver_data;
>         void *timing_base = ctx->regs + driver_data->timing_base;
>         u32 val, clkdiv;
> 
> +       if (crtc->base.state)
> +               mode = &crtc->base.state->adjusted_mode;
> +       else
> +               mode = &crtc->base.mode;
> +
>         if (ctx->suspended)
>                 return;
> 
> Otherwise I get an oops (nullptr deref) on boot, so 'state' is probably
> not initialized yet at this point.

Would you like to send a proper git patch of this? You can move the 
drm_mode_vrefresh() part to your patch.

	Gustavo
