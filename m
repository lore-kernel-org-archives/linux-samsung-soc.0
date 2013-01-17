From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: samsung: skip gpio lib registration for EXYNOS5440
Date: Thu, 17 Jan 2013 11:54:31 +0100
Message-ID: <CACRpkdYDmUwH8=ATUug0LBdw_7dUPiHNVxNwFWKG1UnJnBnAHA@mail.gmail.com>
References: <1356030537-16830-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f173.google.com ([209.85.223.173]:38714 "EHLO
	mail-ie0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757197Ab3AQKyb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Jan 2013 05:54:31 -0500
Received: by mail-ie0-f173.google.com with SMTP id e13so4496652iej.4
        for <linux-samsung-soc@vger.kernel.org>; Thu, 17 Jan 2013 02:54:31 -0800 (PST)
In-Reply-To: <1356030537-16830-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Grant Likely <grant.likely@secretlab.ca>, Thomas Abraham <thomas.ab@samsung.com>

On Thu, Dec 20, 2012 at 8:08 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:

> Since exynos5440 can support pinctrl so skip the legacy
> gpiolib registration. If not, happens following.
>
> WARNING: at drivers/gpio/gpio-samsung.c:3102 samsung_gpiolib_init+0x68/0x8c()
> Unknown SoC in gpio-samsung, no GPIOs added
>
> Acked-by: Thomas Abraham <thomas.ab@samsung.com>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>

Appled to fixes.

Thanks!
Linus Walleij
