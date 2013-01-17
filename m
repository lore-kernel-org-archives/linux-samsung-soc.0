From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: samsung: silent build warning for EXYNOS5 SoCs
Date: Thu, 17 Jan 2013 09:18:39 +0100
Message-ID: <CACRpkdbcsXVNY-1TgmZ=qyVtMDFiijPGUb1vNcHHRfSh62NP+A@mail.gmail.com>
References: <1356631950-1556-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ia0-f182.google.com ([209.85.210.182]:63711 "EHLO
	mail-ia0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754466Ab3AQISk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Jan 2013 03:18:40 -0500
Received: by mail-ia0-f182.google.com with SMTP id w33so312803iag.27
        for <linux-samsung-soc@vger.kernel.org>; Thu, 17 Jan 2013 00:18:40 -0800 (PST)
In-Reply-To: <1356631950-1556-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Grant Likely <grant.likely@secretlab.ca>, Thomas Abraham <thomas.ab@samsung.com>

On Thu, Dec 27, 2012 at 7:12 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:

> This patch fixes following warning:
>
> drivers/gpio/gpio-samsung.c:450:32: warning: 'exynos_gpio_cfg' defined but not used [-Wunused-variable]
> drivers/gpio/gpio-samsung.c:2450:33: warning: 'exynos5_gpios_1' defined but not used [-Wunused-variable]
> drivers/gpio/gpio-samsung.c:2618:33: warning: 'exynos5_gpios_2' defined but not used [-Wunused-variable]
> drivers/gpio/gpio-samsung.c:2679:33: warning: 'exynos5_gpios_3' defined but not used [-Wunused-variable]
> drivers/gpio/gpio-samsung.c:2715:33: warning: 'exynos5_gpios_4' defined but not used [-Wunused-variable]
>
> Because current gpio-samsung is valid only on EXYNOS5250.
>
> Cc: Thomas Abraham <thomas.ab@samsung.com>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>

Patch applied, thanks!

Yours,
Linus Walleij
