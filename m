From: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
Subject: [PATCH] ARM: dts: Allow simultaneous usage exynos-rng and s5p-sss drivers on exynos5
Date: Mon, 11 Jan 2016 20:40:28 +0900
Message-ID: <1452512428-3916-1-git-send-email-k.kozlowski.k@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pf0-f176.google.com ([209.85.192.176]:34780 "EHLO
	mail-pf0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758999AbcAKLnZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 Jan 2016 06:43:25 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>

The s5p-sss crypto HW acceleration driver supports only AES algorithms
thus it accesses only registers from feeder (offset 0x0, length 0x100)
and AES (offset 0x200, length 0x100) blocks Security SubSystem (SSS).

The exynos-rng Pseudo Random Number Generator driver accesses only PRNG
block at offset 0x400 (length 0x100).

Narrow the size of memory mapped by s5p-sss driver so both drivers can
be loaded at the same time.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
---
 arch/arm/boot/dts/exynos5250.dtsi | 2 +-
 arch/arm/boot/dts/exynos5420.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 33e2d5f7315b..234403422c6f 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -807,7 +807,7 @@
 
 	sss@10830000 {
 		compatible = "samsung,exynos4210-secss";
-		reg = <0x10830000 0x10000>;
+		reg = <0x10830000 0x300>;
 		interrupts = <0 112 0>;
 		clocks = <&clock CLK_SSS>;
 		clock-names = "secss";
diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 48a0a55314f5..7c8a606d65aa 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -859,7 +859,7 @@
 
 	sss: sss@10830000 {
 		compatible = "samsung,exynos4210-secss";
-		reg = <0x10830000 0x10000>;
+		reg = <0x10830000 0x300>;
 		interrupts = <0 112 0>;
 		clocks = <&clock CLK_SSS>;
 		clock-names = "secss";
-- 
2.1.4
