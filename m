From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] mach-s3c64xx:Fix error handling for certain calls to
 s3c_gpio_cfgpin_range in the file dev-audio.c
Date: Thu, 17 Sep 2015 11:05:34 +0900
Message-ID: <55FA1FEE.5070506@samsung.com>
References: <1442454673-26752-1-git-send-email-xerofoify@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:63455 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752964AbbIQCFm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Sep 2015 22:05:42 -0400
In-reply-to: <1442454673-26752-1-git-send-email-xerofoify@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Nicholas Krause <xerofoify@gmail.com>, kgene@kernel.org
Cc: linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On 17.09.2015 10:51, Nicholas Krause wrote:
> This fixes error handling for calls to the function
> s3c_gpio_cfgpin_range in the file dev-audio.c that
> assume calls to this particular function always run
> successfully to properly check now if these calls
> fail by returning a error code and if so return it
> directly to the call of these functions in order for
> the caller to be able to handle these failed calls in
> its own error path(s).
> 
> Signed-off-by: Nicholas Krause <xerofoify@gmail.com>
> ---
>  arch/arm/mach-s3c64xx/dev-audio.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)

I am assuming (from the past events) that you did not test the patch and
how returning the error condition affects rest of the code. In the same
time you ignored my request to mark such patches with Request-For-Test.

Please send it after testing.

Commit message is hard to understand, please re-phrase so it would be
easily to find how this affects upper layers.

As you are banned on LKML, the patch needs thorough testing and review
before applying.

Best regards,
Krzysztof

> 
> diff --git a/arch/arm/mach-s3c64xx/dev-audio.c b/arch/arm/mach-s3c64xx/dev-audio.c
> index ff780a8..81fabdb 100644
> --- a/arch/arm/mach-s3c64xx/dev-audio.c
> +++ b/arch/arm/mach-s3c64xx/dev-audio.c
> @@ -27,6 +27,7 @@
>  static int s3c64xx_i2s_cfg_gpio(struct platform_device *pdev)
>  {
>  	unsigned int base;
> +	int ret;
>  
>  	switch (pdev->id) {
>  	case 0:
> @@ -47,9 +48,9 @@ static int s3c64xx_i2s_cfg_gpio(struct platform_device *pdev)
>  		return -EINVAL;
>  	}
>  
> -	s3c_gpio_cfgpin_range(base, 5, S3C_GPIO_SFN(3));
> -
> -	return 0;
> +	ret = s3c_gpio_cfgpin_range(base, 5, S3C_GPIO_SFN(3));
> +
> +	return ret;
>  }
>  
>  static struct resource s3c64xx_iis0_resource[] = {
> @@ -122,6 +123,7 @@ EXPORT_SYMBOL(s3c64xx_device_iisv4);
>  static int s3c64xx_pcm_cfg_gpio(struct platform_device *pdev)
>  {
>  	unsigned int base;
> +	int ret;
>  
>  	switch (pdev->id) {
>  	case 0:
> @@ -136,8 +138,8 @@ static int s3c64xx_pcm_cfg_gpio(struct platform_device *pdev)
>  		return -EINVAL;
>  	}
>  
> -	s3c_gpio_cfgpin_range(base, 5, S3C_GPIO_SFN(2));
> -	return 0;
> +	ret = s3c_gpio_cfgpin_range(base, 5, S3C_GPIO_SFN(2));
> +	return ret;
>  }
>  
>  static struct resource s3c64xx_pcm0_resource[] = {
> 
