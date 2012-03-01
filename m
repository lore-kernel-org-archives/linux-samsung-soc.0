From: Jingoo Han <jg1.han@samsung.com>
Subject: [PATCH v2 1/2] ARM: EXYNOS: Add USB HOST register definitions
Date: Thu, 01 Mar 2012 14:38:20 +0900
Message-ID: <000701ccf76d$8316b0a0$894411e0$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:34564 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752855Ab2CAFiW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 1 Mar 2012 00:38:22 -0500
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: 'Greg Kroah-Hartman' <gregkh@linuxfoundation.org>, 'Kukjin Kim' <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, 'Sangwook Lee' <sangwook.lee@linaro.org>, 'Alan Stern' <stern@rowland.harvard.edu>, 'Joonyoung Shim' <jy0922.shim@samsung.com>, patches@linaro.org, linaro-dev@lists.linaro.org, 'Thomas Abraham' <thomas.abraham@linaro.org>, 'Jingoo Han' <jg1.han@samsung.com>

This patch adds USB HOST register definitions. The definition for
EHCI INSNREG00 regiser and corresponding bit field definitions are
added.

Signed-off-by: Sangwook Lee <sangwook.lee@linaro.org>
Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
v2: change the definition name from EHCI_ENA_xxx to EHCI_INSNREG00_ENA_xxx.

arch/arm/mach-exynos/include/mach/regs-usb-host.h |   24 +++++++++++++++++++++
 1 files changed, 24 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/mach-exynos/include/mach/regs-usb-host.h

diff --git a/arch/arm/mach-exynos/include/mach/regs-usb-host.h b/arch/arm/mach-exynos/include/mach/regs-usb-host.h
new file mode 100644
index 0000000..572b7d4
--- /dev/null
+++ b/arch/arm/mach-exynos/include/mach/regs-usb-host.h
@@ -0,0 +1,24 @@
+/*
+ * Copyright (C) 2012 Samsung Electronics Co.Ltd
+ *		http://www.samsung.com
+ *
+ * EXYNOS - USB HOST register definitions
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#ifndef __REGS_USB_HOST_H
+#define __REGS_USB_HOST_H __FILE__
+
+#define EHCI_INSNREG00(base)			(base + 0x90)
+#define EHCI_INSNREG00_ENA_INCR16		(0x1 << 25)
+#define EHCI_INSNREG00_ENA_INCR8		(0x1 << 24)
+#define EHCI_INSNREG00_ENA_INCR4		(0x1 << 23)
+#define EHCI_INSNREG00_ENA_INCRX_ALIGN		(0x1 << 22)
+#define EHCI_INSNREG00_ENABLE_DMA_BURST	\
+	(EHCI_INSNREG00_ENA_INCR16 | EHCI_INSNREG00_ENA_INCR8 |	\
+	 EHCI_INSNREG00_ENA_INCR4 | EHCI_INSNREG00_ENA_INCRX_ALIGN)
+
+#endif /* __REGS_USB_HOST_H */
-- 
1.7.1
