From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] ASoC: samsung: get access to DMA engine early to defer
 probe properly
Date: Thu, 27 Oct 2016 19:25:12 +0300
Message-ID: <20161027162512.GA4527@kozik-lap>
References: <CGME20161027103418eucas1p1628aa0c578b8470d537abaa92c6bf10c@eucas1p1.samsung.com>
 <1477564442-19772-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:34174 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932708AbcJ0QZT (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 27 Oct 2016 12:25:19 -0400
Received: by mail-wm0-f67.google.com with SMTP id y138so3477679wme.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 27 Oct 2016 09:25:18 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1477564442-19772-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, Mark Brown <broonie@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Inki Dae <inki.dae@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>

On Thu, Oct 27, 2016 at 12:34:02PM +0200, Marek Szyprowski wrote:
> ASoC Samsung sub-drivers tried to get access to their DMA engine
> controllers as a last step in driver probe. If a DMA engine was not
> available yet, samsung_asoc_dma_platform_register() function ended in
> -EPROBE_DEFER, but the driver already registered its component to ASoC
> core. This patch moves samsung_asoc_dma_platform_register() call before
> registering any components, to the common place, where driver was gathering
> all needed resources.
> 
> In case of Samsung Exynos i2s driver the issue was even worse. The driver
> managed already to register its secondary DAI platform device before
> even getting the DMA engine access. That together with -EPROBE_DEFER error
> code from samsung_i2s_probe() immediately triggered another round of
> deferred probe retry and in turn endless loop of driver probing.
> 
> This patch fixes broken boot on Odroid XU3 and other Exynos5422-based
> boards.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  sound/soc/samsung/ac97.c        | 10 +++++-----
>  sound/soc/samsung/i2s.c         | 19 ++++++++++---------
>  sound/soc/samsung/pcm.c         | 19 ++++++++++---------
>  sound/soc/samsung/s3c2412-i2s.c | 16 ++++++++--------
>  sound/soc/samsung/s3c24xx-i2s.c | 14 +++++++-------
>  sound/soc/samsung/spdif.c       | 14 +++++++-------
>  6 files changed, 47 insertions(+), 45 deletions(-)
> 
> diff --git a/sound/soc/samsung/ac97.c b/sound/soc/samsung/ac97.c
> index 97d6700b1009..cbc0023c2bc8 100644
> --- a/sound/soc/samsung/ac97.c
> +++ b/sound/soc/samsung/ac97.c
> @@ -383,11 +383,6 @@ static int s3c_ac97_probe(struct platform_device *pdev)
>  		goto err4;
>  	}
>  
> -	ret = devm_snd_soc_register_component(&pdev->dev, &s3c_ac97_component,
> -					 s3c_ac97_dai, ARRAY_SIZE(s3c_ac97_dai));
> -	if (ret)
> -		goto err5;
> -
>  	ret = samsung_asoc_dma_platform_register(&pdev->dev,
>  						 ac97_pdata->dma_filter,
>  						 NULL, NULL);
> @@ -396,6 +391,11 @@ static int s3c_ac97_probe(struct platform_device *pdev)
>  		goto err5;
>  	}
>  
> +	ret = devm_snd_soc_register_component(&pdev->dev, &s3c_ac97_component,
> +					 s3c_ac97_dai, ARRAY_SIZE(s3c_ac97_dai));
> +	if (ret)
> +		goto err5;
> +
>  	return 0;
>  err5:
>  	free_irq(irq_res->start, NULL);
> diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
> index 7e32cf4581f8..7825bff45ae3 100644
> --- a/sound/soc/samsung/i2s.c
> +++ b/sound/soc/samsung/i2s.c
> @@ -1237,14 +1237,14 @@ static int samsung_i2s_probe(struct platform_device *pdev)
>  			dev_err(&pdev->dev, "Unable to get drvdata\n");
>  			return -EFAULT;
>  		}
> -		ret = devm_snd_soc_register_component(&sec_dai->pdev->dev,
> -						&samsung_i2s_component,
> -						&sec_dai->i2s_dai_drv, 1);
> +		ret = samsung_asoc_dma_platform_register(&pdev->dev,
> +					sec_dai->filter, "tx-sec", NULL);
>  		if (ret != 0)
>  			return ret;
>  
> -		return samsung_asoc_dma_platform_register(&pdev->dev,
> -					sec_dai->filter, "tx-sec", NULL);
> +		return devm_snd_soc_register_component(&sec_dai->pdev->dev,
> +						&samsung_i2s_component,
> +						&sec_dai->i2s_dai_drv, 1);
>  	}
>  
>  	pri_dai = i2s_alloc_dai(pdev, false);
> @@ -1314,6 +1314,11 @@ static int samsung_i2s_probe(struct platform_device *pdev)
>  	if (quirks & QUIRK_PRI_6CHAN)
>  		pri_dai->i2s_dai_drv.playback.channels_max = 6;
>  
> +	ret = samsung_asoc_dma_platform_register(&pdev->dev, pri_dai->filter,
> +						 NULL, NULL);
> +	if (ret < 0)
> +		goto err_disable_clk;
> +
>  	if (quirks & QUIRK_SEC_DAI) {
>  		sec_dai = i2s_alloc_dai(pdev, true);
>  		if (!sec_dai) {
> @@ -1353,10 +1358,6 @@ static int samsung_i2s_probe(struct platform_device *pdev)
>  	if (ret < 0)
>  		goto err_free_dai;
>  
> -	ret = samsung_asoc_dma_platform_register(&pdev->dev, pri_dai->filter,
> -						 NULL, NULL);
> -	if (ret < 0)
> -		goto err_free_dai;
>  
>  	pm_runtime_enable(&pdev->dev);
>  
> diff --git a/sound/soc/samsung/pcm.c b/sound/soc/samsung/pcm.c
> index 43e367a9acc3..c484985812ed 100644
> --- a/sound/soc/samsung/pcm.c
> +++ b/sound/soc/samsung/pcm.c
> @@ -565,24 +565,25 @@ static int s3c_pcm_dev_probe(struct platform_device *pdev)
>  	pcm->dma_capture = &s3c_pcm_stereo_in[pdev->id];
>  	pcm->dma_playback = &s3c_pcm_stereo_out[pdev->id];
>  
> +	ret = samsung_asoc_dma_platform_register(&pdev->dev, filter,
> +						 NULL, NULL);
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to get register DMA: %d\n", ret);
> +		goto err5;
> +	}
> +
>  	pm_runtime_enable(&pdev->dev);
>  
>  	ret = devm_snd_soc_register_component(&pdev->dev, &s3c_pcm_component,
>  					 &s3c_pcm_dai[pdev->id], 1);
>  	if (ret != 0) {
>  		dev_err(&pdev->dev, "failed to get register DAI: %d\n", ret);
> -		goto err5;
> -	}
> -
> -	ret = samsung_asoc_dma_platform_register(&pdev->dev, filter,
> -						 NULL, NULL);
> -	if (ret) {
> -		dev_err(&pdev->dev, "failed to get register DMA: %d\n", ret);
> -		goto err5;
> +		goto err6;
>  	}
>  
>  	return 0;
> -
> +err6:
> +	pm_runtime_disable(&pdev->dev);

I see you are also cleaning the error path. Good... but this should be
actually separate patch preceding this. It is not related to the bug
you are fixing here.

Beside that, looks good.

Best regards,
Krzysztof
