From: Inki Dae <inki.dae@samsung.com>
Subject: RE: [PATCH 1/4] drm/exynos: Prepare/Unprepare HDMI subsystem clocks
Date: Thu, 13 Jun 2013 20:46:08 +0900
Message-ID: <02c301ce682b$986a0350$c93e09f0$%dae@samsung.com>
References: <1370933645-18344-1-git-send-email-rahul.sharma@samsung.com>
 <1370933645-18344-2-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:49780 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752088Ab3FMLqL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Jun 2013 07:46:11 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MOB00IVMY0OU210@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 13 Jun 2013 20:46:09 +0900 (KST)
In-reply-to: <1370933645-18344-2-git-send-email-rahul.sharma@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Rahul Sharma' <rahul.sharma@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, dri-devel@lists.freedesktop.org
Cc: kgene.kim@samsung.com, sw0312.kim@samsung.com, seanpaul@chromium.org, joshi@samsung.com, r.sh.open@gmail.com

Applied.

Thanks,
Inki Dae

> -----Original Message-----
> From: Rahul Sharma [mailto:rahul.sharma@samsung.com]
> Sent: Tuesday, June 11, 2013 3:54 PM
> To: linux-samsung-soc@vger.kernel.org;
devicetree-discuss@lists.ozlabs.org;
> dri-devel@lists.freedesktop.org
> Cc: kgene.kim@samsung.com; sw0312.kim@samsung.com; inki.dae@samsung.com;
> seanpaul@chromium.org; joshi@samsung.com; r.sh.open@gmail.com; Rahul
> Sharma
> Subject: [PATCH 1/4] drm/exynos: Prepare/Unprepare HDMI subsystem clocks
> 
> From: Sean Paul <seanpaul@chromium.org>
> 
> Change the clk_enable/clk_disable calls in mixer and hdmi drivers into
> clk_prepare_enable/clk_disable_unprepare, respectively.
> 
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_hdmi.c  |   24 ++++++++++++------------
>  drivers/gpu/drm/exynos/exynos_mixer.c |   12 ++++++------
>  2 files changed, 18 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c
> b/drivers/gpu/drm/exynos/exynos_hdmi.c
> index 04255fe..5a98194 100644
> --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
> +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
> @@ -1117,9 +1117,9 @@ static void hdmi_v13_mode_apply(struct hdmi_context
> *hdata)
>  		hdmi_regs_dump(hdata, "timing apply");
>  	}
> 
> -	clk_disable(hdata->res.sclk_hdmi);
> +	clk_disable_unprepare(hdata->res.sclk_hdmi);
>  	clk_set_parent(hdata->res.sclk_hdmi, hdata->res.sclk_hdmiphy);
> -	clk_enable(hdata->res.sclk_hdmi);
> +	clk_prepare_enable(hdata->res.sclk_hdmi);
> 
>  	/* enable HDMI and timing generator */
>  	hdmi_reg_writemask(hdata, HDMI_CON_0, ~0, HDMI_EN);
> @@ -1284,9 +1284,9 @@ static void hdmi_v14_mode_apply(struct hdmi_context
> *hdata)
>  		hdmi_regs_dump(hdata, "timing apply");
>  	}
> 
> -	clk_disable(hdata->res.sclk_hdmi);
> +	clk_disable_unprepare(hdata->res.sclk_hdmi);
>  	clk_set_parent(hdata->res.sclk_hdmi, hdata->res.sclk_hdmiphy);
> -	clk_enable(hdata->res.sclk_hdmi);
> +	clk_prepare_enable(hdata->res.sclk_hdmi);
> 
>  	/* enable HDMI and timing generator */
>  	hdmi_reg_writemask(hdata, HDMI_CON_0, ~0, HDMI_EN);
> @@ -1310,9 +1310,9 @@ static void hdmiphy_conf_reset(struct hdmi_context
> *hdata)
>  	u8 buffer[2];
>  	u32 reg;
> 
> -	clk_disable(hdata->res.sclk_hdmi);
> +	clk_disable_unprepare(hdata->res.sclk_hdmi);
>  	clk_set_parent(hdata->res.sclk_hdmi, hdata->res.sclk_pixel);
> -	clk_enable(hdata->res.sclk_hdmi);
> +	clk_prepare_enable(hdata->res.sclk_hdmi);
> 
>  	/* operation mode */
>  	buffer[0] = 0x1f;
> @@ -1701,9 +1701,9 @@ static void hdmi_poweron(struct hdmi_context *hdata)
>  	if (regulator_bulk_enable(res->regul_count, res->regul_bulk))
>  		DRM_DEBUG_KMS("failed to enable regulator bulk\n");
> 
> -	clk_enable(res->hdmiphy);
> -	clk_enable(res->hdmi);
> -	clk_enable(res->sclk_hdmi);
> +	clk_prepare_enable(res->hdmiphy);
> +	clk_prepare_enable(res->hdmi);
> +	clk_prepare_enable(res->sclk_hdmi);
> 
>  	hdmiphy_poweron(hdata);
>  }
> @@ -1726,9 +1726,9 @@ static void hdmi_poweroff(struct hdmi_context
*hdata)
>  	hdmiphy_conf_reset(hdata);
>  	hdmiphy_poweroff(hdata);
> 
> -	clk_disable(res->sclk_hdmi);
> -	clk_disable(res->hdmi);
> -	clk_disable(res->hdmiphy);
> +	clk_disable_unprepare(res->sclk_hdmi);
> +	clk_disable_unprepare(res->hdmi);
> +	clk_disable_unprepare(res->hdmiphy);
>  	regulator_bulk_disable(res->regul_count, res->regul_bulk);
> 
>  	mutex_lock(&hdata->hdmi_mutex);
> diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c
> b/drivers/gpu/drm/exynos/exynos_mixer.c
> index b0882b3..978894e 100644
> --- a/drivers/gpu/drm/exynos/exynos_mixer.c
> +++ b/drivers/gpu/drm/exynos/exynos_mixer.c
> @@ -900,10 +900,10 @@ static void mixer_poweron(struct mixer_context *ctx)
>  	ctx->powered = true;
>  	mutex_unlock(&ctx->mixer_mutex);
> 
> -	clk_enable(res->mixer);
> +	clk_prepare_enable(res->mixer);
>  	if (ctx->vp_enabled) {
> -		clk_enable(res->vp);
> -		clk_enable(res->sclk_mixer);
> +		clk_prepare_enable(res->vp);
> +		clk_prepare_enable(res->sclk_mixer);
>  	}
> 
>  	mixer_reg_write(res, MXR_INT_EN, ctx->int_en);
> @@ -927,10 +927,10 @@ static void mixer_poweroff(struct mixer_context
*ctx)
> 
>  	ctx->int_en = mixer_reg_read(res, MXR_INT_EN);
> 
> -	clk_disable(res->mixer);
> +	clk_disable_unprepare(res->mixer);
>  	if (ctx->vp_enabled) {
> -		clk_disable(res->vp);
> -		clk_disable(res->sclk_mixer);
> +		clk_disable_unprepare(res->vp);
> +		clk_disable_unprepare(res->sclk_mixer);
>  	}
> 
>  	mutex_lock(&ctx->mixer_mutex);
> --
> 1.7.10.4
