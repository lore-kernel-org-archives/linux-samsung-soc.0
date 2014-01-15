From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] ARM: S3C[24|64]xx: move includes back under <mach/> scope
Date: Wed, 15 Jan 2014 13:58:11 +0100
Message-ID: <CACRpkda=p6GnpuNQizdQA1gGuOe8Lnsp+r8rQedWCRog2MRHww@mail.gmail.com>
References: <1389707618-17011-1-git-send-email-linus.walleij@linaro.org>
	<CAHbNUh29qGSt-isqOAdVVO3x0w2mDTVnKeH+Sc_rkfkOiXc_mA@mail.gmail.com>
	<6144980.CZru2D3yJB@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f51.google.com ([209.85.219.51]:62548 "EHLO
	mail-oa0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751253AbaAOM6M (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 15 Jan 2014 07:58:12 -0500
Received: by mail-oa0-f51.google.com with SMTP id h16so617087oag.38
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Jan 2014 04:58:12 -0800 (PST)
In-Reply-To: <6144980.CZru2D3yJB@wuerfel>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Tushar Behera <tushar.behera@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Heiko Stuebner <heiko@sntech.de>, Mark Brown <broonie@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Ben Dooks <ben-linux@fluff.org>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>

On Wed, Jan 15, 2014 at 10:43 AM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Wednesday 15 January 2014 14:41:01 Tushar Behera wrote:
>> > diff --git a/arch/arm/plat-samsung/pm-gpio.c b/arch/arm/plat-samsung/pm-gpio.c
>> > index c4efa1c2a5d1..a9f7a37c4173 100644
>> > --- a/arch/arm/plat-samsung/pm-gpio.c
>> > +++ b/arch/arm/plat-samsung/pm-gpio.c
>> > @@ -19,12 +19,7 @@
>> >  #include <linux/io.h>
>> >  #include <linux/gpio.h>
>> >
>> > -#ifdef CONFIG_ARCH_S3C24XX
>> > -#include <linux/platform_data/gpio-samsung-s3c24xx.h>
>> > -#endif
>> > -#ifdef CONFIG_ARCH_S3C64XX
>> > -#include <linux/platform_data/gpio-samsung-s3c64xx.h>
>> > -#endif
>> > +#include <mach/gpio-samsung.h>
>>
>> This inclusion should be protected by a check for CONFIG_ARCH_S3C24XX
>> || CONFIG_ARCH_S3C64XX. Currently generating build errors for
>> s5p64x0_defconfig, s5pc100_defconfig and s5pv210_defconfig on
>> next-20140115.
>>
>
> I noticed the same problem, but I think a better solution would
> be to do the same change for s5p that Linus has done for s3c,
> which is to move the nonstandard contents of mach/gpio.h to
> mach/gpio-samsung.h.

When I look at it, the issue also exist in e.g.
drivers/gpio/gpio-samsung.c which can be compiled
(like for allyesconfig) when PLAT_SAMSUNG is set.

And it is also set to y for ARCH_EXYNOS... which
doesn't have any custom GPIO header. So this would
involve something like creating an empty
<mach/gpio-samsung.h> for Exynos which doesn't
seem like the right thing to do.

So I'm sticking with the #ifdef patch for now as it
seems to be the lesser evil :-/

Yours,
Linus Walleij
