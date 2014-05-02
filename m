From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH v2 2/2] Documentation: DT: Exynos: Bind SRAM though DT
Date: Fri,  2 May 2014 10:36:20 +0530
Message-ID: <1399007180-20680-2-git-send-email-sachin.kamat@linaro.org>
References: <1399007180-20680-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f45.google.com ([209.85.220.45]:61701 "EHLO
	mail-pa0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751100AbaEBFHv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 2 May 2014 01:07:51 -0400
Received: by mail-pa0-f45.google.com with SMTP id kq14so4830310pab.18
        for <linux-samsung-soc@vger.kernel.org>; Thu, 01 May 2014 22:07:50 -0700 (PDT)
In-Reply-To: <1399007180-20680-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, heiko@sntech.de, arnd@arndb.de, robh+dt@kernel.org, kgene.kim@samsung.com, sachin.kamat@linaro.org

Add SRAM binding documentation.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
Acked-by: Arnd Bergmann <arnd@arndb.de>
---
Changes since v1:
Minor re-wording for better clarity.
---
 .../devicetree/bindings/arm/exynos/smp-sram.txt    |   38 ++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/exynos/smp-sram.txt

diff --git a/Documentation/devicetree/bindings/arm/exynos/smp-sram.txt b/Documentation/devicetree/bindings/arm/exynos/smp-sram.txt
new file mode 100644
index 000000000000..c9ff2f58f9b6
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/exynos/smp-sram.txt
@@ -0,0 +1,38 @@
+Samsung Exynos SRAM for SMP bringup:
+------------------------------------
+
+Samsung SMP-capable Exynos SoCs use part of the SRAM for the bringup
+of the secondary cores. Once the core gets powered up it executes the
+code that is residing at some specific location of the SRAM.
+
+Therefore reserved section sub-nodes have to be added to the mmio-sram
+declaration. These nodes are of two types depending upon secure or
+non-secure execution environment.
+
+Required sub-node properties:
+- compatible : depending upon boot mode, should be
+		"samsung,exynos4210-sram" : for Secure SYSRAM
+		"samsung,exynos4210-sram-ns" : for Non-secure SYSRAM
+
+The rest of the properties should follow the generic mmio-sram discription
+found in ../../misc/sram.txt
+
+Example:
+
+	sram@02020000 {
+		compatible = "mmio-sram";
+		reg = <0x02020000 0x54000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0 0x02020000 0x54000>;
+
+		smp-sram@0 {
+			compatible = "samsung,exynos4210-sram";
+			reg = <0x0 0x1000>;
+		};
+
+		smp-sram@53000 {
+			compatible = "samsung,exynos4210-sram-ns";
+			reg = <0x53000 0x1000>;
+		};
+	};
-- 
1.7.9.5
