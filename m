From: Sachin Kamat <sachin.kamat@samsung.com>
Subject: [PATCH 2/2] phy: Kconfig: Update config for Exynos USB DRD
Date: Mon, 30 Jun 2014 14:26:22 +0530
Message-ID: <1404118582-21993-2-git-send-email-sachin.kamat@samsung.com>
References: <1404118582-21993-1-git-send-email-sachin.kamat@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1404118582-21993-1-git-send-email-sachin.kamat@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, kishon@ti.com, dianders@chromium.org, gautam.vivek@samsung.com, spk.linux@gmail.com
List-Id: linux-samsung-soc@vger.kernel.org

USB DWC3 driver on Exynos platform does not work without its
corresponding phy driver. Hence make the PHY driver depend on
Exynos DWC3 driver and default it to yes to make things easier
for the end user.

Signed-off-by: Sachin Kamat <sachin.kamat@samsung.com>
---
 drivers/phy/Kconfig |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index 9aab5dfb0adf..6f90ee3c7ed1 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -151,8 +151,10 @@ config PHY_EXYNOS5_USBDRD
 	tristate "Exynos5 SoC series USB DRD PHY driver"
 	depends on ARCH_EXYNOS5 && OF
 	depends on HAS_IOMEM
+	depends on USB_DWC3_EXYNOS
 	select GENERIC_PHY
 	select MFD_SYSCON
+	default y
 	help
 	  Enable USB DRD PHY support for Exynos 5 SoC series.
 	  This driver provides PHY interface for USB 3.0 DRD controller
-- 
1.7.9.5
