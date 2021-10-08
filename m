Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A285C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  8 Oct 2021 11:43:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 13C4060F4B
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  8 Oct 2021 11:43:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242650AbhJHLpX (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 8 Oct 2021 07:45:23 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:47496
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S243309AbhJHLnm (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 8 Oct 2021 07:43:42 -0400
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 47E1240003
        for <linux-samsung-soc@vger.kernel.org>; Fri,  8 Oct 2021 11:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1633693220;
        bh=sO19rw6M+5EyeIJS4t8Wx47RQLw3db6b3KXg3W2uMhI=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=LEuQ3nE74BLgUfF3jDNX9NAWzVVciEWz9sFAiIhtY5u4WeMHBEKWrvaWgdjg7Y6Zg
         6t8mAq8T5hJJ9hN3BL6NJpKpUkHC5HlwF7kAlhnR+WB6IjAfU2fOOKzUuudEyLM8On
         J45uiWPesrSZWBLEqj+rBJutmLUd6GaK5+ySr6TC5UtsbRESCR0RoAGmtB1pKHzbAi
         YuuJJTpSxupC0OqFzN0+dzeTAv6MnVxiSCHosX80+GN2OF+FCxRFWtugYwT/FkSH76
         sUICKpQFLClcSzQfb095aRh4dWzEbVW7PtSwuNaK20ZvWPOwJDFwpU4QOr4/7T54ez
         JafWIgn9pL+QA==
Received: by mail-ed1-f71.google.com with SMTP id t28-20020a508d5c000000b003dad7fc5caeso8905764edt.11
        for <linux-samsung-soc@vger.kernel.org>; Fri, 08 Oct 2021 04:40:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sO19rw6M+5EyeIJS4t8Wx47RQLw3db6b3KXg3W2uMhI=;
        b=3P4gd2MM2pffv6njhHt8FsmEiYViV8gytmiSlPaWRR3jUaywLoUT7jQ8DPTD9jURwh
         Kp1Y2N+NThPnWZGsC4xuLvBAvKMHGGKkhsbfc4SaM/OQfNgoSyl051W+KpRl4X1HjQI9
         YeLmssnBEU5e2772i2MCAI4ztf4aVcDYSMmSKYXmI+VP213xNvpNQXqeiwAaXos8u45O
         MHQV9au1yvpKll6D2ZuHIZYBHCHfhn4N7HRyRctadzRWoXD5Doqcd6eaHyLUcZP2FsO5
         L9JLP7ceJKy4X1eDsfGufe8IOzs+r+9HVVzWdBIkg/4A/D10KVAWjuvTIFQe1hAE217I
         7NwA==
X-Gm-Message-State: AOAM533xyCLCBSWmT2IRce6/qu5+29Y7jPHG35yORWRnhJsn+VD1egqc
        WbxDH92kJ064NR3iNFNyxXi5JPUSiDsVGwDzaGAtDijp7qr2/RKcCmv7OusoNvILsloR9WzcR33
        lhTC9RANq/r+BFlSsNjKNvtxcc8jTLxbiyu+Vl5/QWJv5Rwf+
X-Received: by 2002:a05:6402:1e8c:: with SMTP id f12mr139105edf.71.1633693219750;
        Fri, 08 Oct 2021 04:40:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJziRyxy/SEuWS0KeR8oHdzjv21FCdZ7f3M2Pyqj2cby9xINsHLJE7vwOeLRw11h+dcTb92YZg==
X-Received: by 2002:a05:6402:1e8c:: with SMTP id f12mr139082edf.71.1633693219494;
        Fri, 08 Oct 2021 04:40:19 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-186-13.adslplus.ch. [188.155.186.13])
        by smtp.gmail.com with ESMTPSA id c17sm901437edu.11.2021.10.08.04.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 04:40:19 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v4 09/10] dt-bindings: mfd: samsung,s5m8767: convert to dtschema
Date:   Fri,  8 Oct 2021 13:39:31 +0200
Message-Id: <20211008113931.134847-6-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211008113723.134648-1-krzysztof.kozlowski@canonical.com>
References: <20211008113723.134648-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Convert the MFD part of Samsung S5M8767 PMIC to DT schema format.
Previously the bindings were mostly in mfd/samsung,sec-core.txt.

Since all of bindings for Samsung S2M and S5M family of PMICs were
converted from mfd/samsung,sec-core.txt to respective dtschema file,
remove the former one.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/mfd/samsung,s5m8767.yaml         | 269 ++++++++++++++++++
 .../bindings/mfd/samsung,sec-core.txt         |  86 ------
 MAINTAINERS                                   |   2 +-
 3 files changed, 270 insertions(+), 87 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/samsung,s5m8767.yaml
 delete mode 100644 Documentation/devicetree/bindings/mfd/samsung,sec-core.txt

