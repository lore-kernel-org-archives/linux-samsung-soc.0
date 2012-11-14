From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH] sound: use PTR_ERR to fix the value of the return
Date: Wed, 14 Nov 2012 10:28:09 +0530
Message-ID: <50A324E1.7060003@linaro.org>
References: <1352809140-4214-1-git-send-email-windsdaemon@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-da0-f46.google.com ([209.85.210.46]:63709 "EHLO
	mail-da0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932391Ab2KNE5n (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 13 Nov 2012 23:57:43 -0500
Received: by mail-da0-f46.google.com with SMTP id n41so23452dak.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Nov 2012 20:57:43 -0800 (PST)
In-Reply-To: <1352809140-4214-1-git-send-email-windsdaemon@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Wang Jing <windsdaemon@gmail.com>
Cc: Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org

On 11/13/2012 05:49 PM, Wang Jing wrote:
> From: wangjing <wangjing@wangjing.(none)>
> 
> This patch use the macro PTR_ERR to modify the value of the return
> 
> Signed-off-by: wangjing <wangjing@wangjing.(none)>
> ---
>  sound/soc/samsung/smdk_spdif.c |   30 +++++++++++++++---------------
>  1 file changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/sound/soc/samsung/smdk_spdif.c b/sound/soc/samsung/smdk_spdif.c
> index beaa9c1..8f78482 100644
> --- a/sound/soc/samsung/smdk_spdif.c
> +++ b/sound/soc/samsung/smdk_spdif.c
> @@ -28,32 +28,29 @@ static int set_audio_clock_heirachy(struct platform_device *pdev)
>  
>  	fout_epll = clk_get(NULL, "fout_epll");
>  	if (IS_ERR(fout_epll)) {
> -		printk(KERN_WARNING "%s: Cannot find fout_epll.\n",
> -				__func__);
> -		return -EINVAL;
> +		printk(KERN_ERR "%s: Cannot find fout_epll.\n", __func__);
> +		ret = PTR_ERR(fout_epll);
> +		return ret;

We can have a single statement for the above two statements.

		return PTR_ERR(fout_epll);

>  	}
>  
>  	mout_epll = clk_get(NULL, "mout_epll");
>  	if (IS_ERR(mout_epll)) {
> -		printk(KERN_WARNING "%s: Cannot find mout_epll.\n",
> -				__func__);
> -		ret = -EINVAL;
> +		printk(KERN_ERR "%s: Cannot find mout_epll.\n", __func__);
> +		ret = PTR_ERR(mout_epll);
>  		goto out1;
>  	}
>  
>  	sclk_audio0 = clk_get(&pdev->dev, "sclk_audio");
>  	if (IS_ERR(sclk_audio0)) {
> -		printk(KERN_WARNING "%s: Cannot find sclk_audio.\n",
> -				__func__);
> -		ret = -EINVAL;
> +		printk(KERN_ERR "%s: Cannot find sclk_audio.\n", __func__);
> +		ret = PTR_ERR(sclk_audio0);
>  		goto out2;
>  	}
>  
>  	sclk_spdif = clk_get(NULL, "sclk_spdif");
>  	if (IS_ERR(sclk_spdif)) {
> -		printk(KERN_WARNING "%s: Cannot find sclk_spdif.\n",
> -				__func__);
> -		ret = -EINVAL;
> +		printk(KERN_ERR "%s: Cannot find sclk_spdif.\n", __func__);
> +		ret = PTR_ERR(sclk_spdif);
>  		goto out3;
>  	}
>  
> @@ -81,11 +78,13 @@ static int set_audio_clock_rate(unsigned long epll_rate,
>  				unsigned long audio_rate)
>  {
>  	struct clk *fout_epll, *sclk_spdif;
> +	int ret = 0;
>  
>  	fout_epll = clk_get(NULL, "fout_epll");
>  	if (IS_ERR(fout_epll)) {
>  		printk(KERN_ERR "%s: failed to get fout_epll\n", __func__);
> -		return -ENOENT;
> +		ret = PTR_ERR(fout_epll);
> +		return ret;

Same as above.

>  	}
>  
>  	clk_set_rate(fout_epll, epll_rate);
> @@ -94,13 +93,14 @@ static int set_audio_clock_rate(unsigned long epll_rate,
>  	sclk_spdif = clk_get(NULL, "sclk_spdif");
>  	if (IS_ERR(sclk_spdif)) {
>  		printk(KERN_ERR "%s: failed to get sclk_spdif\n", __func__);
> -		return -ENOENT;
> +		ret = PTR_ERR(sclk_spdif);
> +		return ret;

Same as above.

>  	}
>  
>  	clk_set_rate(sclk_spdif, audio_rate);
>  	clk_put(sclk_spdif);
>  
> -	return 0;
> +	return ret;
>  }
>  
>  static int smdk_hw_params(struct snd_pcm_substream *substream,
> 


-- 
Tushar Behera
