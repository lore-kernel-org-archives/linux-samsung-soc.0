From: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v4 1/5] ARM: EXYNOS: Update & move usb-phy types to generic
 include layer
Date: Tue, 06 Nov 2012 20:24:55 +0530
Message-ID: <1352213699-11112-2-git-send-email-gautam.vivek@samsung.com>
References: <1352213699-11112-1-git-send-email-gautam.vivek@samsung.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1352213699-11112-1-git-send-email-gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, yulgon.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Updating the names of usb-phy types to more generic names:
USB_PHY_TYPE_DEIVCE & USB_PHY_TYPE_HOST; and further update its
dependencies.

Signed-off-by: Praveen Paneri <p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Signed-off-by: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm/mach-exynos/setup-usb-phy.c         |    9 +++++----
 arch/arm/mach-s5pv210/setup-usb-phy.c        |    5 +++--
 arch/arm/plat-samsung/include/plat/usb-phy.h |    5 -----
 drivers/usb/host/ehci-s5p.c                  |    9 +++++----
 drivers/usb/host/ohci-exynos.c               |    9 +++++----
 include/linux/usb/samsung_usb_phy.h          |   17 +++++++++++++++++
 6 files changed, 35 insertions(+), 19 deletions(-)
 create mode 100644 include/linux/usb/samsung_usb_phy.h

diff --git a/arch/arm/mach-exynos/setup-usb-phy.c b/arch/arm/mach-exynos/setup-usb-phy.c
index 1c62d20..c77f51b 100644
--- a/arch/arm/mach-exynos/setup-usb-phy.c
+++ b/arch/arm/mach-exynos/setup-usb-phy.c
@@ -14,6 +14,7 @@
 #include <linux/err.h>
 #include <linux/io.h>
 #include <linux/platform_device.h>
+#include <linux/usb/samsung_usb_phy.h>
 #include <mach/regs-pmu.h>
 #include <mach/regs-usb-phy.h>
 #include <plat/cpu.h>
