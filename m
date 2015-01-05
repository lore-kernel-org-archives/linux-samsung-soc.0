From: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Subject: Re: [alsa-devel] [PATCH 1/3] ASoC: samsung: Add machine driver for
 Trats2
Date: Mon, 05 Jan 2015 12:48:27 +0100
Message-ID: <54AA7A0B.2070004@metafoo.de>
References: <1420457117-11030-1-git-send-email-ideal.song@samsung.com> <1420457117-11030-2-git-send-email-ideal.song@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1420457117-11030-2-git-send-email-ideal.song-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Inha Song <ideal.song-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, sbkim73-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, tiwai-l3A5Bk7waGM@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

A few small comments inline.

On 01/05/2015 12:25 PM, Inha Song wrote:
> --- /dev/null
> +++ b/sound/soc/samsung/trats2_wm1811.c
> @@ -0,0 +1,216 @@
>[...]
> +#include <linux/of.h>
> +#include <linux/module.h>
> +#include <linux/clk.h>
> +#include <sound/soc.h>
> +#include <sound/pcm_params.h>
> +#include "i2s.h"
> +#include "i2s-regs.h"

You probably don't need i2s-regs.h

> +#include "../codecs/wm8994.h"
> +
> +struct trats2_machine_priv {
> +	struct clk *clk_mclk;
> +};
> +
> +static struct trats2_machine_priv trats2_wm1811_priv;
> +
> +static const struct snd_kcontrol_new trats2_controls[] = {
> +	SOC_DAPM_PIN_SWITCH("SPK"),
> +};
> +
> +const struct snd_soc_dapm_widget trats2_dapm_widgets[] = {

static

> +	SND_SOC_DAPM_SPK("SPK", NULL),
> +};
> +
> +static int trats2_aif1_hw_params(struct snd_pcm_substream *substream,
> +				 struct snd_pcm_hw_params *params)
> +{
> +	struct snd_soc_pcm_runtime *rtd = substream->private_data;
> +	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
> +	struct snd_soc_dai *codec_dai = rtd->codec_dai;
> +	struct trats2_machine_priv *priv = snd_soc_card_get_drvdata(rtd->card);
> +	unsigned int sysclk_rate;
> +	unsigned int mclk_rate =
> +			(unsigned int)clk_get_rate(priv->clk_mclk);
> +	int ret;
> +
> +	/* Set the codec DAI configuration to Master*/
> +	ret = snd_soc_dai_set_fmt(codec_dai, SND_SOC_DAIFMT_I2S
> +					| SND_SOC_DAIFMT_NB_NF
> +					| SND_SOC_DAIFMT_CBM_CFM);
> +	if (ret < 0) {
> +		dev_err(codec_dai->dev,
> +			"Failed to set codec dai format: %d\n", ret);
> +		return ret;
> +	}
> +
> +	/* Set the cpu DAI configuration to Slave */
> +	ret = snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_I2S
> +					| SND_SOC_DAIFMT_NB_NF
> +					| SND_SOC_DAIFMT_CBM_CFM);
> +	if (ret < 0) {
> +		dev_err(cpu_dai->dev,
> +			"Failed to set cpu dai format: %d\n", ret);
> +		return ret;
> +	}


Use the dai_fmt field in the dai_link struct to setup the DAI link format. 
This will configure both the CPU and the CODEC DAI with the specified 
format, no need to do it manually.

>[...]
> +static struct snd_soc_ops trats2_aif1_ops = {

const

> +	.hw_params = trats2_aif1_hw_params,
> +};
> +
> +static int trats2_init_paiftx(struct snd_soc_pcm_runtime *rtd)
> +{
> +	struct snd_soc_codec *codec = rtd->codec;
> +	struct snd_soc_card *card = rtd->card;
> +	struct trats2_machine_priv *priv = snd_soc_card_get_drvdata(card);
> +	int ret;
> +
> +	ret = clk_prepare_enable(priv->clk_mclk);

Maybe just do this in the platform device probe handler and you should have 
a matching disable call somewhere.

> +	if (ret) {
> +		dev_err(codec->dev, "Failed to enable mclk: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
>[...]
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
