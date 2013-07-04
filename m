From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: [PATCH] ASoC: samsung: Remove obsolete GPIO based DT pinmuxing
Date: Thu, 04 Jul 2013 21:18:48 +0200
Message-ID: <51D5CA98.8020406@gmail.com>
References: <1372767090-14963-1-git-send-email-broonie@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46]:54392 "EHLO
	mail-bk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752751Ab3GDTSw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 4 Jul 2013 15:18:52 -0400
Received: by mail-bk0-f46.google.com with SMTP id na10so768542bkb.5
        for <linux-samsung-soc@vger.kernel.org>; Thu, 04 Jul 2013 12:18:51 -0700 (PDT)
In-Reply-To: <1372767090-14963-1-git-send-email-broonie@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, linaro-kernel@lists.linaro.org, Mark Brown <broonie@linaro.org>

On 07/02/2013 02:11 PM, Mark Brown wrote:
> From: Mark Brown<broonie@linaro.org>
>
> Since the Samsung platforms have moved to pinctrl for pin muxing and that
> is handled in the core the old GPIO based muxing code can just be removed.
> Something similar had been submitted by Thomas Abraham back in March but
> a resubmission following review never happened.
>
> Signed-off-by: Mark Brown<broonie@linaro.org>

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

> ---
>   sound/soc/samsung/i2s.c | 66 +++----------------------------------------------
>   1 file changed, 4 insertions(+), 62 deletions(-)
>
> diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
> index 82ebb1a..7a17346 100644
> --- a/sound/soc/samsung/i2s.c
> +++ b/sound/soc/samsung/i2s.c
> @@ -1016,52 +1016,6 @@ static struct i2s_dai *i2s_alloc_dai(struct platform_device *pdev, bool sec)
>   	return i2s;
>   }
>
> -#ifdef CONFIG_OF
> -static int samsung_i2s_parse_dt_gpio(struct i2s_dai *i2s)
> -{
> -	struct device *dev =&i2s->pdev->dev;
> -	int index, gpio, ret;
> -
> -	for (index = 0; index<  7; index++) {
> -		gpio = of_get_gpio(dev->of_node, index);
> -		if (!gpio_is_valid(gpio)) {
> -			dev_err(dev, "invalid gpio[%d]: %d\n", index, gpio);
> -			goto free_gpio;
> -		}
> -
> -		ret = gpio_request(gpio, dev_name(dev));
> -		if (ret) {
> -			dev_err(dev, "gpio [%d] request failed\n", gpio);
> -			goto free_gpio;
> -		}
> -		i2s->gpios[index] = gpio;
> -	}
> -	return 0;
> -
> -free_gpio:
> -	while (--index>= 0)
> -		gpio_free(i2s->gpios[index]);
> -	return -EINVAL;
> -}
> -
> -static void samsung_i2s_dt_gpio_free(struct i2s_dai *i2s)
> -{
> -	unsigned int index;
> -	for (index = 0; index<  7; index++)
> -		gpio_free(i2s->gpios[index]);
> -}
> -#else
> -static int samsung_i2s_parse_dt_gpio(struct i2s_dai *dai)
> -{
> -	return -EINVAL;
> -}
> -
> -static void samsung_i2s_dt_gpio_free(struct i2s_dai *dai)
> -{
> -}
> -
> -#endif
> -
>   static const struct of_device_id exynos_i2s_match[];
>
>   static inline int samsung_i2s_get_driver_data(struct platform_device *pdev)
> @@ -1235,18 +1189,10 @@ static int samsung_i2s_probe(struct platform_device *pdev)
>   		pri_dai->sec_dai = sec_dai;
>   	}
>
> -	if (np) {
> -		if (samsung_i2s_parse_dt_gpio(pri_dai)) {
> -			dev_err(&pdev->dev, "Unable to configure gpio\n");
> -			ret = -EINVAL;
> -			goto err;
> -		}
> -	} else {
> -		if (i2s_pdata->cfg_gpio&&  i2s_pdata->cfg_gpio(pdev)) {
> -			dev_err(&pdev->dev, "Unable to configure gpio\n");
> -			ret = -EINVAL;
> -			goto err;
> -		}
> +	if (i2s_pdata&&  i2s_pdata->cfg_gpio&&  i2s_pdata->cfg_gpio(pdev)) {
> +		dev_err(&pdev->dev, "Unable to configure gpio\n");
> +		ret = -EINVAL;
> +		goto err;
>   	}
>
>   	snd_soc_register_component(&pri_dai->pdev->dev,&samsung_i2s_component,
> @@ -1267,14 +1213,10 @@ static int samsung_i2s_remove(struct platform_device *pdev)
>   {
>   	struct i2s_dai *i2s, *other;
>   	struct resource *res;
> -	struct s3c_audio_pdata *i2s_pdata = pdev->dev.platform_data;
>
>   	i2s = dev_get_drvdata(&pdev->dev);
>   	other = i2s->pri_dai ? : i2s->sec_dai;
>
> -	if (!i2s_pdata->cfg_gpio&&  pdev->dev.of_node)
> -		samsung_i2s_dt_gpio_free(i2s->pri_dai);
> -
>   	if (other) {
>   		other->pri_dai = NULL;
>   		other->sec_dai = NULL;
