From: Vikas Sajjan <vikas.sajjan@samsung.com>
Subject: [PATCH V3 1/4] ARM: dts: Add sysreg sytem controller node to
 exynos5250 and exynos5420
Date: Mon, 19 May 2014 16:49:13 +0530
Message-ID: <1400498356-26803-2-git-send-email-vikas.sajjan@samsung.com>
References: <1400498356-26803-1-git-send-email-vikas.sajjan@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:56531 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753177AbaESLUu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 May 2014 07:20:50 -0400
In-reply-to: <1400498356-26803-1-git-send-email-vikas.sajjan@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, k.debski@samsung.com, kishon@ti.com, robh+dt@kernel.org, stern@rowland.harvard.edu, gautam.vivek@samsung.com, Vikas Sajjan <vikas.sajjan@samsung.com>

From: Vivek Gautam <gautam.vivek@samsung.com>

This patch adds sysreg-syscon node to exynos5250 and exynos5420 device
tree, to access System Register's registers using syscon driver.

Signed-off-by: Kamil Debski <k.debski@samsung.com>
[gautam.vivek@samsung.com: Split this syreg-syscon dts entry from
dts: Add usb2phy to Exynos 5250 patch]
[gautam.vivek@samsung.com: added similar syscon entry for exynos5420]
Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>
[vikas.sajjan@samsung.com: updated the binding document]
Signed-off-by: Vikas Sajjan <vikas.sajjan@samsung.com>
---
 .../devicetree/bindings/arm/samsung/sysreg.txt     |   11 +++++++++--
 arch/arm/boot/dts/exynos5250.dtsi                  |    5 +++++
 arch/arm/boot/dts/exynos5420.dtsi                  |    5 +++++
 3 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/samsung/sysreg.txt b/Documentation/devicetree/bindings/arm/samsung/sysreg.txt
index 0ab3251..4fced6e 100644
--- a/Documentation/devicetree/bindings/arm/samsung/sysreg.txt
+++ b/Documentation/devicetree/bindings/arm/samsung/sysreg.txt
@@ -1,8 +1,10 @@
 SAMSUNG S5P/Exynos SoC series System Registers (SYSREG)
 
 Properties:
- - compatible : should contain "samsung,<chip name>-sysreg", "syscon";
-   For Exynos4 SoC series it should be "samsung,exynos4-sysreg", "syscon";
+ - compatible : should contain two values. First value must be one from following list:
+		- "samsung,exynos4-sysreg" - for Exynos4 based SoCs,
+		- "samsung,exynos5-sysreg" - for Exynos5 based SoCs.
+		second value must be always "syscon".
  - reg : offset and length of the register set.
 
 Example:
@@ -10,3 +12,8 @@ Example:
 		compatible = "samsung,exynos4-sysreg", "syscon";
 		reg = <0x10010000 0x400>;
 	};
+
+	syscon@10050000 {
+		compatible = "samsung,exynos5-sysreg", "syscon";
+		reg = <0x10050000 0x5000>;
+	};
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 68a3e6f..8e9b9a3 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -193,6 +193,11 @@
 		reg = <0x10040000 0x5000>;
 	};
 
+	sysreg_system_controller: syscon@10050000 {
+		compatible = "samsung,exynos5-sysreg", "syscon";
+		reg = <0x10050000 0x5000>;
+	};
+
 	watchdog@101D0000 {
 		compatible = "samsung,exynos5250-wdt";
 		reg = <0x101D0000 0x100>;
diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 13a083e..f9b051b 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -725,6 +725,11 @@
 		reg = <0x10040000 0x5000>;
 	};
 
+	sysreg_system_controller: syscon@10050000 {
+		compatible = "samsung,exynos5-sysreg", "syscon";
+		reg = <0x10050000 0x5000>;
+	};
+
 	tmu_cpu0: tmu@10060000 {
 		compatible = "samsung,exynos5420-tmu";
 		reg = <0x10060000 0x100>;
-- 
1.7.9.5
