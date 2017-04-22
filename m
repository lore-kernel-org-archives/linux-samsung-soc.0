From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH RFC 4/7] drm: exynos: Add driver for HDMI audio interface
Date: Sat, 22 Apr 2017 17:31:26 +0200
Message-ID: <20170422153126.jqfcm5ja2m6pyrgz@kozik-lap>
References: <1492795191-31298-1-git-send-email-s.nawrocki@samsung.com>
 <CGME20170421172034epcas5p1dafc1794a7649ec30053f7f62d1831e5@epcas5p1.samsung.com>
 <1492795191-31298-5-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:32847 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1424976AbdDVPbb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 22 Apr 2017 11:31:31 -0400
Content-Disposition: inline
In-Reply-To: <1492795191-31298-5-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, inki.dae@samsung.com, sw0312.kim@samsung.com, cw00.choi@samsung.com, javier@osg.samsung.com, jy0922.shim@samsung.com, broonie@kernel.org, robh+dt@kernel.org, b.zolnierkie@samsung.com

On Fri, Apr 21, 2017 at 07:19:48PM +0200, Sylwester Nawrocki wrote:
> The hdmi-codec interface added in this patch is required to properly
> support HDMI audio. Currently the audio part of the SoC internal
> HDMI transmitter is configured with fixed values, which makes HDMI
> audio working by chance, only on boards equipped with external audio
> codec connected in parallel with the HDMI audio transmitter I2S input
> interface.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  drivers/gpu/drm/exynos/Kconfig       |   1 +
>  drivers/gpu/drm/exynos/exynos_hdmi.c | 220 +++++++++++++++++++++++++++++------
>  2 files changed, 188 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/Kconfig
> index 1d18534..a6edbb6 100644
> --- a/drivers/gpu/drm/exynos/Kconfig
> +++ b/drivers/gpu/drm/exynos/Kconfig
> @@ -3,6 +3,7 @@ config DRM_EXYNOS
>  	depends on OF && DRM && (ARCH_S3C64XX || ARCH_EXYNOS || ARCH_MULTIPLATFORM)
>  	select DRM_KMS_HELPER
>  	select VIDEOMODE_HELPERS
> +	select SND_SOC_HDMI_CODEC if SND_SOC
>  	help
>  	  Choose this option if you have a Samsung SoC EXYNOS chipset.
>  	  If M is selected the module will be called exynosdrm.
> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
> index 88ccc04..be18023 100644
> --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
> +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
> @@ -40,7 +40,7 @@
>  #include <linux/component.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/regmap.h>
> -
> +#include <sound/hdmi-codec.h>
>  #include <drm/exynos_drm.h>
>  
>  #include "exynos_drm_drv.h"
> @@ -110,13 +110,23 @@ struct hdmi_driver_data {
>  	struct string_array_spec clk_muxes;
>  };
>  
> +struct hdmi_audio {
> +	struct platform_device *pdev;
> +	struct hdmi_audio_infoframe infoframe;
> +	unsigned int sample_rate;
> +	unsigned int sample_width;
> +	u8 enable;
> +};
> +
>  struct hdmi_context {
>  	struct drm_encoder		encoder;
>  	struct device			*dev;
>  	struct drm_device		*drm_dev;
>  	struct drm_connector		connector;
> +	struct hdmi_audio		audio;
>  	bool				powered;
>  	bool				dvi_mode;
> +	struct mutex			mutex;

I find short documentation what is protected by mutex usually quite
useful. Can you add such?

>  	struct delayed_work		hotplug_work;
>  	struct drm_display_mode		current_mode;
>  	const struct hdmi_driver_data	*drv_data;
> @@ -766,6 +776,22 @@ static int hdmi_clk_set_parents(struct hdmi_context *hdata, bool to_phy)
>  	return ret;
>  }
>  
> +static int hdmi_audio_infoframe_apply(struct hdmi_context *hdata)
> +{
> +	struct hdmi_audio_infoframe *infoframe = &hdata->audio.infoframe;
> +	u8 buf[HDMI_INFOFRAME_SIZE(AUDIO)];
> +	int len;
> +
> +	len = hdmi_audio_infoframe_pack(infoframe, buf, sizeof(buf));
> +	if (len < 0)
> +		return len;
> +
> +	hdmi_reg_writeb(hdata, HDMI_AUI_CON, HDMI_AUI_CON_EVERY_VSYNC);
> +	hdmi_reg_write_buf(hdata, HDMI_AUI_HEADER0, buf, len);
> +
> +	return 0;
> +}
> +
>  static void hdmi_reg_infoframes(struct hdmi_context *hdata)
>  {
>  	union hdmi_infoframe frm;
> @@ -803,15 +829,7 @@ static void hdmi_reg_infoframes(struct hdmi_context *hdata)
>  		hdmi_reg_write_buf(hdata, HDMI_VSI_DATA(0), buf + 3, ret - 3);
>  	}
>  
> -	ret = hdmi_audio_infoframe_init(&frm.audio);
> -	if (!ret) {
> -		frm.audio.channels = 2;
> -		ret = hdmi_audio_infoframe_pack(&frm.audio, buf, sizeof(buf));
> -	}
> -	if (ret > 0) {
> -		hdmi_reg_writeb(hdata, HDMI_AUI_CON, HDMI_AUI_CON_EVERY_VSYNC);
> -		hdmi_reg_write_buf(hdata, HDMI_AUI_HEADER0, buf, ret);
> -	}
> +	hdmi_audio_infoframe_apply(hdata);
>  }
>  
>  static enum drm_connector_status hdmi_detect(struct drm_connector *connector,
> @@ -993,23 +1011,18 @@ static void hdmi_reg_acr(struct hdmi_context *hdata, u32 freq)
>  	hdmi_reg_writeb(hdata, HDMI_ACR_CON, 4);
>  }
>  
> -static void hdmi_audio_init(struct hdmi_context *hdata)
> +static void hdmi_audio_config(struct hdmi_context *hdata)
>  {
> -	u32 sample_rate, bits_per_sample;
> -	u32 data_num, bit_ch, sample_frq;
> -	u32 val;
> +	u32 data_num, sample_freq, val;
> +	u32 bit_ch = 1;
>  
> -	sample_rate = 44100;
> -	bits_per_sample = 16;
>  
> -	switch (bits_per_sample) {
> +	switch (hdata->audio.sample_width) {
>  	case 20:
>  		data_num = 2;
> -		bit_ch = 1;
>  		break;
>  	case 24:
>  		data_num = 3;
> -		bit_ch = 1;
>  		break;
>  	default:
>  		data_num = 1;
> @@ -1017,7 +1030,7 @@ static void hdmi_audio_init(struct hdmi_context *hdata)
>  		break;
>  	}
>  
> -	hdmi_reg_acr(hdata, sample_rate);
> +	hdmi_reg_acr(hdata, hdata->audio.sample_rate);
>  
>  	hdmi_reg_writeb(hdata, HDMI_I2S_MUX_CON, HDMI_I2S_IN_DISABLE
>  				| HDMI_I2S_AUD_I2S | HDMI_I2S_CUV_I2S_ENABLE
> @@ -1028,10 +1041,21 @@ static void hdmi_audio_init(struct hdmi_context *hdata)
>  
>  	hdmi_reg_writeb(hdata, HDMI_I2S_MUX_CUV, HDMI_I2S_CUV_RL_EN);
>  
> -	sample_frq = (sample_rate == 44100) ? 0 :
> -			(sample_rate == 48000) ? 2 :
> -			(sample_rate == 32000) ? 3 :
> -			(sample_rate == 96000) ? 0xa : 0x0;
> +	switch(hdata->audio.sample_rate) {
> +	case 32000:
> +		sample_freq = 0x3;
> +		break;
> +	case 48000:
> +		sample_freq = 0x2;
> +		break;
> +	case 96000:
> +		sample_freq = 0xa;
> +		break;
> +	case 44100:
> +	default:
> +		sample_freq = 0;
> +		break;
> +	}
>  
>  	hdmi_reg_writeb(hdata, HDMI_I2S_CLK_CON, HDMI_I2S_CLK_DIS);
>  	hdmi_reg_writeb(hdata, HDMI_I2S_CLK_CON, HDMI_I2S_CLK_EN);
> @@ -1065,7 +1089,7 @@ static void hdmi_audio_init(struct hdmi_context *hdata)
>  	hdmi_reg_writeb(hdata, HDMI_I2S_CH_ST_1, HDMI_I2S_CD_PLAYER);
>  	hdmi_reg_writeb(hdata, HDMI_I2S_CH_ST_2, HDMI_I2S_SET_SOURCE_NUM(0));
>  	hdmi_reg_writeb(hdata, HDMI_I2S_CH_ST_3, HDMI_I2S_CLK_ACCUR_LEVEL_2
> -			| HDMI_I2S_SET_SMP_FREQ(sample_frq));
> +			| HDMI_I2S_SET_SMP_FREQ(sample_freq));
>  	hdmi_reg_writeb(hdata, HDMI_I2S_CH_ST_4,
>  			HDMI_I2S_ORG_SMP_FREQ_44_1
>  			| HDMI_I2S_WORD_LEN_MAX24_24BITS
> @@ -1074,13 +1098,15 @@ static void hdmi_audio_init(struct hdmi_context *hdata)
>  	hdmi_reg_writeb(hdata, HDMI_I2S_CH_ST_CON, HDMI_I2S_CH_STATUS_RELOAD);
>  }
>  
> -static void hdmi_audio_control(struct hdmi_context *hdata, bool onoff)
> +static void hdmi_audio_control(struct hdmi_context *hdata)
>  {
> +	bool enable = hdata->audio.enable;
> +
>  	if (hdata->dvi_mode)
>  		return;
>  
> -	hdmi_reg_writeb(hdata, HDMI_AUI_CON, onoff ? 2 : 0);
> -	hdmi_reg_writemask(hdata, HDMI_CON_0, onoff ?
> +	hdmi_reg_writeb(hdata, HDMI_AUI_CON, enable ? 2 : 0);
> +	hdmi_reg_writemask(hdata, HDMI_CON_0, enable ?
>  			HDMI_ASP_EN : HDMI_ASP_DIS, HDMI_ASP_MASK);
>  }
>  
> @@ -1400,9 +1426,9 @@ static void hdmi_conf_apply(struct hdmi_context *hdata)
>  {
>  	hdmi_start(hdata, false);
>  	hdmi_conf_init(hdata);
> -	hdmi_audio_init(hdata);
> +	hdmi_audio_config(hdata);
>  	hdmi_mode_apply(hdata);
> -	hdmi_audio_control(hdata, true);
> +	hdmi_audio_control(hdata);
>  }
>  
>  static void hdmi_mode_set(struct drm_encoder *encoder,
> @@ -1476,8 +1502,12 @@ static void hdmi_enable(struct drm_encoder *encoder)
>  {
>  	struct hdmi_context *hdata = encoder_to_hdmi(encoder);
>  
> +	mutex_lock(&hdata->mutex);
> +
>  	hdmiphy_enable(hdata);
>  	hdmi_conf_apply(hdata);
> +
> +	mutex_unlock(&hdata->mutex);
>  }
>  
>  static void hdmi_disable(struct drm_encoder *encoder)
> @@ -1486,6 +1516,8 @@ static void hdmi_disable(struct drm_encoder *encoder)
>  	struct drm_crtc *crtc = encoder->crtc;
>  	const struct drm_crtc_helper_funcs *funcs = NULL;
>  
> +	mutex_lock(&hdata->mutex);
> +
>  	if (!hdata->powered)

Need to unlock mutex (here and maybe in other exit paths?).


Best regards,
Krzysztof
