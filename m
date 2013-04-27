From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH v3 00/13] ARM: EXYNOS: Fix Universal C210 support
Date: Fri, 26 Apr 2013 17:34:13 -0700
Message-ID: <20130427003413.GA2350@quad.lixom.net>
References: <1366731994-7478-1-git-send-email-t.figa@samsung.com>
 <201304251646.28026.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f41.google.com ([209.85.220.41]:44033 "EHLO
	mail-pa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755329Ab3D0AeT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 26 Apr 2013 20:34:19 -0400
Received: by mail-pa0-f41.google.com with SMTP id kq12so2007147pab.14
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Apr 2013 17:34:18 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <201304251646.28026.arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Tomasz Figa <t.figa@samsung.com>, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, kyungmin.park@samsung.com, tomasz.figa@gmail.com, m.szyprowski@samsung.com, john.stultz@linaro.org, tglx@linutronix.de, ben-linux@fluff.org, thomas.abraham@linaro.org

On Thu, Apr 25, 2013 at 04:46:27PM +0200, Arnd Bergmann wrote:
> On Tuesday 23 April 2013, Tomasz Figa wrote:
> > This series intends to fix support for Universal C210 board in mainline.
> > Main difference from other boards based on Exynos 4210 is that hardware
> > revision of the SoC used on Universal C210 does not support MCT timers
> > and legacy PWM timers must be used instead.
> > 
> > First (and the biggest) part of the series deals with cleaning up and
> > fixing the samsung_pwm_timer clocksource driver, that was posted
> > recently by Arnd. In addition the driver is prepared to share the
> > hardware with PWM driver that will be reworked later, since it is not
> > a component crucial for system operation.
> > 
> > Second part fixes ATAGS support of Exynos 4210 rev0 SoC, which needs
> > different timer initialization, using the new samsung_pwm_timer driver.
> > 
> > Third and last part adds Device Tree-based support for Universal C210
> > board by providing device tree sources for it.
> > 
> > On Universal C210 board, both with and without DT:
> > 
> > Tested-by: Tomasz Figa <t.figa@samsung.com>
> 
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>
> 
> Olof, Kgene, I think we should have this one in 3.10 since it fixes
> a regression. It looks bigger than it really is because I asked Tomasz
> to do small patches rather than a single combined patch.

Ok. Kukjin, I don't mind collecting this in a late/* branch even though time is
running late, since it's a regression. Do you want to send it to me or should
I just pick up the patches?


-Olof
