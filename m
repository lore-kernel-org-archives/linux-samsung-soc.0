From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v2] ARM: dts: Add SYSREG block node for S5P/Exynos4 SoC series
Date: Tue, 26 Mar 2013 14:00:21 +0100
Message-ID: <1364302821-17989-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:29999 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757712Ab3CZNAo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Mar 2013 09:00:44 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MK90073BQT2TH10@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 26 Mar 2013 22:00:38 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: kyungmin.park@samsung.com, thomas.abraham@linaro.org, t.figa@samsung.com, myungjoo.ham@samsung.com, dh09.lee@samsung.com, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Sylwester Nawrocki <s.nawrocki@samsung.com>

This patch adds device tree node for the SYSREG registers block
found in Samsung S5P/Exynos SoC series. The SYSREG module
generates control signals for the ARM CPU and various IP blocks
and buses. SYSREG block registers are exposed through APB bus
interface. A sysreg device tree node is to be associated with
mfd syscon driver and all SYSREG clients should use regmap
interface it provides. It allows to eliminate any possible races
and conflicts should different drivers attempt to concurrently
access same register.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---

Changes since v1:
 - Added missing "samsung," prefix to the compatible property,
 - the binding documentation moved to ...bindings/arm/samsung
   as SYSREG block can be also found on other SoCs than Exynos.
---
 .../devicetree/bindings/arm/samsung/sysreg.txt     |    7 +++++++
 arch/arm/boot/dts/exynos4.dtsi                     |    5 +++++
 2 files changed, 12 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/samsung/sysreg.txt

diff --git a/Documentation/devicetree/bindings/arm/samsung/sysreg.txt b/Documentation/devicetree/bindings/arm/samsung/sysreg.txt
new file mode 100644
index 0000000..5039c0a
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/samsung/sysreg.txt
@@ -0,0 +1,7 @@
+SAMSUNG S5P/Exynos SoC series System Registers (SYSREG)
+
+Properties:
+ - name : should be 'sysreg';
+ - compatible : should contain "samsung,<chip name>-sysreg", "syscon";
+   For Exynos4 SoC series it should be "samsung,exynos4-sysreg", "syscon";
+ - reg : offset and length of the register set.
diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index 9ac47d5..462f055 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -82,6 +82,11 @@
 		reg = <0x10440000 0x1000>;
 	};
 
+	sys_reg: sysreg {
+		compatible = "samsung,exynos4-sysreg", "syscon";
+		reg = <0x10010000 0x400>;
+	};
+
 	watchdog@10060000 {
 		compatible = "samsung,s3c2410-wdt";
 		reg = <0x10060000 0x100>;
-- 
1.7.9.5
