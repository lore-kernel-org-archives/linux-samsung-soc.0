From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] ARM: Drop fixed 200 Hz timer requirement from Exynos
 platforms
Date: Thu, 17 Nov 2016 13:35:45 +0100
Message-ID: <3145378.USf2WOPoV2@wuerfel>
References: <1479148025-469-1-git-send-email-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1479148025-469-1-git-send-email-krzk@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Lee Jones <lee.jones@linaro.org>, Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier@osg.samsung.com>, Kukjin Kim <kgene@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Ben Dooks <ben.dooks@codethink.co.uk>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Monday, November 14, 2016 8:27:05 PM CET Krzysztof Kozlowski wrote:
> @@ -1497,7 +1497,7 @@ source kernel/Kconfig.preempt
>  config HZ_FIXED
>         int
>         default 200 if ARCH_EBSA110 || ARCH_S3C24XX || \
> -               ARCH_S5PV210 || ARCH_EXYNOS4
> +               ARCH_S5PV210
>         default 128 if SOC_AT91RM9200
>         default 0

After further research, I've concluded that we should also drop the
settings for ARCH_S5PV210 and ARCH_S3C24XX here.

ARCH_S5PV210 behaves exactly like EXYNOS here, it has 32-bit timers
so there won't be any overflow with 100Hz.

For ARCH_S3C24XX, it the requirement was that HZ_100 could not
be used with the old arch/arm/plat-samsung/time.c code that would
overflow its 16-bit counter.
However, the new drivers/clocksource/samsung_pwm_timer.c configures
the clock divider to '50' instead of '6', so there is no longer
a 16-bit overflow before the 100Hz tick, it now overflows every
3.7ms for the typical 12MHz clock.

	Arnd
