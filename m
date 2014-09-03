From: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Subject: [PATCH v2] irqchip: exynos-combiner: Fix compilation error on ARM64
Date: Wed, 03 Sep 2014 11:02:09 +0530
Message-ID: <1409722329-18309-1-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:50910 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750918AbaICFgj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 3 Sep 2014 01:36:39 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: naveenkrishna.ch@gmail.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Sudeep Holla <sudeep.holla@arm.com>

The following compilation error occurs on 64-bit Exynos7 SoC:

drivers/irqchip/exynos-combiner.c: In function =E2=80=98combiner_irq_do=
main_map=E2=80=99:
drivers/irqchip/exynos-combiner.c:162:2: error: implicit declaration of=
 function =E2=80=98set_irq_flags=E2=80=99 [-Werror=3Dimplicit-function-=
declaration]
  set_irq_flags(irq, IRQF_VALID | IRQF_PROBE);
  ^
drivers/irqchip/exynos-combiner.c:162:21: error: =E2=80=98IRQF_VALID=E2=
=80=99 undeclared (first use in this function)
  set_irq_flags(irq, IRQF_VALID | IRQF_PROBE);
                     ^
drivers/irqchip/exynos-combiner.c:162:21: note: each undeclared identif=
ier is reported only once for each function it appears in
drivers/irqchip/exynos-combiner.c:162:34: error: =E2=80=98IRQF_PROBE=E2=
=80=99 undeclared (first use in this function)
  set_irq_flags(irq, IRQF_VALID | IRQF_PROBE);

=46ix the build error by including linux/interrupt.h.

Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Jason Cooper <jason@lakedaemon.net>
Cc: Sudeep Holla <sudeep.holla@arm.com>
---
Changes since v1:
Used linux/interrupt.h instead of asm/hardirq.h

 drivers/irqchip/exynos-combiner.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/irqchip/exynos-combiner.c b/drivers/irqchip/exynos=
-combiner.c
index f8636a6..5945223 100644
--- a/drivers/irqchip/exynos-combiner.c
+++ b/drivers/irqchip/exynos-combiner.c
@@ -15,6 +15,7 @@
 #include <linux/slab.h>
 #include <linux/irqdomain.h>
 #include <linux/irqchip/chained_irq.h>
+#include <linux/interrupt.h>
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
=20
--=20
1.7.9.5
