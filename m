From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [alsa-devel] [PATCH v4 4/4] ASoC: samsung: Add machine driver for
 Exynos5433 based TM2 board
Date: Mon, 25 Jul 2016 16:20:18 +0200
Message-ID: <57962022.6020808@samsung.com>
References: <1467738877-31555-1-git-send-email-s.nawrocki@samsung.com>
 <20160722095115.GB8680@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:60291 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752449AbcGYOU1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 25 Jul 2016 10:20:27 -0400
In-reply-to: <20160722095115.GB8680@localhost.localdomain>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Cc: robh@kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-kernel@vger.kernel.org, inki.dae@samsung.com, devicetree@vger.kernel.org, broonie@kernel.org, ideal.song@samsung.com

On 07/22/2016 11:51 AM, Charles Keepax wrote:
> On Tue, Jul 05, 2016 at 07:14:37PM +0200, Sylwester Nawrocki wrote:
>> This patch adds the sound machine driver for TM2 and TM2E board.
>> Speaker and headphone playback, Main Mic capture, Bluetooth,
>> Voice call and external accessory are supported.
>>
>> Signed-off-by: Inha Song <ideal.song@samsung.com>
>> [k.kozlowski: rebased on 4.1]
>> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>> [s.nawrocki: rebased to 4.7, adjustment to the ASoC core changes,
>>  removed unused ops and direct calls to the max98504 function,
>>  added parsing of "audio-amplifier" and "audio-codec"
>>  properties, added TDM API calls, switched to gpiod API]
>> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

> 
> Apologies for my late response I had missed this.

Thanks a lot for your comments, this missed the 4.8 merge window
anyway.

> <snip>
>> +static int tm2_start_sysclk(struct snd_soc_card *card)
>> +{
>> +	struct tm2_machine_priv *priv = snd_soc_card_get_drvdata(card);
>> +	struct snd_soc_codec *codec = priv->codec;
>> +	unsigned long mclk_rate = clk_get_rate(priv->codec_mclk1);
>> +	int ret;
>> +
>> +	ret = clk_prepare_enable(priv->codec_mclk1);
>> +	if (ret < 0) {
>> +		dev_err(card->dev, "Failed to enable mclk: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	ret = snd_soc_codec_set_pll(codec, WM5110_FLL1,
>> +				    ARIZONA_FLL_SRC_MCLK1,
>> +				    mclk_rate,
>> +				    priv->sysclk_rate);
>> +	if (ret < 0) {
>> +		dev_err(codec->dev, "Failed to start FLL: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	ret = snd_soc_codec_set_pll(codec, WM5110_FLL1_REFCLK,
>> +				    ARIZONA_FLL_SRC_MCLK1,
>> +				    mclk_rate,
>> +				    priv->sysclk_rate);
>> +	if (ret < 0) {
>> +		dev_err(codec->dev, "Failed to set FLL1 Source: %d\n", ret);
>> +		return ret;
>> +	}
> 
> It would be better to set the REFCLK first. Setting WM5110_FLL1
> actually enables the FLL, where as setting WM5110_FLL1_REFCKL
> doesn't. So doing it this way round the first time you bring
> up the FLL it will enable it then reconfigure the reference
> path. Doing it the other way round it will always enable first
> time with the correct settings.

OK, thanks for the hint, I will reorder this.


>> +static int tm2_aif1_hw_params(struct snd_pcm_substream *substream,
>> +				struct snd_pcm_hw_params *params)
>> +{

>> +
>> +	ret = snd_soc_dai_set_sysclk(codec_dai, ARIZONA_CLK_SYSCLK, 0, 0);
>> +	if (ret < 0) {
>> +		dev_err(codec_dai->dev, "Failed to set SYSCLK: %d\n", ret);
>> +		return ret;
>> +	}
> 
> If there is no intention to change which clocking domain the DAI
> is attached to I would put this in late probe, although it does
> no harm here and if that might get added in the future then here
> is better.

If the clocking arrangement ever needs to be changed the call could
be added here again, I will move it to late_probe.

>> +	return tm2_start_sysclk(rtd->card);
>> +}
>> +
>> +static struct snd_soc_ops tm2_aif1_ops = {
>> +	.hw_params = tm2_aif1_hw_params,
>> +};
>> +
>> +static int tm2_aif2_hw_params(struct snd_pcm_substream *substream,
>> +				struct snd_pcm_hw_params *params)
>> +{

>> +	ret = snd_soc_codec_set_pll(codec, WM5110_FLL2,
>> +				    ARIZONA_FLL_SRC_MCLK1,
>> +				    mclk_rate,
>> +				    asyncclk_rate);
>> +	if (ret < 0) {
>> +		dev_err(codec->dev, "Failed to start FLL: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	ret = snd_soc_codec_set_pll(codec, WM5110_FLL2_REFCLK,
>> +				    ARIZONA_FLL_SRC_MCLK1,
>> +				    mclk_rate,
>> +				    asyncclk_rate);
>> +	if (ret < 0) {
>> +		dev_err(codec->dev, "Failed to set FLL1 Source: %d\n", ret);
>> +		return ret;
>> +	}
> 
> Again as before I would set the REFCLK path first on the FLL.
> 
> Also nothing ever turns FLL2 off again here. I would either turn
> it off again in set_bias level or add a free callback into
> tm2_aif2_ops, probably adding a free callback matches the usage
> of this clock better I would guess.

hw_free sounds like a good option, I'll add it to ensure the WM5110_FLL2
clock is disabled when not in use.

>> +static int tm2_set_bias_level(struct snd_soc_card *card,
>> +				struct snd_soc_dapm_context *dapm,
>> +				enum snd_soc_bias_level level)
>> +{

>> +
>> +	card->dapm.bias_level = level;
> 
> I believe the core does this for you these days.

Indeed, I had missed that, I'll drop this assignment.

>> +static int tm2_suspend_post(struct snd_soc_card *card)
>> +{
>> +	return tm2_stop_sysclk(card);
> 
> I think you can't really do this from these callbacks, the
> trouble is suspend_post is called from snd_soc_suspend which is
> set as the suspend callback in snd_soc_pm_ops. So when this is
> called you don't actually know if the SPI has already suspended
> or not, if it hasn't things will work but if the SPI has already
> suspended then this falls over.
> 
> A better solution would be to define a local copy of
> snd_soc_pm_ops with this functions set as the prepare and
> complete callbacks the other callbacks set as snd_soc_pm_ops sets
> them. These callback will run before anything is suspended and
> after everything has been resumed.

Agreed, dependency on the SPI controller seems to be not modelled and
it looks like it is working by chance now.  I will try to use prepare/
complete callback until better options are available.

-- 
Thanks,
Sylwester
