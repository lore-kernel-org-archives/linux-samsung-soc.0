From: Jingoo Han <jg1.han@samsung.com>
Subject: [PATCH RESEND] ARM: EXYNOS: change the name of USB ohci header
Date: Wed, 26 Dec 2012 15:35:26 +0900
Message-ID: <030301cde333$3142efc0$93c8cf40$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:36093 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751508Ab2LZGf4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 26 Dec 2012 01:35:56 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MFM009R0KZ33L60@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 26 Dec 2012 15:35:27 +0900 (KST)
Received: from DOJG1HAN02 ([12.23.120.99])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MFM00CD5KZ2IA00@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 26 Dec 2012 15:35:27 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, 'Alan Stern' <stern@rowland.harvard.edu>, 'Jingoo Han' <jg1.han@samsung.com>

This patch changes the name of USB ohci header from 'usb-exynos.h'
to 'usb-ohci-exynos.h'. This is because this header file has
the platdata for only Exynos ohci.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 arch/arm/mach-exynos/dev-ohci.c                    |    2 +-
 arch/arm/mach-exynos/mach-origen.c                 |    2 +-
 arch/arm/mach-exynos/mach-smdkv310.c               |    2 +-
 drivers/usb/host/ohci-exynos.c                     |    2 +-
 .../{usb-exynos.h => usb-ohci-exynos.h}            |    0
 5 files changed, 4 insertions(+), 4 deletions(-)
 rename include/linux/platform_data/{usb-exynos.h => usb-ohci-exynos.h} (100%)

diff --git a/arch/arm/mach-exynos/dev-ohci.c b/arch/arm/mach-exynos/dev-ohci.c
index 4244d02..d5bc129 100644
--- a/arch/arm/mach-exynos/dev-ohci.c
+++ b/arch/arm/mach-exynos/dev-ohci.c
@@ -12,7 +12,7 @@
 
 #include <linux/dma-mapping.h>
 #include <linux/platform_device.h>
-#include <linux/platform_data/usb-exynos.h>
+#include <linux/platform_data/usb-ohci-exynos.h>
 
 #include <mach/irqs.h>
 #include <mach/map.h>
diff --git a/arch/arm/mach-exynos/mach-origen.c b/arch/arm/mach-exynos/mach-origen.c
index 5e34b9c..5035d9c 100644
--- a/arch/arm/mach-exynos/mach-origen.c
+++ b/arch/arm/mach-exynos/mach-origen.c
@@ -26,7 +26,7 @@
 #include <linux/platform_data/i2c-s3c2410.h>
 #include <linux/platform_data/s3c-hsotg.h>
 #include <linux/platform_data/usb-ehci-s5p.h>
-#include <linux/platform_data/usb-exynos.h>
+#include <linux/platform_data/usb-ohci-exynos.h>
 
 #include <asm/mach/arch.h>
 #include <asm/hardware/gic.h>
diff --git a/arch/arm/mach-exynos/mach-smdkv310.c b/arch/arm/mach-exynos/mach-smdkv310.c
index 35548e3..0c2912f 100644
--- a/arch/arm/mach-exynos/mach-smdkv310.c
+++ b/arch/arm/mach-exynos/mach-smdkv310.c
@@ -23,7 +23,7 @@
 #include <linux/platform_data/i2c-s3c2410.h>
 #include <linux/platform_data/s3c-hsotg.h>
 #include <linux/platform_data/usb-ehci-s5p.h>
-#include <linux/platform_data/usb-exynos.h>
+#include <linux/platform_data/usb-ohci-exynos.h>
 
 #include <asm/mach/arch.h>
 #include <asm/hardware/gic.h>
diff --git a/drivers/usb/host/ohci-exynos.c b/drivers/usb/host/ohci-exynos.c
index aa3b884..a3fd454 100644
--- a/drivers/usb/host/ohci-exynos.c
+++ b/drivers/usb/host/ohci-exynos.c
@@ -14,7 +14,7 @@
 #include <linux/clk.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
-#include <linux/platform_data/usb-exynos.h>
+#include <linux/platform_data/usb-ohci-exynos.h>
 #include <plat/usb-phy.h>
 
 struct exynos_ohci_hcd {
diff --git a/include/linux/platform_data/usb-exynos.h b/include/linux/platform_data/usb-ohci-exynos.h
similarity index 100%
rename from include/linux/platform_data/usb-exynos.h
rename to include/linux/platform_data/usb-ohci-exynos.h
-- 
1.7.2.5
