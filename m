From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH v2 2/3] dt-bindings: regulator/mfd: Reorganize S5M8767 bindings
Date: Mon, 28 Dec 2015 10:15:13 +0900
Message-ID: <1451265314-4232-3-git-send-email-k.kozlowski@samsung.com>
References: <1451265314-4232-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <1451265314-4232-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: Sangbeom Kim <sbkim73@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Mark Brown <broonie@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

The regulator/s5m8767-regulator.txt duplicates some of the information
about bindings with old mfd/s2mps11.txt. Now common part exists entirely
in mfd/samsung,sec-core.txt so:
 - add company prefix to file name (regulator/samsung,s5m8767.txt),
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
 .../devicetree/bindings/mfd/samsung,sec-core.txt   |   4 +-
 .../{s5m8767-regulator.txt => samsung,s5m8767.txt} | 152 +++++++++------------
 MAINTAINERS                                        |   2 +-
 3 files changed, 71 insertions(+), 87 deletions(-)
 rename Documentation/devicetree/bindings/regulator/{s5m8767-regulator.txt => samsung,s5m8767.txt} (34%)

diff --git a/Documentation/devicetree/bindings/mfd/samsung,sec-core.txt b/Documentation/devicetree/bindings/mfd/samsung,sec-core.txt
index ef0166d0f643..4aeb95c82304 100644
--- a/Documentation/devicetree/bindings/mfd/samsung,sec-core.txt
+++ b/Documentation/devicetree/bindings/mfd/samsung,sec-core.txt
@@ -14,6 +14,7 @@ addressed by the host system using different I2C slave addresses.
 This document describes bindings for main device node. Optional sub-blocks
 must be a sub-nodes to it. Bindings for them can be found in:
  - bindings/regulator/samsung,s2mps11.txt
+ - bindings/regulator/samsung,s5m8767.txt
  - bindings/clock/samsung,s2mps11.txt
 
 
@@ -23,7 +24,8 @@ Required properties:
 	- "samsung,s2mps13-pmic",
 	- "samsung,s2mps14-pmic",
 	- "samsung,s2mps15-pmic",
-	- "samsung,s2mpu02-pmic".
+	- "samsung,s2mpu02-pmic",
+	- "samsung,s5m8767-pmic".
  - reg: Specifies the I2C slave address of the pmic block. It should be 0x66.
 
 Optional properties:
