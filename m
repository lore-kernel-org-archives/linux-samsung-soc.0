From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 4.9 061/130] clocksource/exynos_mct: Clear interrupt when cpu is shut down
Date: Tue, 24 Jan 2017 08:55:01 +0100
Message-ID: <20170124075537.439363186@linuxfoundation.org>
References: <20170124075534.905042535@linuxfoundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170124075534.905042535@linuxfoundation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org, Seung-Woo Kim <sw0312.kim@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, linux-samsung-soc@vger.kernel.org, cw00.choi@samsung.com, daniel.lezcano@linaro.org, javier@osg.samsung.com, kgene@kernel.org, krzk@kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>
List-Id: linux-samsung-soc@vger.kernel.org

4.9-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Joonyoung Shim <jy0922.shim@samsung.com>

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
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
 drivers/clocksource/exynos_mct.c |    1 +
 1 file changed, 1 insertion(+)

--- a/drivers/clocksource/exynos_mct.c
+++ b/drivers/clocksource/exynos_mct.c
@@ -495,6 +495,7 @@ static int exynos4_mct_dying_cpu(unsigne
 	if (mct_int_type == MCT_INT_SPI) {
 		if (evt->irq != -1)
 			disable_irq_nosync(evt->irq);
+		exynos4_mct_write(0x1, mevt->base + MCT_L_INT_CSTAT_OFFSET);
 	} else {
 		disable_percpu_irq(mct_irqs[MCT_L0_IRQ]);
 	}
