From: Beomho Seo <beomho.seo@samsung.com>
Subject: [PATCH v2 3/3] ARM: dts: fixed gpio key node for exynos4412
Date: Fri, 02 May 2014 15:38:03 +0900
Message-ID: <53633D4B.9070500@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:56866 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752127AbaEBGiE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 2 May 2014 02:38:04 -0400
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
Changes in v2:
- None.
---
 arch/arm/boot/dts/exynos4412-trats2.dts |   22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4412-trats2.dts b/arch/arm/boot/dts/exynos4412-trats2.dts
index d599215..41305e2 100644
--- a/arch/arm/boot/dts/exynos4412-trats2.dts
+++ b/arch/arm/boot/dts/exynos4412-trats2.dts
@@ -87,18 +87,18 @@
 		compatible = "gpio-keys";

 		key-down {
-			interrupt-parent = <&gpj1>;
-			interrupts = <2 0>;
-			gpios = <&gpj1 2 1>;
+			interrupt-parent = <&gpx3>;
+			interrupts = <3 0>;
+			gpios = <&gpx3 3 1>;
 			linux,code = <114>;
 			label = "volume down";
 			debounce-interval = <10>;
 		};

 		key-up {
-			interrupt-parent = <&gpj1>;
-			interrupts = <1 0>;
-			gpios = <&gpj1 1 1>;
+			interrupt-parent = <&gpx2>;
+			interrupts = <2 0>;
+			gpios = <&gpx2 2 1>;
 			linux,code = <115>;
 			label = "volume up";
 			debounce-interval = <10>;
@@ -113,6 +113,16 @@
 			debounce-interval = <10>;
 			gpio-key,wakeup;
 		};
+
+		key-ok {
+			interrupt-parent = <&gpx0>;
+			interrupts = <1 0>;
+			gpios = <&gpx0 1 1>;
+			linux,code = <139>;
+			label = "ok";
+			debounce-inteval = <10>;
+			gpio-key,wakeup;
+		};
 	};

 	adc: adc@126C0000 {
-- 
1.7.9.5
