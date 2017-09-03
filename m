From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 3/3] ASoC: samsung: Fix invalid argument when
 devm_gpiod_get is called
Date: Sun, 3 Sep 2017 22:07:08 +0200
Message-ID: <20170903200708.u6w7rdef54qdxhci@kozik-lap>
References: <20170828100102.17591-1-jcsing.lee@samsung.com>
 <CGME20170828100105epcas2p3b528f17ba89532835e9b1735a0016215@epcas2p3.samsung.com>
 <20170828100102.17591-4-jcsing.lee@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yw0-f196.google.com ([209.85.161.196]:35304 "EHLO
        mail-yw0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751678AbdICUHO (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 3 Sep 2017 16:07:14 -0400
Content-Disposition: inline
In-Reply-To: <20170828100102.17591-4-jcsing.lee@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jaechul Lee <jcsing.lee@samsung.com>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, galaxyra@gmail.com, Chanwoo Choi <cw00.choi@samsung.com>

On Mon, Aug 28, 2017 at 07:01:02PM +0900, Jaechul Lee wrote:
> devm_gpiod_get is called with GPIOF_OUT_INIT_LOW but the function doesn't
> allow the parameters. Unluckily, GPIOF_OUT_INIT_LOW is same value as
> GPIOD_IN so it works like input gpio.

In overall, makes sense however one thing troubles me:
GPIOF_OUT_INIT_LOW = 0x0
GPIOD_IN = BIT(0) = 0x1

Are you sure they have the same value? Maybe you meant GPIOD_ASIS?

Best regards,
Krzysztof


> 
> Muted stream comes up when I try recording some sounds on TM2. mic-bias
> gpiod state can't be changed because the gpiod is created with the invalid
> parameter. The gpio should be set GPIOD_OUT_HIGH.
> 
> Fixes: 1bfbc260a5b4 ("ASoC: samsung: Add machine driver for Exynos5433 based TM2 board")
> Signed-off-by: Jaechul Lee <jcsing.lee@samsung.com>
> ---
>  sound/soc/samsung/tm2_wm5110.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/sound/soc/samsung/tm2_wm5110.c b/sound/soc/samsung/tm2_wm5110.c
> index f467ad06e827..76abe45ed537 100644
> --- a/sound/soc/samsung/tm2_wm5110.c
> +++ b/sound/soc/samsung/tm2_wm5110.c
> @@ -439,8 +439,7 @@ static int tm2_probe(struct platform_device *pdev)
>  	snd_soc_card_set_drvdata(card, priv);
>  	card->dev = dev;
>  
> -	priv->gpio_mic_bias = devm_gpiod_get(dev, "mic-bias",
> -						GPIOF_OUT_INIT_LOW);
> +	priv->gpio_mic_bias = devm_gpiod_get(dev, "mic-bias", GPIOD_OUT_HIGH);
>  	if (IS_ERR(priv->gpio_mic_bias)) {
>  		dev_err(dev, "Failed to get mic bias gpio\n");
>  		return PTR_ERR(priv->gpio_mic_bias);
> -- 
> 2.14.1
> 
