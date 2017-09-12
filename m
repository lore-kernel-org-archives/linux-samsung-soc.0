From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: [PATCH 09/10] drm/exynos/hdmi: quirk for support mode timings
 conversion
Date: Tue, 12 Sep 2017 14:50:29 +0200
Message-ID: <09f2c924-a8cd-a6dc-4a11-e11a099ac305@math.uni-bielefeld.de>
References: <1504694220-15818-1-git-send-email-a.hajda@samsung.com>
 <CGME20170906103731eucas1p24ec3d9de21453732de868960553b5e8d@eucas1p2.samsung.com>
 <1504694220-15818-10-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:43593 "EHLO
        smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751454AbdILMum (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 12 Sep 2017 08:50:42 -0400
In-Reply-To: <1504694220-15818-10-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>, Inki Dae <inki.dae@samsung.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Daniel Drake <drake@endlessm.com>

Hello Andrzej,


Andrzej Hajda wrote:
> MIXER in SoCs prior to Exynos5420 supports only 4 video modes:
> 720x480, 720x576, 1280x720, 1920x1080. Support for other modes
> can be enabled by manipulating timings of HDMI. To do it
> adjusted_mode should contain actual mode set on crtc.
> With this patch it is possible to enable 1024x768 and 1280x1024
> modes in MIXER.

Reviewed-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

And some question below.


> Suggested-by: Daniel Drake <drake@endlessm.com>
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_hdmi.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
> index 7225b65..4b081f6 100644
> --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
> +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
> @@ -1239,6 +1239,17 @@ static void hdmi_v13_mode_apply(struct hdmi_context *hdata)
>  static void hdmi_v14_mode_apply(struct hdmi_context *hdata)
>  {
>  	struct drm_display_mode *m = &hdata->encoder.crtc->state->mode;
> +	struct drm_display_mode *am = &hdata->encoder.crtc->state->adjusted_mode;
> +	int hquirk = 0;
> +
> +	/*
> +	 * In case video mode coming from CRTC differs from requested one HDMI
> +	 * sometimes is able to almost properly perform conversion - only
> +	 * first line is distorted.
> +	 */
> +	if ((m->vdisplay != am->vdisplay) &&
> +	    (m->hdisplay == 1280 || m->hdisplay == 1024))
> +		hquirk = 258;
Can it even happen, that m->hdisplay is neither 1280 nor 1024 but "m->vdisplay
!= am->vdisplay" still holds?



>  	hdmi_reg_writev(hdata, HDMI_H_BLANK_0, 2, m->htotal - m->hdisplay);
>  	hdmi_reg_writev(hdata, HDMI_V_LINE_0, 2, m->vtotal);
> @@ -1332,8 +1343,8 @@ static void hdmi_v14_mode_apply(struct hdmi_context *hdata)
>  	hdmi_reg_writev(hdata, HDMI_V_SYNC_LINE_AFT_PXL_6_0, 2, 0xffff);
>  
>  	hdmi_reg_writev(hdata, HDMI_TG_H_FSZ_L, 2, m->htotal);
> -	hdmi_reg_writev(hdata, HDMI_TG_HACT_ST_L, 2, m->htotal - m->hdisplay);
> -	hdmi_reg_writev(hdata, HDMI_TG_HACT_SZ_L, 2, m->hdisplay);
> +	hdmi_reg_writev(hdata, HDMI_TG_HACT_ST_L, 2, m->htotal - m->hdisplay - hquirk);
> +	hdmi_reg_writev(hdata, HDMI_TG_HACT_SZ_L, 2, m->hdisplay + hquirk);
>  	hdmi_reg_writev(hdata, HDMI_TG_V_FSZ_L, 2, m->vtotal);
>  	if (hdata->drv_data == &exynos5433_hdmi_driver_data)
>  		hdmi_reg_writeb(hdata, HDMI_TG_DECON_EN, 1);
> 
