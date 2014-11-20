From: Padma Venkat <padma.kvr@gmail.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: samsung: In the i2s_set_sysclk()
 callback we are currently clearing all bits of the IISMOD register in
 i2s_set_sysclk. It's due to an incorrect mask used for the AND operation
 which is introduced in commit a5a56871f804edac93a53b5e871c0e9818fb9033 (ASoC:
 samsung: add support for exynos7 I2S controller) and also adds the missing
 break statement.
Date: Thu, 20 Nov 2014 15:38:51 +0530
Message-ID: <CAAgF-BfwGsn6HbJWH8uE48F2VWAYnAkv8=kGPkqCEWKaBM6=GQ@mail.gmail.com>
References: <1416476977-20118-1-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f173.google.com ([209.85.160.173]:50534 "EHLO
	mail-yk0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757203AbaKTKIw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Nov 2014 05:08:52 -0500
Received: by mail-yk0-f173.google.com with SMTP id 19so1133734ykq.32
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Nov 2014 02:08:51 -0800 (PST)
In-Reply-To: <1416476977-20118-1-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padmavathi Venna <padma.v@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, sbkim73@samsung.com, kgene.kim@samsung.com, broonie@kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>

Hi,

On 11/20/14, Padmavathi Venna <padma.v@samsung.com> wrote:
> Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
> ---
>  sound/soc/samsung/i2s.c |    5 +++--
>  1 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
> index 0df6547..e1ace52 100644
> --- a/sound/soc/samsung/i2s.c
> +++ b/sound/soc/samsung/i2s.c
> @@ -494,7 +494,7 @@ static int i2s_set_sysclk(struct snd_soc_dai *dai,
>  		if (dir == SND_SOC_CLOCK_IN)
>  			mod |= 1 << i2s_regs->cdclkcon_off;
>  		else
> -			mod &= 0 << i2s_regs->cdclkcon_off;
> +			mod &= ~(1 << i2s_regs->cdclkcon_off);
>
>  		i2s->rfs = rfs;
>  		break;
> @@ -551,10 +551,11 @@ static int i2s_set_sysclk(struct snd_soc_dai *dai,
>  		}
>
>  		if (clk_id == 0)
> -			mod &= 0 << i2s_regs->rclksrc_off;
> +			mod &= ~(1 << i2s_regs->rclksrc_off);
>  		else
>  			mod |= 1 << i2s_regs->rclksrc_off;
>
> +		break;
>  	default:
>  		dev_err(&i2s->pdev->dev, "We don't serve that!\n");
>  		return -EINVAL;
> --
> 1.7.4.4
>

Please ignore this patch as subject line is not proper.

Thanks
Padma
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> http://mailman.alsa-project.org/mailman/listinfo/alsa-devel
>
