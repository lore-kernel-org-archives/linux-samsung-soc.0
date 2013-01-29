From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] Fix compilation error on S3C2440
Date: Mon, 28 Jan 2013 22:06:24 -0800
Message-ID: <05e201cdfde6$c711cb70$55356250$@samsung.com>
References: <1359392823-30529-1-git-send-email-agalakhov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:25663 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753697Ab3A2GGc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 29 Jan 2013 01:06:32 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MHD00AKBIAOD0O0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 29 Jan 2013 15:06:31 +0900 (KST)
Received: from visitor4lab ([105.128.18.157])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MHD00529IASSW70@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 29 Jan 2013 15:06:31 +0900 (KST)
In-reply-to: <1359392823-30529-1-git-send-email-agalakhov@gmail.com>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Alexey Galakhov' <agalakhov@gmail.com>, linux-samsung-soc@vger.kernel.org
Cc: 'Padmavathi Venna' <padma.v@samsung.com>, 'Sangbeom Kim' <sbkim73@samsung.com>, 'Mark Brown' <broonie@opensource.wolfsonmicro.com>, 'Kukjin Kim' <kgene.kim@samsung.com>

Alexey Galakhov wrote:
> 
> There was a compilation error introduced on Dec 7, 2012
> by commit a08485d8fdf6f67ca5f173b68d8f873c574745f2.
> 
Following is better:

The commit a08485d8 ("ASoC: Samsung: Do not register samsung audio dma
device as pdev") introduced compilation error.

> Combination of CONFIG_CPU_S3C2440 and CONFIG_SND_S3C24XX_I2S
> caused the following:
> sound/soc/samsung/s3c24xx-i2s.c: In function 's3c24xx_iis_dev_probe':
> sound/soc/samsung/s3c24xx-i2s.c:472:2: error: implicit declaration of
> function 's3c_i2sv2_register_dai' [-Werror=implicit-function-declaration]
> sound/soc/samsung/s3c24xx-i2s.c:472:48: error: 's3c2412_i2s_dai'
> undeclared (first use in this function)
> 
> This patch fixes the problem and makes S3C2440 I2S usable again.
> 
> Signed-off-by: Alexey Galakhov <agalakhov@gmail.com>

Cc: Padmavathi Venna <padma.v@samsung.com>
Cc: Sangbeom Kim <sbkim73@samsung.com>
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>

> ---
>  sound/soc/samsung/s3c24xx-i2s.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/samsung/s3c24xx-i2s.c
> b/sound/soc/samsung/s3c24xx-i2s.c
> index ee10e87..13f6dd1 100644
> --- a/sound/soc/samsung/s3c24xx-i2s.c
> +++ b/sound/soc/samsung/s3c24xx-i2s.c
> @@ -469,7 +469,7 @@ static int s3c24xx_iis_dev_probe(struct
> platform_device *pdev)
>  {
>  	int ret = 0;
> 
> -	ret = s3c_i2sv2_register_dai(&pdev->dev, -1, &s3c2412_i2s_dai);
> +	ret = snd_soc_register_dai(&pdev->dev, &s3c24xx_i2s_dai);
>  	if (ret) {
>  		pr_err("failed to register the dai\n");
>  		return ret;
> --
> 1.7.10.4
