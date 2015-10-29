From: Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH v4 1/4] dt-bindings: mfd: s2mps11: add documentation for
 s2mps15 PMIC
Date: Thu, 29 Oct 2015 10:28:38 +0530
Message-ID: <1446094723-6212-2-git-send-email-alim.akhtar@samsung.com>
References: <1446094723-6212-1-git-send-email-alim.akhtar@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1446094723-6212-1-git-send-email-alim.akhtar@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, broonie@kernel.org
Cc: k.kozlowski@samsung.com, linux-samsung-soc@vger.kernel.org, rtc-linux@googlegroups.com, linux-kernel@vger.kernel.org, Thomas Abraham <thomas.ab@samsung.com>, devicetree@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

From: Thomas Abraham <thomas.ab@samsung.com>

Add dt-binding documentation for s2mps15 PMIC device. The s2mps15 device
is similar to s2mps11/14 PMIC device and has 27 LDO and 10 buck regulators.

Cc: devicetree@vger.kernel.org
Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Acked-by: Lee Jones <lee.jones@linaro.org>
---
 Documentation/devicetree/bindings/mfd/s2mps11.txt |   23 ++++++++++++++-------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/s2mps11.txt b/Documentation/devicetree/bindings/mfd/s2mps11.txt
index 890f0b0e1643..c0427c9d0886 100644
--- a/Documentation/devicetree/bindings/mfd/s2mps11.txt
+++ b/Documentation/devicetree/bindings/mfd/s2mps11.txt
@@ -1,5 +1,5 @@
 
-* Samsung S2MPS11, S2MPS13, S2MPS14 and S2MPU02 Voltage and Current Regulator
+* Samsung S2MPS11/13/14/15 and S2MPU02 Voltage and Current Regulator
 
 The Samsung S2MPS11 is a multi-function device which includes voltage and
 current regulators, RTC, charger controller and other sub-blocks. It is
@@ -7,8 +7,12 @@ interfaced to the host controller using an I2C interface. Each sub-block is
 addressed by the host system using different I2C slave addresses.
 
 Required properties:
-- compatible: Should be "samsung,s2mps11-pmic" or "samsung,s2mps13-pmic"
-	      or "samsung,s2mps14-pmic" or "samsung,s2mpu02-pmic".
+- compatible: Should be one of the following
+	- "samsung,s2mps11-pmic"
+	- "samsung,s2mps13-pmic"
+	- "samsung,s2mps14-pmic"
+	- "samsung,s2mps15-pmic"
+	- "samsung,s2mpu02-pmic".
 - reg: Specifies the I2C slave address of the pmic block. It should be 0x66.
 
 Optional properties:
@@ -24,7 +28,7 @@ Optional properties:
   unwanted buck warm reset (setting buck voltages to default values).
 
 Optional nodes:
-- clocks: s2mps11, s2mps13 and s5m8767 provide three(AP/CP/BT) buffered 32.768
+- clocks: s2mps11, s2mps13, s2mps15 and s5m8767 provide three(AP/CP/BT) buffered 32.768
   KHz outputs, so to register these as clocks with common clock framework
   instantiate a sub-node named "clocks". It uses the common clock binding
   documented in :
@@ -37,12 +41,13 @@ Optional nodes:
     the clock which they consume.
     Clock               ID           Devices
     ----------------------------------------------------------
-    32KhzAP		0            S2MPS11, S2MPS13, S2MPS14, S5M8767
-    32KhzCP		1            S2MPS11, S2MPS13, S5M8767
-    32KhzBT		2            S2MPS11, S2MPS13, S2MPS14, S5M8767
+    32KhzAP		0            S2MPS11, S2MPS13, S2MPS14, S2MPS15, S5M8767
+    32KhzCP		1            S2MPS11, S2MPS13, S2MPS15, S5M8767
+    32KhzBT		2            S2MPS11, S2MPS13, S2MPS14, S2MPS15, S5M8767
 
   - compatible: Should be one of: "samsung,s2mps11-clk", "samsung,s2mps13-clk",
-		"samsung,s2mps14-clk", "samsung,s5m8767-clk"
+		"samsung,s2mps14-clk", "samsung,s2mps15-clk",
+		"samsung,s5m8767-clk"
 
 - regulators: The regulators of s2mps11 that have to be instantiated should be
 included in a sub-node named 'regulators'. Regulator nodes included in this
@@ -90,6 +95,7 @@ as per the datasheet of s2mps11.
 			- S2MPS11: 1 to 38
 			- S2MPS13: 1 to 40
 			- S2MPS14: 1 to 25
+			- S2MPS15: 1 to 27
 			- S2MPU02: 1 to 28
 		  - Example: LDO1, LDO2, LDO28
 	- BUCKn
@@ -97,6 +103,7 @@ as per the datasheet of s2mps11.
 			- S2MPS11: 1 to 10
 			- S2MPS13: 1 to 10
 			- S2MPS14: 1 to 5
+			- S2MPS15: 1 to 10
 			- S2MPU02: 1 to 7
 		  - Example: BUCK1, BUCK2, BUCK9
 
-- 
1.7.10.4
