From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH v3 2/2] regulator: s5m8767: Document new binding for Buck9 GPIO
 control
Date: Fri, 24 Jan 2014 14:37:58 +0100
Message-ID: <1390570678-30686-3-git-send-email-k.kozlowski@samsung.com>
References: <1390570678-30686-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1390570678-30686-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Sachin Kamat <sachin.kamat@linaro.org>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Add documentation for new binding for controlling (enable/disable) the
Buck9 Converter by GPIO (BUCK9EN).

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
---
 .../bindings/regulator/s5m8767-regulator.txt       |   13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/regulator/s5m8767-regulator.txt b/Documentation/devicetree/bindings/regulator/s5m8767-regulator.txt
index fc6b38f035bd..d290988ed975 100644
--- a/Documentation/devicetree/bindings/regulator/s5m8767-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/s5m8767-regulator.txt
@@ -69,13 +69,16 @@ sub-node should be of the format as listed below.
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
+	- s5m8767,pmic-ext-control-gpios: (optional) GPIO specifier for one
+		GPIO controlling this regulator (enable/disable); This is
+		valid only for buck9.
 
 The following are the names of the regulators that the s5m8767 pmic block
 supports. Note: The 'n' in LDOn and BUCKn represents the LDO or BUCK number
@@ -148,5 +151,13 @@ Example:
 				regulator-always-on;
 				regulator-boot-on;
 			};
+
+			vemmc_reg: BUCK9 {
+				regulator-name = "VMEM_VDD_2.8V";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+				op_mode = <3>; /* Standby Mode */
+				s5m8767,pmic-ext-control-gpios = <&gpk0 2 0>;
+			};
 		};
 	};
-- 
1.7.9.5
