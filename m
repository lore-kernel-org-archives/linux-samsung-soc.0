From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 3/5] ARM: S5P64X0: Add pm save/restore functions for GPIO
 banks
Date: Wed, 07 Sep 2011 15:01:38 +0900
Message-ID: <000301cc6d23$9bad71a0$d30854e0$%kim@samsung.com>
References: <1313144787-30666-1-git-send-email-a.kesavan@samsung.com>
 <1313144787-30666-4-git-send-email-a.kesavan@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:60880 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754015Ab1IGGBk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Sep 2011 02:01:40 -0400
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LR500D3Z20GDOG0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 07 Sep 2011 15:01:39 +0900 (KST)
Received: from kgenekim (12-23-120-114.csky.net [12.23.120.114])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LR5001BH22RZH@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 07 Sep 2011 15:01:39 +0900 (KST)
In-reply-to: <1313144787-30666-4-git-send-email-a.kesavan@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Abhilash Kesavan' <a.kesavan@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Abhilash Kesavan wrote:
> 
> Fix the "no pm for GPIOXX" messages appearing during bootup due
> to missing assignment of save/restore functions for those banks.
> 
> Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
> ---
>  arch/arm/mach-s5p64x0/gpiolib.c  |    1 +
>  drivers/gpio/gpio-plat-samsung.c |    4 +++-
>  2 files changed, 4 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/arm/mach-s5p64x0/gpiolib.c
b/arch/arm/mach-s5p64x0/gpiolib.c
> index e7fb3b0..76c0924 100644
> --- a/arch/arm/mach-s5p64x0/gpiolib.c
> +++ b/arch/arm/mach-s5p64x0/gpiolib.c
> @@ -467,6 +467,7 @@ static void __init s5p64x0_gpio_add_rbank_4bit2(struct
> s3c_gpio_chip *chip,
>  		chip->chip.direction_input =
s5p64x0_gpiolib_rbank_4bit2_input;
>  		chip->chip.direction_output =
>  					s5p64x0_gpiolib_rbank_4bit2_output;
> +		chip->pm = __gpio_pm(&s3c_gpio_pm_4bit);
>  		s3c_gpiolib_add(chip);
>  	}
>  }
> diff --git a/drivers/gpio/gpio-plat-samsung.c
b/drivers/gpio/gpio-plat-samsung.c
> index ef67f19..4f7c387 100644
> --- a/drivers/gpio/gpio-plat-samsung.c
> +++ b/drivers/gpio/gpio-plat-samsung.c
> @@ -200,6 +200,8 @@ void __init samsung_gpiolib_add_4bit2_chips(struct
> s3c_gpio_chip *chip,
>  void __init samsung_gpiolib_add_2bit_chips(struct s3c_gpio_chip *chip,
>  					   int nr_chips)
>  {
> -	for (; nr_chips > 0; nr_chips--, chip++)
> +	for (; nr_chips > 0; nr_chips--, chip++) {
> +		chip->pm = __gpio_pm(&s3c_gpio_pm_2bit);
>  		s3c_gpiolib_add(chip);
> +	}
>  }
> --
> 1.7.4.1

Hi Abhilash,

Since submitted gpio-samsung patch includes above changes, so we can drop
this.

If any problem, please let me know.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
