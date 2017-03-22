From: Rob Herring <robh@kernel.org>
Subject: [PATCH 04/15] ARM: dts: exynos: fix PCI bus dtc warnings
Date: Tue, 21 Mar 2017 21:03:02 -0500
Message-ID: <20170322020313.24338-4-robh@kernel.org>
References: <20170322020313.24338-1-robh@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oi0-f65.google.com ([209.85.218.65]:36244 "EHLO
        mail-oi0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757696AbdCVCDT (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 21 Mar 2017 22:03:19 -0400
In-Reply-To: <20170322020313.24338-1-robh@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc: arm@kernel.org, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, linux-samsung-soc@vger.kernel.org

dtc recently added PCI bus checks. Fix these warnings.

Signed-off-by: Rob Herring <robh@kernel.org>
Cc: Kukjin Kim <kgene@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: linux-samsung-soc@vger.kernel.org
---
Sub-arch maintainers, please apply to your trees unless arm-soc wants 
to take the whole lot.

 arch/arm/boot/dts/exynos5440.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5440.dtsi b/arch/arm/boot/dts/exynos5440.dtsi
index 77d35bb92950..d86da2c768fa 100644
--- a/arch/arm/boot/dts/exynos5440.dtsi
+++ b/arch/arm/boot/dts/exynos5440.dtsi
@@ -306,6 +306,7 @@
 		ranges = <0x00000800 0 0x40000000 0x40000000 0 0x00001000   /* configuration space */
 			  0x81000000 0 0	  0x40001000 0 0x00010000   /* downstream I/O */
 			  0x82000000 0 0x40011000 0x40011000 0 0x1ffef000>; /* non-prefetchable memory */
+		bus-range = <0x00 0xff>;
 		#interrupt-cells = <1>;
 		interrupt-map-mask = <0 0 0 0>;
 		interrupt-map = <0x0 0 &gic 53>;
@@ -329,6 +330,7 @@
 		ranges = <0x00000800 0 0x60000000 0x60000000 0 0x00001000   /* configuration space */
 			  0x81000000 0 0	  0x60001000 0 0x00010000   /* downstream I/O */
 			  0x82000000 0 0x60011000 0x60011000 0 0x1ffef000>; /* non-prefetchable memory */
+		bus-range = <0x00 0xff>;
 		#interrupt-cells = <1>;
 		interrupt-map-mask = <0 0 0 0>;
 		interrupt-map = <0x0 0 &gic 56>;
-- 
2.10.1
