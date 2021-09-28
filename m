Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40272C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 28 Sep 2021 08:50:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 28F1661139
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 28 Sep 2021 08:50:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239741AbhI1IwS (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 28 Sep 2021 04:52:18 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:48582
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239852AbhI1Iv5 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 28 Sep 2021 04:51:57 -0400
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 7A40740858
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Sep 2021 08:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632819009;
        bh=DYlpmkzuiD+xFishIZvq7/7ZcxNP9Zi3ybA1Mc3jieA=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=sd7FhWiTCKatRdDY6NeoKBvTSjajZZFqw6T76EFEYh4aqcTjPsnb/oandChidjJ19
         MzKlCLNwIOb6S+ghydYDrTaWVTVbIcMZLXudMcRRg/WNF6DT81d6y5QcM/bOzXBhqG
         7ritutvJyfkW5twkUmBSBwJc0G4fBKOYwCeD/5OkbAXT9nqpeYEK7KlVgpV8N/KYQH
         i546J5hqKVTgqAj1VXSThNwoCnHnsXzCOqhZWsPKb4nae3KzG1Dj6c/eEix1hgUZMj
         zL7rfZjL8qi8jagVTsmLe7TOSCW+qoLUH8hoHtzUZX2x/CSnh4CLxv//62NNLZyNjj
         WlwkFwKrC+Bbg==
Received: by mail-lf1-f69.google.com with SMTP id r193-20020a19c1ca000000b003fc8f43caa6so18638582lff.17
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Sep 2021 01:50:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DYlpmkzuiD+xFishIZvq7/7ZcxNP9Zi3ybA1Mc3jieA=;
        b=f/zlrjMKT9Egvkjcwz658c03J9HMQ5snKekoJF5DQ+vmCfvQLFwL6/YF7VcI7Sjc0I
         ugCMGqjWxtnbjz1IxnH22ak0z163wAaYHEo5hUruajy1NCrhq2aG6PaeGAJTBd0UKd0g
         yGzRn5SDgZic5JccrEnAVQ1+oV8iZcytGkMbeRX1A3PP6TVNm9+7Pbn9yvQ57fja+Pyn
         f0MEMSu3itVuli1G5/mdLIViS3dAGj2HKH695qYWmpeFS2z3aCeRz2f3tCpmzjQNmIgM
         RaGG6Bvjm2C5fw5K1WHDAS6eZdxK+ZkYs5dRM1QDjZ5OH25r+mcbT4h0/CuHcIhZm8fO
         81zg==
X-Gm-Message-State: AOAM533c6/uFX8jaMr0IwiVS5ovkwdKuScRMNx8zuteDvP9nKYe8Rt5f
        nkDdLZmVlaI3hyXWDXerRSx+pEdyVG0nee4WX0q7I/23tU9jk3jtOVuFsOTe9cCDuhIzoCguiO8
        eeT//UQYP+JrJzlgekwwKSWJF+tCBLPk8jvarJA1Z/y78az0M
X-Received: by 2002:a05:6512:234d:: with SMTP id p13mr4396027lfu.324.1632819008075;
        Tue, 28 Sep 2021 01:50:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZU3x7gQJq5zyLoY/BjkB+UMtfLP9Dm61UR4J2xLQ3Gy9umSe77fjpziDoHP2I1RNmDK60gw==
X-Received: by 2002:a05:6512:234d:: with SMTP id p13mr4396006lfu.324.1632819007900;
        Tue, 28 Sep 2021 01:50:07 -0700 (PDT)
Received: from localhost.localdomain (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id h13sm1848419lfl.205.2021.09.28.01.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 01:50:07 -0700 (PDT)
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
Subject: [PATCH 08/12] mfd: dt-bindings: samsung,s2mpa01: convert to dtschema
Date:   Tue, 28 Sep 2021 10:49:45 +0200
Message-Id: <20210928084949.27939-9-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210928084949.27939-1-krzysztof.kozlowski@canonical.com>
References: <20210928084949.27939-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Convert the MFD part of Samsung S2MPA01 PMIC to DT schema format.
Previously the bindings were mostly in mfd/samsung,sec-core.txt.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../bindings/mfd/samsung,s2mpa01.yaml         | 91 +++++++++++++++++++
 1 file changed, 91 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/samsung,s2mpa01.yaml

diff --git a/Documentation/devicetree/bindings/mfd/samsung,s2mpa01.yaml b/Documentation/devicetree/bindings/mfd/samsung,s2mpa01.yaml
new file mode 100644
index 000000000000..014e00616c8f
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/samsung,s2mpa01.yaml
@@ -0,0 +1,91 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/samsung,s2mpa01.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S2MPA01 Power Management IC
+
+maintainers:
+  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+
+description: |
+  This is a part of device tree bindings for S2M and S5M family of Power
+  Management IC (PMIC).
+
+  The Samsung S2MPA01 is a Power Management IC which include voltage and
+  current regulators, RTC, clock outputs and other sub-blocks.
+
+properties:
+  compatible:
+    const: samsung,s2mpa01-pmic
+
+  interrupts:
+    maxItems: 1
+
+  reg:
+    maxItems: 1
+
+  regulators:
+    $ref: ../regulator/samsung,s2mpa01.yaml
+    description:
+      List of child nodes that specify the regulators.
+
+  wakeup-source: true
+
+required:
+  - compatible
+  - reg
+  - regulators
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        pmic@66 {
+            compatible = "samsung,s2mpa01-pmic";
+            reg = <0x66>;
+
+            regulators {
+                ldo1_reg: LDO1 {
+                    regulator-name = "VDD_ALIVE";
+                    regulator-min-microvolt = <1000000>;
+                    regulator-max-microvolt = <1000000>;
+                };
+
+                ldo2_reg: LDO2 {
+                    regulator-name = "VDDQ_MMC2";
+                    regulator-min-microvolt = <2800000>;
+                    regulator-max-microvolt = <2800000>;
+                    regulator-always-on;
+                };
+
+                // ...
+
+                buck1_reg: BUCK1 {
+                    regulator-name = "vdd_mif";
+                    regulator-min-microvolt = <950000>;
+                    regulator-max-microvolt = <1350000>;
+                    regulator-always-on;
+                    regulator-boot-on;
+                };
+
+                buck2_reg: BUCK2 {
+                    regulator-name = "vdd_arm";
+                    regulator-min-microvolt = <950000>;
+                    regulator-max-microvolt = <1350000>;
+                    regulator-always-on;
+                    regulator-boot-on;
+                    regulator-ramp-delay = <50000>;
+                };
+
+                // ...
+            };
+        };
+    };
-- 
2.30.2

