From: Jiri Slaby <jslaby@suse.cz>
Subject: [patch added to 3.12-stable] clocksource/exynos_mct: Clear interrupt
 when cpu is shut down
Date: Fri, 27 Jan 2017 11:46:58 +0100
Message-ID: <20170127104747.24816-14-jslaby@suse.cz>
References: <20170127104747.24816-1-jslaby@suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170127104747.24816-1-jslaby@suse.cz>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: stable@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>, javier@osg.samsung.com, daniel.lezcano@linaro.org, krzk@kernel.org, cw00.choi@samsung.com, kgene@kernel.org, Thomas Gleixner <tglx@linutronix.de>, Jiri Slaby <jslaby@suse.cz>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

From: Joonyoung Shim <jy0922.shim@samsung.com>

This patch has been added to the 3.12 stable tree. If you have any
objections, please let us know.

===============

commit bc7c36eedb0c7004aa06c2afc3c5385adada8fa3 upstream.

When a CPU goes offline a potentially pending timer interrupt is not
cleared. When the CPU comes online again then the pending interrupt is
delivered before the per cpu clockevent device is initialized. As a
consequence the tick interrupt handler dereferences a NULL pointer.

[   51.251378] Unable to handle kernel NULL pointer dereference at virtual address 00000040
[   51.289348] task: ee942d00 task.stack: ee960000
[   51.293861] PC is at tick_periodic+0x38/0xb0
[   51.298102] LR is at tick_handle_periodic+0x1c/0x90

Clear the pending interrupt in the cpu dying path.

Fixes: 56a94f13919c ("clocksource: exynos_mct: Avoid blocking calls in the cpu hotplug notifier")
Reported-by: Seung-Woo Kim <sw0312.kim@samsung.com>
Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org
Cc: cw00.choi@samsung.com
Cc: daniel.lezcano@linaro.org
Cc: javier@osg.samsung.com
Cc: kgene@kernel.org
Cc: krzk@kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Link: http://lkml.kernel.org/r/1484628876-22065-1-git-send-email-jy0922.shim@samsung.com
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Jiri Slaby <jslaby@suse.cz>
---
 drivers/clocksource/exynos_mct.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
index af994880be72..26bfe09ce0fb 100644
--- a/drivers/clocksource/exynos_mct.c
+++ b/drivers/clocksource/exynos_mct.c
@@ -439,6 +439,7 @@ static void exynos4_local_timer_stop(struct mct_clock_event_device *mevt)
 	if (mct_int_type == MCT_INT_SPI) {
 		if (evt->irq != -1)
 			disable_irq_nosync(evt->irq);
+		exynos4_mct_write(0x1, mevt->base + MCT_L_INT_CSTAT_OFFSET);
 	} else {
 		disable_percpu_irq(mct_irqs[MCT_L0_IRQ]);
 	}
-- 
2.11.0
