From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: Re: [alsa-devel] [PATCH v5 2/2] ASoC: samsung: Add machine driver
 for Exynos5433 based TM2 board
Date: Mon, 29 Aug 2016 16:02:51 +0100
Message-ID: <20160829150251.GU21682@localhost.localdomain>
References: <1470752514-11409-1-git-send-email-s.nawrocki@samsung.com>
 <1470752514-11409-2-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168]:45023 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1757440AbcH2PIG (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 29 Aug 2016 11:08:06 -0400
Content-Disposition: inline
In-Reply-To: <1470752514-11409-2-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: broonie@kernel.org, devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com, k.kozlowski@samsung.com, Inha Song <ideal.song@samsung.com>

On Tue, Aug 09, 2016 at 04:21:54PM +0200, Sylwester Nawrocki wrote:
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
> 
> Changes since v4 (addressing review comments from Charles):
>  - changed the order of WM5110_FLL{1,2}, WM5110_FLL{1,2}_REFCLK setting,
>  - ARIZONA_CLK_SYSCLK, ARIZONA_CLK_ASYNCCLK setting moved to late_probe,
>  - added tm2_aif2_hw_free callback for disabling FLL2,
>  - removed unneded card->dapm.bias_level assignment in tm2_mic_bias callback,
>  - suspend_late, resume_early dev_pm_ops used instead of suspend_post,
>    resume_pre struct snd_soc_card callbacks.
> 
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
<snip>
> +static int tm2_suspend_late(struct device *dev)
> +{
> +	struct snd_soc_card *card = dev_get_drvdata(dev);
> +
> +	return tm2_stop_sysclk(card);
> +}
> +
> +static int tm2_resume_early(struct device *dev)
> +{
> +	struct snd_soc_card *card = dev_get_drvdata(dev);
> +
> +	return tm2_start_sysclk(card);
> +}
> +
> +const struct dev_pm_ops tm2_pm_ops = {
> +	.suspend	= snd_soc_suspend,
> +	.suspend_late	= tm2_suspend_late,
> +	.resume		= snd_soc_resume,
> +	.resume_early	= tm2_resume_early,
> +	.freeze		= snd_soc_suspend,
> +	.thaw		= snd_soc_resume,
> +	.poweroff	= snd_soc_poweroff,
> +	.restore	= snd_soc_resume,
> +};

This bit still looks problematic to me, although admittedly I not
sure exactly why you don't seem to be hitting any issues with
it. Before you were effectively calling things from .suspend, now
its .suspend_late.  As we are now later in the suspend process
that means its even more likely the SPI will be unavailable when
we try to talk to the CODEC. You need to run before the SPI
has started suspending so you can still communicate with the
CODEC, I still think prepare/complete are likely to be the best
options for this, unless there are some complications there I
have missed.

Aside from that and the clock stuff we are already discussing
everything else looks totally fine to me.

Thanks,
Charles