diff --git a/Documentation/devicetree/bindings/regulator/s5m8767-regulator.txt b/Documentation/devicetree/bindings/regulator/samsung,s5m8767.txt
similarity index 34%
rename from Documentation/devicetree/bindings/regulator/s5m8767-regulator.txt
rename to Documentation/devicetree/bindings/regulator/samsung,s5m8767.txt
index 20191315e444..093edda0c8df 100644
--- a/Documentation/devicetree/bindings/regulator/s5m8767-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/samsung,s5m8767.txt
@@ -1,98 +1,80 @@
-* Samsung S5M8767 Voltage and Current Regulator
-
-The Samsung S5M8767 is a multi-function device which includes voltage and
-current regulators, rtc, charger controller and other sub-blocks. It is
-interfaced to the host controller using a i2c interface. Each sub-block is
-addressed by the host system using different i2c slave address. This document
-describes the bindings for 'pmic' sub-block of s5m8767.
-
-Required properties:
-- compatible: Should be "samsung,s5m8767-pmic".
-- reg: Specifies the i2c slave address of the pmic block. It should be 0x66.
-
-- s5m8767,pmic-buck2-dvs-voltage: A set of 8 voltage values in micro-volt (uV)
-  units for buck2 when changing voltage using gpio dvs. Refer to [1] below
-  for additional information.
-
-- s5m8767,pmic-buck3-dvs-voltage: A set of 8 voltage values in micro-volt (uV)
-  units for buck3 when changing voltage using gpio dvs. Refer to [1] below
-  for additional information.
-
-- s5m8767,pmic-buck4-dvs-voltage: A set of 8 voltage values in micro-volt (uV)
-  units for buck4 when changing voltage using gpio dvs. Refer to [1] below
-  for additional information.
-
-- s5m8767,pmic-buck-ds-gpios: GPIO specifiers for three host gpio's used
-  for selecting GPIO DVS lines. It is one-to-one mapped to dvs gpio lines.
-
-[1] If none of the 's5m8767,pmic-buck[2/3/4]-uses-gpio-dvs' optional
-    property is specified, the 's5m8767,pmic-buck[2/3/4]-dvs-voltage'
-    property should specify atleast one voltage level (which would be a
-    safe operating voltage).
-
-    If either of the 's5m8767,pmic-buck[2/3/4]-uses-gpio-dvs' optional
-    property is specified, then all the eight voltage values for the
-    's5m8767,pmic-buck[2/3/4]-dvs-voltage' should be specified.
-
-Optional properties:
-- interrupt-parent: Specifies the phandle of the interrupt controller to which
-  the interrupts from s5m8767 are delivered to.
-- interrupts: Interrupt specifiers for two interrupt sources.
-  - First interrupt specifier is for 'irq1' interrupt.
-  - Second interrupt specifier is for 'alert' interrupt.
-- s5m8767,pmic-buck2-uses-gpio-dvs: 'buck2' can be controlled by gpio dvs.
-- s5m8767,pmic-buck3-uses-gpio-dvs: 'buck3' can be controlled by gpio dvs.
-- s5m8767,pmic-buck4-uses-gpio-dvs: 'buck4' can be controlled by gpio dvs.
+Binding for Samsung S5M8767 regulator block
+===========================================
+
+This is a part of device tree bindings for S5M family multi-function devices.
+More information can be found in bindings/mfd/sec-core.txt file.
+
+The S5M8767 device provide buck and LDO regulators.
+
+To register these with regulator framework instantiate under main device node
+a sub-node named "regulators" with more sub-nodes for each regulator using the
+common regulator binding documented in:
+ - Documentation/devicetree/bindings/regulator/regulator.txt
+
+
+Required properties of the main device node (the parent!):
+ - s5m8767,pmic-buck2-dvs-voltage: A set of 8 voltage values in micro-volt (uV)
+   units for buck2 when changing voltage using gpio dvs. Refer to [1] below
+   for additional information.
+
+ - s5m8767,pmic-buck3-dvs-voltage: A set of 8 voltage values in micro-volt (uV)
+   units for buck3 when changing voltage using gpio dvs. Refer to [1] below
+   for additional information.
+
+ - s5m8767,pmic-buck4-dvs-voltage: A set of 8 voltage values in micro-volt (uV)
+   units for buck4 when changing voltage using gpio dvs. Refer to [1] below
+   for additional information.
+
+ - s5m8767,pmic-buck-ds-gpios: GPIO specifiers for three host gpio's used
+   for selecting GPIO DVS lines. It is one-to-one mapped to dvs gpio lines.
+
+ [1] If none of the 's5m8767,pmic-buck[2/3/4]-uses-gpio-dvs' optional
+     property is specified, the 's5m8767,pmic-buck[2/3/4]-dvs-voltage'
+     property should specify atleast one voltage level (which would be a
+     safe operating voltage).
+
+     If either of the 's5m8767,pmic-buck[2/3/4]-uses-gpio-dvs' optional
+     property is specified, then all the eight voltage values for the
+     's5m8767,pmic-buck[2/3/4]-dvs-voltage' should be specified.
+
+Optional properties of the main device node (the parent!):
+ - s5m8767,pmic-buck2-uses-gpio-dvs: 'buck2' can be controlled by gpio dvs.
+ - s5m8767,pmic-buck3-uses-gpio-dvs: 'buck3' can be controlled by gpio dvs.
+ - s5m8767,pmic-buck4-uses-gpio-dvs: 'buck4' can be controlled by gpio dvs.
 
 Additional properties required if either of the optional properties are used:
 
