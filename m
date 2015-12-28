From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH v2 3/3] dt-bindings: regulator/mfd: Reorganize S2MPA01 bindings
Date: Mon, 28 Dec 2015 10:15:14 +0900
Message-ID: <1451265314-4232-4-git-send-email-k.kozlowski@samsung.com>
References: <1451265314-4232-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:38411 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751163AbbL1BPn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 27 Dec 2015 20:15:43 -0500
In-reply-to: <1451265314-4232-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sangbeom Kim <sbkim73@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Mark Brown <broonie@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org

The mfd/s2mpa01.txt duplicates some of the information about bindings
with old mfd/s2mps11.txt. Now common part exists entirely in
mfd/samsung,sec-core.txt so:
 - add company prefix to file name (regulator/samsung,s2mpa01.txt),
 - remove duplicated information,
 - reorganize the contents to match style of
   regulator/samsung,s2mps11.txt.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Acked-by: Mark Brown <broonie@kernel.org>
Acked-by: Rob Herring <robh@kernel.org>
Acked-by: Lee Jones <lee.jones@linaro.org>

---

Changes since v1:
1. Added accumulated acks.
2. Use -M20% so renames will be more visible (formatting is changed so
   default -M50% does not consider it as renames).
---
 .../devicetree/bindings/mfd/samsung,sec-core.txt   |  4 +-
 .../s2mpa01.txt => regulator/samsung,s2mpa01.txt}  | 69 +++++++++-------------
 2 files changed, 32 insertions(+), 41 deletions(-)
 rename Documentation/devicetree/bindings/{mfd/s2mpa01.txt => regulator/samsung,s2mpa01.txt} (37%)

diff --git a/Documentation/devicetree/bindings/mfd/samsung,sec-core.txt b/Documentation/devicetree/bindings/mfd/samsung,sec-core.txt
index 4aeb95c82304..cdd079bfc287 100644
--- a/Documentation/devicetree/bindings/mfd/samsung,sec-core.txt
+++ b/Documentation/devicetree/bindings/mfd/samsung,sec-core.txt
@@ -4,7 +4,7 @@ Binding for Samsung S2M and S5M family multi-function device
 This is a part of device tree bindings for S2M and S5M family multi-function
 devices.
 
-The Samsung S2MPS11/13/14/15, S2MPU02 and S5M8767 is a family
+The Samsung S2MPA01, S2MPS11/13/14/15, S2MPU02 and S5M8767 is a family
 of multi-function devices which include voltage and current regulators, RTC,
 charger controller, clock outputs and other sub-blocks. It is interfaced
 to the host controller using an I2C interface. Each sub-block is usually
@@ -13,6 +13,7 @@ addressed by the host system using different I2C slave addresses.
 
 This document describes bindings for main device node. Optional sub-blocks
 must be a sub-nodes to it. Bindings for them can be found in:
+ - bindings/regulator/samsung,s2mpa01.txt
  - bindings/regulator/samsung,s2mps11.txt
  - bindings/regulator/samsung,s5m8767.txt
  - bindings/clock/samsung,s2mps11.txt
@@ -20,6 +21,7 @@ must be a sub-nodes to it. Bindings for them can be found in:
 
 Required properties:
  - compatible: Should be one of the following
+	- "samsung,s2mpa01-pmic",
 	- "samsung,s2mps11-pmic",
 	- "samsung,s2mps13-pmic",
 	- "samsung,s2mps14-pmic",
diff --git a/Documentation/devicetree/bindings/mfd/s2mpa01.txt b/Documentation/devicetree/bindings/regulator/samsung,s2mpa01.txt
similarity index 37%
rename from Documentation/devicetree/bindings/mfd/s2mpa01.txt
rename to Documentation/devicetree/bindings/regulator/samsung,s2mpa01.txt
index c13d3d8c3947..bae3c7f838cf 100644
--- a/Documentation/devicetree/bindings/mfd/s2mpa01.txt
+++ b/Documentation/devicetree/bindings/regulator/samsung,s2mpa01.txt
@@ -1,54 +1,43 @@
+Binding for Samsung S2MPA01 regulator block
+===========================================
 
-* Samsung S2MPA01 Voltage and Current Regulator
+This is a part of device tree bindings for S2M family multi-function devices.
+More information can be found in bindings/mfd/sec-core.txt file.
 
-The Samsung S2MPA01 is a multi-function device which includes high
-efficiency buck converters including Dual-Phase buck converter, various LDOs,
-and an RTC. It is interfaced to the host controller using an I2C interface.
-Each sub-block is addressed by the host system using different I2C slave
-addresses.
+The S2MPA01 device provide buck and LDO regulators.
 
-Required properties:
-- compatible: Should be "samsung,s2mpa01-pmic".
-- reg: Specifies the I2C slave address of the PMIC block. It should be 0x66.
+To register these with regulator framework instantiate under main device node
+a sub-node named "regulators" with more sub-nodes for each regulator using the
+common regulator binding documented in:
+ - Documentation/devicetree/bindings/regulator/regulator.txt
 
-Optional properties:
-- interrupt-parent: Specifies the phandle of the interrupt controller to which
-  the interrupts from s2mpa01 are delivered to.
-- interrupts: An interrupt specifier for the sole interrupt generated by the
-  device.
-
-Optional nodes:
-- regulators: The regulators of s2mpa01 that have to be instantiated should be
-  included in a sub-node named 'regulators'. Regulator nodes and constraints
-  included in this sub-node use the standard regulator bindings which are
-  documented elsewhere.
-
-Properties for BUCK regulator nodes:
-- regulator-ramp-delay: ramp delay in uV/us. May be 6250, 12500
-  (default), 25000, or 50000. May be 0 for disabling the ramp delay on
-  BUCK{1,2,3,4}.
-
- In the absence of the regulator-ramp-delay property, the default ramp
- delay will be used.
-
-  NOTE: Some BUCKs share the ramp rate setting i.e. same ramp value will be set
-  for a particular group of BUCKs. So provide same regulator-ramp-delay=<value>.
-
-  The following BUCKs share ramp settings:
-  * 1 and 6
-  * 2 and 4
-  * 8, 9, and 10
-
-The following are the names of the regulators that the s2mpa01 PMIC block
-supports. Note: The 'n' in LDOn and BUCKn represents the LDO or BUCK number
-as per the datasheet of s2mpa01.
 
+Names of regulators supported by S2MPA01 device:
 	- LDOn
 		  - valid values for n are 1 to 26
 		  - Example: LDO1, LD02, LDO26
 	- BUCKn
 		  - valid values for n are 1 to 10.
 		  - Example: BUCK1, BUCK2, BUCK9
+Note: The 'n' in LDOn and BUCKn represents the LDO or BUCK number
+as per the datasheet of device.
+
+
+Optional properties of buck regulator nodes under "regulators" sub-node:
+ - regulator-ramp-delay: ramp delay in uV/us. May be 6250, 12500
+   (default), 25000, or 50000. May be 0 for disabling the ramp delay on
+   BUCK{1,2,3,4}.
+
+   In the absence of the regulator-ramp-delay property, the default ramp
+   delay will be used.
+
+   Note: Some bucks share the ramp rate setting i.e. same ramp value
+   will be set for a particular group of bucks so provide the same
+   regulator-ramp-delay value for them.
+   Groups sharing ramp rate:
+    - buck{1,6},
+    - buck{2,4},
+    - buck{8,9,10}.
 
 Example:
 
-- 
1.9.1
