From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] ARM: exynos_defconfig: Enable DWC2 USB driver and USB ethernet
 gadget
Date: Tue, 18 Aug 2015 11:15:33 +0200
Message-ID: <1439889333-11990-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:31207 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751883AbbHRJPt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Aug 2015 05:15:49 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NT9002UKTQAZ050@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 18 Aug 2015 10:15:46 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

DWC2 (s3c-hsotg) hardware module is available on many Exynos based boards,
so enable DWC2 driver as well as the most common USB Ethernet gadget.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/configs/exynos_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index 1ff2bfa..729e2fa 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -158,8 +158,10 @@ CONFIG_USB_OHCI_HCD=y
 CONFIG_USB_OHCI_EXYNOS=y
 CONFIG_USB_STORAGE=y
 CONFIG_USB_DWC3=y
+CONFIG_USB_DWC2=y
 CONFIG_USB_HSIC_USB3503=y
 CONFIG_USB_GADGET=y
+CONFIG_USB_ETH=y
 CONFIG_MMC=y
 CONFIG_MMC_BLOCK_MINORS=16
 CONFIG_MMC_SDHCI=y
-- 
1.9.2