@@ -204,9 +205,9 @@ static int exynos4210_usb_phy1_exit(struct platform_device *pdev)
 
 int s5p_usb_phy_init(struct platform_device *pdev, int type)
 {
-	if (type == S5P_USB_PHY_DEVICE)
+	if (type == USB_PHY_TYPE_DEVICE)
 		return exynos4210_usb_phy0_init(pdev);
-	else if (type == S5P_USB_PHY_HOST)
+	else if (type == USB_PHY_TYPE_HOST)
 		return exynos4210_usb_phy1_init(pdev);
 
 	return -EINVAL;
@@ -214,9 +215,9 @@ int s5p_usb_phy_init(struct platform_device *pdev, int type)
 
 int s5p_usb_phy_exit(struct platform_device *pdev, int type)
 {
-	if (type == S5P_USB_PHY_DEVICE)
+	if (type == USB_PHY_TYPE_DEVICE)
 		return exynos4210_usb_phy0_exit(pdev);
-	else if (type == S5P_USB_PHY_HOST)
+	else if (type == USB_PHY_TYPE_HOST)
 		return exynos4210_usb_phy1_exit(pdev);
 
 	return -EINVAL;
diff --git a/arch/arm/mach-s5pv210/setup-usb-phy.c b/arch/arm/mach-s5pv210/setup-usb-phy.c
index be39cf4..cdb80a5 100644
--- a/arch/arm/mach-s5pv210/setup-usb-phy.c
+++ b/arch/arm/mach-s5pv210/setup-usb-phy.c
@@ -12,6 +12,7 @@
 #include <linux/err.h>
 #include <linux/io.h>
 #include <linux/platform_device.h>
+#include <linux/usb/samsung_usb_phy.h>
 #include <mach/map.h>
 #include <mach/regs-sys.h>
 #include <plat/cpu.h>
@@ -75,7 +76,7 @@ static int s5pv210_usb_otgphy_exit(struct platform_device *pdev)
 
 int s5p_usb_phy_init(struct platform_device *pdev, int type)
 {
-	if (type == S5P_USB_PHY_DEVICE)
+	if (type == USB_PHY_TYPE_DEVICE)
 		return s5pv210_usb_otgphy_init(pdev);
 
 	return -EINVAL;
@@ -83,7 +84,7 @@ int s5p_usb_phy_init(struct platform_device *pdev, int type)
 
 int s5p_usb_phy_exit(struct platform_device *pdev, int type)
 {
-	if (type == S5P_USB_PHY_DEVICE)
+	if (type == USB_PHY_TYPE_DEVICE)
 		return s5pv210_usb_otgphy_exit(pdev);
 
 	return -EINVAL;
diff --git a/arch/arm/plat-samsung/include/plat/usb-phy.h b/arch/arm/plat-samsung/include/plat/usb-phy.h
index 165ffe7..4e6f370 100644
--- a/arch/arm/plat-samsung/include/plat/usb-phy.h
+++ b/arch/arm/plat-samsung/include/plat/usb-phy.h
@@ -11,11 +11,6 @@
 #ifndef __PLAT_SAMSUNG_USB_PHY_H
 #define __PLAT_SAMSUNG_USB_PHY_H __FILE__
 
-enum s5p_usb_phy_type {
-	S5P_USB_PHY_DEVICE,
-	S5P_USB_PHY_HOST,
-};
-
 extern int s5p_usb_phy_init(struct platform_device *pdev, int type);
 extern int s5p_usb_phy_exit(struct platform_device *pdev, int type);
 extern void s5p_usb_phy_pmu_isolation(int on);
diff --git a/drivers/usb/host/ehci-s5p.c b/drivers/usb/host/ehci-s5p.c
index abc178d..0cd0c7b 100644
--- a/drivers/usb/host/ehci-s5p.c
+++ b/drivers/usb/host/ehci-s5p.c
@@ -17,6 +17,7 @@
 #include <linux/platform_device.h>
 #include <linux/of_gpio.h>
 #include <linux/platform_data/usb-ehci-s5p.h>
+#include <linux/usb/samsung_usb_phy.h>
 #include <plat/usb-phy.h>
 
 #define EHCI_INSNREG00(base)			(base + 0x90)
@@ -164,7 +165,7 @@ static int __devinit s5p_ehci_probe(struct platform_device *pdev)
 	}
 
 	if (pdata->phy_init)
-		pdata->phy_init(pdev, S5P_USB_PHY_HOST);
+		pdata->phy_init(pdev, USB_PHY_TYPE_HOST);
 
 	ehci = hcd_to_ehci(hcd);
 	ehci->caps = hcd->regs;
@@ -198,7 +199,7 @@ static int __devexit s5p_ehci_remove(struct platform_device *pdev)
 	usb_remove_hcd(hcd);
 
 	if (pdata && pdata->phy_exit)
-		pdata->phy_exit(pdev, S5P_USB_PHY_HOST);
+		pdata->phy_exit(pdev, USB_PHY_TYPE_HOST);
 
 	clk_disable_unprepare(s5p_ehci->clk);
 
@@ -229,7 +230,7 @@ static int s5p_ehci_suspend(struct device *dev)
 	rc = ehci_suspend(hcd, do_wakeup);
 
 	if (pdata && pdata->phy_exit)
-		pdata->phy_exit(pdev, S5P_USB_PHY_HOST);
+		pdata->phy_exit(pdev, USB_PHY_TYPE_HOST);
 
 	clk_disable_unprepare(s5p_ehci->clk);
 
@@ -246,7 +247,7 @@ static int s5p_ehci_resume(struct device *dev)
 	clk_prepare_enable(s5p_ehci->clk);
 
 	if (pdata && pdata->phy_init)
-		pdata->phy_init(pdev, S5P_USB_PHY_HOST);
+		pdata->phy_init(pdev, USB_PHY_TYPE_HOST);
 
 	/* DMA burst Enable */
 	writel(EHCI_INSNREG00_ENABLE_DMA_BURST, EHCI_INSNREG00(hcd->regs));
diff --git a/drivers/usb/host/ohci-exynos.c b/drivers/usb/host/ohci-exynos.c
index 6a30fc5..1f46898 100644
--- a/drivers/usb/host/ohci-exynos.c
+++ b/drivers/usb/host/ohci-exynos.c
@@ -15,6 +15,7 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/platform_data/usb-exynos.h>
+#include <linux/usb/samsung_usb_phy.h>
 #include <plat/usb-phy.h>
 
 struct exynos_ohci_hcd {
@@ -153,7 +154,7 @@ static int __devinit exynos_ohci_probe(struct platform_device *pdev)
 	}
 
 	if (pdata->phy_init)
-		pdata->phy_init(pdev, S5P_USB_PHY_HOST);
+		pdata->phy_init(pdev, USB_PHY_TYPE_HOST);
 
 	ohci = hcd_to_ohci(hcd);
 	ohci_hcd_init(ohci);
@@ -184,7 +185,7 @@ static int __devexit exynos_ohci_remove(struct platform_device *pdev)
 	usb_remove_hcd(hcd);
 
 	if (pdata && pdata->phy_exit)
-		pdata->phy_exit(pdev, S5P_USB_PHY_HOST);
+		pdata->phy_exit(pdev, USB_PHY_TYPE_HOST);
 
 	clk_disable_unprepare(exynos_ohci->clk);
 
@@ -229,7 +230,7 @@ static int exynos_ohci_suspend(struct device *dev)
 	clear_bit(HCD_FLAG_HW_ACCESSIBLE, &hcd->flags);
 
 	if (pdata && pdata->phy_exit)
-		pdata->phy_exit(pdev, S5P_USB_PHY_HOST);
+		pdata->phy_exit(pdev, USB_PHY_TYPE_HOST);
 
 	clk_disable_unprepare(exynos_ohci->clk);
 
@@ -249,7 +250,7 @@ static int exynos_ohci_resume(struct device *dev)
 	clk_prepare_enable(exynos_ohci->clk);
 
 	if (pdata && pdata->phy_init)
-		pdata->phy_init(pdev, S5P_USB_PHY_HOST);
+		pdata->phy_init(pdev, USB_PHY_TYPE_HOST);
 
 	ohci_resume(hcd, false);
 
diff --git a/include/linux/usb/samsung_usb_phy.h b/include/linux/usb/samsung_usb_phy.h
new file mode 100644
index 0000000..4361a7e
--- /dev/null
+++ b/include/linux/usb/samsung_usb_phy.h
@@ -0,0 +1,17 @@
+/*
+ * Copyright (C) 2012 Samsung Electronics Co.Ltd
+ *		http://www.samsung.com/
+ *
+ * Defines phy types for samsung usb phy controllers - HOST or DEIVCE.
+ *
+ * This program is free software; you can redistribute  it and/or modify it
+ * under  the terms of  the GNU General  Public License as published by the
+ * Free Software Foundation;  either version 2 of the  License, or (at your
+ * option) any later version.
+ */
+
+enum samsung_usb_phy_type
+{
+	USB_PHY_TYPE_DEVICE,
+	USB_PHY_TYPE_HOST,
+};
-- 
1.7.6.5

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
