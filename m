Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C45FC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  1 Oct 2021 09:41:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 51CD261A81
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  1 Oct 2021 09:41:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353158AbhJAJnj (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 1 Oct 2021 05:43:39 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:57018
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1353162AbhJAJnf (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 1 Oct 2021 05:43:35 -0400
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com [209.85.167.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 9DD2040799
        for <linux-samsung-soc@vger.kernel.org>; Fri,  1 Oct 2021 09:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1633081310;
        bh=gDmftXMeUArh2TCL5iigzgu27m5LXLf7Nkl0/uBbmsg=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=SlaTTXsasJBlrI6LJqCP6pgzBfSxUKgFsKrwMxHwSTOHN0aQMlKrZ31dd7W3d2xL3
         lJT15EB2YNMjo2r1p6U9Fb/7ujRrUY8lICbiLuT0g2BriR+vbB5Pu9/tS0uYZa0DiZ
         AdkGC5nTjOOhbwQg+TELoT/l9KvG3IfcLJY4dBxIekUGr2VwoH+glWkTShWr7spVH3
         skryiq9rEuBDDLveqMhGzE0+urFiMumVpom6Fr3JIYDutkxPgOABzl9jj9nvDXRIjK
         oBC1vgTBnz0YTYWMfzUPfwyDBFkPB5Ep3tQljnSEk6yEluWVns5Yf2jO4tJ1IKkfoc
         QyeCA+DmkaVxg==
Received: by mail-lf1-f70.google.com with SMTP id a28-20020a056512021c00b003f5883dcd4bso8417900lfo.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 01 Oct 2021 02:41:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gDmftXMeUArh2TCL5iigzgu27m5LXLf7Nkl0/uBbmsg=;
        b=RFr09sCkux+BMI/oPAxCGb7ORK4DVJIlXRdgGHiXUfSGUoIu1tj780gP+Czicyebgf
         5jkTImzM9gnUtuKlh37VQEJYfmOjNDCOfcmlT9RXouISLVr6vz1eobb8G/h3u+V3eyLG
         LGnMRjBx9Q8WpYW3fJSFsay6KRqQp7mwdl7kwH9CBi2eUfOjrJJnNQ24LsQA+ezBRvED
         VvMGwv3t/E0rMcZVZepvEaqEb1Fu/h8LnHt61fMI5RDEoED2Ed5JbwYqt1ivWckeTlQ+
         lPrjkoXuwu7IhJm4BjjUQAMNpdqRSwy/P1CP/yx5ebssOpG8GpAnMaw3JU7FExIUSSEF
         BaiA==
X-Gm-Message-State: AOAM533XX3bdGMTraiS5wZ9/I8X6Qur+TV0yqRdz5tnbHTZG/be2bwvy
        xXCPAI+s4PYov/yglTB8QlOwd7/aGMmWhzt3/0rWRbeFsinX5KG557UcpdKcBq0YNEyYOirL7E/
        d2KPK/27L1cYWlb5ndmlSOt0/E8buBStmQuwrVrk077g9QxpA
X-Received: by 2002:a2e:b707:: with SMTP id j7mr10277606ljo.297.1633081309768;
        Fri, 01 Oct 2021 02:41:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyK9Nk/LJqoRUkCncERWUjzz6vPJkoAGgguzFcpWdVVS0aPBAXzWAvbOt2yrm187e8Fsg5TtQ==
X-Received: by 2002:a2e:b707:: with SMTP id j7mr10277573ljo.297.1633081309419;
        Fri, 01 Oct 2021 02:41:49 -0700 (PDT)
Received: from localhost.localdomain ([193.178.187.25])
        by smtp.gmail.com with ESMTPSA id g29sm673784lfj.212.2021.10.01.02.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 02:41:49 -0700 (PDT)
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
Subject: [PATCH v2 04/10] regulator: dt-bindings: samsung,s2m: convert to dtschema
Date:   Fri,  1 Oct 2021 11:41:00 +0200
Message-Id: <20211001094106.52412-5-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211001094106.52412-1-krzysztof.kozlowski@canonical.com>
References: <20211001094106.52412-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Convert the regulators of Samsung
S2MPS11/S2MPS13/S2MPS14/S2MPS15/S2MPU02 family of PMICs to DT schema
format.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../bindings/regulator/samsung,s2mps11.txt    | 102 ------------------
 .../bindings/regulator/samsung,s2mps11.yaml   |  52 +++++++++
 .../bindings/regulator/samsung,s2mps13.yaml   |  52 +++++++++
 .../bindings/regulator/samsung,s2mps14.yaml   |  52 +++++++++
 .../bindings/regulator/samsung,s2mps15.yaml   |  52 +++++++++
 .../bindings/regulator/samsung,s2mpu02.yaml   |  52 +++++++++
 MAINTAINERS                                   |   2 +-
 7 files changed, 261 insertions(+), 103 deletions(-)
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
index 000000000000..44624815c8e6
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/samsung,s2mps11.yaml
@@ -0,0 +1,52 @@
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
+    description:
+      Properties for single LDO regulator.
+
+    properties:
+      regulator-name: true
+
+    required:
+      - regulator-name
+
+    unevaluatedProperties: false
+
+  # 10 bucks
+  "^BUCK([1-9]|10)$":
+    type: object
+    $ref: regulator.yaml#
+    description:
+      Properties for single BUCK regulator.
+
+    properties:
+      regulator-name: true
+
+    required:
+      - regulator-name
+
+    unevaluatedProperties: false
+
+additionalProperties: false
diff --git a/Documentation/devicetree/bindings/regulator/samsung,s2mps13.yaml b/Documentation/devicetree/bindings/regulator/samsung,s2mps13.yaml
new file mode 100644
index 000000000000..6f5cd5cc8482
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/samsung,s2mps13.yaml
@@ -0,0 +1,52 @@
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
+    description:
+      Properties for single LDO regulator.
+
+    properties:
+      regulator-name: true
+
+    required:
+      - regulator-name
+
+    unevaluatedProperties: false
+
+  # 10 bucks
+  "^BUCK([1-9]|10)$":
+    type: object
+    $ref: regulator.yaml#
+    description:
+      Properties for single BUCK regulator.
+
+    properties:
+      regulator-name: true
+
+    required:
+      - regulator-name
+
+    unevaluatedProperties: false
+
+additionalProperties: false
diff --git a/Documentation/devicetree/bindings/regulator/samsung,s2mps14.yaml b/Documentation/devicetree/bindings/regulator/samsung,s2mps14.yaml
new file mode 100644
index 000000000000..227555b69fa1
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/samsung,s2mps14.yaml
@@ -0,0 +1,52 @@
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
+    description:
+      Properties for single LDO regulator.
+
+    properties:
+      regulator-name: true
+
+    required:
+      - regulator-name
+
+    unevaluatedProperties: false
+
+  # 5 bucks
+  "^BUCK[1-5]$":
+    type: object
+    $ref: regulator.yaml#
+    description:
+      Properties for single BUCK regulator.
+
+    properties:
+      regulator-name: true
+
+    required:
+      - regulator-name
+
+    unevaluatedProperties: false
+
+additionalProperties: false
diff --git a/Documentation/devicetree/bindings/regulator/samsung,s2mps15.yaml b/Documentation/devicetree/bindings/regulator/samsung,s2mps15.yaml
new file mode 100644
index 000000000000..f989f9ef999b
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/samsung,s2mps15.yaml
@@ -0,0 +1,52 @@
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
+    description:
+      Properties for single LDO regulator.
+
+    properties:
+      regulator-name: true
+
+    required:
+      - regulator-name
+
+    unevaluatedProperties: false
+
+  # 10 bucks
+  "^BUCK([1-9]|10)$":
+    type: object
+    $ref: regulator.yaml#
+    description:
+      Properties for single BUCK regulator.
+
+    properties:
+      regulator-name: true
+
+    required:
+      - regulator-name
+
+    unevaluatedProperties: false
+
+additionalProperties: false
diff --git a/Documentation/devicetree/bindings/regulator/samsung,s2mpu02.yaml b/Documentation/devicetree/bindings/regulator/samsung,s2mpu02.yaml
new file mode 100644
index 000000000000..2d0c00e3a54a
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/samsung,s2mpu02.yaml
@@ -0,0 +1,52 @@
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
+    description:
+      Properties for single LDO regulator.
+
+    properties:
+      regulator-name: true
+
+    required:
+      - regulator-name
+
+    unevaluatedProperties: false
+
+  # 7 bucks
+  "^BUCK[1-7]$":
+    type: object
+    $ref: regulator.yaml#
+    description:
+      Properties for single BUCK regulator.
+
+    properties:
+      regulator-name: true
+
+    required:
+      - regulator-name
+
+    unevaluatedProperties: false
+
+additionalProperties: false
diff --git a/MAINTAINERS b/MAINTAINERS
index 241fe78a3282..ee486357cf45 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16601,7 +16601,7 @@ L:	linux-samsung-soc@vger.kernel.org
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