diff --git a/Documentation/devicetree/bindings/mfd/samsung,s5m8767.yaml b/Documentation/devicetree/bindings/mfd/samsung,s5m8767.yaml
new file mode 100644
index 000000000000..b2529a48c890
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/samsung,s5m8767.yaml
@@ -0,0 +1,269 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/samsung,s5m8767.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S5M8767 Power Management IC
+
+maintainers:
+  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+
+description: |
+  This is a part of device tree bindings for S2M and S5M family of Power
+  Management IC (PMIC).
+
+  The Samsung S5M8767 is a Power Management IC which includes voltage
+  and current regulators, RTC, clock outputs and other sub-blocks.
+
+properties:
+  compatible:
+    const: samsung,s5m8767-pmic
+
+  clocks:
+    $ref: ../clock/samsung,s2mps11.yaml
+    description:
+      Child node describing clock provider.
+
+  interrupts:
+    maxItems: 1
+
+  reg:
+    maxItems: 1
+
+  regulators:
+    $ref: ../regulator/samsung,s5m8767.yaml
+    description:
+      List of child nodes that specify the regulators.
+
+  s5m8767,pmic-buck2-dvs-voltage:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 8
+    maxItems: 8
+    description: |
+      A set of 8 voltage values in micro-volt (uV) units for buck2 when
+      changing voltage using gpio dvs.
+
+  s5m8767,pmic-buck3-dvs-voltage:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 8
+    maxItems: 8
+    description: |
+      A set of 8 voltage values in micro-volt (uV) units for buck3 when
+      changing voltage using gpio dvs.
+
+  s5m8767,pmic-buck4-dvs-voltage:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 8
+    maxItems: 8
+    description: |
+      A set of 8 voltage values in micro-volt (uV) units for buck4 when
+      changing voltage using gpio dvs.
+
+  s5m8767,pmic-buck-ds-gpios:
+    minItems: 3
+    maxItems: 3
+    description: |
+      GPIO specifiers for three host gpio's used for selecting GPIO DVS lines.
+      It is one-to-one mapped to dvs gpio lines.
+
+  s5m8767,pmic-buck2-uses-gpio-dvs:
+    type: boolean
+    description: buck2 can be controlled by gpio dvs.
+
+  s5m8767,pmic-buck3-uses-gpio-dvs:
+    type: boolean
+    description: buck3 can be controlled by gpio dvs.
+
+  s5m8767,pmic-buck4-uses-gpio-dvs:
+    type: boolean
+    description: buck4 can be controlled by gpio dvs.
+
+  s5m8767,pmic-buck-default-dvs-idx:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minimum: 0
+    maximum: 7
+    default: 0
+    description: |
+      Default voltage setting selected from the possible 8 options selectable
+      by the dvs gpios. The value of this property should be between 0 and 7.
+      If not specified or if out of range, the default value of this property
+      is set to 0.
+
+  s5m8767,pmic-buck-dvs-gpios:
+    minItems: 3
+    maxItems: 3
+    description: |
+      GPIO specifiers for three host gpio's used for dvs.
+
+  wakeup-source: true
+
+required:
+  - compatible
+  - reg
+  - regulators
+  - s5m8767,pmic-buck-ds-gpios
+
+dependencies:
+  s5m8767,pmic-buck2-dvs-voltage: [ 's5m8767,pmic-buck-dvs-gpios' ]
+  s5m8767,pmic-buck3-dvs-voltage: [ 's5m8767,pmic-buck-dvs-gpios' ]
+  s5m8767,pmic-buck4-dvs-voltage: [ 's5m8767,pmic-buck-dvs-gpios' ]
+  s5m8767,pmic-buck2-uses-gpio-dvs: [ 's5m8767,pmic-buck-dvs-gpios', 's5m8767,pmic-buck2-dvs-voltage' ]
+  s5m8767,pmic-buck3-uses-gpio-dvs: [ 's5m8767,pmic-buck-dvs-gpios', 's5m8767,pmic-buck3-dvs-voltage' ]
+  s5m8767,pmic-buck4-uses-gpio-dvs: [ 's5m8767,pmic-buck-dvs-gpios', 's5m8767,pmic-buck4-dvs-voltage' ]
+
+additionalProperties: false
+
+allOf:
+  - if:
+      required:
+        - s5m8767,pmic-buck2-uses-gpio-dvs
+    then:
+      properties:
+        s5m8767,pmic-buck3-uses-gpio-dvs: false
+        s5m8767,pmic-buck4-uses-gpio-dvs: false
+
+  - if:
+      required:
+        - s5m8767,pmic-buck3-uses-gpio-dvs
+    then:
+      properties:
+        s5m8767,pmic-buck2-uses-gpio-dvs: false
+        s5m8767,pmic-buck4-uses-gpio-dvs: false
+
+  - if:
+      required:
+        - s5m8767,pmic-buck4-uses-gpio-dvs
+    then:
+      properties:
+        s5m8767,pmic-buck2-uses-gpio-dvs: false
+        s5m8767,pmic-buck3-uses-gpio-dvs: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        pmic@66 {
+            compatible = "samsung,s5m8767-pmic";
+            reg = <0x66>;
+
+            interrupt-parent = <&gpx3>;
+            interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
+            pinctrl-names = "default";
+            pinctrl-0 = <&s5m8767_irq &s5m8767_dvs &s5m8767_ds>;
+            wakeup-source;
+
+            s5m8767,pmic-buck-default-dvs-idx = <3>;
+            s5m8767,pmic-buck2-uses-gpio-dvs;
+
+            s5m8767,pmic-buck-dvs-gpios = <&gpd1 0 GPIO_ACTIVE_LOW>,
+                                          <&gpd1 1 GPIO_ACTIVE_LOW>,
+                                          <&gpd1 2 GPIO_ACTIVE_LOW>;
+
+            s5m8767,pmic-buck-ds-gpios = <&gpx2 3 GPIO_ACTIVE_LOW>,
+                                         <&gpx2 4 GPIO_ACTIVE_LOW>,
+                                         <&gpx2 5 GPIO_ACTIVE_LOW>;
+
+            s5m8767,pmic-buck2-dvs-voltage = <1350000>, <1300000>,
+                                             <1250000>, <1200000>,
+                                             <1150000>, <1100000>,
+                                             <1000000>, <950000>;
+
+            s5m8767,pmic-buck3-dvs-voltage = <1100000>, <1100000>,
+                                             <1100000>, <1100000>,
+                                             <1000000>, <1000000>,
+                                             <1000000>, <1000000>;
+
+            s5m8767,pmic-buck4-dvs-voltage = <1200000>, <1200000>,
+                                             <1200000>, <1200000>,
+                                             <1200000>, <1200000>,
+                                             <1200000>, <1200000>;
+
+            clocks {
+                compatible = "samsung,s5m8767-clk";
+                #clock-cells = <1>;
+                clock-output-names = "en32khz_ap", "en32khz_cp", "en32khz_bt";
+            };
+
+            regulators {
+                LDO1 {
+                    regulator-name = "VDD_ALIVE";
+                    regulator-min-microvolt = <1100000>;
+                    regulator-max-microvolt = <1100000>;
+                    regulator-always-on;
+                    regulator-boot-on;
+                    op_mode = <1>; /* Normal Mode */
+                };
+
+                // ...
+
+                BUCK1 {
+                    regulator-name = "VDD_MIF";
+                    regulator-min-microvolt = <950000>;
+                    regulator-max-microvolt = <1100000>;
+                    regulator-always-on;
+                    regulator-boot-on;
+                    op_mode = <1>; /* Normal Mode */
+                };
+
+                BUCK2 {
+                    regulator-name = "VDD_ARM";
+                    regulator-min-microvolt = <900000>;
+                    regulator-max-microvolt = <1350000>;
+                    regulator-always-on;
+                    regulator-boot-on;
+                    op_mode = <1>; /* Normal Mode */
+                };
+
+                // ...
+            };
+        };
+    };
+
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        pmic@66 {
+            compatible = "samsung,s5m8767-pmic";
+            reg = <0x66>;
+
+            interrupt-parent = <&gpx3>;
+            interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
+            pinctrl-names = "default";
+            pinctrl-0 = <&s5m8767_irq &s5m8767_dvs &s5m8767_ds>;
+            wakeup-source;
+
+            s5m8767,pmic-buck-ds-gpios = <&gpx2 3 GPIO_ACTIVE_LOW>,
+                                         <&gpx2 4 GPIO_ACTIVE_LOW>,
+                                         <&gpx2 5 GPIO_ACTIVE_LOW>;
+
+            clocks {
+                compatible = "samsung,s5m8767-clk";
+                #clock-cells = <1>;
+                clock-output-names = "en32khz_ap", "en32khz_cp", "en32khz_bt";
+            };
+
+            regulators {
+                LDO1 {
+                    regulator-name = "VDD_ALIVE";
+                    regulator-min-microvolt = <1100000>;
+                    regulator-max-microvolt = <1100000>;
+                    regulator-always-on;
+                    regulator-boot-on;
+                    op_mode = <1>; /* Normal Mode */
+                };
+
+                // ...
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/mfd/samsung,sec-core.txt b/Documentation/devicetree/bindings/mfd/samsung,sec-core.txt
deleted file mode 100644
index c68cdd365153..000000000000
--- a/Documentation/devicetree/bindings/mfd/samsung,sec-core.txt
+++ /dev/null
@@ -1,86 +0,0 @@
-Binding for Samsung S2M and S5M family multi-function device
-============================================================
-
-This is a part of device tree bindings for S2M and S5M family multi-function
-devices.
-
-The Samsung S2MPA01, S2MPS11/13/14/15, S2MPU02 and S5M8767 is a family
-of multi-function devices which include voltage and current regulators, RTC,
-charger controller, clock outputs and other sub-blocks. It is interfaced
-to the host controller using an I2C interface. Each sub-block is usually
-addressed by the host system using different I2C slave addresses.
-
-
-This document describes bindings for main device node. Optional sub-blocks
-must be a sub-nodes to it. Bindings for them can be found in:
- - bindings/regulator/samsung,s2mpa01.txt
- - bindings/regulator/samsung,s2mps11.txt
- - bindings/regulator/samsung,s5m8767.txt
- - bindings/clock/samsung,s2mps11.txt
-
-
-Required properties:
- - compatible: Should be one of the following
-	- "samsung,s2mpa01-pmic",
-	- "samsung,s2mps11-pmic",
-	- "samsung,s2mps13-pmic",
-	- "samsung,s2mps14-pmic",
-	- "samsung,s2mps15-pmic",
-	- "samsung,s2mpu02-pmic",
-	- "samsung,s5m8767-pmic".
- - reg: Specifies the I2C slave address of the pmic block. It should be 0x66.
-
-Optional properties:
- - interrupts: Interrupt specifiers for interrupt sources.
- - samsung,s2mps11-wrstbi-ground: Indicates that WRSTBI pin of PMIC is pulled
-   down. When the system is suspended it will always go down thus triggerring
-   unwanted buck warm reset (setting buck voltages to default values).
- - samsung,s2mps11-acokb-ground: Indicates that ACOKB pin of S2MPS11 PMIC is
-   connected to the ground so the PMIC must manually set PWRHOLD bit in CTRL1
-   register to turn off the power. Usually the ACOKB is pulled up to VBATT so
-   when PWRHOLD pin goes low, the rising ACOKB will trigger power off.
-
-Example:
-
-	s2mps11_pmic@66 {
-		compatible = "samsung,s2mps11-pmic";
-		reg = <0x66>;
-
-		s2m_osc: clocks {
-			compatible = "samsung,s2mps11-clk";
-			#clock-cells = <1>;
-			clock-output-names = "xx", "yy", "zz";
-		};
-
-		regulators {
-			ldo1_reg: LDO1 {
-				regulator-name = "VDD_ABB_3.3V";
-				regulator-min-microvolt = <3300000>;
-				regulator-max-microvolt = <3300000>;
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
-				regulator-name = "vdd_mif";
-				regulator-min-microvolt = <950000>;
-				regulator-max-microvolt = <1350000>;
-				regulator-always-on;
-				regulator-boot-on;
-			};
-
-			buck2_reg: BUCK2 {
-				regulator-name = "vdd_arm";
-				regulator-min-microvolt = <950000>;
-				regulator-max-microvolt = <1350000>;
-				regulator-always-on;
-				regulator-boot-on;
-				regulator-ramp-delay = <50000>;
-			};
-		};
-	};
diff --git a/MAINTAINERS b/MAINTAINERS
index dc931242a7f9..e086102e8340 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16638,7 +16638,7 @@ L:	linux-samsung-soc@vger.kernel.org
 S:	Supported
 F:	Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml
 F:	Documentation/devicetree/bindings/mfd/samsung,s2m*.yaml
-F:	Documentation/devicetree/bindings/mfd/samsung,sec-core.txt
+F:	Documentation/devicetree/bindings/mfd/samsung,s5m*.yaml
 F:	Documentation/devicetree/bindings/regulator/samsung,s2m*.yaml
 F:	Documentation/devicetree/bindings/regulator/samsung,s5m*.yaml
 F:	drivers/clk/clk-s2mps11.c
-- 
2.30.2

