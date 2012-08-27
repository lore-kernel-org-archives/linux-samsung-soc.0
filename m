From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 0/3] Removal of obsolete s3c2410_* GPIO API
Date: Mon, 27 Aug 2012 16:33:43 -0700
Message-ID: <503C03D7.5050801@samsung.com>
References: <1345897243-15619-1-git-send-email-sylvester.nawrocki@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:48201 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754853Ab2H0Xds (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 27 Aug 2012 19:33:48 -0400
Received: by pbbrr13 with SMTP id rr13so8278738pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Aug 2012 16:33:48 -0700 (PDT)
In-Reply-To: <1345897243-15619-1-git-send-email-sylvester.nawrocki@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Cc: kgene.kim@samsung.com, linus.walleij@stericsson.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On 08/25/12 05:20, Sylwester Nawrocki wrote:
> This short patch series converts remaining users of the s3c24xx SoC
> specific gpiolib functions to the gpiolib API and finally removes
> all s3c2410_* functions from drivers/gpio/gpio-samsung.c.
>
> Sylwester Nawrocki (3):
>    ARM: S3C24XX: Convert users of s3c2410_gpio_setpin to gpiolib API
>    ARM: S3C24XX: Remove obsolete GPIO API declarations
>    gpio-samsung: Remove now unused s3c2410_gpio* API
>
>   arch/arm/mach-s3c24xx/mach-anubis.c           |    3 +-
>   arch/arm/mach-s3c24xx/mach-jive.c             |   12 ++--
>   arch/arm/mach-s3c24xx/mach-mini2440.c         |    4 +-
>   arch/arm/mach-s3c24xx/mach-nexcoder.c         |   22 +++---
>   arch/arm/mach-s3c24xx/mach-osiris.c           |    7 +-
>   arch/arm/plat-samsung/include/plat/gpio-fns.h |   97 -------------------------
>   drivers/gpio/gpio-samsung.c                   |   40 ----------
>   7 files changed, 25 insertions(+), 160 deletions(-)
>

Nice cleanup.

Accordingly, we need to sort out the 
'Documentation/arm/Samsung-S3C24XX/GPIO.txt' later?

Linus, this series should be sent to upstream via both trees, samsung 
and gpio to avoid useless merge conflicts. How do you think?

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
