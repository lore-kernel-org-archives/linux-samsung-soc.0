From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2 v3] ARM: s3c24xx: get rid of custom <mach/gpio.h>
Date: Tue, 14 Jan 2014 11:42:08 +0100
Message-ID: <CACRpkdZfXFja-j9ot_e4eu4yPo_YAk-U7Gr3xXvMQhSEJBvUbQ@mail.gmail.com>
References: <1386939220-12776-1-git-send-email-linus.walleij@linaro.org>
	<CACRpkdbdDHyg4uz0tAMccB8yGxsoF4JaHocAxbV_bTJ832kbQw@mail.gmail.com>
	<201401081243.04326.arnd@arndb.de>
	<201401081659.03357.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f50.google.com ([209.85.219.50]:44558 "EHLO
	mail-oa0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751368AbaANKmJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 14 Jan 2014 05:42:09 -0500
Received: by mail-oa0-f50.google.com with SMTP id l6so9367087oag.37
        for <linux-samsung-soc@vger.kernel.org>; Tue, 14 Jan 2014 02:42:09 -0800 (PST)
In-Reply-To: <201401081659.03357.arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, Ben Dooks <ben-linux@fluff.org>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>

On Wed, Jan 8, 2014 at 4:59 PM, Arnd Bergmann <arnd@arndb.de> wrote:

> I've asked the mighty grep and it said that these are the files
> using the contents you moved around:
>
> drivers/gpio/gpio-samsung.c
> drivers/leds/leds-s3c24xx.c
> drivers/mmc/host/s3cmci.c
> sound/soc/samsung/h1940_uda1380.c
> sound/soc/samsung/neo1973_wm8753.c
> sound/soc/samsung/rx1950_uda1380.c
> sound/soc/samsung/s3c2412-i2s.c
> sound/soc/samsung/s3c24xx-i2s.c
> sound/soc/samsung/smartq_wm8987.c
>
> The symbols used in these drivers are:
>
> S3C....GP.()
> S3C_GPIO_END
> S3C_GPIO_PULL_.*
> S3C_GPIO_SFN()
> s3c_gpio_cfgall_range()
> s3c_gpio_setpull()

Hm I will look closer at these. Maybe I can even fix some to just
pass GPIO thru platform data and end-of-story them.
Targeting v3.15.

But I guess you want me to move the
<linux/platform_data/gpio-s3c*> back to <mach/*>
before v3.14 so focusing on that now. (These patches
cannot be just reverted as people have fixed other
Samsung GPIO issues on top of them, so it needs to be done
carefully.)

> I think it would be worthwhile to go ahead and make all inclusions of
> the plat/gpio-cfg.h file explicit, and remove it from mach/gpio.h, that
> part should be simple enough and helpful at the same time.

<plat/gpio-cfg.h> is used by S5P as well, but I guess you've
checked that.

If I take it driver-by-driver it should be possible to get rid of it
or most of it I think, reducing it to the arch/arm/mach-* folder.

Certainly I should be attacking S3C and S5P simultaneously.

Yours,
Linus Walleij
