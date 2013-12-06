From: Padma Venkat <padma.kvr@gmail.com>
Subject: Re: [alsa-devel] [PATCH 2/2] ASoC: samsung: Use ASoC dmaengine code
 where possible
Date: Fri, 6 Dec 2013 10:44:19 +0530
Message-ID: <CAAgF-Bfk8byZwVBd_5PopM3ji-wdTMR5i-J7w1W4zq4gFk4i+Q@mail.gmail.com>
References: <1386253559-18262-1-git-send-email-broonie@kernel.org>
	<1386253559-18262-2-git-send-email-broonie@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qe0-f44.google.com ([209.85.128.44]:54403 "EHLO
	mail-qe0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751051Ab3LFFOU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 6 Dec 2013 00:14:20 -0500
Received: by mail-qe0-f44.google.com with SMTP id nd7so163229qeb.17
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Dec 2013 21:14:19 -0800 (PST)
In-Reply-To: <1386253559-18262-2-git-send-email-broonie@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Padmavathi Venna <padma.v@samsung.com>, alsa-devel@alsa-project.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linaro-kernel@lists.linaro.org, Mark Brown <broonie@linaro.org>

Hi Mark,

On Thu, Dec 5, 2013 at 7:55 PM, Mark Brown <broonie@kernel.org> wrote:
> From: Mark Brown <broonie@linaro.org>
>
> Since all Exynos platforms have been converted to dmaengine and many of
> the older platforms are in the process of conversion they do not need to
> use the legacy s3c-dma APIs for DMA but can instead use the standard ASoC
> dmaengine helpers. This both allows them to benefit from improvements
> implemented in the generic code and supports multiplatform.
>
> This patch includes some fixes from Padma for Exynos SoCs.
>
> Signed-off-by: Mark Brown <broonie@linaro.org>
> Tested By: Padmavathi Venna <padma.v@samsung.com>
> ---
>
> I think this should reflect all your testing but a recheck would be good.

I couldn't test this patch set due to some crash in recent kernel in
dmaengine_unmap_put. I think this unmap support is not yet implemented
for pl330 driver. It is mentioned in the commit "dmaengine: prepare
for generic 'unmap' data", [bzolnier: prepare pl330 driver for adding
missing unmap while at it].


[snip]

> +
> +int samsung_asoc_dma_platform_register(struct device *dev)
> +{
> +       return snd_dmaengine_pcm_register(dev, &samsung_dmaengine_pcm_config,
> +                                         SND_DMAENGINE_PCM_FLAG_CUSTOM_CHANNEL_NAME |
> +                                         SND_DMAENGINE_PCM_NO_RESIDUE |

This flag should be SND_DMAENGINE_PCM_FLAG_NO_RESIDUE.

> +                                         SND_DMAENGINE_PCM_FLAG_COMPAT);
> +}
> +EXPORT_SYMBOL_GPL(samsung_asoc_dma_platform_register);
> +

Thanks
Padma
