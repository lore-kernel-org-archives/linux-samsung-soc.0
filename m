From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 1/2] ARM: s3c24xx: get rid of custom <mach/gpio.h>
Date: Fri, 13 Dec 2013 11:30:13 +0100
Message-ID: <12061693.IYmMzIp37Y@flatron>
References: <1386857210-4944-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f41.google.com ([74.125.83.41]:43904 "EHLO
	mail-ee0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752278Ab3LMKaU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 13 Dec 2013 05:30:20 -0500
Received: by mail-ee0-f41.google.com with SMTP id t10so779837eei.14
        for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Dec 2013 02:30:19 -0800 (PST)
In-Reply-To: <1386857210-4944-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Ben Dooks <ben-linux@fluff.org>, Heiko Stuebner <heiko@sntech.de>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>

Hi Linus,

On Thursday 12 of December 2013 15:06:50 Linus Walleij wrote:
[snip]
>  arch/arm/mach-s3c64xx/include/mach/gpio.h          |  93 -----------------

Hmm, shouldn't this (and other s3c64xx-related changes) be in patch 2/2?

Anyway, I've applied both, but unfortunately compilation for mach-s3c64xx
(using s3c6400_defconfig) fails with following error:

  CC      arch/arm/plat-samsung/pm-gpio.o
In file included from arch/arm/plat-samsung/pm-gpio.c:25:0:
arch/arm/plat-samsung/include/plat/gpio-core.h:100:44: error: 'S3C_GPIO_END' undeclared here (not in a function)
 extern struct samsung_gpio_chip *s3c_gpios[S3C_GPIO_END];
                                            ^
scripts/Makefile.build:308: recipe for target 'arch/arm/plat-samsung/pm-gpio.o' failed
make[1]: *** [arch/arm/plat-samsung/pm-gpio.o] Error 1
Makefile:820: recipe for target 'arch/arm/plat-samsung' failed
make: *** [arch/arm/plat-samsung] Error 2

I don't have much time right now to look at this further, but I'll try
to do it later today (if you don't fix it before that) and do further
testing.

Best regards,
Tomasz
