Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAF7DC4332F
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 29 Dec 2021 12:47:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239275AbhL2MrR (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 29 Dec 2021 07:47:17 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:39802
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238908AbhL2MrM (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 29 Dec 2021 07:47:12 -0500
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com [209.85.208.199])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 70EAB3F1AB
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Dec 2021 12:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1640782028;
        bh=OwXVxDUNHiNBsMlyx2vvQ9vqNwzXFDkR9fITbhvv6ps=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=AkPNUFRC/qMdP/VtNo+3+X8ILTEWvLVFzld59dg3MdUx6M27dPfMwXKJAmelt5361
         kYKLJ+AowrmfwOn2YPFWTYo7Z2nT/dY5LbqdxIcjC/DknQG+686xppCtIKlpVluHJs
         SG1XeVtZ40sftUrtTIdW/MONmvXJHllAy0S6hRbS2BPYO5Ab0IFdsHg/aLOccLTrpV
         4p39JgRguqGNInCRyGJaXmlqJatMDIHxeyV2W20+v5zSaqjnmRgbRg64AaS/SWeVyU
         IuQ/cFwerQ8ZQ5FyGgJphHX4FGo67efhTUGvCuNi7e5xdrFFmkt2XVD81Acd394N+0
         iE/JuY8Qcldkg==
Received: by mail-lj1-f199.google.com with SMTP id w17-20020a05651c119100b0022dcdb204b9so3844533ljo.5
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Dec 2021 04:47:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OwXVxDUNHiNBsMlyx2vvQ9vqNwzXFDkR9fITbhvv6ps=;
        b=QFMEU1r1fj/PrZLfGQcRT99CloNw4OtX2LuJ+5GJ0NqxLdoEigKf4beCDDMF4DefP3
         V2CmRO65EWqr1SFQjKthWOaKQHGGI/hk2qhuDTi+MW/hI93yym3J9jQR1gLxn1Hb0vSj
         16dA4GZR17xI7RNr9v9JN0j+dw0NZnJiqgO+Tk4HswpVlN7TtCM310S1UfHQjzs8sTbq
         b1Z1hajpwMuxPJFGNUPDta37BlNipqyUm5A0SN4dtIbNEetBD2N2u13W4EeUuL7s4P/0
         ohVSKLYYYPuVY9W8E0kfcMI9Z8Vdjm9cmXLni1LX6UILwAHBM6RZ0InOhScX9tSNW/83
         fGmg==
X-Gm-Message-State: AOAM531kdwyIkIiKtrf8/UxCluFJZu4rnzFndNLZlcb+yvgR1pZF73Zy
        tNCFuWPM9FDVsfG53C3hXX7yxz2gLtkfcX9ESSUcG4MCZzfc09hd7v/r4JOlVqkpxVzWg6un5w3
        u1oiApYEVqIKuPQ2qyAwWO0jlfjG/J/5226Nq5XYMzzZWEA93
X-Received: by 2002:ac2:51bc:: with SMTP id f28mr22837364lfk.222.1640782025668;
        Wed, 29 Dec 2021 04:47:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzxlGSDNuVy9A0zTlQuoOwthlW7pXRr59PjrQaxjdZcO/w8Pf78FJV3HvNi8hIKJtFoMm3G1w==
X-Received: by 2002:ac2:51bc:: with SMTP id f28mr22837340lfk.222.1640782025478;
        Wed, 29 Dec 2021 04:47:05 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id e11sm711158ljn.73.2021.12.29.04.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Dec 2021 04:47:04 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Inki Dae <inki.dae@samsung.com>,
        Jaewon Kim <jaewon02.kim@samsung.com>,
        Beomho Seo <beomho.seo@samsung.com>
Subject: [PATCH 4/5] dt-bindings: mfd: maxim,max77843: add MAX77843 bindings
Date:   Wed, 29 Dec 2021 13:46:30 +0100
Message-Id: <20211229124631.21576-5-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211229124631.21576-1-krzysztof.kozlowski@canonical.com>
References: <20211229124631.21576-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Document the bindings for MAX77843 MFD driver, based on Exynos5433 TM2
devicetree.  These are neither accurate nor finished bindings but at
least allow parsing existing DTS files.

The example DTS was copied from existing DTS
(exynos5433-tm2-common.dtsi), so keep the license as GPL-2.0-only.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../bindings/mfd/maxim,max77843.yaml          | 144 ++++++++++++++++++
 1 file changed, 144 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/maxim,max77843.yaml

diff --git a/Documentation/devicetree/bindings/mfd/maxim,max77843.yaml b/Documentation/devicetree/bindings/mfd/maxim,max77843.yaml
new file mode 100644
index 000000000000..7f3d74f254af
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/maxim,max77843.yaml
@@ -0,0 +1,144 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/maxim,max77843.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Maxim MAX77843 MicroUSB and Companion Power Management IC
+
+maintainers:
+  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+
+description: |
+  This is a part of device tree bindings for Maxim MAX77843 MicroUSB
+  Integrated Circuit (MUIC).
+
+  The Maxim MAX77843 is a MicroUSB and Companion Power Management IC which
+  includes voltage current regulators, charger, fuel-gauge, haptic motor driver
+  and MicroUSB management IC.
+
+properties:
+  compatible:
+    const: maxim,max77843
+
+  interrupts:
+    maxItems: 1
+
+  reg:
+    maxItems: 1
+
+  extcon:
+    $ref: ../extcon/maxim,max77843.yaml
+
+  motor-driver:
+    type: object
+    properties:
+      compatible:
+        const: maxim,max77843-haptic
+
+      haptic-supply:
+        description: Power supply to the haptic motor
+
+      pwms:
+        maxItems: 1
+
+    required:
+      - compatible
+      - haptic-supply
+      - pwms
+
+  regulators:
+    $ref: ../regulator/maxim,max77843.yaml
+
+required:
+  - compatible
+  - interrupts
+  - reg
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
+            compatible = "maxim,max77843";
+            interrupt-parent = <&gpa1>;
+            interrupts = <5 IRQ_TYPE_EDGE_FALLING>;
+            reg = <0x66>;
+
+            extcon {
+                compatible = "maxim,max77843-muic";
+
+                connector {
+                    compatible = "samsung,usb-connector-11pin",
+                                 "usb-b-connector";
+                    label = "micro-USB";
+                    type = "micro";
+
+                    ports {
+                        #address-cells = <1>;
+                        #size-cells = <0>;
+
+                        port@0 {
+                            /*
+                             * TODO: The DTS this is based on does not have
+                             * port@0 which is a required property. The ports
+                             * look incomplete and need fixing.
+                             * Add a disabled port just to satisfy dtschema.
+                             */
+                            reg = <0>;
+                            status = "disabled";
+                        };
+
+                        port@3 {
+                            reg = <3>;
+                            endpoint {
+                                remote-endpoint = <&mhl_to_musb_con>;
+                            };
+                        };
+                    };
+                };
+
+                ports {
+                    port {
+                        endpoint {
+                            remote-endpoint = <&usb_to_muic>;
+                        };
+                    };
+                };
+            };
+
+            regulators {
+                compatible = "maxim,max77843-regulator";
+
+                SAFEOUT1 {
+                    regulator-name = "SAFEOUT1";
+                    regulator-min-microvolt = <3300000>;
+                    regulator-max-microvolt = <4950000>;
+                };
+
+                SAFEOUT2 {
+                    regulator-name = "SAFEOUT2";
+                    regulator-min-microvolt = <3300000>;
+                    regulator-max-microvolt = <4950000>;
+                };
+
+                CHARGER {
+                    regulator-name = "CHARGER";
+                    regulator-min-microamp = <100000>;
+                    regulator-max-microamp = <3150000>;
+                };
+            };
+
+            motor-driver {
+                compatible = "maxim,max77843-haptic";
+                haptic-supply = <&ldo38_reg>;
+                pwms = <&pwm 0 33670 0>;
+            };
+        };
+    };
-- 
2.32.0

