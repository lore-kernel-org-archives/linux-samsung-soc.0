From: Russell King <rmk+kernel@arm.linux.org.uk>
Subject: [PATCH 14/16] ARM: l2c: convert exynos to generic l2c initialisation
 (and thereby fix it)
Date: Mon, 28 Apr 2014 17:58:58 +0100
Message-ID: <E1WeotO-0002QG-B6@rmk-PC.arm.linux.org.uk>
References: <20140428165631.GM26756@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20140428165631.GM26756@n2100.arm.linux.org.uk>
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
Cc: linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

exynos was unconditionally calling the L2 cache initialisation from an
early_initcall.  This breaks multiplatform kernels.  Thankfully,
converting to generic l2c initialisation fixes this.

Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>
---
 arch/arm/mach-exynos/exynos.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-exynos/exynos.c b/arch/arm/mach-exynos/exynos.c
index fbfc29df3299..a763c0862da9 100644
--- a/arch/arm/mach-exynos/exynos.c
+++ b/arch/arm/mach-exynos/exynos.c
@@ -316,12 +316,6 @@ static int __init exynos_core_init(void)
 }
 core_initcall(exynos_core_init);
 
-static int __init exynos4_l2x0_cache_init(void)
-{
-	return l2x0_of_init(0x3c400001, 0xc20fffff);
-}
-early_initcall(exynos4_l2x0_cache_init);
-
 static void __init exynos_dt_machine_init(void)
 {
 	struct device_node *i2c_np;
@@ -387,6 +381,8 @@ static void __init exynos_reserve(void)
 DT_MACHINE_START(EXYNOS_DT, "SAMSUNG EXYNOS (Flattened Device Tree)")
 	/* Maintainer: Thomas Abraham <thomas.abraham@linaro.org> */
 	/* Maintainer: Kukjin Kim <kgene.kim@samsung.com> */
+	.l2c_aux_val	= 0x3c400001,
+	.l2c_aux_mask	= 0xc20fffff,
 	.smp		= smp_ops(exynos_smp_ops),
 	.map_io		= exynos_init_io,
 	.init_early	= exynos_firmware_init,
-- 
1.8.3.1
