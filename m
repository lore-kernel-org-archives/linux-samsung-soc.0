From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH] usb: Remove references to non-existent PLAT_S5P symbol
Date: Mon, 06 Oct 2014 17:47:10 +0200
Message-ID: <1412610430-8647-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, pebolle@tiscali.nl, jg1.han@samsung.com, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

The PLAT_S5P Kconfig symbol was removed in commit d78c16ccde96
("ARM: SAMSUNG: Remove remaining legacy code"). There are still
some references left, fix that by replacing them with ARCH_S5PV210.

Reported-by: Paul Bolle <pebolle@tiscali.nl>
Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 drivers/usb/host/Kconfig |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index 82800a7..6f1d48e 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -220,7 +220,7 @@ config USB_EHCI_SH
 
 config USB_EHCI_EXYNOS
        tristate "EHCI support for Samsung S5P/EXYNOS SoC Series"
-       depends on PLAT_S5P || ARCH_EXYNOS
+       depends on ARCH_S5PV210 || ARCH_EXYNOS
        help
 	Enable support for the Samsung Exynos SOC's on-chip EHCI controller.
 
@@ -527,7 +527,7 @@ config USB_OHCI_SH
 
 config USB_OHCI_EXYNOS
 	tristate "OHCI support for Samsung S5P/EXYNOS SoC Series"
-	depends on PLAT_S5P || ARCH_EXYNOS
+	depends on ARCH_S5PV210 || ARCH_EXYNOS
 	help
 	 Enable support for the Samsung Exynos SOC's on-chip OHCI controller.
 
-- 
1.7.9.5
