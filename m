From: Sachin Kamat <sachin.kamat-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 2/2] usb: dwc3: Kconfig: Select PHY drivers for Exynos DWC3
Date: Thu, 26 Jun 2014 11:09:38 +0530
Message-ID: <1403761178-5371-2-git-send-email-sachin.kamat@samsung.com>
References: <1403761178-5371-1-git-send-email-sachin.kamat@samsung.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1403761178-5371-1-git-send-email-sachin.kamat-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, spk.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

USB DWC3 driver on Exynos platforms does not work without its
corresponding phy driver. Hence it makes no sense to keep the
phy driver as user selectable. Instead select it from USB config
to make things easier for the end user.
While at it make the config depend on ARCH_EXYNOS5 instead of
ARCH_EXYNOS as this IP is available only on Exynos5 platforms.

Signed-off-by: Sachin Kamat <sachin.kamat-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
---
 drivers/phy/Kconfig      |    8 +-------
 drivers/usb/dwc3/Kconfig |    3 ++-
 2 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index 7fe7ef5f1322..6be353c9dc4c 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -138,15 +138,9 @@ config PHY_EXYNOS5250_USB2
 	bool
 
 config PHY_EXYNOS5_USBDRD
-	tristate "Exynos5 SoC series USB DRD PHY driver"
-	depends on ARCH_EXYNOS5 && OF
-	depends on HAS_IOMEM
+	tristate
 	select GENERIC_PHY
 	select MFD_SYSCON
-	help
-	  Enable USB DRD PHY support for Exynos 5 SoC series.
-	  This driver provides PHY interface for USB 3.0 DRD controller
-	  present on Exynos5 SoC series.
 
 config PHY_XGENE
 	tristate "APM X-Gene 15Gbps PHY support"
diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
index 261c3b428220..501477452ad8 100644
--- a/drivers/usb/dwc3/Kconfig
+++ b/drivers/usb/dwc3/Kconfig
@@ -55,7 +55,8 @@ config USB_DWC3_OMAP
 
 config USB_DWC3_EXYNOS
 	tristate "Samsung Exynos Platform"
-	depends on ARCH_EXYNOS || COMPILE_TEST
+	depends on ARCH_EXYNOS5 || COMPILE_TEST
+	select PHY_EXYNOS5_USBDRD
 	default USB_DWC3
 	help
 	  Recent Exynos5 SoCs ship with one DesignWare Core USB3 IP inside,
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
