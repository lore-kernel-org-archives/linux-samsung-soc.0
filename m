From: Padma Venkat <padma.kvr@gmail.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: samsung: Fix IISMOD setting in i2s_set_sysclk()
Date: Thu, 20 Nov 2014 12:34:51 +0530
Message-ID: <CAAgF-BemHSdcmzkqOUX+JNMLu0-GXs0EGm8YWHt+CBRP8Wa5DA@mail.gmail.com>
References: <1416420664-20952-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yh0-f52.google.com ([209.85.213.52]:46109 "EHLO
	mail-yh0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750838AbaKTHEv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Nov 2014 02:04:51 -0500
Received: by mail-yh0-f52.google.com with SMTP id z6so1055924yhz.25
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Nov 2014 23:04:51 -0800 (PST)
In-Reply-To: <1416420664-20952-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: broonie@kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, Padmavathi Venna <padma.v@samsung.com>, sbkim73@samsung.com, linux-arm-kernel@lists.infradead.org

Hi Sylwester,

On 11/19/14, Sylwester Nawrocki <s.nawrocki@samsung.com> wrote:
> In the i2s_set_sysclk() callback we are currently clearing all bits
> of the IISMOD register when clk_id is SAMSUNG_I2S_CDCLK and dir
> is SND_SOC_CLOCK_OUT. It's due to an incorrect mask used for the AND
> operation and breaks the I2S interface operation when we attempt to
> use the CDCLK output clock.
>
> It fixes commit a5a56871f804edac93a53b5e871c0e9818fb9033
> ("ASoC: samsung: add support for exynos7 I2S controller") and restores
> sound support for Odroid X2/U3.
>
> Cc: Padmavathi Venna <padma.v@samsung.com>
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  sound/soc/samsung/i2s.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
> index 947352d..8db8c66 100644
> --- a/sound/soc/samsung/i2s.c
> +++ b/sound/soc/samsung/i2s.c
> @@ -494,7 +494,7 @@ static int i2s_set_sysclk(struct snd_soc_dai *dai,
>  		if (dir == SND_SOC_CLOCK_IN)
>  			mod |= 1 << i2s_regs->cdclkcon_off;
>  		else
> -			mod &= 0 << i2s_regs->cdclkcon_off;
> +			mod &= ~(1 << i2s_regs->cdclkcon_off);

Thanks for pointing this. In my local machine it was properly done but
while rebasing on linux-next I did some mistake. There is one more
place in set_sysclk which need to be corrected here
mod &= 0 << i2s_regs->rclksrc_off
can you include this change also in your patch or should I post a new
patch for all?

Thanks
Padma

>  		i2s->rfs = rfs;
>  		break;
> --
> 1.7.9.5
>
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> http://mailman.alsa-project.org/mailman/listinfo/alsa-devel
>
