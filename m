From: Sachin Kamat <sachin.kamat-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 1/2] usb: host: Kconfig: Select PHY drivers for Exynos EHCI/OHCI
Date: Thu, 26 Jun 2014 11:09:37 +0530
Message-ID: <1403761178-5371-1-git-send-email-sachin.kamat@samsung.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, spk.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

EHCI and OHCI drivers on Exynos platforms do not work without their
corresponding SoC specific phy drivers. Hence it makes no sense to
keep these phy drivers as user selectable. Instead select them from
the respective USB configs to make things easier for the end user.
While at it enable 5250 phy for Exynos 5420 SoC too.

Signed-off-by: Sachin Kamat <sachin.kamat-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
---
 drivers/phy/Kconfig      |   37 +++++++------------------------------
 drivers/usb/host/Kconfig |   10 ++++++----
 2 files changed, 13 insertions(+), 34 deletions(-)

diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index 16a2f067c242..7fe7ef5f1322 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -121,44 +121,21 @@ config PHY_SUN4I_USB
 	  parts, as well as the 2 regular USB 2 host PHYs.
 
 config PHY_SAMSUNG_USB2
-	tristate "Samsung USB 2.0 PHY driver"
+	tristate
 	select GENERIC_PHY
 	select MFD_SYSCON
-	help
-	  Enable this to support the Samsung USB 2.0 PHY driver for Samsung
-	  SoCs. This driver provides the interface for USB 2.0 PHY. Support for
-	  particular SoCs has to be enabled in addition to this driver. Number
-	  and type of supported phys depends on the SoC.
+	select PHY_EXYNOS4210_USB2 if CPU_EXYNOS4210
+	select PHY_EXYNOS4X12_USB2 if (SOC_EXYNOS4212 || SOC_EXYNOS4412)
+	select PHY_EXYNOS5250_USB2 if (SOC_EXYNOS5250 || SOC_EXYNOS5420)
 
 config PHY_EXYNOS4210_USB2
-	bool "Support for Exynos 4210"
-	depends on PHY_SAMSUNG_USB2
-	depends on CPU_EXYNOS4210
-	help
-	  Enable USB PHY support for Exynos 4210. This option requires that
-	  Samsung USB 2.0 PHY driver is enabled and means that support for this
-	  particular SoC is compiled in the driver. In case of Exynos 4210 four
-	  phys are available - device, host, HSIC0 and HSIC1.
+	bool
 
 config PHY_EXYNOS4X12_USB2
-	bool "Support for Exynos 4x12"
-	depends on PHY_SAMSUNG_USB2
-	depends on (SOC_EXYNOS4212 || SOC_EXYNOS4412)
-	help
-	  Enable USB PHY support for Exynos 4x12. This option requires that
-	  Samsung USB 2.0 PHY driver is enabled and means that support for this
-	  particular SoC is compiled in the driver. In case of Exynos 4x12 four
-	  phys are available - device, host, HSIC0 and HSIC1.
+	bool
 
 config PHY_EXYNOS5250_USB2
-	bool "Support for Exynos 5250"
-	depends on PHY_SAMSUNG_USB2
-	depends on SOC_EXYNOS5250
-	help
-	  Enable USB PHY support for Exynos 5250. This option requires that
-	  Samsung USB 2.0 PHY driver is enabled and means that support for this
-	  particular SoC is compiled in the driver. In case of Exynos 5250 four
-	  phys are available - device, host, HSIC0 and HSIC.
+	bool
 
 config PHY_EXYNOS5_USBDRD
 	tristate "Exynos5 SoC series USB DRD PHY driver"
diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index 61b7817bd66b..2938807331de 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -211,10 +211,11 @@ config USB_EHCI_SH
 	  If you use the PCI EHCI controller, this option is not necessary.
 
 config USB_EHCI_EXYNOS
-       tristate "EHCI support for Samsung S5P/EXYNOS SoC Series"
-       depends on PLAT_S5P || ARCH_EXYNOS
-       help
-	Enable support for the Samsung Exynos SOC's on-chip EHCI controller.
+	tristate "EHCI support for Samsung S5P/EXYNOS SoC Series"
+	depends on PLAT_S5P || ARCH_EXYNOS
+	select PHY_SAMSUNG_USB2 if ARCH_EXYNOS
+	help
+	  Enable support for the Samsung Exynos SOC's on-chip EHCI controller.
 
 config USB_EHCI_MV
 	bool "EHCI support for Marvell PXA/MMP USB controller"
@@ -520,6 +521,7 @@ config USB_OHCI_SH
 config USB_OHCI_EXYNOS
 	tristate "OHCI support for Samsung S5P/EXYNOS SoC Series"
 	depends on PLAT_S5P || ARCH_EXYNOS
+	select PHY_SAMSUNG_USB2 if ARCH_EXYNOS
 	help
 	 Enable support for the Samsung Exynos SOC's on-chip OHCI controller.
 
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
