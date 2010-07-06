From: Liam Girdwood <lrg@slimlogic.co.uk>
Subject: Re: [alsa-devel] [PATCH] ASoC: Invert speaker enabling behaviour
 in SmartQ sound driver
Date: Tue, 06 Jul 2010 09:07:36 +0100
Message-ID: <1278403656.3103.10.camel@odin>
References: <4c3088ad.487e0e0a.3402.6e62@mx.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:37935 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751134Ab0GFIHn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 6 Jul 2010 04:07:43 -0400
Received: by fxm14 with SMTP id 14so4442392fxm.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 06 Jul 2010 01:07:39 -0700 (PDT)
In-Reply-To: <4c3088ad.487e0e0a.3402.6e62@mx.google.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Maurus Cuelenaere <mcuelenaere@gmail.com>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@opensource.wolfsonmicro.com>, linux-arm-kernel@lists.infradead.org

On Sun, 2010-07-04 at 15:12 +0200, Maurus Cuelenaere wrote:
> The speaker was enabled when the headphone was plugged in, which isn't the
> wanted behaviour so correct this.
> 
> Signed-off-by: Maurus Cuelenaere <mcuelenaere@gmail.com>
> ---
>  sound/soc/s3c24xx/smartq_wm8987.c |    1 -
>  1 files changed, 0 insertions(+), 1 deletions(-)
> 
> diff --git a/sound/soc/s3c24xx/smartq_wm8987.c b/sound/soc/s3c24xx/smartq_wm8987.c
> index c90ef96..b480348 100644
> --- a/sound/soc/s3c24xx/smartq_wm8987.c
> +++ b/sound/soc/s3c24xx/smartq_wm8987.c
> @@ -112,7 +112,6 @@ static struct snd_soc_jack_pin smartq_jack_pins[] = {
>  	{
>  		.pin	= "Internal Speaker",
>  		.mask	= SND_JACK_HEADPHONE,
> -		.invert	= true,
>  	},
>  };
>  
Acked-by: Liam Girdwood <lrg@slimlogic.co.uk>
-- 
Freelance Developer, SlimLogic Ltd
ASoC and Voltage Regulator Maintainer.
http://www.slimlogic.co.uk
