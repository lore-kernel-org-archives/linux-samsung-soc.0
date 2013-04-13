From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v5 00/14] ARM: samsung-time: Prepare for multiplatform support
Date: Sat, 13 Apr 2013 14:28:18 +0200
Message-ID: <14380521.emfIF6y4Om@flatron>
References: <1365794250-14436-1-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f172.google.com ([209.85.215.172]:49473 "EHLO
	mail-ea0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752784Ab3DMM2W (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 13 Apr 2013 08:28:22 -0400
Received: by mail-ea0-f172.google.com with SMTP id z7so1625024eaf.31
        for <linux-samsung-soc@vger.kernel.org>; Sat, 13 Apr 2013 05:28:21 -0700 (PDT)
In-Reply-To: <1365794250-14436-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, kyungmin.park@samsung.com, linux@simtec.co.uk, broonie@opensource.wolfsonmicro.com, kwangwoo.lee@gmail.com, jacmet@sunsite.dk, augulis.darius@gmail.com, mcuelenaere@gmail.com, linux@arm.linux.org.uk, sylvester.nawrocki@gmail.com, buserror@gmail.com, christer@weinigel.se, jekhor@gmail.com, ghcstop@gmail.com, mark.rutland@arm.com, heiko@sntech.de, robherring2@gmail.com, m.szyprowski@samsung.com, arnd@arndb.de, john.stultz@linaro.org, tglx@linutronix.de

On Friday 12 of April 2013 21:17:16 Tomasz Figa wrote:
> This series is an attempt to make the samsung-time clocksource driver
> ready for multiplatform kernels. It moves the driver to
> drivers/clocksource, cleans it up from uses of static platform-specific
> definitions, simplifies timer interrupt handling and adds Device Tree
> support.
> 
> The samsung_pwm clocksource driver is made the master driver, which
> exposes a single function to the PWM driver to get required data. Only
> samsung-time driver is reworked to use the master driver at this time,
> since the PWM driver can be already considered broken at the moment and
> needs separate series of several patches to fix and clean it up, which
> I am already working on.
> 
> Tested on Universal C210 board with Device Tree. Not tested without
> Device Tree, since it has been already broken before this series.
> Compile tested for other related SoCs.
> 
> Changes since v4:
> (http://thread.gmane.org/gmane.linux.kernel.samsung-soc/17464)
>  - Changed the design again - now clocksource driver is considered the
> master and exports a single function to get access to things like base
> address, hardware variant information, shared spinlock for register
> access synchronization and interrupt numbers
>  - Renamed the clocksource driver to samsung_pwm
>  - Cleaned up the code a bit more
>  - Added clocksource_of_init support
> 
> Changes since v3:
> (http://thread.gmane.org/gmane.linux.kernel.samsung-soc/16664/)
>  - Changed the design to use common (master) driver for operations that
>    can be done from both clocksource and PWM drivers (as suggested by
>    Arnd Bergmann) - needed to properly synchronize access to PWM
> registers - Moved handling of PWM prescaler and divider to master
> driver
> 
> Changes since v2:
> (http://thread.gmane.org/gmane.linux.kernel.samsung-soc/16158)
>  - Addressed comments from Rob Herring and Mark Rutland
>  - Removed unused register definitions
>  - Replaced samsung,source-timer and samsung,event-timer properties
>    with samsung,pwm-outputs property that defines which PWM channels
>    are reserved for PWM outputs on particular platform
>  - Split non-DT and DT initialization into two functions
>  - Fixed a copy paste error
> 
> Changes since v1:
> (http://thread.gmane.org/gmane.linux.kernel.samsung-soc/16005)
>  - Addressed comments from Mark Rutland
>  - Documented struct samsung_timer_variant
>  - Dropped inactive mail addresses from CC
> 
> Tomasz Figa (14):
>   ARM: SAMSUNG: Move samsung-time to drivers/clocksource
>   clocksource: samsung-pwm: Clean up platform header
>   clocksource: samsung-pwm: Add infrastructure to share PWM hardware
>   ARM: SAMSUNG: Unify base address definitions of timer block
>   ARM: SAMSUNG: Add new PWM platform device
>   ARM: SAMSUNG: Set PWM platform data
>   clocksource: samsung-pwm: Use platform data to setup the clocksource
>   clocksource: samsung-pwm: Synchronize register accesses
>   clocksource: samsung-pwm: Move IRQ mask/ack handling to the driver
>   ARM: SAMSUNG: Remove unused PWM timer IRQ chip code
>   clocksource: samsung-pwm: Configure dividers directly
>   clocksource: samsung-pwm: Do not use static mapping of registers
>   clocksource: samsung-pwm: Drop unnecessary includes
>   clocksource: samsung-pwm: Prepare for clocksource_of_init

On S3C6410-based Tiny6410 (Mini6410-compatible) board, both with and 
without Device Tree:

Tested-by: Tomasz Figa <tomasz.figa@gmail.com>

Best regards,
Tomasz
