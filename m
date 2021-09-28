Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9269C43217
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 28 Sep 2021 08:50:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9619B61209
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 28 Sep 2021 08:50:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239751AbhI1Ivw (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 28 Sep 2021 04:51:52 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:53290
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239752AbhI1Ivn (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 28 Sep 2021 04:51:43 -0400
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com [209.85.167.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 57935402FB
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Sep 2021 08:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632819003;
        bh=lj4azQtYX3DGEOpII1IdEZQABvMEYqNjVucE7+lmBtg=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=Bm3kKwrGc6P52opvqoXa5XLdpy4ygj/CwpD3UuuGYJjPRcR5rTgTcQCk/vkvek6+P
         89kJvxJoZmK/3PgZAJXcGwNI3F1c4ZrzsQg3ixjG6rxlZgL2iZdPKdGrEmA6JmyY7/
         gIaEx1Q9YhWvIP8DMksopeAwaCXzcuM4YkiDbvnmF0KChbetNizsU9lcDxvGsgdOYj
         InHRKcDDqRNhygk5XVTzug4Zpgx9nhf2KlzHLEuIyciQM5kN/5gNC3cNj6NMAG3Onz
         rxowAAffTQFa8ND7ZTLmcQ5SMLClPyfMIGRyG+9HN1OU5eA6h7FWDkuL29Mv6+jk1i
         KhHQluXEDvDIQ==
Received: by mail-lf1-f70.google.com with SMTP id c6-20020a05651200c600b003fc6d39efa4so18657249lfp.12
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Sep 2021 01:50:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lj4azQtYX3DGEOpII1IdEZQABvMEYqNjVucE7+lmBtg=;
        b=Y8ID/kU6tYR6yCkx/UXcQASuGTYJPSoOkz0VWTtTVDUA9Apj3W4Uf4z/xD0MuJ2uS5
         HY132cOWtyYSrY99omTDWYL4DJtoy6aqLAlfHX1/6fVEOFe5qGYAFHjdcDu4u9klRdqE
         NKeB94eRsaoHFrg045UtGN/vidL/MTvKeDzQTFm8uruCeuoKfJ43B1I4Do4o+pg7D+7s
         bRWG7i7z1j6nQaE0mc8emL79h2ukmHwm4VvqcGKZ/MX/+LxPrRjf/fOasOqYVXEmt2+C
         Ixs7ypwW5+XjUwarJcxAGfmRq+xt3mPeQWEYSArrkB6na+uj6pHNvWbQSp72h6qkEm9S
         7jjw==
X-Gm-Message-State: AOAM532H7EWS1GXQIUngNAw2VOf0H1HdWNyg5r/TFFvyo82U+8TZ8CHh
        B8XvbcF9Hshd4o5LDw9/M15TCkNKaj5YC/2a9m7IgqRkClGRk/a2HXeGB38oqn/Q6DlKm2IDBvs
        s9KbQWiMLFoqSJt5opK71aWpcRE9NJXD9W/OpDYF6WJPQautS
X-Received: by 2002:a05:651c:160a:: with SMTP id f10mr4851372ljq.196.1632819002527;
        Tue, 28 Sep 2021 01:50:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJCoPkHLpKxy5FxvXM5fyxfBJlKTCCt4dVgu6YniIMFpxvcFyT6WGQeh9ZgMLAFGo+WPoAFg==
X-Received: by 2002:a05:651c:160a:: with SMTP id f10mr4851337ljq.196.1632819002184;
        Tue, 28 Sep 2021 01:50:02 -0700 (PDT)
Received: from localhost.localdomain (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id h13sm1848419lfl.205.2021.09.28.01.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 01:50:01 -0700 (PDT)
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
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>
Subject: [PATCH 04/12] regulator: dt-bindings: samsung,s2m: convert to dtschema
Date:   Tue, 28 Sep 2021 10:49:41 +0200
Message-Id: <20210928084949.27939-5-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210928084949.27939-1-krzysztof.kozlowski@canonical.com>
References: <20210928084949.27939-1-krzysztof.kozlowski@canonical.com>
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
index 000000000000..18e1229f7dac
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
+  The S2MPS11 provide buck and LDO regulators.
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
index 000000000000..f0505e225026
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
+  The S2MPS13 provide buck and LDO regulators.
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
index 000000000000..74b2d6b950de
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
+  The S2MPS14 provide buck and LDO regulators.
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
index 000000000000..527ab1e8b4cd
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
+  The S2MPS15 provide buck and LDO regulators.
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
index 000000000000..8fb399561197
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
+  The S2MPU02 provide buck and LDO regulators.
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

