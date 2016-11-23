From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3] ARM: Drop fixed 200 Hz timer requirement from Samsung
 platforms
Date: Wed, 23 Nov 2016 19:37:39 +0200
Message-ID: <20161123173739.GA9228@kozik-lap>
References: <1479467712-5218-1-git-send-email-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1479467712-5218-1-git-send-email-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Ben Dooks <ben.dooks@codethink.co.uk>, Lee Jones <lee.jones@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Nov 18, 2016 at 01:15:12PM +0200, Krzysztof Kozlowski wrote:
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
> On S3C24xx, the PWM counter is only 16 bit wide, and with the
> typical 12MHz input clock that overflows every 5.5ms.  This works
> with HZ=200 or higher but not with HZ=100 which needs a 10ms
> interval between ticks.  On Later chips (S3C64xx, S5P and EXYNOS),
> the counter is 32 bits and does not have this problem.
> 
> The new samsung_pwm_timer driver solves the problem by scaling the input
> clock by a factor of 50 on S3C24xx, which makes it less accurate but
> allows HZ=100 as well as CONFIG_NO_HZ with fewer wakeups.
> 
> Few perf mem and sched tests on Odroid XU3 board (Exynos5422, 4x Cortex
> A7, 4x Cortex A15) show no regressions when switching from 200 Hz to
> other values.
> 
> Reported-by: Lee Jones <lee.jones@linaro.org>
> [Dropping of 200_HZ from S3C/S5P was suggested by Arnd]
> Reported-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Kukjin Kim <kgene@kernel.org>
> [Tested on Exynos5800]
> Tested-by: Javier Martinez Canillas <javier@osg.samsung.com>
> Acked-by: Kukjin Kim <kgene@kernel.org>
> [Tested on S3C2440]
> Tested-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> 
> ---
> 
> Changes since v2:
> 1. Extend message.
> 2. Add Kukjin's ack.
> 3. Add Sylwester's tested-by.
> 
> Changes since v1:
> 1. Add Javier's tested-by.
> 2. Drop HZ_FIXED also from ARCH_S5PV210 and ARCH_S3C24XX after Arnd
>    suggestions and analysis.
> ---
>  arch/arm/Kconfig | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>

Applied,
Krzysztof
