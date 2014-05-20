From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 1/4] ARM: dts: exynos4210-trats: Enable USB gadget functionality
Date: Tue, 20 May 2014 14:46:58 +0200
Message-ID: <1400590021-15422-2-git-send-email-m.szyprowski@samsung.com>
References: <1400590021-15422-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:27882 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751790AbaETMrJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 May 2014 08:47:09 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N5V0028TI6IK600@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 20 May 2014 13:47:06 +0100 (BST)
In-reply-to: <1400590021-15422-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>

From: Tomasz Figa <t.figa@samsung.com>

This patch adds device tree nodes necessary to enable USB gadget
functionality on Exynos4210-based Trats board.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos4210-trats.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4210-trats.dts b/arch/arm/boot/dts/exynos4210-trats.dts
index 63aa2bb24a4b..f516da9e8b3a 100644
--- a/arch/arm/boot/dts/exynos4210-trats.dts
+++ b/arch/arm/boot/dts/exynos4210-trats.dts
@@ -88,6 +88,12 @@
 		};
 	};
 
+	hsotg@12480000 {
+		vusb_d-supply = <&vusb_reg>;
+		vusb_a-supply = <&vusbdac_reg>;
+		status = "okay";
+	};
+
 	sdhci_emmc: sdhci@12510000 {
 		bus-width = <8>;
 		non-removable;
@@ -97,6 +103,10 @@
 		status = "okay";
 	};
 
+	exynos-usbphy@125B0000 {
+		status = "okay";
+	};
+
 	serial@13800000 {
 		status = "okay";
 	};
-- 
1.9.2
