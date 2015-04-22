From: Marc Zyngier <marc.zyngier@arm.com>
Subject: [PATCH] ARM: exynos: Fix wake-up interrupts for Exynos3250
Date: Wed, 22 Apr 2015 18:40:52 +0100
Message-ID: <1429724452-26563-1-git-send-email-marc.zyngier@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Chanwoo Choi <cw00.choi@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Commit 8b283c025443 (ARM: exynos4/5: convert pmu wakeup to
stacked domains) changed the Exynos PMU code to use stacked
domains. This has led to a number of interrupt numbers to be
fixed.

In the meantime, support for Exynos 3250 was added, missing
the required change to this platform. This amounts to revert
ace283a04a4a (ARM: EXYNOS: Fix wrong hwirq of RTC interrupt
for Exynos3250 SoC), as the initial patch was right, just a
bit early...

Cc: Chanwoo Choi <cw00.choi@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>
Signed-off-by: Marc Zyngier <marc.zyngier@arm.com>
---
 arch/arm/mach-exynos/suspend.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-exynos/suspend.c b/arch/arm/mach-exynos/suspend.c
index 3e6aea7..40dce36 100644
--- a/arch/arm/mach-exynos/suspend.c
+++ b/arch/arm/mach-exynos/suspend.c
@@ -87,8 +87,8 @@ static unsigned int exynos_pmu_spare3;
 static u32 exynos_irqwake_intmask = 0xffffffff;
 
 static const struct exynos_wkup_irq exynos3250_wkup_irq[] = {
-	{ 105, BIT(1) }, /* RTC alarm */
-	{ 106, BIT(2) }, /* RTC tick */
+	{ 73, BIT(1) }, /* RTC alarm */
+	{ 74, BIT(2) }, /* RTC tick */
 	{ /* sentinel */ },
 };
 
-- 
2.1.4
