Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 148A2C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  8 Oct 2021 11:43:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EE47B60F57
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  8 Oct 2021 11:43:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241031AbhJHLoy (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 8 Oct 2021 07:44:54 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:47494
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241803AbhJHLmH (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 8 Oct 2021 07:42:07 -0400
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id C20C33FFEF
        for <linux-samsung-soc@vger.kernel.org>; Fri,  8 Oct 2021 11:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1633693207;
        bh=phCSw5kxExg8gioSpHB+wngrq+jBT0Kz7+SB/4iyLt8=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=QjerPsuD1CpeLJpG9Rkjwtmtkb/UHt6DdhmDIbitTjXj+Mo+4k0Xk4K+q0OV5Y1xC
         xm1iAawXpaqUU26cobtCpm6IhGEeNnM6SuWFJ07MU0T5p+PIUcNT1NB1Ttf7TPjdXh
         iAkoLgZI+zezZJlGQx2dl+hT3Kr+WYhHJbAhZFGSvXMiNH9ywF2UEr99AVbKr8mAhZ
         qjZOWVMrzRlpyzMipCC3M3g4AiMKGitBpPcqTEHda7bgmKvqHuMg7byl3DoNzkqtXm
         ih3Zn0f5WxGmmSFMCbBhC9WdVapOCghBshJ6PtfjqXkCPurlOUUs5YABkVTDHH2/pz
         QiOUIfLkPzrPg==
Received: by mail-ed1-f72.google.com with SMTP id x5-20020a50f185000000b003db0f796903so8900930edl.18
        for <linux-samsung-soc@vger.kernel.org>; Fri, 08 Oct 2021 04:40:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=phCSw5kxExg8gioSpHB+wngrq+jBT0Kz7+SB/4iyLt8=;
        b=FuJdXdgTazjMIsfMtDnrjhDwIMcPpkK6tbnXALD52e80vUhB1MF0OFTf+fr+GY3qww
         ksPvpYsXEAVpJxUnELLUkHNnDd/Pkj80dI50j/YT67QWHBUAe3ubrPSzy2MaduOIh43d
         gwlDH9XkAPh7I7Y4K+gK8GXafFC2ZnjROXsK6o6zvKyFf+6KSB+BXRRkcEkNsWjESLM/
         J2kvolChB8ee3noN+VN5oKJVuT3KdT5Awt5HYzNKDlWMp1dHJyWgtwaanmmwMs/UrllY
         ovTRnQdvGnwtTV6FbYDR9cSSE5lteb/M2CBkX/rtwRxbUPP55FW/0qTSj2Is+k7k56dP
         PZug==
X-Gm-Message-State: AOAM530dPR3Vh1ijVhvtDX1WmX9gybfJZpnRqLt6vl5auyIgBKtG/5se
        YvrLYbybujn+ZfJImq0ofG+8KCHDWcjx2E9epvsekFVJr1MuJobS2J5nJ5vqPrkCq6HM9dTzxlQ
        XBsUA1jm8C8Flsh7Ww/+VEduwWcnrs4vd6HhPW6nbgPem8kCL
X-Received: by 2002:a17:906:ce25:: with SMTP id sd5mr2060557ejb.398.1633693207183;
        Fri, 08 Oct 2021 04:40:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwjmBMRe5dusDzDWdeybqFAP2p4bJKuoJO1MbaP0Wf2d/EeDSDH1EOvWJ1WMv1k1yjFSY8Xzg==
X-Received: by 2002:a17:906:ce25:: with SMTP id sd5mr2060528ejb.398.1633693206877;
        Fri, 08 Oct 2021 04:40:06 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-186-13.adslplus.ch. [188.155.186.13])
        by smtp.gmail.com with ESMTPSA id c17sm901437edu.11.2021.10.08.04.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 04:40:06 -0700 (PDT)
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
Subject: [PATCH v4 04/10] regulator: dt-bindings: samsung,s2m: convert to dtschema
Date:   Fri,  8 Oct 2021 13:39:26 +0200
Message-Id: <20211008113931.134847-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211008113723.134648-1-krzysztof.kozlowski@canonical.com>
References: <20211008113723.134648-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Convert the regulators of Samsung
S2MPS11/S2MPS13/S2MPS14/S2MPS15/S2MPU02 family of PMICs to DT schema
format.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/regulator/samsung,s2mps11.txt    | 102 ------------------
 .../bindings/regulator/samsung,s2mps11.yaml   |  44 ++++++++
 .../bindings/regulator/samsung,s2mps13.yaml   |  44 ++++++++
 .../bindings/regulator/samsung,s2mps14.yaml   |  44 ++++++++
 .../bindings/regulator/samsung,s2mps15.yaml   |  44 ++++++++
 .../bindings/regulator/samsung,s2mpu02.yaml   |  44 ++++++++
 MAINTAINERS                                   |   2 +-
 7 files changed, 221 insertions(+), 103 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/regulator/samsung,s2mps11.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/samsung,s2mps11.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/samsung,s2mps13.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/samsung,s2mps14.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/samsung,s2mps15.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/samsung,s2mpu02.yaml

diff --git a/Documentation/devicetree/bindings/regulator/samsung,s2mps11.txt b/Documentation/devicetree/bindings/regulator/samsung,s2mps11.txt
deleted file mode 100644
index 27a48bf1b185..000000000000
--- a/Documentation/devicetree/bindings/regulator/samsung,s2mps11.txt
+++ /dev/null
@@ -1,102 +0,0 @@
-Binding for Samsung S2M family regulator block
-==============================================
-
-This is a part of device tree bindings for S2M family multi-function devices.
-More information can be found in bindings/mfd/sec-core.txt file.
-
-The S2MPS11/13/14/15 and S2MPU02 devices provide buck and LDO regulators.
-
-To register these with regulator framework instantiate under main device node
-a sub-node named "regulators" with more sub-nodes for each regulator using the
-common regulator binding documented in:
- - Documentation/devicetree/bindings/regulator/regulator.txt
-
-
-Names of regulators supported by different devices:
-	- LDOn
-		  - valid values for n are:
-			- S2MPS11: 1 to 38
-			- S2MPS13: 1 to 40
-			- S2MPS14: 1 to 25
-			- S2MPS15: 1 to 27
-			- S2MPU02: 1 to 28
-		  - Example: LDO1, LDO2, LDO28
-	- BUCKn
-		  - valid values for n are:
-			- S2MPS11: 1 to 10
-			- S2MPS13: 1 to 10
-			- S2MPS14: 1 to 5
-			- S2MPS15: 1 to 10
-			- S2MPU02: 1 to 7
-		  - Example: BUCK1, BUCK2, BUCK9
-Note: The 'n' in LDOn and BUCKn represents the LDO or BUCK number
-as per the datasheet of device.
-
-
-Optional properties of the nodes under "regulators" sub-node:
- - regulator-ramp-delay: ramp delay in uV/us. May be 6250, 12500,
-   25000 (default) or 50000.
-
-   Additionally S2MPS11 supports disabling ramp delay for BUCK{2,3,4,6}
-   by setting it to <0>.
-
-   Note: On S2MPS11 some bucks share the ramp rate setting i.e. same ramp value
-   will be set for a particular group of bucks so provide the same
-   regulator-ramp-delay value for them.
-   Groups sharing ramp rate:
-    - buck{1,6},
-    - buck{3,4},
-    - buck{7,8,10}.
-
- - samsung,ext-control-gpios: On S2MPS14 the LDO10, LDO11 and LDO12 can be
-   configured to external control over GPIO. To turn this feature on this
-   property must be added to the regulator sub-node:
-    - samsung,ext-control-gpios: GPIO specifier for one GPIO
-                                 controlling this regulator (enable/disable)
-  Example:
-	LDO12 {
-		regulator-name = "V_EMMC_2.8V";
-		regulator-min-microvolt = <2800000>;
-		regulator-max-microvolt = <2800000>;
-		samsung,ext-control-gpios = <&gpk0 2 0>;
-	};
-
-
-Example:
-
-	s2mps11_pmic@66 {
-		compatible = "samsung,s2mps11-pmic";
-		reg = <0x66>;
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
diff --git a/Documentation/devicetree/bindings/regulator/samsung,s2mps11.yaml b/Documentation/devicetree/bindings/regulator/samsung,s2mps11.yaml
new file mode 100644
index 000000000000..e3b780715f44
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/samsung,s2mps11.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/samsung,s2mps11.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S2MPS11 Power Management IC regulators
+
+maintainers:
+  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+
+description: |
+  This is a part of device tree bindings for S2M and S5M family of Power
+  Management IC (PMIC).
+
+  The S2MPS11 provides buck and LDO regulators.
+
+  See also Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml for
+  additional information and example.
+
+patternProperties:
+  # 38 LDOs
+  "^LDO([1-9]|[1-2][0-9]|3[0-8])$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    description:
+      Properties for single LDO regulator.
+
+    required:
+      - regulator-name
+
+  # 10 bucks
+  "^BUCK([1-9]|10)$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    description:
+      Properties for single BUCK regulator.
+
+    required:
+      - regulator-name
+
+additionalProperties: false
diff --git a/Documentation/devicetree/bindings/regulator/samsung,s2mps13.yaml b/Documentation/devicetree/bindings/regulator/samsung,s2mps13.yaml
new file mode 100644
index 000000000000..579d77aefc3f
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/samsung,s2mps13.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/samsung,s2mps13.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S2MPS13 Power Management IC regulators
+
+maintainers:
+  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+
+description: |
+  This is a part of device tree bindings for S2M and S5M family of Power
+  Management IC (PMIC).
+
+  The S2MPS13 provides buck and LDO regulators.
+
+  See also Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml for
+  additional information and example.
+
+patternProperties:
+  # 40 LDOs
+  "^LDO([1-9]|[1-3][0-9]|40)$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    description:
+      Properties for single LDO regulator.
+
+    required:
+      - regulator-name
+
+  # 10 bucks
+  "^BUCK([1-9]|10)$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    description:
+      Properties for single BUCK regulator.
+
+    required:
+      - regulator-name
+
+additionalProperties: false
diff --git a/Documentation/devicetree/bindings/regulator/samsung,s2mps14.yaml b/Documentation/devicetree/bindings/regulator/samsung,s2mps14.yaml
new file mode 100644
index 000000000000..fdea290b3e94
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/samsung,s2mps14.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/samsung,s2mps14.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S2MPS14 Power Management IC regulators
+
+maintainers:
+  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+
+description: |
+  This is a part of device tree bindings for S2M and S5M family of Power
+  Management IC (PMIC).
+
+  The S2MPS14 provides buck and LDO regulators.
+
+  See also Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml for
+  additional information and example.
+
+patternProperties:
+  # 25 LDOs
+  "^LDO([1-9]|[1][0-9]|2[0-5])$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    description:
+      Properties for single LDO regulator.
+
+    required:
+      - regulator-name
+
+  # 5 bucks
+  "^BUCK[1-5]$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    description:
+      Properties for single BUCK regulator.
+
+    required:
+      - regulator-name
+
+additionalProperties: false
diff --git a/Documentation/devicetree/bindings/regulator/samsung,s2mps15.yaml b/Documentation/devicetree/bindings/regulator/samsung,s2mps15.yaml
new file mode 100644
index 000000000000..b3a883c94628
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/samsung,s2mps15.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/samsung,s2mps15.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S2MPS15 Power Management IC regulators
+
+maintainers:
+  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+
+description: |
+  This is a part of device tree bindings for S2M and S5M family of Power
+  Management IC (PMIC).
+
+  The S2MPS15 provides buck and LDO regulators.
+
+  See also Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml for
+  additional information and example.
+
+patternProperties:
+  # 27 LDOs
+  "^LDO([1-9]|[1][0-9]|2[0-7])$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    description:
+      Properties for single LDO regulator.
+
+    required:
+      - regulator-name
+
+  # 10 bucks
+  "^BUCK([1-9]|10)$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    description:
+      Properties for single BUCK regulator.
+
+    required:
+      - regulator-name
+
+additionalProperties: false
diff --git a/Documentation/devicetree/bindings/regulator/samsung,s2mpu02.yaml b/Documentation/devicetree/bindings/regulator/samsung,s2mpu02.yaml
new file mode 100644
index 000000000000..0ded6953e3b6
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/samsung,s2mpu02.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/samsung,s2mpu02.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S2MPU02 Power Management IC regulators
+
+maintainers:
+  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+
+description: |
+  This is a part of device tree bindings for S2M and S5M family of Power
+  Management IC (PMIC).
+
+  The S2MPU02 provides buck and LDO regulators.
+
+  See also Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml for
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
+    required:
+      - regulator-name
+
+  # 7 bucks
+  "^BUCK[1-7]$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    description:
+      Properties for single BUCK regulator.
+
+    required:
+      - regulator-name
+
+additionalProperties: false
diff --git a/MAINTAINERS b/MAINTAINERS
index d86fd237edee..6d15a483fd3c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16638,7 +16638,7 @@ L:	linux-samsung-soc@vger.kernel.org
 S:	Supported
 F:	Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml
 F:	Documentation/devicetree/bindings/mfd/samsung,sec-core.txt
-F:	Documentation/devicetree/bindings/regulator/samsung,s2m*.txt
+F:	Documentation/devicetree/bindings/regulator/samsung,s2m*.yaml
 F:	Documentation/devicetree/bindings/regulator/samsung,s5m*.txt
 F:	drivers/clk/clk-s2mps11.c
 F:	drivers/mfd/sec*.c
-- 
2.30.2

