From: Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH v2 1/2] arm64: dts: Add level for cpu dt node for exynos7
Date: Sat, 12 Nov 2016 15:47:11 +0530
Message-ID: <1478945832-1826-1-git-send-email-alim.akhtar@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:47359 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S936602AbcKLKTB (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 12 Nov 2016 05:19:01 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: krzk@kernel.org, will.deacon@arm.com, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, robin.murphy@arm.com

This patch adds level for cpu dt node, so that these levels can be used
as a phandle whenever required. For example, adding a "interrupt-affinity"
for arm pmu node.

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos7.dtsi |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos7.dtsi b/arch/arm64/boot/dts/exynos/exynos7.dtsi
index e0d0d01..396ffb9 100644
--- a/arch/arm64/boot/dts/exynos/exynos7.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos7.dtsi
@@ -35,28 +35,28 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		cpu@0 {
+		cpu_atlas0: cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a57", "arm,armv8";
 			reg = <0x0>;
 			enable-method = "psci";
 		};
 
-		cpu@1 {
+		cpu_atlas1: cpu@1 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a57", "arm,armv8";
 			reg = <0x1>;
 			enable-method = "psci";
 		};
 
-		cpu@2 {
+		cpu_atlas2: cpu@2 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a57", "arm,armv8";
 			reg = <0x2>;
 			enable-method = "psci";
 		};
 
-		cpu@3 {
+		cpu_atlas3: cpu@3 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a57", "arm,armv8";
 			reg = <0x3>;
-- 
1.7.10.4
