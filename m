From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH v3 11/13] Documentation: mfd: s2mps11: Document support for
 S2MPS14
Date: Mon, 17 Feb 2014 09:40:25 +0100
Message-ID: <1392626427-4518-12-git-send-email-k.kozlowski@samsung.com>
References: <1392626427-4518-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1392626427-4518-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sangbeom Kim <sbkim73@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Yadwinder Singh Brar <yadi.brar@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
List-Id: linux-samsung-soc@vger.kernel.org

Add bindings documentation for S2MPS14 device to the s2mps11 driver.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Tomasz Figa <t.figa@samsung.com>
Cc: devicetree@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Pawel Moll <pawel.moll@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
Cc: Kumar Gala <galak@codeaurora.org>
Acked-by: Tomasz Figa <t.figa@samsung.com>
---
 Documentation/devicetree/bindings/mfd/s2mps11.txt |   12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/s2mps11.txt b/Documentation/devicetree/bindings/mfd/s2mps11.txt
index 15ee89c3cc7b..f69bec294f02 100644
--- a/Documentation/devicetree/bindings/mfd/s2mps11.txt
+++ b/Documentation/devicetree/bindings/mfd/s2mps11.txt
@@ -1,5 +1,5 @@
 
-* Samsung S2MPS11 Voltage and Current Regulator
+* Samsung S2MPS11 and S2MPS14 Voltage and Current Regulator
 
 The Samsung S2MPS11 is a multi-function device which includes voltage and
 current regulators, RTC, charger controller and other sub-blocks. It is
@@ -7,7 +7,7 @@ interfaced to the host controller using an I2C interface. Each sub-block is
 addressed by the host system using different I2C slave addresses.
 
 Required properties:
-- compatible: Should be "samsung,s2mps11-pmic".
+- compatible: Should be "samsung,s2mps11-pmic" or "samsung,s2mps14-pmic".
 - reg: Specifies the I2C slave address of the pmic block. It should be 0x66.
 
 Optional properties:
@@ -59,10 +59,14 @@ supports. Note: The 'n' in LDOn and BUCKn represents the LDO or BUCK number
 as per the datasheet of s2mps11.
 
 	- LDOn
-		  - valid values for n are 1 to 38
+		  - valid values for n are:
+			- S2MPS11: 1 to 38
+			- S2MPS14: 1 to 25
 		  - Example: LDO1, LD02, LDO28
 	- BUCKn
-		  - valid values for n are 1 to 10.
+		  - valid values for n are:
+			- S2MPS11: 1 to 10
+			- S2MPS14: 1 to 5
 		  - Example: BUCK1, BUCK2, BUCK9
 
 Example:
-- 
1.7.9.5
