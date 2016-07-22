From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: Re: [alsa-devel] [PATCH v4 4/4] ASoC: samsung: Add machine driver
 for Exynos5433 based TM2 board
Date: Fri, 22 Jul 2016 10:51:15 +0100
Message-ID: <20160722095115.GB8680@localhost.localdomain>
References: <1467738877-31555-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1467738877-31555-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: broonie@kernel.org, robh@kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-kernel@vger.kernel.org, inki.dae@samsung.com, devicetree@vger.kernel.org, ideal.song@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Jul 05, 2016 at 07:14:37PM +0200, Sylwester Nawrocki wrote:
> This patch adds the sound machine driver for TM2 and TM2E board.
> Speaker and headphone playback, Main Mic capture, Bluetooth,
> Voice call and external accessory are supported.
> 
> Signed-off-by: Inha Song <ideal.song@samsung.com>
> [k.kozlowski: rebased on 4.1]
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> [s.nawrocki: rebased to 4.7, adjustment to the ASoC core changes,
>  removed unused ops and direct calls to the max98504 function,
>  added parsing of "audio-amplifier" and "audio-codec"
>  properties, added TDM API calls, switched to gpiod API]
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
> Changes since v3:
>  - removed SND_SOC_SAMSUNG_AUDSS from Kconfig.
> 
> Changes since v2:
>  - added missing Kconfig dependencies.
> 
> Changes since initial version:
>  - added PDM Tx channels setup through TDM API
>  - adaptation to renamed 'samsung,model', 'samsung,i2s-controller',
>    'samsung,speaker-amplifier' properties,
>  - removed some dev_dbg() calls,
>  - cleaned up mic-bias GPIO handling and switched to gpiod API,
>  - added parsing of 'audio-codec' property,
>  - initialized codec_of_node of dai_link instead of codec_name,
>  - switched to using clock, clock-names properties from the wm5110
>    codec node,
>  - fixed error paths in probe() (of_node reference counting).
> ---

Apologies for my late response I had missed this.

