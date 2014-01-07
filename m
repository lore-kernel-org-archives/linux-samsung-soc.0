From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 1/2 v3] ARM: s3c24xx: get rid of custom <mach/gpio.h>
Date: Tue, 07 Jan 2014 20:36:22 +0100
Message-ID: <3906866.u3Hx8EuvTo@phil>
References: <1386939220-12776-1-git-send-email-linus.walleij@linaro.org> <201401071215.06064.arnd@arndb.de> <CACRpkdacaskiv2R5YTB_9jFaOueXGEFxYQUEo4eq7aHkDLhjfw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:38339 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750851AbaAGTgo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Jan 2014 14:36:44 -0500
In-Reply-To: <CACRpkdacaskiv2R5YTB_9jFaOueXGEFxYQUEo4eq7aHkDLhjfw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Ben Dooks <ben-linux@fluff.org>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, Tomasz Figa <tomasz.figa@gmail.com>

Am Dienstag, 7. Januar 2014, 19:27:49 schrieb Linus Walleij:
> On Tue, Jan 7, 2014 at 12:15 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> > On Friday 13 December 2013, Linus Walleij wrote:
> > * The file includes <plat/gpio-cfg.h>, which is not a bug yet, but
> > 
> >   will be once we move s3c24xx to multiplatform, which would make
> >   it impossible to include this file from outside of arch/arm.
> 
> Yes that needs to be a step for multiplatform enablement.
> My series only tries to make the problem smaller and remove
> the dependence on <mach/gpio.h>. All the <mach/*> and
> <plat/*> stuff needs to go away eventually ...
>
> > Note that on Exynos, the solution for the gpio driver dependencies
> > was to scrap the driver and use pinctrl-exynos instead.
> 
> I think the S3C driver is a different piece of hardware unfortunately.

both the s3c24xx as well as the exynos pinctrl driver use the common pinctrl-
samsung infrastructure. The biggest part of the pinctrl-{exynos,s3c24xx} 
drivers is the handling of the gpio-interrupts and defining the available 
banks.

In general my multiplatform-plan is to provide the basics (pinctrl, common-
clock, etc) and then take the easy way out, described in some arm-summit-notes 
by simply removing the boards and let people with the hardware that care about 
it readd the specifics :-) .

For example it seems nobody started a S3C2442 machine for quite some time, as 
it was/is missing the clkdev entries for stuff like the serial ports.


Heiko
