From: Padma Venkat <padma.kvr@gmail.com>
Subject: Re: [alsa-devel] [PATCH 1/2] ASoC: samsung: Provide helper for DMA init
Date: Tue, 26 Nov 2013 10:54:57 +0530
Message-ID: <CAAgF-BdUWGun6m2+zxMhUU1_DpZviHg-REnsGvh+bWgpm2NuLg@mail.gmail.com>
References: <1384264120-24750-1-git-send-email-broonie@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qa0-f50.google.com ([209.85.216.50]:64810 "EHLO
	mail-qa0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750786Ab3KZFY6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Nov 2013 00:24:58 -0500
Received: by mail-qa0-f50.google.com with SMTP id i13so7632646qae.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 25 Nov 2013 21:24:57 -0800 (PST)
In-Reply-To: <1384264120-24750-1-git-send-email-broonie@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, alsa-devel@alsa-project.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Mark Brown <broonie@linaro.org>, linaro-kernel@lists.linaro.org, Padmavathi Venna <padma.v@samsung.com>

Hi Mark,

On Tue, Nov 12, 2013 at 7:18 PM, Mark Brown <broonie@kernel.org> wrote:
> From: Mark Brown <broonie@linaro.org>
>
> In preparation for using the dmaengine helpers in ASoC rather than the
> dmaengine wrappers for the Samsung API wrap the configuration of dma_data.
> The dmaengine code expects different data to that used by the legacy API.
>
> Signed-off-by: Mark Brown <broonie@linaro.org>
> ---
>  sound/soc/samsung/ac97.c | 51 +++++++++++++++---------------------------------
>  sound/soc/samsung/dma.c  |  8 ++++++++
>  sound/soc/samsung/dma.h  |  3 +++
>  sound/soc/samsung/i2s.c  |  2 +-
>  sound/soc/samsung/pcm.c  | 18 +++++++++--------
>  5 files changed, 38 insertions(+), 44 deletions(-)
>

[snip]

> diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
> index a5cbdb4..67d9fa9 100644
> --- a/sound/soc/samsung/i2s.c
> +++ b/sound/soc/samsung/i2s.c
> @@ -963,7 +963,7 @@ static int samsung_i2s_dai_probe(struct snd_soc_dai *dai)
>         }
>         clk_prepare_enable(i2s->clk);
>
> -       snd_soc_dai_init_dma_data(dai, &i2s->dma_playback, &i2s->dma_capture);
> +       samsung_asoc_init_dma_data(dai, &i2s->dma_playback, &i2s->dma_capture);

we have to initialize the dma data for i2s secondary dai also
otherwise there is a crash in dmaengine_pcm_new during probe.

Thanks
Padma
