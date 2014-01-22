From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH v2 2/2] regulator: s5m8767: Document new bindings for Buck9
 GPIO control
Date: Wed, 22 Jan 2014 17:07:28 +0100
Message-ID: <1390406848-20964-3-git-send-email-k.kozlowski@samsung.com>
References: <1390406848-20964-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1390406848-20964-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Rob Landley <rob@landley.net>, Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Grant Likely <grant.likely@linaro.org>, Sachin Kamat <sachin.kamat@linaro.org>, Amit Daniel Kachhap <amit.daniel@samsung.com>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Add documentation for new bindings for controlling (enable/disable) the
Buck9 Converter by GPIO (BUCK9EN).

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
---
 .../bindings/regulator/s5m8767-regulator.txt       |   16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/regulator/s5m8767-regulator.txt b/Documentation/devicetree/bindings/regulator/s5m8767-regulator.txt
index fc6b38f035bd..b52ee77dc4c0 100644
--- a/Documentation/devicetree/bindings/regulator/s5m8767-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/s5m8767-regulator.txt
@@ -69,13 +69,18 @@ sub-node should be of the format as listed below.
 		};
 	};
 The above regulator entries are defined in regulator bindings documentation
-except op_mode description.
+except these properties:
 	- op_mode: describes the different operating modes of the LDO's with
 		power mode change in SOC. The different possible values are,
 		0 - always off mode
 		1 - on in normal mode
 		2 - low power mode
 		3 - suspend mode
+	- s5m8767,pmic-ext-control-enable: regulator can be enabled/disabled
+		by GPIO (valid only for buck9).
+	- s5m8767,pmic-ext-control-gpio: GPIO specifier for one GPIO
+		controlling this regulator (valid only for buck9).
+		This property is required when 's5m8767,pmic-ext-control-enable' is specified.
 
 The following are the names of the regulators that the s5m8767 pmic block
 supports. Note: The 'n' in LDOn and BUCKn represents the LDO or BUCK number
@@ -148,5 +153,14 @@ Example:
 				regulator-always-on;
 				regulator-boot-on;
 			};
+
+			vemmc_reg: BUCK9 {
+				regulator-name = "VMEM_VDD_2.8V";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+				op_mode = <3>; /* Standby Mode */
+				s5m8767,pmic-ext-control-enable;
+				s5m8767,pmic-ext-control-gpio = <&gpk0 2 0>;
+			};
 		};
 	};
-- 
1.7.9.5
