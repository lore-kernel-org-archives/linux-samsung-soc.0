Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E77AC43217
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  6 Oct 2021 13:24:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E8F8061131
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  6 Oct 2021 13:24:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238781AbhJFN0X (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 6 Oct 2021 09:26:23 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:52014
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238915AbhJFN0I (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 6 Oct 2021 09:26:08 -0400
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com [209.85.167.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 2B42A3FFE5
        for <linux-samsung-soc@vger.kernel.org>; Wed,  6 Oct 2021 13:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1633526647;
        bh=B1LQlQ7B/5D6Dgl3qfPf6DLDJ9sR5D/GqEBR3sbuvCA=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=jsfFbKMX60jl8QpQQwRUzQjcUegRFgIyCLooYRQNcplrTwJXhQMMibfNLZf6wmaRn
         T2BvhQyCwXGVlEfH53MX5FtP03JljzY1WmAz/IpKP/+Sf+eJ2Lh1hfqrwrJeRtzkPn
         x+YOlQVLYCaSUgWLFtDY30HHpfRBgjAIBLLGzhVeJcuG0UYqpQkJ1EVJPCUP3ehz4b
         Mak33XiNVUH8cZRcDIihTr07Dfli7Vyem5Wg8TClwSTCq1BUewp1Avuk1P8dyIhDWV
         3fTFU+3XH37LCMaz5k5PtzHMIsS9/txdIFMS1CV0GykMHSWVFhtDeixNwrB9j3XOmC
         F+XlC9vEAjAlg==
Received: by mail-lf1-f71.google.com with SMTP id i40-20020a0565123e2800b003f53da59009so1969270lfv.16
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 Oct 2021 06:24:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B1LQlQ7B/5D6Dgl3qfPf6DLDJ9sR5D/GqEBR3sbuvCA=;
        b=L1s3E1qiKxXKr0Bs/pcWv7R65k7D9pKcPW2I+hbNFHGPgtp7QLgFeALo3VaSQ9OhTi
         +IwMjbr9FPKy3B6w4G6bGfOCNIrmy7Q5Ry6GRRnmIdTswcu4vfgfqSQvfyWH9L+ZE1KH
         Xs2bJ47B30cuegkz+IebcY15Vb3SHc9DF6ge0cPknA+G3PhT3YkD8nqCKcWMjhnUuuVq
         XHMDCJ5L5Qc8zFx2G8A0NCvDktHSoP83OQ9i83g7kt+gIJFTJRCLHk9BY/SHNiuO6FBK
         HCJPfkqsqYunOKAHR7W48UhtHI5ENDzTq/OH+UcxJ2f1eieRc442sGY++UFFS7Uxez1y
         vrKA==
X-Gm-Message-State: AOAM5321uroxm/X+ksi0A09HpP0Phxo5kgBq2OKrBAwDDHaRlxJKFHe9
        nMB8b4YOiT8BdMQutfs7QRNRcClTE8XaZ6I+4ynKBWvocMSbNeZng1C3sd5apnXp/fz5SuCx1xG
        z/tFk9FE0uPcjrvsGGAfr9AhNeQ0EI29m2NTv/przDX829J4t
X-Received: by 2002:a05:651c:289:: with SMTP id b9mr29079989ljo.465.1633526646581;
        Wed, 06 Oct 2021 06:24:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzjGnDUmiuOQqsLWleF3DPjUQZQ+zoUaTETMtxV4PHL/vfPb8YsGjZKZ+FazY2lLxLzjB9iYA==
X-Received: by 2002:a05:651c:289:: with SMTP id b9mr29079974ljo.465.1633526646371;
        Wed, 06 Oct 2021 06:24:06 -0700 (PDT)
Received: from localhost.localdomain (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id y12sm2002819lfg.115.2021.10.06.06.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 06:24:06 -0700 (PDT)
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
Cc:     Rob Herring <robh@kernel.org>
Subject: [PATCH v3 05/10] regulator: dt-bindings: samsung,s2mpa01: convert to dtschema
Date:   Wed,  6 Oct 2021 15:23:19 +0200
Message-Id: <20211006132324.76008-6-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211006132324.76008-1-krzysztof.kozlowski@canonical.com>
References: <20211006132324.76008-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Convert the regulators of Samsung S2MPA01 PMIC to DT schema format.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/regulator/samsung,s2mpa01.txt    | 79 -------------------
 .../bindings/regulator/samsung,s2mpa01.yaml   | 62 +++++++++++++++
 2 files changed, 62 insertions(+), 79 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/regulator/samsung,s2mpa01.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/samsung,s2mpa01.yaml

diff --git a/Documentation/devicetree/bindings/regulator/samsung,s2mpa01.txt b/Documentation/devicetree/bindings/regulator/samsung,s2mpa01.txt
deleted file mode 100644
index bae3c7f838cf..000000000000
--- a/Documentation/devicetree/bindings/regulator/samsung,s2mpa01.txt
+++ /dev/null
@@ -1,79 +0,0 @@
-Binding for Samsung S2MPA01 regulator block
-===========================================
-
-This is a part of device tree bindings for S2M family multi-function devices.
-More information can be found in bindings/mfd/sec-core.txt file.
-
-The S2MPA01 device provide buck and LDO regulators.
-
-To register these with regulator framework instantiate under main device node
-a sub-node named "regulators" with more sub-nodes for each regulator using the
-common regulator binding documented in:
- - Documentation/devicetree/bindings/regulator/regulator.txt
-
-
-Names of regulators supported by S2MPA01 device:
-	- LDOn
-		  - valid values for n are 1 to 26
-		  - Example: LDO1, LD02, LDO26
-	- BUCKn
-		  - valid values for n are 1 to 10.
-		  - Example: BUCK1, BUCK2, BUCK9
-Note: The 'n' in LDOn and BUCKn represents the LDO or BUCK number
-as per the datasheet of device.
-
-
-Optional properties of buck regulator nodes under "regulators" sub-node:
- - regulator-ramp-delay: ramp delay in uV/us. May be 6250, 12500
-   (default), 25000, or 50000. May be 0 for disabling the ramp delay on
-   BUCK{1,2,3,4}.
-
-   In the absence of the regulator-ramp-delay property, the default ramp
-   delay will be used.
-
-   Note: Some bucks share the ramp rate setting i.e. same ramp value
-   will be set for a particular group of bucks so provide the same
-   regulator-ramp-delay value for them.
-   Groups sharing ramp rate:
-    - buck{1,6},
-    - buck{2,4},
-    - buck{8,9,10}.
-
-Example:
-
-	s2mpa01_pmic@66 {
-		compatible = "samsung,s2mpa01-pmic";
-		reg = <0x66>;
-
-		regulators {
-			ldo1_reg: LDO1 {
-				regulator-name = "VDD_ALIVE";
-				regulator-min-microvolt = <1000000>;
-				regulator-max-microvolt = <1000000>;
-			};
-
-			ldo2_reg: LDO2 {
-				regulator-name = "VDDQ_MMC2";
-				regulator-min-microvolt = <2800000>;
-				regulator-max-microvolt = <2800000>;
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
diff --git a/Documentation/devicetree/bindings/regulator/samsung,s2mpa01.yaml b/Documentation/devicetree/bindings/regulator/samsung,s2mpa01.yaml
new file mode 100644
index 000000000000..0627dec513da
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/samsung,s2mpa01.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/samsung,s2mpa01.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S2MPA01 Power Management IC regulators
+
+maintainers:
+  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+
+description: |
+  This is a part of device tree bindings for S2M and S5M family of Power
+  Management IC (PMIC).
+
+  The S2MPA01 provides buck and LDO regulators.
+
+  See also Documentation/devicetree/bindings/mfd/samsung,s2mpa01.yaml for
+  additional information and example.
+
+patternProperties:
+  # 26 LDOs
+  "^LDO([1-9]|1[0-9]|2[0-6])$":
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
+    properties:
+      regulator-ramp-delay:
+        enum: [0, 6250, 12500, 25000, 50000]
+        default: 12500
+        description: |
+          May be 0 for disabling the ramp delay on BUCK{1,2,3,4}.
+
+          In the absence of the regulator-ramp-delay property, the default ramp
+          delay will be used.
+
+          Note: Some bucks share the ramp rate setting i.e. same ramp value
+          will be set for a particular group of bucks so provide the same
+          regulator-ramp-delay value for them.
+          Groups sharing ramp rate:
+            * buck{1,6},
+            * buck{2,4},
+            * buck{8,9,10}.
+
+    required:
+      - regulator-name
+
+additionalProperties: false
-- 
2.30.2

