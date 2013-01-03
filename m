From: Rob Herring <robherring2@gmail.com>
Subject: [PATCH v4 15/19] ARM: samsung: remove unused tick.h
Date: Thu,  3 Jan 2013 11:54:24 -0600
Message-ID: <1357235668-9450-16-git-send-email-robherring2@gmail.com>
References: <1357235668-9450-1-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1357235668-9450-1-git-send-email-robherring2@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: thomas.petazzoni@free-electrons.com, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <rob.herring@calxeda.com>, linux-samsung-soc@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>, Olof Johansson <olof@lixom.net>
List-Id: linux-samsung-soc@vger.kernel.org

From: Rob Herring <rob.herring@calxeda.com>

Remove tick.h on s5p64x0 and s5pv210 as they are unused.

Signed-off-by: Rob Herring <rob.herring@calxeda.com>
Cc: Ben Dooks <ben-linux@fluff.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org
---
 arch/arm/mach-s5pv210/include/mach/tick.h |   26 --------------------------
 arch/arm/plat-samsung/s5p-irq-eint.c      |    1 +
 2 files changed, 1 insertion(+), 26 deletions(-)
 delete mode 100644 arch/arm/mach-s5pv210/include/mach/tick.h

diff --git a/arch/arm/mach-s5pv210/include/mach/tick.h b/arch/arm/mach-s5pv210/include/mach/tick.h
deleted file mode 100644
index 7993b36..0000000
--- a/arch/arm/mach-s5pv210/include/mach/tick.h
+++ /dev/null
@@ -1,26 +0,0 @@
-/* linux/arch/arm/mach-s5pv210/include/mach/tick.h
- *
- * Copyright (c) 2009 Samsung Electronics Co., Ltd.
- *		http://www.samsung.com/
- *
- * Based on arch/arm/mach-s3c6400/include/mach/tick.h
- *
- * S5PV210 - Timer tick support definitions
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
-*/
-
-#ifndef __ASM_ARCH_TICK_H
-#define __ASM_ARCH_TICK_H __FILE__
-
-static inline u32 s3c24xx_ostimer_pending(void)
-{
-	u32 pend = __raw_readl(VA_VIC0 + VIC_RAW_STATUS);
-	return pend & (1 << (IRQ_TIMER4_VIC - S5P_IRQ_VIC0(0)));
-}
-
-#define TICK_MAX	(0xffffffff)
-
-#endif /* __ASM_ARCH_TICK_H */
diff --git a/arch/arm/plat-samsung/s5p-irq-eint.c b/arch/arm/plat-samsung/s5p-irq-eint.c
index 33bd3f3..974bf98 100644
--- a/arch/arm/plat-samsung/s5p-irq-eint.c
+++ b/arch/arm/plat-samsung/s5p-irq-eint.c
@@ -15,6 +15,7 @@
 #include <linux/io.h>
 #include <linux/device.h>
 #include <linux/gpio.h>
+#include <linux/irqchip/arm-vic.h>
 
 #include <asm/hardware/vic.h>
 
-- 
1.7.10.4
