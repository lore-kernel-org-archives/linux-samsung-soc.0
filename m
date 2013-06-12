From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 3/3] gpio: samsung: skip gpiolib registration if pinctrl support is enabled for exynos5420
Date: Wed, 12 Jun 2013 23:02:24 +0200
Message-ID: <21123416.h5QvJGGsDv@flatron>
References: <1371048688-9089-1-git-send-email-l.krishna@samsung.com> <1371048688-9089-4-git-send-email-l.krishna@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f177.google.com ([209.85.215.177]:45128 "EHLO
	mail-ea0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755695Ab3FLVC2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Jun 2013 17:02:28 -0400
Received: by mail-ea0-f177.google.com with SMTP id j14so7256027eak.22
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Jun 2013 14:02:27 -0700 (PDT)
In-Reply-To: <1371048688-9089-4-git-send-email-l.krishna@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Leela Krishna Amudala <l.krishna@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, dianders@chromium.org, sjg@chromium.org, thomas.ab@samsung.com, t.figa@samsung.com

On Wednesday 12 of June 2013 20:21:28 Leela Krishna Amudala wrote:
> Skip exynos5420 gpiolib registration if pinctrl support is enabled.
> 
> Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
> ---
>  drivers/gpio/gpio-samsung.c |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpio/gpio-samsung.c b/drivers/gpio/gpio-samsung.c
> index 83a0d71..b3dd984 100644
> --- a/drivers/gpio/gpio-samsung.c
> +++ b/drivers/gpio/gpio-samsung.c
> @@ -3033,6 +3033,7 @@ static __init int samsung_gpiolib_init(void)
>  		{ .compatible = "samsung,exynos4210-pinctrl", },
>  		{ .compatible = "samsung,exynos4x12-pinctrl", },
>  		{ .compatible = "samsung,exynos5250-pinctrl", },
> +		{ .compatible = "samsung,exynos5420-pinctrl", },
>  		{ .compatible = "samsung,exynos5440-pinctrl", },

IMHO after Kukjin's patches removing non-DT support for Exynos, we can 
just remove Exynos support from this legacy driver. I will send 
appropriate patch this Friday, along with other cleanup patches.

Best regards,
Tomasz

>  		{ }
>  	};
