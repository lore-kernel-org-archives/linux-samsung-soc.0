From: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 1/2] ARM: EXYNOS: Add USB HOST register definitions
Date: Wed, 29 Feb 2012 23:39:35 +0900
Message-ID: <000101ccf6ef$f4efbab0$decf3010$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-language: ko
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, 'Greg Kroah-Hartman' <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, 'Sangwook Lee' <sangwook.lee-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, 'Alan Stern' <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, 'Joonyoung Shim' <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, 'Kukjin Kim' <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, 'Thomas Abraham' <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, 'Jingoo Han' <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

This patch adds USB HOST register definitions. The definition for
EHCI INSNREG00 regiser and corresponding bit field definitions are
added.

Signed-off-by: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm/mach-exynos/include/mach/regs-usb-host.h |   23 +++++++++++++++++++++
 1 files changed, 23 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/mach-exynos/include/mach/regs-usb-host.h

diff --git a/arch/arm/mach-exynos/include/mach/regs-usb-host.h b/arch/arm/mach-exynos/include/mach/regs-usb-host.h
new file mode 100644
index 0000000..1a60f27
--- /dev/null
+++ b/arch/arm/mach-exynos/include/mach/regs-usb-host.h
@@ -0,0 +1,23 @@
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
+#define EHCI_INSNREG00(base)		(base + 0x90)
+#define EHCI_ENA_INCR16			(0x1 << 25)
+#define EHCI_ENA_INCR8			(0x1 << 24)
+#define EHCI_ENA_INCR4			(0x1 << 23)
+#define EHCI_ENA_INCRX_ALIGN		(0x1 << 22)
+#define EHCI_ENABLE_DMA_INCR		(EHCI_ENA_INCR16 | EHCI_ENA_INCR8| \
+					 EHCI_ENA_INCR4 | EHCI_ENA_INCRX_ALIGN)
+
+#endif /* __REGS_USB_HOST_H */
-- 
1.7.1


--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