<snip>
> +static int tm2_start_sysclk(struct snd_soc_card *card)
> +{
> +	struct tm2_machine_priv *priv = snd_soc_card_get_drvdata(card);
> +	struct snd_soc_codec *codec = priv->codec;
> +	unsigned long mclk_rate = clk_get_rate(priv->codec_mclk1);
> +	int ret;
> +
> +	ret = clk_prepare_enable(priv->codec_mclk1);
> +	if (ret < 0) {
> +		dev_err(card->dev, "Failed to enable mclk: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = snd_soc_codec_set_pll(codec, WM5110_FLL1,
> +				    ARIZONA_FLL_SRC_MCLK1,
> +				    mclk_rate,
> +				    priv->sysclk_rate);
> +	if (ret < 0) {
> +		dev_err(codec->dev, "Failed to start FLL: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = snd_soc_codec_set_pll(codec, WM5110_FLL1_REFCLK,
> +				    ARIZONA_FLL_SRC_MCLK1,
> +				    mclk_rate,
> +				    priv->sysclk_rate);
> +	if (ret < 0) {
> +		dev_err(codec->dev, "Failed to set FLL1 Source: %d\n", ret);
> +		return ret;
> +	}

It would be better to set the REFCLK first. Setting WM5110_FLL1
actually enables the FLL, where as setting WM5110_FLL1_REFCKL
doesn't. So doing it this way round the first time you bring
up the FLL it will enable it then reconfigure the reference
path. Doing it the other way round it will always enable first
time with the correct settings.

> +
> +	ret = snd_soc_codec_set_sysclk(codec, ARIZONA_CLK_SYSCLK,
> +				       ARIZONA_CLK_SRC_FLL1,
> +				       priv->sysclk_rate,
> +				       SND_SOC_CLOCK_IN);
> +	if (ret < 0) {
> +		dev_err(codec->dev, "Failed to set SYSCLK Source: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
<snip>
> +static int tm2_aif1_hw_params(struct snd_pcm_substream *substream,
> +				struct snd_pcm_hw_params *params)
> +{
> +	struct snd_soc_pcm_runtime *rtd = substream->private_data;
> +	struct snd_soc_dai *codec_dai = rtd->codec_dai;
> +	struct snd_soc_codec *codec = rtd->codec;
> +	struct tm2_machine_priv *priv = snd_soc_card_get_drvdata(rtd->card);
> +	int ret;
> +
> +	switch (params_rate(params)) {
> +	case 4000:
> +	case 8000:
> +	case 12000:
> +	case 16000:
> +	case 24000:
> +	case 32000:
> +	case 48000:
> +	case 96000:
> +	case 192000:
> +		/* Highest possible SYSCLK frequency: 147.456MHz */
> +		priv->sysclk_rate = 147456000U;
> +		break;
> +	case 11025:
> +	case 22050:
> +	case 44100:
> +	case 88200:
> +	case 176400:
> +		/* Highest possible SYSCLK frequency: 135.4752 MHz */
> +		priv->sysclk_rate = 135475200U;
> +		break;
> +	default:
> +		dev_err(codec->dev, "Not supported sample rate: %d\n",
> +			params_rate(params));
> +		return -EINVAL;
> +	}
> +
> +	ret = snd_soc_dai_set_sysclk(codec_dai, ARIZONA_CLK_SYSCLK, 0, 0);
> +	if (ret < 0) {
> +		dev_err(codec_dai->dev, "Failed to set SYSCLK: %d\n", ret);
> +		return ret;
> +	}

If there is no intention to change which clocking domain the DAI
is attached to I would put this in late probe, although it does
no harm here and if that might get added in the future then here
is better.

> +
> +	return tm2_start_sysclk(rtd->card);
> +}
> +
> +static struct snd_soc_ops tm2_aif1_ops = {
> +	.hw_params = tm2_aif1_hw_params,
> +};
> +
> +static int tm2_aif2_hw_params(struct snd_pcm_substream *substream,
> +				struct snd_pcm_hw_params *params)
> +{
> +	struct snd_soc_pcm_runtime *rtd = substream->private_data;
> +	struct snd_soc_dai *codec_dai = rtd->codec_dai;
> +	struct snd_soc_codec *codec = rtd->codec;
> +	struct tm2_machine_priv *priv =	snd_soc_card_get_drvdata(rtd->card);
> +	unsigned long mclk_rate = clk_get_rate(priv->codec_mclk1);
> +	unsigned int asyncclk_rate;
> +	int ret;
> +
> +	switch (params_rate(params)) {
> +	case 8000:
> +	case 12000:
> +	case 16000:
> +		/* Highest possible ASYNCCLK frequency: 49.152MHz */
> +		asyncclk_rate = 49152000U;
> +		break;
> +	case 11025:
> +		/* Highest possible ASYNCCLK frequency: 45.1584 MHz */
> +		asyncclk_rate = 45158400U;
> +		break;
> +	default:
> +		dev_err(codec->dev, "Not supported sample rate: %d\n",
> +			params_rate(params));
> +		return -EINVAL;
> +	}
> +
> +	ret = snd_soc_codec_set_pll(codec, WM5110_FLL2,
> +				    ARIZONA_FLL_SRC_MCLK1,
> +				    mclk_rate,
> +				    asyncclk_rate);
> +	if (ret < 0) {
> +		dev_err(codec->dev, "Failed to start FLL: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = snd_soc_codec_set_pll(codec, WM5110_FLL2_REFCLK,
> +				    ARIZONA_FLL_SRC_MCLK1,
> +				    mclk_rate,
> +				    asyncclk_rate);
> +	if (ret < 0) {
> +		dev_err(codec->dev, "Failed to set FLL1 Source: %d\n", ret);
> +		return ret;
> +	}

Again as before I would set the REFCLK path first on the FLL.

Also nothing ever turns FLL2 off again here. I would either turn
it off again in set_bias level or add a free callback into
tm2_aif2_ops, probably adding a free callback matches the usage
of this clock better I would guess.

> +
> +	ret = snd_soc_dai_set_sysclk(codec_dai, ARIZONA_CLK_ASYNCCLK, 0, 0);
> +
> +	if (ret < 0) {
> +		dev_err(codec_dai->dev, "Failed to set ASYNCCLK: %d\n", ret);
> +		return ret;
> +	}

Again I would do from late probe.

> +
> +	ret = snd_soc_codec_set_sysclk(codec, ARIZONA_CLK_ASYNCCLK,
> +				       ARIZONA_CLK_SRC_FLL2,
> +				       asyncclk_rate,
> +				       SND_SOC_CLOCK_IN);
> +	if (ret < 0) {
> +		dev_err(codec->dev, "Failed to set ASYNCCLK Source: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static struct snd_soc_ops tm2_aif2_ops = {
> +	.hw_params = tm2_aif2_hw_params,
> +};
> +
<snip>
> +
> +static int tm2_set_bias_level(struct snd_soc_card *card,
> +				struct snd_soc_dapm_context *dapm,
> +				enum snd_soc_bias_level level)
> +{
> +	struct snd_soc_pcm_runtime *rtd;
> +
> +	rtd = snd_soc_get_pcm_runtime(card, card->dai_link[0].name);
> +
> +	if (dapm->dev != rtd->codec_dai->dev)
> +		return 0;
> +
> +	switch (level) {
> +	case SND_SOC_BIAS_STANDBY:
> +		if (card->dapm.bias_level == SND_SOC_BIAS_OFF)
> +			tm2_start_sysclk(card);
> +		break;
> +	case SND_SOC_BIAS_OFF:
> +		tm2_stop_sysclk(card);
> +		break;
> +	case SND_SOC_BIAS_PREPARE:
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	card->dapm.bias_level = level;

I believe the core does this for you these days.

> +
> +	return 0;
> +}
> +
<snip>
> +
> +static int tm2_suspend_post(struct snd_soc_card *card)
> +{
> +	return tm2_stop_sysclk(card);

I think you can't really do this from these callbacks, the
trouble is suspend_post is called from snd_soc_suspend which is
set as the suspend callback in snd_soc_pm_ops. So when this is
called you don't actually know if the SPI has already suspended
or not, if it hasn't things will work but if the SPI has already
suspended then this falls over.

A better solution would be to define a local copy of
snd_soc_pm_ops with this functions set as the prepare and
complete callbacks the other callbacks set as snd_soc_pm_ops sets
them. These callback will run before anything is suspended and
after everything has been resumed.

> +}
> +
> +static int tm2_resume_pre(struct snd_soc_card *card)
> +{
> +	return tm2_start_sysclk(card);

Same here with restore you don't know if the SPI has resumed yet
when this runs.

Thanks,
Charles
