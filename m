Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47BB8C4167D
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  6 Oct 2021 13:25:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 36A5E6113A
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  6 Oct 2021 13:25:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238635AbhJFN0v (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 6 Oct 2021 09:26:51 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:52024
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238994AbhJFN0X (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 6 Oct 2021 09:26:23 -0400
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 3FD5E3FFF9
        for <linux-samsung-soc@vger.kernel.org>; Wed,  6 Oct 2021 13:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1633526649;
        bh=QpNJdFM+qjdBW2F0GbInLf7cdU2ofsJ83zrGD5vXtQA=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=ZTqYsj3wWtksiyRnWtAQHa3bxum3RkqBwNwOQcMO1aPhhoKGc8Io3U68wh8g4QWf8
         /IlbkIbtWTthunOrT7BpkDMHsM55uFG6Ymm3Skv+VfHh5pjQL/H8Ij3s2oNLg5oHnE
         QKPXSax027TDGMJZJGTsnc7b4SAf43h3Ux4ImtDj8sOmlWeib0B+QUUX9XojpnaD++
         TZt7AIf1K3NZR5x/jNArJE9wL0kAbUPJ/WiZw35koFzkYqupo7d1c8o77rnCFQY6CT
         KyQ6nvzo4jkW5HQvfhvhBb/j8L2yc3+k/qzZvDbMNsnfOj6g8fhEmKIr71vP/ES4oV
         4JxwDTVqqOoMA==
Received: by mail-lf1-f69.google.com with SMTP id v2-20020ac25582000000b003fd1c161a31so1956196lfg.15
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 Oct 2021 06:24:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QpNJdFM+qjdBW2F0GbInLf7cdU2ofsJ83zrGD5vXtQA=;
        b=hMJvwSIZg4WS91ghrsGgPD2lkqP4weD9CbpGrP+IYB6H0Boe9kDiJApoYkz1EvQhnI
         QY00ixsE4OWg6JDOfM86LtH+rvG04s6hNoRO8YC6jqzn9pROHwY/Ha2wwjmonX9r3S87
         wt2H2bTuVP+oKR5ouRN9rykjG/2dIwRGbizW9wNyhDHnNIN9KNT/eVl3oNO6v/8tYWyV
         dWf215fHyg/VUj/0y9OJvFXRrUmaS2vEtpgX61yeYWfViFJtDmig2bdkGmiMEOY+u+1B
         EYP240rXVjcc+E/eDZ00gZbRH/zxBzUjeiKj1z5YQcOU1AgQa/mVf9vG5RwVBAV/QDNI
         KZnw==
X-Gm-Message-State: AOAM5306kJyuL+dbxmc4y3nGXaT9CAYz4Dyia1Vh5WRmBWpdxMfJ4kpH
        Td9IPROHSK9L8Vs4Z06pMRGjZqajC6OUd+GU0JjfSpW4z5a2YQ8Bjkdmg1QB4Kj6waDFmniXgEk
        7RpyU1iq0ANqAqTK2t+yC7OjBiaeXpTAMqxK2Mr2S5K7RVG6d
X-Received: by 2002:a2e:5450:: with SMTP id y16mr28980195ljd.21.1633526648004;
        Wed, 06 Oct 2021 06:24:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyQPr0iXNjBl6KfKodSi+rIIzVmCXjlGtzdwPSVzkPL6BU8Rs0lDfykngjZGgecDaaSTSHA9w==
X-Received: by 2002:a2e:5450:: with SMTP id y16mr28980151ljd.21.1633526647702;
        Wed, 06 Oct 2021 06:24:07 -0700 (PDT)
Received: from localhost.localdomain (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id y12sm2002819lfg.115.2021.10.06.06.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 06:24:07 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH v3 06/10] regulator: dt-bindings: samsung,s5m8767: convert to dtschema
Date:   Wed,  6 Oct 2021 15:23:20 +0200
Message-Id: <20211006132324.76008-7-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211006132324.76008-1-krzysztof.kozlowski@canonical.com>
References: <20211006132324.76008-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Convert the regulators of Samsung S5M8767 PMIC to DT schema format.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../bindings/regulator/samsung,s5m8767.txt    | 140 ------------------
 .../bindings/regulator/samsung,s5m8767.yaml   |  74 +++++++++
 MAINTAINERS                                   |   2 +-
 3 files changed, 75 insertions(+), 141 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/regulator/samsung,s5m8767.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/samsung,s5m8767.yaml

diff --git a/Documentation/devicetree/bindings/regulator/samsung,s5m8767.txt b/Documentation/devicetree/bindings/regulator/samsung,s5m8767.txt
deleted file mode 100644
index 6cd83d920155..000000000000
--- a/Documentation/devicetree/bindings/regulator/samsung,s5m8767.txt
+++ /dev/null
@@ -1,140 +0,0 @@
-Binding for Samsung S5M8767 regulator block
-===========================================
-
-This is a part of device tree bindings for S5M family multi-function devices.
-More information can be found in bindings/mfd/sec-core.txt file.
-
-The S5M8767 device provide buck and LDO regulators.
-
-To register these with regulator framework instantiate under main device node
-a sub-node named "regulators" with more sub-nodes for each regulator using the
-common regulator binding documented in:
- - Documentation/devicetree/bindings/regulator/regulator.txt
-
-
-Required properties of the main device node (the parent!):
- - s5m8767,pmic-buck-ds-gpios: GPIO specifiers for three host gpio's used
-   for selecting GPIO DVS lines. It is one-to-one mapped to dvs gpio lines.
-
- [1] If either of the 's5m8767,pmic-buck[2/3/4]-uses-gpio-dvs' optional
-     property is specified, then all the eight voltage values for the
-     's5m8767,pmic-buck[2/3/4]-dvs-voltage' should be specified.
-
-Optional properties of the main device node (the parent!):
- - s5m8767,pmic-buck2-dvs-voltage: A set of 8 voltage values in micro-volt (uV)
-   units for buck2 when changing voltage using gpio dvs. Refer to [1] below
-   for additional information.
-
- - s5m8767,pmic-buck3-dvs-voltage: A set of 8 voltage values in micro-volt (uV)
-   units for buck3 when changing voltage using gpio dvs. Refer to [1] below
-   for additional information.
-
- - s5m8767,pmic-buck4-dvs-voltage: A set of 8 voltage values in micro-volt (uV)
-   units for buck4 when changing voltage using gpio dvs. Refer to [1] below
-   for additional information.
-
- - s5m8767,pmic-buck2-uses-gpio-dvs: 'buck2' can be controlled by gpio dvs.
- - s5m8767,pmic-buck3-uses-gpio-dvs: 'buck3' can be controlled by gpio dvs.
- - s5m8767,pmic-buck4-uses-gpio-dvs: 'buck4' can be controlled by gpio dvs.
-
-Additional properties required if either of the optional properties are used:
-
- - s5m8767,pmic-buck-default-dvs-idx: Default voltage setting selected from
-   the possible 8 options selectable by the dvs gpios. The value of this
-   property should be between 0 and 7. If not specified or if out of range, the
-   default value of this property is set to 0.
-
- - s5m8767,pmic-buck-dvs-gpios: GPIO specifiers for three host gpio's used
-   for dvs. The format of the gpio specifier depends in the gpio controller.
-
-
-Names of regulators supported by S5M8767 device:
-	- LDOn
-		  - valid values for n are 1 to 28
-		  - Example: LDO1, LDO2, LDO28
-	- BUCKn
-		  - valid values for n are 1 to 9.
-		  - Example: BUCK1, BUCK2, BUCK9
-Note: The 'n' in LDOn and BUCKn represents the LDO or BUCK number
-as per the datasheet of device.
-
-
-Optional properties of the nodes under "regulators" sub-node:
- - op_mode: describes the different operating modes of the LDO's with
-            power mode change in SOC. The different possible values are,
-             0 - always off mode
-             1 - on in normal mode
-             2 - low power mode
-             3 - suspend mode
- - s5m8767,pmic-ext-control-gpios: (optional) GPIO specifier for one
-                                   GPIO controlling this regulator
-                                   (enable/disable); This is valid only
-                                   for buck9.
-
-Example:
-
-	s5m8767_pmic@66 {
-		compatible = "samsung,s5m8767-pmic";
-		reg = <0x66>;
-
-		s5m8767,pmic-buck2-uses-gpio-dvs;
-		s5m8767,pmic-buck3-uses-gpio-dvs;
-		s5m8767,pmic-buck4-uses-gpio-dvs;
-
-		s5m8767,pmic-buck-default-dvs-idx = <0>;
-
-		s5m8767,pmic-buck-dvs-gpios = <&gpx0 0 0>, /* DVS1 */
-						 <&gpx0 1 0>, /* DVS2 */
-						 <&gpx0 2 0>; /* DVS3 */
-
-		s5m8767,pmic-buck-ds-gpios = <&gpx2 3 0>, /* SET1 */
-						<&gpx2 4 0>, /* SET2 */
-						<&gpx2 5 0>; /* SET3 */
-
-		s5m8767,pmic-buck2-dvs-voltage = <1350000>, <1300000>,
-						 <1250000>, <1200000>,
-						 <1150000>, <1100000>,
-						 <1000000>, <950000>;
-
-		s5m8767,pmic-buck3-dvs-voltage = <1100000>, <1100000>,
-						 <1100000>, <1100000>,
-						 <1000000>, <1000000>,
-						 <1000000>, <1000000>;
-
-		s5m8767,pmic-buck4-dvs-voltage = <1200000>, <1200000>,
-						 <1200000>, <1200000>,
-						 <1200000>, <1200000>,
-						 <1200000>, <1200000>;
-
-		regulators {
-			ldo1_reg: LDO1 {
-				regulator-name = "VDD_ABB_3.3V";
-				regulator-min-microvolt = <3300000>;
-				regulator-max-microvolt = <3300000>;
-				op_mode = <1>; /* Normal Mode */
-			};
-
-			ldo2_reg: LDO2 {
-				regulator-name = "VDD_ALIVE_1.1V";
-				regulator-min-microvolt = <1100000>;
-				regulator-max-microvolt = <1100000>;
-				regulator-always-on;
-			};
-
-			buck1_reg: BUCK1 {
-				regulator-name = "VDD_MIF_1.2V";
-				regulator-min-microvolt = <950000>;
-				regulator-max-microvolt = <1350000>;
-				regulator-always-on;
-				regulator-boot-on;
-			};
-
-			vemmc_reg: BUCK9 {
-				regulator-name = "VMEM_VDD_2.8V";
-				regulator-min-microvolt = <2800000>;
-				regulator-max-microvolt = <2800000>;
-				op_mode = <3>; /* Standby Mode */
-				s5m8767,pmic-ext-control-gpios = <&gpk0 2 0>;
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/regulator/samsung,s5m8767.yaml b/Documentation/devicetree/bindings/regulator/samsung,s5m8767.yaml
new file mode 100644
index 000000000000..80a63d47790a
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/samsung,s5m8767.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/samsung,s5m8767.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S5M8767 Power Management IC regulators
+
+maintainers:
+  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+
+description: |
+  This is a part of device tree bindings for S2M and S5M family of Power
+  Management IC (PMIC).
+
+  The S5M8767 provides buck and LDO regulators.
+
+  See also Documentation/devicetree/bindings/mfd/samsung,s5m8767.yaml for
+  additional information and example.
+
+patternProperties:
+  # 28 LDOs
+  "^LDO([1-9]|1[0-9]|2[0-8])$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    description:
+      Properties for single LDO regulator.
+
+    properties:
+      op_mode:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [0, 1, 2, 3]
+        default: 1
+        description: |
+          Describes the different operating modes of the LDO's with power mode
+          change in SOC. The different possible values are:
+            0 - always off mode
+            1 - on in normal mode
+            2 - low power mode
+            3 - suspend mode
+
+    required:
+      - regulator-name
+
+  # 8 bucks
+  "^BUCK[1-8]$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    description:
+      Properties for single BUCK regulator.
+
+    required:
+      - regulator-name
+
+  # 9 buck
+  "^BUCK9$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    description:
+      Properties for single BUCK regulator.
+
+    properties:
+      s5m8767,pmic-ext-control-gpios:
+        maxItems: 1
+        description: |
+          GPIO specifier for one GPIO controlling this regulator on/off.
+
+    required:
+      - regulator-name
+
+additionalProperties: false
diff --git a/MAINTAINERS b/MAINTAINERS
index ac83c22c67d6..7967f735b2e7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16602,7 +16602,7 @@ S:	Supported
 F:	Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml
 F:	Documentation/devicetree/bindings/mfd/samsung,sec-core.txt
 F:	Documentation/devicetree/bindings/regulator/samsung,s2m*.yaml
-F:	Documentation/devicetree/bindings/regulator/samsung,s5m*.txt
+F:	Documentation/devicetree/bindings/regulator/samsung,s5m*.yaml
 F:	drivers/clk/clk-s2mps11.c
 F:	drivers/mfd/sec*.c
 F:	drivers/regulator/s2m*.c
-- 
2.30.2

