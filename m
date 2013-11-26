From: Padma Venkat <padma.kvr@gmail.com>
Subject: Re: [alsa-devel] [PATCH 2/2] ASoC: samsung: Use ASoC dmaengine code
 where possible
Date: Tue, 26 Nov 2013 10:55:17 +0530
Message-ID: <CAAgF-BcJZrwwHYtk6pKj_-+CzmbhhV4V_Z02kjHveObOR6oiFQ@mail.gmail.com>
References: <1384264120-24750-1-git-send-email-broonie@kernel.org>
	<1384264120-24750-2-git-send-email-broonie@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qa0-f51.google.com ([209.85.216.51]:42064 "EHLO
	mail-qa0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750786Ab3KZFZS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Nov 2013 00:25:18 -0500
Received: by mail-qa0-f51.google.com with SMTP id o15so8361210qap.17
        for <linux-samsung-soc@vger.kernel.org>; Mon, 25 Nov 2013 21:25:17 -0800 (PST)
In-Reply-To: <1384264120-24750-2-git-send-email-broonie@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, alsa-devel@alsa-project.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Mark Brown <broonie@linaro.org>, linaro-kernel@lists.linaro.org, Padmavathi Venna <padma.v@samsung.com>

Hi Mark,

On Tue, Nov 12, 2013 at 7:18 PM, Mark Brown <broonie@kernel.org> wrote:
> From: Mark Brown <broonie@linaro.org>
>
> Since all Exynos platforms have been converted to dmaengine and many of
> the older platforms are in the process of conversion they do not need to
> use the legacy s3c-dma APIs for DMA but can instead use the standard ASoC
> dmaengine helpers. This both allows them to benefit from improvements
> implemented in the generic code and supports multiplatform.
>
> Signed-off-by: Mark Brown <broonie@linaro.org>
> ---
>
> This depends on Tomasz's s3c64xx dmaengine conversion since that is how
> I've tested it - if possible I'd like to get that merged into ASoC and
> SPI early after -rc1, since I maintian both trees it's possibly easiest
> if I go ahead any apply it?
>
>  sound/soc/samsung/Kconfig     | 13 +++++--
>  sound/soc/samsung/Makefile    |  6 ++--
>  sound/soc/samsung/dma.h       |  3 ++
>  sound/soc/samsung/dmaengine.c | 82 +++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 100 insertions(+), 4 deletions(-)
>  create mode 100644 sound/soc/samsung/dmaengine.c
>

[snip]

>  void samsung_asoc_init_dma_data(struct snd_soc_dai *dai,
> diff --git a/sound/soc/samsung/dmaengine.c b/sound/soc/samsung/dmaengine.c
> new file mode 100644
> index 0000000..ad0a371
> --- /dev/null
> +++ b/sound/soc/samsung/dmaengine.c
> @@ -0,0 +1,82 @@
> +/*
> + * dmaengine.c - Samsung dmaengine wrapper
> + *
> + * Author: Mark Brown <broonie@linaro.org>
> + * Copyright 2013 Linaro
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License
> + * version 2 as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful, but
> + * WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + * General Public License for more details.
> + *
> + */
> +
> +#include <linux/module.h>
> +#include <linux/amba/pl08x.h>
> +
> +#include <sound/core.h>
> +#include <sound/pcm.h>
> +#include <sound/pcm_params.h>
> +#include <sound/dmaengine_pcm.h>
> +#include <sound/soc.h>
> +#include <sound/soc-dai.h>
> +
> +#include "dma.h"
> +
> +#ifdef CONFIG_ARCH_S3C64XX
> +#define filter_fn pl08x_filter_id
> +#else
> +#define filter_fn NULL
> +#endif
> +
> +static const struct snd_dmaengine_pcm_config samsung_dmaengine_pcm_config = {
> +       .prepare_slave_config = snd_dmaengine_pcm_prepare_slave_config,
> +       .compat_filter_fn = filter_fn,
> +};
> +
> +void samsung_asoc_init_dma_data(struct snd_soc_dai *dai,
> +                               struct s3c_dma_params *playback,
> +                               struct s3c_dma_params *capture)
> +{
> +       struct snd_dmaengine_dai_dma_data *playback_data = NULL;
> +       struct snd_dmaengine_dai_dma_data *capture_data = NULL;
> +
> +       if (playback) {
> +               playback_data = &playback->dma_data;
> +               playback_data->filter_data = (void *)playback->channel;
> +               playback_data->chan_name = playback->ch_name;
> +               playback_data->addr = playback->dma_addr;
> +               playback_data->addr_width = playback->dma_size;
> +       }
> +       if (capture) {
> +               capture_data = &capture->dma_data;
> +               capture_data->filter_data = (void *)capture->channel;
> +               capture_data->chan_name = capture->ch_name;
> +               capture_data->addr = capture->dma_addr;
> +               capture_data->addr_width = capture->dma_size;
> +       }
> +
> +       snd_soc_dai_init_dma_data(dai, playback_data, capture_data);
> +}
> +EXPORT_SYMBOL_GPL(samsung_asoc_init_dma_data);
> +
> +int samsung_asoc_dma_platform_register(struct device *dev)
> +{
> +       return snd_dmaengine_pcm_register(dev, &samsung_dmaengine_pcm_config,
> +                                         SND_DMAENGINE_PCM_FLAG_COMPAT);

also need to pass flag SND_DMAENGINE_PCM_FLAG_CUSTOM_CHANNEL_NAME here?

I tested this patch set on smdk5420 i2s. During playback audio playing
fast and there is underrun error like below.
underrun!!! (at least 0.061 ms long)
underrun!!! (at least 0.043 ms long)

Thanks
Padma
