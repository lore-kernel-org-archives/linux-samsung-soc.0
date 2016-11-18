From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2] ARM: Drop fixed 200 Hz timer requirement from Samsung platforms
Date: Fri, 18 Nov 2016 09:46:47 +0100
Message-ID: <22757093.ejshJp9T7L@wuerfel>
References: <1479453418-25314-1-git-send-email-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.130]:63591 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752724AbcKRIrk (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 18 Nov 2016 03:47:40 -0500
In-Reply-To: <1479453418-25314-1-git-send-email-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Russell King <linux@armlinux.org.uk>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Ben Dooks <ben.dooks@codethink.co.uk>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Lee Jones <lee.jones@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>

On Friday, November 18, 2016 9:16:58 AM CET Krzysztof Kozlowski wrote:
> All Samsung platforms, including the Exynos, are selecting HZ_FIXED with
> 200 Hz.  Unfortunately in case of multiplatform image this affects also
> other platforms when Exynos is enabled.
> 
> This looks like an very old legacy code, dating back to initial
> upstreaming of S3C24xx.  Probably it was required for s3c24xx timer
> driver, which was removed in commit ad38bdd15d5b ("ARM: SAMSUNG: Remove
> unused plat-samsung/time.c").
> 
> Since then, this fixed 200 Hz spread everywhere, including out-of-tree
> Samsung kernels (SoC vendor's and Tizen's).  I believe this choice
> was rather an effect of coincidence instead of conscious choice.
> 
> Exynos uses its own MCT or arch timer and can work with all HZ values.
> Older platforms use newer Samsung PWM timer driver which should handle
> down to 100 Hz.
> 
> Few perf mem and sched tests on Odroid XU3 board (Exynos5422, 4x Cortex
> A7, 4x Cortex A15) show no regressions when switching from 200 Hz to
> other values.
> 
> Reported-by: Lee Jones <lee.jones@linaro.org>
> [Dropping 200_HZ from S3C/S5P suggested by Arnd]
> Reported-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Kukjin Kim <kgene@kernel.org>
> Tested-by: Javier Martinez Canillas <javier@osg.samsung.com>
> 

Acked-by: Arnd Bergmann <arnd@arndb.de>

Maybe add a paragraph about the specific problem:

"On s3c24xx, the PWM counter is only 16 bit wide, and with the
typical 12MHz input clock that overflows every 5.5ms. This works
with HZ=200 or higher but not with HZ=100 which needs a 10ms
interval between ticks. On Later chips (S3C64xx, S5P and EXYNOS),
the counter is 32 bits and does not have this problem.
The new samsung_pwm_timer driver solves the problem by scaling
the input clock by a factor of 50 on s3c24xx, which makes it
less accurate but allows HZ=100 as well as CONFIG_NO_HZ with
fewer wakeups".

	Arnd
