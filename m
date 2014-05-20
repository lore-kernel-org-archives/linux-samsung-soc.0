From: Beomho Seo <beomho.seo@samsung.com>
Subject: [PATCH v3 2/2] ARM: dts: fixed gpio key node for exynos4412
Date: Tue, 20 May 2014 19:48:11 +0900
Message-ID: <537B32EB.4090102@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:54885 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750789AbaETKsN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 May 2014 06:48:13 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Tomasz Figa <t.figa@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>
Cc: Myungjoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Jaehoon Chung <jh80.chung@samsung.com>

This patch fixed gpio key device node.
First, fix incorrect gpio property.
And then, add ok-key node where locate bottom center.
I have tested on exynos4412-trats2 board.

Signed-off-by: Beomho Seo <beomho.seo@samsung.com>
Signed-off-by: MyungJoo Ham <myungjoo.ham@samsung.com>
---
Changes in v3:
- Remove interrupt-parent, interrupts properties.

Changes in v2:
- None.
---
 arch/arm/boot/dts/exynos4412-trats2.dts |   19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4412-trats2.dts b/arch/arm/boot/dts/exynos4412-trats2.dts
index dda7517..bfefe22 100644
--- a/arch/arm/boot/dts/exynos4412-trats2.dts
+++ b/arch/arm/boot/dts/exynos4412-trats2.dts
@@ -115,32 +115,35 @@
 		compatible = "gpio-keys";

 		key-down {
-			interrupt-parent = <&gpj1>;
-			interrupts = <2 0>;
-			gpios = <&gpj1 2 1>;
+			gpios = <&gpx3 3 1>;
 			linux,code = <114>;
 			label = "volume down";
 			debounce-interval = <10>;
 		};

 		key-up {
-			interrupt-parent = <&gpj1>;
-			interrupts = <1 0>;
-			gpios = <&gpj1 1 1>;
+			gpios = <&gpx2 2 1>;
 			linux,code = <115>;
 			label = "volume up";
 			debounce-interval = <10>;
 		};

 		key-power {
-			interrupt-parent = <&gpx2>;
-			interrupts = <7 0>;
 			gpios = <&gpx2 7 1>;
 			linux,code = <116>;
 			label = "power";
 			debounce-interval = <10>;
 			gpio-key,wakeup;
 		};
+
+		key-ok {
+			gpios = <&gpx0 1 1>;
+			linux,code = <139>;
+			label = "ok";
+			debounce-inteval = <10>;
+			gpio-key,wakeup;
+		};
+
 	};

 	adc: adc@126C0000 {
-- 
1.7.9.5
