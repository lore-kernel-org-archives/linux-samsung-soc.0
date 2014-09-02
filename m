From: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Subject: [PATCH] irqchip: exynos-combiner: Fix compilation error on ARM64
Date: Tue, 02 Sep 2014 20:54:52 +0530
Message-ID: <1409671492-7725-1-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:13134 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751764AbaIBP3g (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 2 Sep 2014 11:29:36 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: naveenkrishna.ch@gmail.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>

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

=46ix the build error by including asm/hardirq.h.

Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
---
 drivers/irqchip/exynos-combiner.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/irqchip/exynos-combiner.c b/drivers/irqchip/exynos=
-combiner.c
index f8636a6..7fbedcc 100644
--- a/drivers/irqchip/exynos-combiner.c
+++ b/drivers/irqchip/exynos-combiner.c
@@ -18,6 +18,8 @@
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
=20
+#include <asm/hardirq.h>
+
 #include "irqchip.h"
=20
 #define COMBINER_ENABLE_SET	0x0
--=20
1.7.9.5
