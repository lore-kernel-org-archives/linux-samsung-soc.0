From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH v2 20/38] ARM: SAMSUNG: pm: Include most of mach/ headers
 conditionally
Date: Mon, 17 Jun 2013 18:34:05 +0200
Message-ID: <1371486863-12398-21-git-send-email-t.figa@samsung.com>
References: <1371486863-12398-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:41745 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753022Ab3FQQey (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Jun 2013 12:34:54 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MOJ00MBNQ1N6260@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 17 Jun 2013 17:34:49 +0100 (BST)
In-reply-to: <1371486863-12398-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

Since it is illegal to include mach/ headers from source files outside
of respective mach-* directory and DT-only Samsung platforms might not
have all of them anyway, this patches makes inclusion of them
conditional, based on CONFIG_SAMSUNG_ATAGS.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/plat-samsung/pm.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm/plat-samsung/pm.c b/arch/arm/plat-samsung/pm.c
index 53210ec..d76ab72 100644
--- a/arch/arm/plat-samsung/pm.c
+++ b/arch/arm/plat-samsung/pm.c
@@ -21,13 +21,17 @@
 
 #include <asm/cacheflush.h>
 #include <asm/suspend.h>
-#include <mach/hardware.h>
-#include <mach/map.h>
 
 #include <plat/regs-serial.h>
+
+#ifdef CONFIG_SAMSUNG_ATAGS
+#include <mach/hardware.h>
+#include <mach/map.h>
 #include <mach/regs-clock.h>
 #include <mach/regs-irq.h>
 #include <mach/irqs.h>
+#endif
+
 #include <asm/irq.h>
 
 #include <plat/pm.h>
-- 
1.8.2.1
