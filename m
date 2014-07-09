From: Vikas Sajjan <vikas.sajjan@samsung.com>
Subject: [PATCH 1/3] arm: dts: Add pmu node for exynos5800 SoC
Date: Wed, 09 Jul 2014 16:55:45 +0530
Message-ID: <1404905147-30319-2-git-send-email-vikas.sajjan@samsung.com>
References: <1404905147-30319-1-git-send-email-vikas.sajjan@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:62408 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754057AbaGIL2j (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 Jul 2014 07:28:39 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N8F0062PZVPS490@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 09 Jul 2014 20:28:37 +0900 (KST)
In-reply-to: <1404905147-30319-1-git-send-email-vikas.sajjan@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, tomasz.figa@gmail.com, joshi@samsung.com, sajjan.linux@gmail.com, dianders@chromium.org, Vikas Sajjan <vikas.sajjan@samsung.com>

Adds pmu node for exynos5800 SoC.

Signed-off-by: Vikas Sajjan <vikas.sajjan@samsung.com>
---
 .../devicetree/bindings/arm/samsung/pmu.txt        |    1 +
 arch/arm/boot/dts/exynos5800.dtsi                  |    4 ++++
 2 files changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/pmu.txt b/Documentation/devicetree/bindings/arm/samsung/pmu.txt
index 2a4ab04..1f0552c 100644
--- a/Documentation/devicetree/bindings/arm/samsung/pmu.txt
+++ b/Documentation/devicetree/bindings/arm/samsung/pmu.txt
@@ -8,6 +8,7 @@ Properties:
 		   - "samsung,exynos4412-pmu" - for Exynos4412 SoC,
 		   - "samsung,exynos5250-pmu" - for Exynos5250 SoC,
 		   - "samsung,exynos5420-pmu" - for Exynos5420 SoC.
+		   - "samsung,exynos5800-pmu" - for Exynos5800 SoC.
 		second value must be always "syscon".
 
  - reg : offset and length of the register set.
diff --git a/arch/arm/boot/dts/exynos5800.dtsi b/arch/arm/boot/dts/exynos5800.dtsi
index c0bb356..2009b9c 100644
--- a/arch/arm/boot/dts/exynos5800.dtsi
+++ b/arch/arm/boot/dts/exynos5800.dtsi
@@ -26,3 +26,7 @@
 &mfc {
 	compatible = "samsung,mfc-v8";
 };
+
+&pmu_system_controller {
+	compatible = "samsung,exynos5800-pmu", "syscon";
+};
-- 
1.7.9.5
