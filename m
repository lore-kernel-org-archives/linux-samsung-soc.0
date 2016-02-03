From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH RESEND RFC] mach:-s3c64xx:Output trace information with
 WARN_ON if calls for setting up gpio board configuration fail in
 s3c64xx_i2s_cfg_gpio
Date: Wed, 03 Feb 2016 10:33:33 +0900
Message-ID: <56B158ED.8090109@samsung.com>
References: <1454424992-14619-1-git-send-email-xerofoify@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:42827 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754992AbcBCBdn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 2 Feb 2016 20:33:43 -0500
In-reply-to: <1454424992-14619-1-git-send-email-xerofoify@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Nicholas Krause <xerofoify@gmail.com>, kgene@kernel.org
Cc: linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On 02.02.2016 23:56, Nicholas Krause wrote:
> This fixes the function s3c64xx_i2c_cfg_gpio to log output to the
> kernel log buff with WARN_ON if any of the calls to either
> s3c_gpio_cfgpin_range or s3c_gpio_cfgpin fail as we cannot exit
> from s3c64xx_i2s_cfg_gpio if any of these calls fail due to
> other intended function work being required to complete. Further more
> if a failure occurs allow the other users/devolopers of this driver
> to properly check the kernel log buffers for a kernel trace for
> when these calls failing to execute successfully arise.

Quite complicated sentences, very difficult to understand. The commit
message should describe the logic behind the change (e.g. answer to
why?) and user-visible impact in a brief and understandable way.

Commit subject does not match subsystem and it is over complicated on
its own. It is also too long. Your editor should point this already (70
chars at most).

Anyway I don't feel the patch is needed and description fails to
convince me. Knowing your history, you did not encounter any errors here
but instead you are just spreading random "fixes" which compile or not...

Since this was not tested:
If it ain't broken, don't fix it.

Best regards,
Krzysztof

> 
> Signed-off-by: Nicholas Krause <xerofoify@gmail.com>
> ---
> v3:Fix more wording issues and uncaught build failure with
> previous build test
> v2:Fix Patch Wording as it was clearly confusing and incorrect
>  arch/arm/mach-s3c64xx/dev-audio.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm/mach-s3c64xx/dev-audio.c b/arch/arm/mach-s3c64xx/dev-audio.c
> index ff780a8..796ac75 100644
> --- a/arch/arm/mach-s3c64xx/dev-audio.c
> +++ b/arch/arm/mach-s3c64xx/dev-audio.c
> @@ -36,10 +36,10 @@ static int s3c64xx_i2s_cfg_gpio(struct platform_device *pdev)
>  		base = S3C64XX_GPE(0);
>  		break;
>  	case 2:
> -		s3c_gpio_cfgpin(S3C64XX_GPC(4), S3C_GPIO_SFN(5));
> -		s3c_gpio_cfgpin(S3C64XX_GPC(5), S3C_GPIO_SFN(5));
> -		s3c_gpio_cfgpin(S3C64XX_GPC(7), S3C_GPIO_SFN(5));
> -		s3c_gpio_cfgpin_range(S3C64XX_GPH(6), 4, S3C_GPIO_SFN(5));
> +		WARN_ON(s3c_gpio_cfgpin(S3C64XX_GPC(4), S3C_GPIO_SFN(5)));
> +		WARN_ON(s3c_gpio_cfgpin(S3C64XX_GPC(5), S3C_GPIO_SFN(5)));
> +		WARN_ON(s3c_gpio_cfgpin(S3C64XX_GPC(7), S3C_GPIO_SFN(5)));
> +		WARN_ON(s3c_gpio_cfgpin_range(S3C64XX_GPH(6), 4, S3C_GPIO_SFN(5)));
>  		return 0;
>  	default:
>  		printk(KERN_DEBUG "Invalid I2S Controller number: %d\n",
> @@ -47,7 +47,7 @@ static int s3c64xx_i2s_cfg_gpio(struct platform_device *pdev)
>  		return -EINVAL;
>  	}
>  
> -	s3c_gpio_cfgpin_range(base, 5, S3C_GPIO_SFN(3));
> +	WARN_ON(s3c_gpio_cfgpin_range(base, 5, S3C_GPIO_SFN(3)));
>  
>  	return 0;
>  }
> 
