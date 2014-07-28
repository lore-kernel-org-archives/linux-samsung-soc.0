From: Vikas Sajjan <vikas.sajjan@samsung.com>
Subject: [RESEND][PATCH 1/2] ARM: DTS: Add PMU DT node for exynos5260 SoC
Date: Mon, 28 Jul 2014 18:07:59 +0530
Message-ID: <1406551080-14821-2-git-send-email-vikas.sajjan@samsung.com>
References: <1406551080-14821-1-git-send-email-vikas.sajjan@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:38470 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751674AbaG1MmZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Jul 2014 08:42:25 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N9F004I79XQTIA0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 28 Jul 2014 21:41:50 +0900 (KST)
In-reply-to: <1406551080-14821-1-git-send-email-vikas.sajjan@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, tomasz.figa@gmail.com, joshi@samsung.com, sajjan.linux@gmail.com, dianders@chromium.org, Vikas Sajjan <vikas.sajjan@samsung.com>

Adds PMU DT node for exynos5260 SoC.

Signed-off-by: Vikas Sajjan <vikas.sajjan@samsung.com>
---
 .../devicetree/bindings/arm/samsung/pmu.txt        |    1 +
 arch/arm/boot/dts/exynos5260.dtsi                  |    5 +++++
 2 files changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/pmu.txt b/Documentation/devicetree/bindings/arm/samsung/pmu.txt
index 2a4ab04..c038628 100644
--- a/Documentation/devicetree/bindings/arm/samsung/pmu.txt
+++ b/Documentation/devicetree/bindings/arm/samsung/pmu.txt
@@ -8,6 +8,7 @@ Properties:
 		   - "samsung,exynos4412-pmu" - for Exynos4412 SoC,
 		   - "samsung,exynos5250-pmu" - for Exynos5250 SoC,
 		   - "samsung,exynos5420-pmu" - for Exynos5420 SoC.
+		   - "samsung,exynos5260-pmu" - for Exynos5260 SoC.
 		second value must be always "syscon".
 
  - reg : offset and length of the register set.
diff --git a/arch/arm/boot/dts/exynos5260.dtsi b/arch/arm/boot/dts/exynos5260.dtsi
index 5398a60..4f2fabe 100644
--- a/arch/arm/boot/dts/exynos5260.dtsi
+++ b/arch/arm/boot/dts/exynos5260.dtsi
@@ -227,6 +227,11 @@
 			interrupts = <0 243 0>;
 		};
 
+		pmu_system_controller: system-controller@10D50000 {
+			compatible = "samsung,exynos5260-pmu", "syscon";
+			reg = <0x10D50000 0x10000>;
+		};
+
 		uart0: serial@12C00000 {
 			compatible = "samsung,exynos4210-uart";
 			reg = <0x12C00000 0x100>;
-- 
1.7.9.5
