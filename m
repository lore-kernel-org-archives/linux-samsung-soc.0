From: Heiko =?iso-8859-15?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH] gpio: samsung: fixes build warning with s3c2410_defconfig
Date: Wed, 13 Feb 2013 09:27:56 +0100
Message-ID: <201302130927.56810.heiko@sntech.de>
References: <1360731937-23471-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:59360 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758918Ab3BMI2A (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 Feb 2013 03:28:00 -0500
In-Reply-To: <1360731937-23471-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org

Am Mittwoch, 13. Februar 2013, 06:05:36 schrieb Kukjin Kim:
> commit 7b45ed96 ("ARM: S3C24XX: handle s3c2412 eints using new
> infrastructure") introduced build warning and this patch fixes
> that:
> 
> drivers/gpio/gpio-samsung.c: In function 's3c24xx_gpiolib_fbank_to_irq':
> drivers/gpio/gpio-samsung.c:1126:5: warning: suggest explicit braces to
> avoid ambiguous 'else' [-Wparentheses]
> 
> Reported-by: kbuild test robot <fengguang.wu@intel.com>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>

right ... this way it's definitly better

Acked-by: Heiko Stuebner <heiko@sntech.de>


> ---
>  drivers/gpio/gpio-samsung.c |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpio/gpio-samsung.c b/drivers/gpio/gpio-samsung.c
> index df096dc..a811d0f 100644
> --- a/drivers/gpio/gpio-samsung.c
> +++ b/drivers/gpio/gpio-samsung.c
> @@ -1123,11 +1123,12 @@ int samsung_gpiolib_to_irq(struct gpio_chip *chip,
> unsigned int offset) #ifdef CONFIG_PLAT_S3C24XX
>  static int s3c24xx_gpiolib_fbank_to_irq(struct gpio_chip *chip, unsigned
> offset) {
> -	if (offset < 4)
> +	if (offset < 4) {
>  		if (soc_is_s3c2412())
>  			return IRQ_EINT0_2412 + offset;
>  		else
>  			return IRQ_EINT0 + offset;
> +	}
> 
>  	if (offset < 8)
>  		return IRQ_EINT4 + offset - 4;
