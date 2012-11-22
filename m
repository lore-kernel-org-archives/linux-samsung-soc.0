From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH v4 5/5] ARM: EXYNOS: Add secure firmware support to secondary
 CPU bring-up
Date: Thu, 22 Nov 2012 16:51:18 +0100
Message-ID: <1353599478-24617-6-git-send-email-t.figa@samsung.com>
References: <1353599478-24617-1-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <1353599478-24617-1-git-send-email-t.figa@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, linux@arm.linux.org.uk, arnd@arndb.de, t.figa@samsung.com, tomasz.figa@gmail.com, kyungmin.park@samsung.com, olof@lixom.net, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Boards using secure firmware must use different CPU boot registers and
call secure firmware to boot the CPU.

Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
Signed-off-by: Tomasz Figa <t.figa@samsung.com>
---
 arch/arm/mach-exynos/platsmp.c | 32 +++++++++++++++++++++++++++-----
 1 file changed, 27 insertions(+), 5 deletions(-)

diff --git a/arch/arm/mach-exynos/platsmp.c b/arch/arm/mach-exynos/platsmp.c
index 4ca8ff1..7dc2f88 100644
--- a/arch/arm/mach-exynos/platsmp.c
+++ b/arch/arm/mach-exynos/platsmp.c
@@ -25,6 +25,7 @@
 #include <asm/hardware/gic.h>
 #include <asm/smp_plat.h>
 #include <asm/smp_scu.h>
+#include <asm/firmware.h>
 
 #include <mach/hardware.h>
 #include <mach/regs-clock.h>
@@ -145,10 +146,21 @@ static int __cpuinit exynos_boot_secondary(unsigned int cpu, struct task_struct
 
 	timeout = jiffies + (1 * HZ);
 	while (time_before(jiffies, timeout)) {
+		unsigned long boot_addr;
+
 		smp_rmb();
 
-		__raw_writel(virt_to_phys(exynos4_secondary_startup),
-							cpu_boot_reg(phys_cpu));
+		boot_addr = virt_to_phys(exynos4_secondary_startup);
+
+		/*
+		 * Try to set boot address using firmware first
+		 * and fall back to boot register if it fails.
+		 */
+		if (call_firmware_op(set_cpu_boot_addr, phys_cpu, boot_addr))
+			__raw_writel(boot_addr, cpu_boot_reg(phys_cpu));
+
+		call_firmware_op(cpu_boot, phys_cpu);
+
 		gic_raise_softirq(cpumask_of(cpu), 0);
 
 		if (pen_release == -1)
@@ -206,10 +218,20 @@ static void __init exynos_smp_prepare_cpus(unsigned int max_cpus)
 	 * system-wide flags register. The boot monitor waits
 	 * until it receives a soft interrupt, and then the
 	 * secondary CPU branches to this address.
+	 *
+	 * Try using firmware operation first and fall back to
+	 * boot register if it fails.
 	 */
-	for (i = 1; i < max_cpus; ++i)
-		__raw_writel(virt_to_phys(exynos4_secondary_startup),
-					cpu_boot_reg(cpu_logical_map(i)));
+	for (i = 1; i < max_cpus; ++i) {
+		unsigned long phys_cpu;
+		unsigned long boot_addr;
+
+		phys_cpu = cpu_logical_map(i);
+		boot_addr = virt_to_phys(exynos4_secondary_startup);
+
+		if (call_firmware_op(set_cpu_boot_addr, phys_cpu, boot_addr))
+			__raw_writel(boot_addr, cpu_boot_reg(phys_cpu));
+	}
 }
 
 struct smp_operations exynos_smp_ops __initdata = {
-- 
1.8.0