-- s5m8767,pmic-buck234-default-dvs-idx: Default voltage setting selected from
-  the possible 8 options selectable by the dvs gpios. The value of this
-  property should be between 0 and 7. If not specified or if out of range, the
-  default value of this property is set to 0.
-
-- s5m8767,pmic-buck-dvs-gpios: GPIO specifiers for three host gpio's used
-  for dvs. The format of the gpio specifier depends in the gpio controller.
-
-Regulators: The regulators of s5m8767 that have to be instantiated should be
-included in a sub-node named 'regulators'. Regulator nodes included in this
-sub-node should be of the format as listed below.
-
-	regulator_name {
-		ldo1_reg: LDO1 {
-			regulator-name = "VDD_ALIVE_1.0V";
-			regulator-min-microvolt = <1100000>;
-			regulator-max-microvolt = <1100000>;
-			regulator-always-on;
-			regulator-boot-on;
-			op_mode = <1>; /* Normal Mode */
-		};
-	};
-The above regulator entries are defined in regulator bindings documentation
-except these properties:
-	- op_mode: describes the different operating modes of the LDO's with
-		power mode change in SOC. The different possible values are,
-		0 - always off mode
-		1 - on in normal mode
-		2 - low power mode
-		3 - suspend mode
-	- s5m8767,pmic-ext-control-gpios: (optional) GPIO specifier for one
-		GPIO controlling this regulator (enable/disable); This is
-		valid only for buck9.
-
-The following are the names of the regulators that the s5m8767 pmic block
-supports. Note: The 'n' in LDOn and BUCKn represents the LDO or BUCK number
-as per the datasheet of s5m8767.
+ - s5m8767,pmic-buck234-default-dvs-idx: Default voltage setting selected from
+   the possible 8 options selectable by the dvs gpios. The value of this
+   property should be between 0 and 7. If not specified or if out of range, the
+   default value of this property is set to 0.
+
+ - s5m8767,pmic-buck-dvs-gpios: GPIO specifiers for three host gpio's used
+   for dvs. The format of the gpio specifier depends in the gpio controller.
 
+
+Names of regulators supported by S5M8767 device:
 	- LDOn
 		  - valid values for n are 1 to 28
 		  - Example: LDO1, LDO2, LDO28
 	- BUCKn
 		  - valid values for n are 1 to 9.
 		  - Example: BUCK1, BUCK2, BUCK9
-
-The bindings inside the regulator nodes use the standard regulator bindings
-which are documented elsewhere.
+Note: The 'n' in LDOn and BUCKn represents the LDO or BUCK number
+as per the datasheet of device.
+
+
+Optional properties of the nodes under "regulators" sub-node:
+ - op_mode: describes the different operating modes of the LDO's with
+            power mode change in SOC. The different possible values are,
+             0 - always off mode
+             1 - on in normal mode
+             2 - low power mode
+             3 - suspend mode
+ - s5m8767,pmic-ext-control-gpios: (optional) GPIO specifier for one
+                                   GPIO controlling this regulator
+                                   (enable/disable); This is valid only
+                                   for buck9.
 
 Example:
 
diff --git a/MAINTAINERS b/MAINTAINERS
index 8ed8a382ffc6..7c4d89e93301 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9309,9 +9309,9 @@ F:	drivers/regulator/s5m*.c
 F:	drivers/clk/clk-s2mps11.c
 F:	drivers/rtc/rtc-s5m.c
 F:	include/linux/mfd/samsung/
-F:	Documentation/devicetree/bindings/regulator/s5m8767-regulator.txt
 F:	Documentation/devicetree/bindings/mfd/samsung,sec-core.txt
 F:	Documentation/devicetree/bindings/regulator/samsung,s2m*.txt
+F:	Documentation/devicetree/bindings/regulator/samsung,s5m*.txt
 F:	Documentation/devicetree/bindings/clock/samsung,s2mps11.txt
 
 SAMSUNG S5P/EXYNOS4 SOC SERIES CAMERA SUBSYSTEM DRIVERS
-- 
1.9.1

