From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v2] ASoC: samsung: i2s: Support more resolution rates
Date: Mon, 10 Jul 2017 09:56:38 +0900
Message-ID: <5962D0C6.5060803@samsung.com>
References: <CGME20170707013112epcas5p43273c95afd43b18ded971bea081edd40@epcas5p4.samsung.com>
        <20170707013110.7060-1-jcsing.lee@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:60721 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752276AbdGJA4m (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 9 Jul 2017 20:56:42 -0400
In-reply-to: <20170707013110.7060-1-jcsing.lee@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jaechul Lee <jcsing.lee@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Sangbeom Kim <sbkim73@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, alsa-devel <alsa-devel@alsa-project.org>
Cc: Jaechul Lee <galaxyra@gmail.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Jaechul,

Looks good to me.
Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

On 2017년 07월 07일 10:31, Jaechul Lee wrote:
> This driver can support more frequencies over 96KHz. There are no reasons
> to limit the frequency range below 96KHz. If codecs/amps or something else
> can't support higher resolution rates, the constraints would be set rates
> properly because each drivers have its own limits.
> 
> I added the 'pcm_rates' field to the dai_data to be set rates by the
> compatibilities. As a result, rates will be set each devices respectively.
> For example of exynos5433, rates will be set from 8KHz to 192KHz.
> 
> Signed-off-by: Jaechul Lee <jcsing.lee@samsung.com>
> ---
> v2:
>  - changed the name of variable to pcm_rates.                                  
>  - removed duplicated code.
>  - modified commit message.
> ---
>  sound/soc/samsung/i2s.c | 20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
> 
> diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
> index af3ba4d4ccc5..c9f87f7bae99 100644
> --- a/sound/soc/samsung/i2s.c
> +++ b/sound/soc/samsung/i2s.c
> @@ -50,6 +50,7 @@ struct samsung_i2s_variant_regs {
>  
>  struct samsung_i2s_dai_data {
>  	u32 quirks;
> +	unsigned int pcm_rates;
>  	const struct samsung_i2s_variant_regs *i2s_variant_regs;
>  };
>  
> @@ -1076,13 +1077,13 @@ static const struct snd_soc_component_driver samsung_i2s_component = {
>  	.name		= "samsung-i2s",
>  };
>  
> -#define SAMSUNG_I2S_RATES	SNDRV_PCM_RATE_8000_96000
> -
>  #define SAMSUNG_I2S_FMTS	(SNDRV_PCM_FMTBIT_S8 | \
>  					SNDRV_PCM_FMTBIT_S16_LE | \
>  					SNDRV_PCM_FMTBIT_S24_LE)
>  
> -static struct i2s_dai *i2s_alloc_dai(struct platform_device *pdev, bool sec)
> +static struct i2s_dai *i2s_alloc_dai(struct platform_device *pdev,
> +				const struct samsung_i2s_dai_data *i2s_dai_data,
> +				bool sec)
>  {
>  	struct i2s_dai *i2s;
>  
> @@ -1101,13 +1102,13 @@ static struct i2s_dai *i2s_alloc_dai(struct platform_device *pdev, bool sec)
>  	i2s->i2s_dai_drv.resume = i2s_resume;
>  	i2s->i2s_dai_drv.playback.channels_min = 1;
>  	i2s->i2s_dai_drv.playback.channels_max = 2;
> -	i2s->i2s_dai_drv.playback.rates = SAMSUNG_I2S_RATES;
> +	i2s->i2s_dai_drv.playback.rates = i2s_dai_data->pcm_rates;
>  	i2s->i2s_dai_drv.playback.formats = SAMSUNG_I2S_FMTS;
>  
>  	if (!sec) {
>  		i2s->i2s_dai_drv.capture.channels_min = 1;
>  		i2s->i2s_dai_drv.capture.channels_max = 2;
> -		i2s->i2s_dai_drv.capture.rates = SAMSUNG_I2S_RATES;
> +		i2s->i2s_dai_drv.capture.rates = i2s_dai_data->pcm_rates;
>  		i2s->i2s_dai_drv.capture.formats = SAMSUNG_I2S_FMTS;
>  	}
>  	return i2s;
> @@ -1242,7 +1243,7 @@ static int samsung_i2s_probe(struct platform_device *pdev)
>  		i2s_dai_data = (struct samsung_i2s_dai_data *)
>  				platform_get_device_id(pdev)->driver_data;
>  
> -	pri_dai = i2s_alloc_dai(pdev, false);
> +	pri_dai = i2s_alloc_dai(pdev, i2s_dai_data, false);
>  	if (!pri_dai) {
>  		dev_err(&pdev->dev, "Unable to alloc I2S_pri\n");
>  		return -ENOMEM;
> @@ -1316,7 +1317,7 @@ static int samsung_i2s_probe(struct platform_device *pdev)
>  		goto err_disable_clk;
>  
>  	if (quirks & QUIRK_SEC_DAI) {
> -		sec_dai = i2s_alloc_dai(pdev, true);
> +		sec_dai = i2s_alloc_dai(pdev, i2s_dai_data, true);
>  		if (!sec_dai) {
>  			dev_err(&pdev->dev, "Unable to alloc I2S_sec\n");
>  			ret = -ENOMEM;
> @@ -1452,29 +1453,34 @@ static const struct samsung_i2s_variant_regs i2sv5_i2s1_regs = {
>  
>  static const struct samsung_i2s_dai_data i2sv3_dai_type = {
>  	.quirks = QUIRK_NO_MUXPSR,
> +	.pcm_rates = SNDRV_PCM_RATE_8000_96000,
>  	.i2s_variant_regs = &i2sv3_regs,
>  };
>  
>  static const struct samsung_i2s_dai_data i2sv5_dai_type = {
>  	.quirks = QUIRK_PRI_6CHAN | QUIRK_SEC_DAI | QUIRK_NEED_RSTCLR |
>  			QUIRK_SUPPORTS_IDMA,
> +	.pcm_rates = SNDRV_PCM_RATE_8000_96000,
>  	.i2s_variant_regs = &i2sv3_regs,
>  };
>  
>  static const struct samsung_i2s_dai_data i2sv6_dai_type = {
>  	.quirks = QUIRK_PRI_6CHAN | QUIRK_SEC_DAI | QUIRK_NEED_RSTCLR |
>  			QUIRK_SUPPORTS_TDM | QUIRK_SUPPORTS_IDMA,
> +	.pcm_rates = SNDRV_PCM_RATE_8000_96000,
>  	.i2s_variant_regs = &i2sv6_regs,
>  };
>  
>  static const struct samsung_i2s_dai_data i2sv7_dai_type = {
>  	.quirks = QUIRK_PRI_6CHAN | QUIRK_SEC_DAI | QUIRK_NEED_RSTCLR |
>  			QUIRK_SUPPORTS_TDM,
> +	.pcm_rates = SNDRV_PCM_RATE_8000_192000,
>  	.i2s_variant_regs = &i2sv7_regs,
>  };
>  
>  static const struct samsung_i2s_dai_data i2sv5_dai_type_i2s1 = {
>  	.quirks = QUIRK_PRI_6CHAN | QUIRK_NEED_RSTCLR,
> +	.pcm_rates = SNDRV_PCM_RATE_8000_96000,
>  	.i2s_variant_regs = &i2sv5_i2s1_regs,
>  };
>  
> 


-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
