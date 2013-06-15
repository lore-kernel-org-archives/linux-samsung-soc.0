From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH V2 3/3] gpio: samsung: skip gpiolib registration if pinctrl support is enabled for exynos5420
Date: Sat, 15 Jun 2013 22:47:24 +0200
Message-ID: <3511415.WCXCyc9gA4@flatron>
References: <1371214954-29358-1-git-send-email-l.krishna@samsung.com> <1371214954-29358-4-git-send-email-l.krishna@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46]:60796 "EHLO
	mail-bk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754502Ab3FOUrY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 15 Jun 2013 16:47:24 -0400
Received: by mail-bk0-f46.google.com with SMTP id na10so688356bkb.33
        for <linux-samsung-soc@vger.kernel.org>; Sat, 15 Jun 2013 13:47:23 -0700 (PDT)
In-Reply-To: <1371214954-29358-4-git-send-email-l.krishna@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Leela Krishna Amudala <l.krishna@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, dianders@chromium.org, sjg@chromium.org, thomas.ab@samsung.com, t.figa@samsung.com, s.nawrocki@samsung.com, linus.walleij@linaro.org

On Friday 14 of June 2013 18:32:34 Leela Krishna Amudala wrote:
> Skip exynos5420 gpiolib registration if pinctrl support is enabled.
> 
> Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
> Reviewed-by: Doug Anderson <dianders@chromium.org>
> Reviewed-by: Tomasz Figa <t.figa@samsung.com>
> ---
>  drivers/gpio/gpio-samsung.c |    1 +
>  1 file changed, 1 insertion(+)

This patch is not needed any more, because ARCH_EXYNOS does not select 
GPIO_SAMSUNG after cleanup patches I posted recently.

Best regards,
Tomasz

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
>  		{ }
>  	};
