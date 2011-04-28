From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH V2 2/2] ASoC: SAMSUNG: Add WM8994 PCM Machine driver
Date: Thu, 28 Apr 2011 13:16:22 +0100
Message-ID: <20110428121621.GA9949@opensource.wolfsonmicro.com>
References: <1303954372-18565-1-git-send-email-sbkim73@samsung.com>
 <1303954372-18565-3-git-send-email-sbkim73@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:60642 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1754367Ab1D1MQZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 28 Apr 2011 08:16:25 -0400
Content-Disposition: inline
In-Reply-To: <1303954372-18565-3-git-send-email-sbkim73@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sangbeom Kim <sbkim73@samsung.com>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, jassisinghbrar@gmail.com, lrg@slimlogic.co.uk, kgene.kim@samsung.com, ben-linux@fluff.org

On Thu, Apr 28, 2011 at 10:32:52AM +0900, Sangbeom Kim wrote:

> +	/* Set the codec DAI configuration */
> +	ret = snd_soc_dai_set_fmt(codec_dai, SND_SOC_DAIFMT_DSP_B
> +				| SND_SOC_DAIFMT_IB_NF
> +				| SND_SOC_DAIFMT_CBS_CFS);
> +	if (ret < 0)
> +		return ret;

> +	/* Set the cpu DAI configuration */
> +	ret = snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_DSP_B
> +				| SND_SOC_DAIFMT_IB_NF
> +				| SND_SOC_DAIFMT_CBS_CFS);
> +	if (ret < 0)
> +		return ret;

> +	ret = snd_soc_dai_set_sysclk(codec_dai, WM8994_SYSCLK_FLL1,
> +					mclk_freq, SND_SOC_CLOCK_IN);
> +	if (ret < 0)
> +		return ret;

For optimal performance the CODEC AIFnCLK needs to be synchronous with
the audio interface clocks.  This means that you should either clock the
FLL from the CPU BCLK or you should make the CODEC master for the AIF.

> +static struct snd_soc_ops smdk_wm8994_pcm_ops = {
> +	.hw_params = smdk_wm8994_pcm_hw_params,
> +};

Note also that the FLL is never stopped in this system - this will not
be optimally power efficient.  It probably doesn't matter too much on
the reference board itself but on systems derived from it it would be an
issue.

> +static struct snd_soc_dai_link smdk_dai[] = {

> +static struct snd_soc_card smdk_pcm = {
> +	.name = "SMDK-PCM",
> +	.dai_link = smdk_dai,
> +	.num_links = 1,

Since the links are in an array using ARRAY_SIZE() would be better.

> +static int __init smdk_audio_init(void)
> +{
> +	return platform_driver_register(&snd_smdk_driver);
> +}
> +
> +module_init(smdk_audio_init);

Random blank line there.
