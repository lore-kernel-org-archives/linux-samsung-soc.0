From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v5 00/14] ARM: samsung-time: Prepare for multiplatform support
Date: Mon, 22 Apr 2013 21:21:05 +0200
Message-ID: <8994400.x1JqGELAnV@flatron>
References: <1365794250-14436-1-git-send-email-t.figa@samsung.com> <201304122251.41393.arnd@arndb.de> <5175755D.20305@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f171.google.com ([74.125.82.171]:60060 "EHLO
	mail-we0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754727Ab3DVTVK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Apr 2013 15:21:10 -0400
Received: by mail-we0-f171.google.com with SMTP id i48so6944220wef.16
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Apr 2013 12:21:09 -0700 (PDT)
In-Reply-To: <5175755D.20305@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Tomasz Figa <t.figa@samsung.com>, mark.rutland@arm.com, heiko@sntech.de, buserror@gmail.com, jacmet@sunsite.dk, augulis.darius@gmail.com, christer@weinigel.se, sylvester.nawrocki@gmail.com, m.szyprowski@samsung.com, linux@arm.linux.org.uk, kwangwoo.lee@gmail.com, mcuelenaere@gmail.com, devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, john.stultz@linaro.org, ghcstop@gmail.com, linux@simtec.co.uk, linux-arm-kernel@lists.infradead.org, broonie@opensource.wolfsonmicro.com, jekhor@gmail.com, kyungmin.park@samsung.com, tglx@linutronix.de, olof@lixom.net

On Tuesday 23 of April 2013 02:37:33 Kukjin Kim wrote:
> On 04/13/13 05:51, Arnd Bergmann wrote:
> > On Friday 12 April 2013, Tomasz Figa wrote:
> >> This series is an attempt to make the samsung-time clocksource driver
> >> ready for multiplatform kernels. It moves the driver to
> >> drivers/clocksource, cleans it up from uses of static
> >> platform-specific definitions, simplifies timer interrupt handling
> >> and adds Device Tree support.
> >> 
> >> The samsung_pwm clocksource driver is made the master driver, which
> >> exposes a single function to the PWM driver to get required data.
> >> Only
> >> samsung-time driver is reworked to use the master driver at this
> >> time,
> >> since the PWM driver can be already considered broken at the moment
> >> and
> >> needs separate series of several patches to fix and clean it up,
> >> which
> >> I am already working on.
> >> 
> >> Tested on Universal C210 board with Device Tree. Not tested without
> >> Device Tree, since it has been already broken before this series.
> >> Compile tested for other related SoCs.
> > 
> > Acked-by: Arnd Bergmann<arnd@arndb.de>
> 
> Applied, this whole series.

It would be nice if we could still get this for 3.10, but AFAIK it is 
already much too late.

I've discussed this matter with Arnd and the solution that can be accepted 
by arm-soc maintainers is to send a subset of this series, like in the 
patch sent by Arnd (clocksource: add samsung pwm timer driver; it needs 
additional fixes, though.).

Best regards,
Tomasz
