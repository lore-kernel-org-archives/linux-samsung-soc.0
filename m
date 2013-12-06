From: Padma Venkat <padma.kvr@gmail.com>
Subject: Re: [alsa-devel] [PATCH 1/2] ASoC: samsung: Provide helper for DMA init
Date: Fri, 6 Dec 2013 10:44:33 +0530
Message-ID: <CAAgF-BdD_DONQYPOenMwBmc6N+EOJQ3TwJz1hpG2qZVfzhR63Q@mail.gmail.com>
References: <1386253559-18262-1-git-send-email-broonie@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qa0-f54.google.com ([209.85.216.54]:60356 "EHLO
	mail-qa0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750837Ab3LFFOe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 6 Dec 2013 00:14:34 -0500
Received: by mail-qa0-f54.google.com with SMTP id f11so259208qae.6
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Dec 2013 21:14:33 -0800 (PST)
In-Reply-To: <1386253559-18262-1-git-send-email-broonie@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Padmavathi Venna <padma.v@samsung.com>, alsa-devel@alsa-project.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linaro-kernel@lists.linaro.org, Mark Brown <broonie@linaro.org>

Hi Mark,

On Thu, Dec 5, 2013 at 7:55 PM, Mark Brown <broonie@kernel.org> wrote:
> From: Mark Brown <broonie@linaro.org>
>
> In preparation for using the dmaengine helpers in ASoC rather than the
> dmaengine wrappers for the Samsung API wrap the configuration of dma_data.
> The dmaengine code expects different data to that used by the legacy API.
>
> Signed-off-by: Mark Brown <broonie@linaro.org>
> ---
>
> This will need merging with the fix patch I sent earlier, I'l do that
> assuming this is OK.
>

[snip]

> diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
> index a5cbdb4f1655..eab0050d4579 100644
> --- a/sound/soc/samsung/i2s.c
> +++ b/sound/soc/samsung/i2s.c
> @@ -946,8 +946,11 @@ static int samsung_i2s_dai_probe(struct snd_soc_dai *dai)
>         struct i2s_dai *i2s = to_info(dai);
>         struct i2s_dai *other = i2s->pri_dai ? : i2s->sec_dai;
>
> -       if (other && other->clk) /* If this is probe on secondary */
> +       if (other && other->clk) { /* If this is probe on secondary */
> +               samsung_asoc_init_dma_data(dai, &other->sec_dai->dma_playback,
> +                                          NULL);
>                 goto probe_exit;
> +       }

This is done in your earlier patch " ASoC: samsung: Ensure DMA data is
initialised for secondary DAI ". Was it done on purpose or by mistake
in this patch?

I think you also told to include a patch for reinitialization of the
dma_data in i2s_hw_params. If you are in the process of debugging some
bug as you mentioned earlier you can ignore this comment. Otherwise it
is just a reminder.

Thanks
Padma
