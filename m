From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH v5 RESEND 2/3] ARM: EXYNOS: Remove unneeded __ref annotation
 for cpu_die function
Date: Fri, 05 Sep 2014 14:34:54 +0200
Message-ID: <1409920495-16533-2-git-send-email-k.kozlowski@samsung.com>
References: <1409920495-16533-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1409920495-16533-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Sachin Kamat <sachin.kamat@linaro.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

The __ref annotation for exynos_cpu_die() is not needed because the
function does not reference any __init/__exit symbol or call.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Reviewed-by: Tomasz Figa <t.figa@samsung.com>

---
Changes since v4:
1. Rebase on linux-next-20140804.
2. Add Reviewed-by Tomasz Figa.
---
 arch/arm/mach-exynos/platsmp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-exynos/platsmp.c b/arch/arm/mach-exynos/platsmp.c
index a809f76c8160..83b20a38a598 100644
--- a/arch/arm/mach-exynos/platsmp.c
+++ b/arch/arm/mach-exynos/platsmp.c
@@ -373,7 +373,7 @@ static void __init exynos_smp_prepare_cpus(unsigned int max_cpus)
  *
  * Called with IRQs disabled
  */
-static void __ref exynos_cpu_die(unsigned int cpu)
+static void exynos_cpu_die(unsigned int cpu)
 {
 	int spurious = 0;
 
-- 
1.9.1
