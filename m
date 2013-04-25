From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3 00/13] ARM: EXYNOS: Fix Universal C210 support
Date: Thu, 25 Apr 2013 16:46:27 +0200
Message-ID: <201304251646.28026.arnd@arndb.de>
References: <1366731994-7478-1-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.8]:61200 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757471Ab3DYOqf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 25 Apr 2013 10:46:35 -0400
In-Reply-To: <1366731994-7478-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, kyungmin.park@samsung.com, tomasz.figa@gmail.com, m.szyprowski@samsung.com, john.stultz@linaro.org, tglx@linutronix.de, olof@lixom.net, ben-linux@fluff.org, thomas.abraham@linaro.org

On Tuesday 23 April 2013, Tomasz Figa wrote:
> This series intends to fix support for Universal C210 board in mainline.
> Main difference from other boards based on Exynos 4210 is that hardware
> revision of the SoC used on Universal C210 does not support MCT timers
> and legacy PWM timers must be used instead.
> 
> First (and the biggest) part of the series deals with cleaning up and
> fixing the samsung_pwm_timer clocksource driver, that was posted
> recently by Arnd. In addition the driver is prepared to share the
> hardware with PWM driver that will be reworked later, since it is not
> a component crucial for system operation.
> 
> Second part fixes ATAGS support of Exynos 4210 rev0 SoC, which needs
> different timer initialization, using the new samsung_pwm_timer driver.
> 
> Third and last part adds Device Tree-based support for Universal C210
> board by providing device tree sources for it.
> 
> On Universal C210 board, both with and without DT:
> 
> Tested-by: Tomasz Figa <t.figa@samsung.com>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

Olof, Kgene, I think we should have this one in 3.10 since it fixes
a regression. It looks bigger than it really is because I asked Tomasz
to do small patches rather than a single combined patch.

	Arnd
