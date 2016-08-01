From: Marc Zyngier <marc.zyngier@arm.com>
Subject: [PATCH v2 1/2] clocksource/arm_arch_timer: Force per-CPU interrupt to
 be level-triggered
Date: Mon,  1 Aug 2016 10:54:15 +0100
Message-ID: <1470045256-9032-2-git-send-email-marc.zyngier@arm.com>
References: <1470045256-9032-1-git-send-email-marc.zyngier@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1470045256-9032-1-git-send-email-marc.zyngier@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thomas Gleixner <tglx@linutronix.de>, Daniel Lezcano <daniel.lezcano@linaro.org>, arm@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Liu Gang <Gang.Liu@nxp.com>, Mark Rutland <marc.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Florian Fainelli <f.fainelli@gmail.com>, Kevin Hilman <khilman@baylibre.com>, Hou Zhiqiang <B48286@freescale.com>, Michal Simek <michal.simek@xilinx.com>, Jon Hunter <jonathanh@nvidia.com>, Kukjin Kim <kgene@kernel.org>, bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Jason Cooper <jason@lakedaemon.net>, Ray Jui <rjui@broadcom.com>, Tirumalesh Chalamarla <tchalamarla@cavium.com>, linux-samsung-soc@vger.kernel.org, Yuan Yao <yao.yuan@nxp.com>, Wenbin Song <Wenbin.Song@freescale.com>, Jan Glauber <jglauber@cavium.com>, Gregory Clement <gregory.clement@free-electrons.com>, linux-amlogic@lists.infradead.org, Mingkai Hu <Mingkai.Hu@freescale.com>
List-Id: linux-samsung-soc@vger.kernel.org

The ARM architected timer produces level-triggered interrupts (this
is mandated by the architecture). Unfortunately, a number of
device-trees get this wrong, and expose an edge-triggered interrupt.

Until now, this wasn't too much an issue, as the programming of the
trigger would fail (the corresponding PPI cannot be reconfigured),
and the kernel would be happy with this. But we're about to change
this, and trust DT a lot if the driver doesn't provide its own
trigger information. In that context, the timer breaks badly.

While we do need to fix the DTs, there is also some userspace out
there (kvmtool) that generates the same kind of broken DT on the
fly, and that will completely break with newer kernels.

As a safety measure, and to keep buggy software alive as well as
buying us some time to fix DTs all over the place, let's check
what trigger configuration has been given us by the firmware.
If this is not a level configuration, then we know that the
DT/ACPI configuration is bust, and we pick some defaults which
won't be worse than the existing setup.

Signed-off-by: Marc Zyngier <marc.zyngier@arm.com>
---
 drivers/clocksource/arm_arch_timer.c | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/clocksource/arm_arch_timer.c b/drivers/clocksource/arm_arch_timer.c
index 28bce3f..5770054 100644
--- a/drivers/clocksource/arm_arch_timer.c
+++ b/drivers/clocksource/arm_arch_timer.c
@@ -8,6 +8,9 @@
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation.
  */
+
+#define pr_fmt(fmt)	"arm_arch_timer: " fmt
+
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/device.h>
@@ -370,16 +373,33 @@ static bool arch_timer_has_nonsecure_ppi(void)
 		arch_timer_ppi[PHYS_NONSECURE_PPI]);
 }
 
+static u32 check_ppi_trigger(int irq)
+{
+	u32 flags = irq_get_trigger_type(irq);
+
+	if (flags != IRQF_TRIGGER_HIGH && flags != IRQF_TRIGGER_LOW) {
+		pr_warn("WARNING: Invalid trigger for IRQ%d, assuming level low\n", irq);
+		pr_warn("WARNING: Please fix your firmware\n");
+		flags = IRQF_TRIGGER_LOW;
+	}
+
+	return flags;
+}
+
 static int arch_timer_starting_cpu(unsigned int cpu)
 {
 	struct clock_event_device *clk = this_cpu_ptr(arch_timer_evt);
+	u32 flags;
 
 	__arch_timer_setup(ARCH_CP15_TIMER, clk);
 
-	enable_percpu_irq(arch_timer_ppi[arch_timer_uses_ppi], 0);
+	flags = check_ppi_trigger(arch_timer_ppi[arch_timer_uses_ppi]);
+	enable_percpu_irq(arch_timer_ppi[arch_timer_uses_ppi], flags);
 
-	if (arch_timer_has_nonsecure_ppi())
-		enable_percpu_irq(arch_timer_ppi[PHYS_NONSECURE_PPI], 0);
+	if (arch_timer_has_nonsecure_ppi()) {
+		flags = check_ppi_trigger(arch_timer_ppi[PHYS_NONSECURE_PPI]);
+		enable_percpu_irq(arch_timer_ppi[PHYS_NONSECURE_PPI], flags);
+	}
 
 	arch_counter_set_user_access();
 	if (evtstrm_enable)
-- 
2.1.4
