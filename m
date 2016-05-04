From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH 3/6] drm/exynos/hdmi: expose HDMI-PHY clock as pipeline
 clock
Date: Wed, 4 May 2016 11:52:10 +0200
Message-ID: <5729C64A.3020708@samsung.com>
References: <1458739562-32327-1-git-send-email-a.hajda@samsung.com>
 <1458739562-32327-4-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from plane.gmane.org ([80.91.229.3]:60585 "EHLO plane.gmane.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756985AbcEDJw1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 4 May 2016 05:52:27 -0400
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <glks-linux-samsung-soc@m.gmane.org>)
	id 1axtTm-0005Mw-1u
	for linux-samsung-soc@vger.kernel.org; Wed, 04 May 2016 11:52:26 +0200
Received: from 217-67-201-162.itsa.net.pl ([217.67.201.162])
        by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 May 2016 11:52:26 +0200
Received: from a.hajda by 217-67-201-162.itsa.net.pl with local (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 May 2016 11:52:26 +0200
In-Reply-To: <1458739562-32327-4-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org

Hi Inki,

It looks like this patch felt through the cracks.
It is a part of "drm/exynos: add pipeline clock support" patchset.
Other patches from the patchset were taken already.
Could you queue it to next pull request?

Regards
Andrzej

On 03/23/2016 02:25 PM, Andrzej Hajda wrote:
> HDMI-PHY clock should be accessible from other components in the pipeline.
> 
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_hdmi.c | 67 ++++++++++++++++++++++++++----------
>  1 file changed, 48 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
> index 49a5902..0d1c2f0 100644
> --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
> +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
> @@ -146,6 +146,7 @@ struct hdmi_context {
>  	struct clk			**clk_muxes;
>  	struct regulator_bulk_data	regul_bulk[ARRAY_SIZE(supply)];
>  	struct regulator		*reg_hdmi_en;
> +	struct exynos_drm_clk		phy_clk;
>  };
>  
>  static inline struct hdmi_context *encoder_to_hdmi(struct drm_encoder *e)
> @@ -1448,7 +1449,6 @@ static void hdmiphy_conf_apply(struct hdmi_context *hdata)
>  
>  static void hdmi_conf_apply(struct hdmi_context *hdata)
>  {
> -	hdmiphy_conf_apply(hdata);
>  	hdmi_start(hdata, false);
>  	hdmi_conf_init(hdata);
>  	hdmi_audio_init(hdata);
> @@ -1481,10 +1481,8 @@ static void hdmi_set_refclk(struct hdmi_context *hdata, bool on)
>  			   SYSREG_HDMI_REFCLK_INT_CLK, on ? ~0 : 0);
>  }
>  
> -static void hdmi_enable(struct drm_encoder *encoder)
> +static void hdmiphy_enable(struct hdmi_context *hdata)
>  {
> -	struct hdmi_context *hdata = encoder_to_hdmi(encoder);
> -
>  	if (hdata->powered)
>  		return;
>  
> @@ -1500,11 +1498,40 @@ static void hdmi_enable(struct drm_encoder *encoder)
>  
>  	hdmi_reg_writemask(hdata, HDMI_PHY_CON_0, 0, HDMI_PHY_POWER_OFF_EN);
>  
> -	hdmi_conf_apply(hdata);
> +	hdmiphy_conf_apply(hdata);
>  
>  	hdata->powered = true;
>  }
>  
> +static void hdmiphy_disable(struct hdmi_context *hdata)
> +{
> +	if (!hdata->powered)
> +		return;
> +
> +	hdmi_reg_writemask(hdata, HDMI_CON_0, 0, HDMI_EN);
> +
> +	hdmi_reg_writemask(hdata, HDMI_PHY_CON_0, ~0, HDMI_PHY_POWER_OFF_EN);
> +
> +	hdmi_set_refclk(hdata, false);
> +
> +	regmap_update_bits(hdata->pmureg, PMU_HDMI_PHY_CONTROL,
> +			PMU_HDMI_PHY_ENABLE_BIT, 0);
> +
> +	regulator_bulk_disable(ARRAY_SIZE(supply), hdata->regul_bulk);
> +
> +	pm_runtime_put_sync(hdata->dev);
> +
> +	hdata->powered = false;
> +}
> +
> +static void hdmi_enable(struct drm_encoder *encoder)
> +{
> +	struct hdmi_context *hdata = encoder_to_hdmi(encoder);
> +
> +	hdmiphy_enable(hdata);
> +	hdmi_conf_apply(hdata);
> +}
> +
>  static void hdmi_disable(struct drm_encoder *encoder)
>  {
>  	struct hdmi_context *hdata = encoder_to_hdmi(encoder);
> @@ -1528,22 +1555,9 @@ static void hdmi_disable(struct drm_encoder *encoder)
>  	if (funcs && funcs->disable)
>  		(*funcs->disable)(crtc);
>  
> -	hdmi_reg_writemask(hdata, HDMI_CON_0, 0, HDMI_EN);
> -
>  	cancel_delayed_work(&hdata->hotplug_work);
>  
> -	hdmi_reg_writemask(hdata, HDMI_PHY_CON_0, ~0, HDMI_PHY_POWER_OFF_EN);
> -
> -	hdmi_set_refclk(hdata, false);
> -
> -	regmap_update_bits(hdata->pmureg, PMU_HDMI_PHY_CONTROL,
> -			PMU_HDMI_PHY_ENABLE_BIT, 0);
> -
> -	regulator_bulk_disable(ARRAY_SIZE(supply), hdata->regul_bulk);
> -
> -	pm_runtime_put_sync(hdata->dev);
> -
> -	hdata->powered = false;
> +	hdmiphy_disable(hdata);
>  }
>  
>  static const struct drm_encoder_helper_funcs exynos_hdmi_encoder_helper_funcs = {
> @@ -1627,6 +1641,17 @@ static int hdmi_clk_init(struct hdmi_context *hdata)
>  	return hdmi_clks_get(hdata, &drv_data->clk_muxes, hdata->clk_muxes);
>  }
>  
> +static void hdmiphy_clk_enable(struct exynos_drm_clk *clk, bool enable)
> +{
> +	struct hdmi_context *hdata = container_of(clk, struct hdmi_context,
> +						  phy_clk);
> +
> +	if (enable)
> +		hdmiphy_enable(hdata);
> +	else
> +		hdmiphy_disable(hdata);
> +}
> +
>  static int hdmi_resources_init(struct hdmi_context *hdata)
>  {
>  	struct device *dev = hdata->dev;
> @@ -1710,6 +1735,10 @@ static int hdmi_bind(struct device *dev, struct device *master, void *data)
>  	if (pipe < 0)
>  		return pipe;
>  
> +	hdata->phy_clk.enable = hdmiphy_clk_enable;
> +
> +	exynos_drm_crtc_from_pipe(drm_dev, pipe)->pipe_clk = &hdata->phy_clk;
> +
>  	encoder->possible_crtcs = 1 << pipe;
>  
>  	DRM_DEBUG_KMS("possible_crtcs = 0x%x\n", encoder->possible_crtcs);
> 
