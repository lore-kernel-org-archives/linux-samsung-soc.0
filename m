From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH v2 18/38] USB: Check for ARCH_EXYNOS separately
Date: Mon, 17 Jun 2013 18:34:03 +0200
Message-ID: <1371486863-12398-19-git-send-email-t.figa@samsung.com>
References: <1371486863-12398-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:41745 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753018Ab3FQQex (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Jun 2013 12:34:53 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MOJ00MBNQ1N6260@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 17 Jun 2013 17:34:48 +0100 (BST)
In-reply-to: <1371486863-12398-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

ARCH_EXYNOS is going to be excluded from PLAT_S5P, so it must be checked
separately in Exynos-related Kconfig entries.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/usb/Kconfig      | 1 +
 drivers/usb/host/Kconfig | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/Kconfig b/drivers/usb/Kconfig
index 92e1dc9..a3b48b5 100644
--- a/drivers/usb/Kconfig
+++ b/drivers/usb/Kconfig
@@ -43,6 +43,7 @@ config USB_ARCH_HAS_EHCI
 	default y if ARCH_VT8500
 	default y if PLAT_SPEAR
 	default y if PLAT_S5P
+	default y if ARCH_EXYNOS
 	default y if ARCH_MSM
 	default y if MICROBLAZE
 	default y if SPARC_LEON
diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index 344d5e2..922a65d 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -225,7 +225,7 @@ config USB_EHCI_SH
 
 config USB_EHCI_S5P
        tristate "EHCI support for Samsung S5P/EXYNOS SoC Series"
-       depends on PLAT_S5P
+       depends on PLAT_S5P || ARCH_EXYNOS
        help
 	Enable support for the Samsung S5Pxxxx and Exynos3/4/5 SOC's
 	on-chip EHCI controller.
-- 
1.8.2.1
