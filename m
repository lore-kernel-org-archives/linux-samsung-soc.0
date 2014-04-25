From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCHv4 4/7] ARM: EXYNOS: Enter a15 lowpower mode for Exynos3250
 based on Cortex-a7
Date: Fri, 25 Apr 2014 10:16:09 +0900
Message-ID: <1398388572-30239-5-git-send-email-cw00.choi@samsung.com>
References: <1398388572-30239-1-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <1398388572-30239-1-git-send-email-cw00.choi@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: kgene.kim@samsung.com, t.figa@samsung.com
Cc: sajjan.linux@gmail.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux@arm.linux.org.uk, arnd@arndb.de, marc.zyngier@arm.com, hyunhee.kim@samsung.com, sw0312.kim@samsung.com, linux-kernel@vger.kernel.org, yj44.cho@samsung.com, inki.dae@samsung.com, cw00.choi@samsung.com, kyungmin.park@samsung.com, thomas.abraham@linaro.org, ben-linux@fluff.org, olof@lixom.net, chanho61.park@samsung.com, sachin.kamat@linaro.org, linux-arm-kernel@lists.infradead.org, tushar.behera@linaro.org
List-Id: linux-samsung-soc@vger.kernel.org

This patch decide proper lowpower mode of either a15 or a9 according to own ID
from Main ID register.

Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Marc Zynigier <marc.zyngier@arm.com>
Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos/hotplug.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/arch/arm/mach-exynos/hotplug.c b/arch/arm/mach-exynos/hotplug.c
index 5eead53..acf3119 100644
--- a/arch/arm/mach-exynos/hotplug.c
+++ b/arch/arm/mach-exynos/hotplug.c
@@ -135,16 +135,21 @@ void __ref exynos_cpu_die(unsigned int cpu)
 	int primary_part = 0;
 
 	/*
-	 * we're ready for shutdown now, so do it.
-	 * Exynos4 is A9 based while Exynos5 is A15; check the CPU part
-	 * number by reading the Main ID register and then perform the
-	 * appropriate sequence for entering low power.
+	 * Prepare the CPU for shutting down. The required sequence of
+	 * operations depends on core type. CPUID part number can be used to
+	 * determine the right way.
 	 */
-	asm("mrc p15, 0, %0, c0, c0, 0" : "=r"(primary_part) : : "cc");
-	if ((primary_part & 0xfff0) == 0xc0f0)
+	primary_part = read_cpuid_part_number();
+
+	switch (primary_part) {
+	case ARM_CPU_PART_CORTEX_A7:
+	case ARM_CPU_PART_CORTEX_A15:
 		cpu_enter_lowpower_a15();
-	else
+		break;
+	default:
 		cpu_enter_lowpower_a9();
+		break;
+	}
 
 	platform_do_lowpower(cpu, &spurious);
 
-- 
1.8.0
