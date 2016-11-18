From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] ARM: Drop fixed 200 Hz timer requirement from Exynos
 platforms
Date: Fri, 18 Nov 2016 08:47:49 +0200
Message-ID: <20161118064749.GA2122@kozik-lap>
References: <1479148025-469-1-git-send-email-krzk@kernel.org>
 <3145378.USf2WOPoV2@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:32984 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751058AbcKRGrz (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 18 Nov 2016 01:47:55 -0500
Content-Disposition: inline
In-Reply-To: <3145378.USf2WOPoV2@wuerfel>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>, Russell King <linux@armlinux.org.uk>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Ben Dooks <ben.dooks@codethink.co.uk>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Lee Jones <lee.jones@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>

On Thu, Nov 17, 2016 at 01:35:45PM +0100, Arnd Bergmann wrote:
> On Monday, November 14, 2016 8:27:05 PM CET Krzysztof Kozlowski wrote:
> > @@ -1497,7 +1497,7 @@ source kernel/Kconfig.preempt
> >  config HZ_FIXED
> >         int
> >         default 200 if ARCH_EBSA110 || ARCH_S3C24XX || \
> > -               ARCH_S5PV210 || ARCH_EXYNOS4
> > +               ARCH_S5PV210
> >         default 128 if SOC_AT91RM9200
> >         default 0
> 
> After further research, I've concluded that we should also drop the
> settings for ARCH_S5PV210 and ARCH_S3C24XX here.
> 
> ARCH_S5PV210 behaves exactly like EXYNOS here, it has 32-bit timers
> so there won't be any overflow with 100Hz.
> 
> For ARCH_S3C24XX, it the requirement was that HZ_100 could not
> be used with the old arch/arm/plat-samsung/time.c code that would
> overflow its 16-bit counter.
> However, the new drivers/clocksource/samsung_pwm_timer.c configures
> the clock divider to '50' instead of '6', so there is no longer
> a 16-bit overflow before the 100Hz tick, it now overflows every
> 3.7ms for the typical 12MHz clock.

I can send an updated version however testing would be nice... I know
Sylwester has a S3C6410 platform running, maybe S3C24xx as well.

Best regards,
Krzysztof
