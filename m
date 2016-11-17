From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH] ARM: Drop fixed 200 Hz timer requirement from Exynos
 platforms
Date: Thu, 17 Nov 2016 12:40:41 -0300
Message-ID: <6f15ef88-aa9e-4a3c-4a75-1d3216d734d5@osg.samsung.com>
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
To: Krzysztof Kozlowski <krzk@kernel.org>, Russell King <linux@armlinux.org.uk>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Ben Dooks <ben.dooks@codethink.co.uk>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Lee Jones <lee.jones@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hello Krzysztof,

On 11/14/2016 03:27 PM, Krzysztof Kozlowski wrote:
> All Samsung platforms, including the Exynos, are selecting HZ_FIXED with
> 200 Hz.  Unfortunately in case of multiplatform image this affects also
> other platforms when Exynos is selected.
> 
> This looks like an very old legacy code, dating back to initial
> upstreaming of S3C24xx.  Probably it was required for s3c24xx timer
> driver, which was removed in commit ad38bdd15d5b ("ARM: SAMSUNG: Remove
> unused plat-samsung/time.c").
> 
> Since then, this fixed 200 Hz spread everywhere, including out-of-tree
> Samsung kernels (SoC vendor's and Tizen's).  I believe this choice
> was rather an effect of coincidence instead of conscious choice.  In
> fact Exynos can work with different timers.
> 
> Few perf mem and sched tests on Odroid XU3 board (Exynos5422, 4x Cortex
> A7, 4x Cortex A15) show no regressions when switching from 200 Hz to
> other values.
> 
> Reported-by: Lee Jones <lee.jones@linaro.org>
> Reported-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> Testing on other Exynos platforms would be appreciated.

I tested this patch on an Exynos5800 Peach Pi Chromebook with different
HZ values (100/200/250/300/500/1000), and found no issues.

Tested-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
