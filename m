From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v2 09/11] drm/exynos/hdmi: quirk for support mode
 timings conversion
Date: Tue, 17 Oct 2017 16:38:36 +0900
Message-ID: <59E5B37C.0@samsung.com>
References: <20170929100542.12849-1-a.hajda@samsung.com>
        <CGME20170929100549eucas1p2053fdf47957c11fa39d0e026267f088c@eucas1p2.samsung.com>
        <20170929100542.12849-10-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:60806 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754455AbdJQHij (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 17 Oct 2017 03:38:39 -0400
In-reply-to: <20170929100542.12849-10-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Daniel Drake <drake@endlessm.com>



2017년 09월 29일 19:05에 Andrzej Hajda 이(가) 쓴 글:
> MIXER in SoCs prior to Exynos5420 supports only 4 video modes:
> 720x480, 720x576, 1280x720, 1920x1080. Support for other modes
> can be enabled by manipulating timings of HDMI. To do it
> adjusted_mode should contain actual mode set on crtc.
> With this patch it is possible to enable 1024x768 and 1280x1024
> modes in MIXER.
> 
> Suggested-by: Daniel Drake <drake@endlessm.com>
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> Reviewed-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
> ---
>  drivers/gpu/drm/exynos/exynos_hdmi.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
> index 7225b6521148..4b081f6cfdcb 100644
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

Andrzej,

The distorted value couldn't be described logically? Just I wonder why the difference happens.

Thanks,
Inki Dae

>  
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
