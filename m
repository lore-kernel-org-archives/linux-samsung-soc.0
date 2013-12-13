From: Heiko =?iso-8859-15?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 1/2] ARM: s3c24xx: get rid of custom <mach/gpio.h>
Date: Fri, 13 Dec 2013 08:57:23 +0100
Message-ID: <201312130857.23890.heiko@sntech.de>
References: <1386857210-4944-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:35436 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751801Ab3LMH5b (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 13 Dec 2013 02:57:31 -0500
In-Reply-To: <1386857210-4944-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Ben Dooks <ben-linux@fluff.org>, Tomasz Figa <tomasz.figa@gmail.com>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>

Am Donnerstag, 12. Dezember 2013, 15:06:50 schrieb Linus Walleij:
> This isolates the custom S3C24xx GPIO definition table to
> <linux/platform_data/gpio-samsung-s3x24xx.h> as this is
> used in a few different places in the kernel, removing the
> need to depend on the implicit inclusion of <mach/gpio.h>
> from <linux/gpio.h> and thus getting rid of a few nasty
> cross-dependencies.
> 
> We also delete the nifty CONFIG_S3C24XX_GPIO_EXTRA stuff.
> The biggest this can ever be for the S3C24XX is
> CONFIG_S3C24XX_GPIO_EXTRA = 128, and then for CPU_S3C2443 or
> CPU_S3C2416 32*12 GPIOs are added, so 32*12+128 = 512
> is the absolute roof value on this platform. So we set
> the size of ARCH_NR_GPIO to this and the GPIOs array will
> fit any S3C24XX platform, as per pattern from other archs.
> 
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: Tomasz Figa <tomasz.figa@gmail.com>
> Cc: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
> Cc: Ben Dooks <ben-linux@fluff.org>
> Cc: Kukjin Kim <kgene.kim@samsung.com>
> Cc: linux-samsung-soc@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Added an #ifdef ARCH_S3C24XX around the header inclusion
>   in drivers/gpio/gpio-samsung.c as we would otherwise
>   have colliding definitions when compiling S3C64XX.
> - Rename inclusion guard in the header file.
> 
> If one of the maintainers give me an ACK for this I will
> take it through the GPIO tree.
> ---

I'm not the maintainer of s3c24xx, but this looks nice ;-)

Acked-by: Heiko Stuebner <heiko@sntech.de>
