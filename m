Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D300C6379F
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 14 Feb 2023 10:47:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232706AbjBNKrX (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 14 Feb 2023 05:47:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232645AbjBNKrT (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 14 Feb 2023 05:47:19 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 800AB26596
        for <linux-samsung-soc@vger.kernel.org>; Tue, 14 Feb 2023 02:46:55 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id m16-20020a05600c3b1000b003dc4050c94aso11199239wms.4
        for <linux-samsung-soc@vger.kernel.org>; Tue, 14 Feb 2023 02:46:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6wXN5oUCLnm2C93hf9UxnZeLddJ4OBVmPryKWY/Xmfg=;
        b=luUXS7knWdNopdDFhg3n0+WWGzOBKLpah9hErnaoGsRXIQae47hwFSjPGJPRTjLPIG
         Bc3M9Uizl2qZ6pgXTnAlOEyMHpQ/vxyMHobcZjhukYpDFzvU9WT+P75DjJKfCtrUlwzE
         gJAmQtpag/K6Uqr46fgpms4w8NJKtDRRntUtO0mi+GBhrCxKfLTXpQJlJFF21RG4PY+B
         Kf9QbRi4mluicb7OF2uYHd680WYdZ9LLI7NqOTIn77FSQ9+1Awl+Xg/A46z9sEGrbVQZ
         LN5r0WAQly2DM0MzI51btKtJvnYtMI09CPiY6++ONCcz+NoqNVl9SuKWPwvdoWh+lYlb
         wrqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6wXN5oUCLnm2C93hf9UxnZeLddJ4OBVmPryKWY/Xmfg=;
        b=Mn1yYtFKSaIdeDJ2Gm/B54nZB/Le96UpYdGuZ3Vg/RSALsNeovz/I96ttu7nQNBtEz
         IDNnZP9ViX6G53sUCE7kGvRVGuSvaar8ST6n/5lMdup8OqqXjnub+8vJfYknLcIwRrXZ
         iz1QMxZ3dnFsEfz/47HQg+1lAo64ZER2DVXu1cYtfpDvDRTw2ZZJRWpwxBDcLoIRgg7R
         2pbRlYJ4zvdS7/LkQUR7laRx9FVVUM5UBrjsqC+ED5uLH779kJeAJ0zacD5IKAqqITw7
         XlE7/nqdLO1vLJmRUkWU3PvTg5s684sxEi35NYpcW191ErDkrRpzaCXIjU2F3zUvGhDi
         AR5g==
X-Gm-Message-State: AO0yUKVz2E2x3HjCXv/8yLR4fasit2BfDg7dtMxv+Maypgen4j6iTmCC
        etOTICrjbMiKbUkJAiNyVMYPIA==
X-Google-Smtp-Source: AK7set9M3e1JfW+D5xPWc3HV6lekr1TOTKgaEb+yWLDRl8lkFgdKQPV8sghYSleDsOw/ONnovsrGpw==
X-Received: by 2002:a05:600c:3d8c:b0:3da:f670:a199 with SMTP id bi12-20020a05600c3d8c00b003daf670a199mr1652853wmb.36.1676371612245;
        Tue, 14 Feb 2023 02:46:52 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id m20-20020a05600c4f5400b003e1f319b87bsm2623719wmq.24.2023.02.14.02.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 02:46:51 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/7] media: dt-bindings: i2c: samsung,s5k6a3: convert to dtschema
Date:   Tue, 14 Feb 2023 11:45:02 +0100
Message-Id: <20230214104508.51955-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230214104508.51955-1-krzysztof.kozlowski@linaro.org>
References: <20230214104508.51955-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Convert the Samsung S5K6A3(YX) raw image sensor bindings to DT schema.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

DTS is being fixed here:
https://lore.kernel.org/all/20230211134731.85957-3-krzysztof.kozlowski@linaro.org/
---
 .../bindings/media/i2c/samsung,s5k6a3.yaml    | 98 +++++++++++++++++++
 .../bindings/media/samsung-s5k6a3.txt         | 33 -------
 2 files changed, 98 insertions(+), 33 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s5k6a3.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/samsung-s5k6a3.txt

diff --git a/Documentation/devicetree/bindings/media/i2c/samsung,s5k6a3.yaml b/Documentation/devicetree/bindings/media/i2c/samsung,s5k6a3.yaml
new file mode 100644
index 000000000000..7e83a94124b5
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/samsung,s5k6a3.yaml
@@ -0,0 +1,98 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/samsung,s5k6a3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S5K6A3(YX) raw image sensor
+
+maintainers:
+  - Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
+
+description:
+  S5K6A3(YX) is a raw image sensor with MIPI CSI-2 and CCP2 image data
+  interfaces and CCI (I2C compatible) control bus.
+
+properties:
+  compatible:
+    const: samsung,s5k6a3
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: extclk
+
+  clock-frequency:
+    default: 24000000
+    description: extclk clock frequency
+
+  gpios:
+    maxItems: 1
+    description: GPIO connected to the RESET pin
+
+  afvdd-supply:
+    description: AF (actuator) voltage supply
+
+  svdda-supply:
+    description: Core voltage supply
+
+  svddio-supply:
+    description: I/O voltage supply
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          data-lanes:
+            items:
+              - const: 1
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+  - gpios
+  - afvdd-supply
+  - svdda-supply
+  - svddio-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        sensor@10 {
+            compatible = "samsung,s5k6a3";
+            reg = <0x10>;
+            clock-frequency = <24000000>;
+            clocks = <&camera 1>;
+            clock-names = "extclk";
+            gpios = <&gpm1 6 GPIO_ACTIVE_LOW>;
+            afvdd-supply = <&ldo19_reg>;
+            svdda-supply = <&cam_io_reg>;
+            svddio-supply = <&ldo19_reg>;
+
+            port {
+                endpoint {
+                    remote-endpoint = <&csis1_ep>;
+                    data-lanes = <1>;
+                };
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/media/samsung-s5k6a3.txt b/Documentation/devicetree/bindings/media/samsung-s5k6a3.txt
deleted file mode 100644
index cce01e82f3e3..000000000000
--- a/Documentation/devicetree/bindings/media/samsung-s5k6a3.txt
+++ /dev/null
@@ -1,33 +0,0 @@
-Samsung S5K6A3(YX) raw image sensor
----------------------------------
-
-S5K6A3(YX) is a raw image sensor with MIPI CSI-2 and CCP2 image data interfaces
-and CCI (I2C compatible) control bus.
-
-Required properties:
-
-- compatible	: "samsung,s5k6a3";
-- reg		: I2C slave address of the sensor;
-- svdda-supply	: core voltage supply;
-- svddio-supply	: I/O voltage supply;
-- afvdd-supply	: AF (actuator) voltage supply;
-- gpios		: specifier of a GPIO connected to the RESET pin;
-- clocks	: should contain list of phandle and clock specifier pairs
-		  according to common clock bindings for the clocks described
-		  in the clock-names property;
-- clock-names	: should contain "extclk" entry for the sensor's EXTCLK clock;
-
-Optional properties:
-
-- clock-frequency : the frequency at which the "extclk" clock should be
-		    configured to operate, in Hz; if this property is not
-		    specified default 24 MHz value will be used.
-
-The common video interfaces bindings (see video-interfaces.txt) should be
-used to specify link to the image data receiver. The S5K6A3(YX) device
-node should contain one 'port' child node with an 'endpoint' subnode.
-
-Following properties are valid for the endpoint node:
-
-- data-lanes : (optional) specifies MIPI CSI-2 data lanes as covered in
-  video-interfaces.txt.  The sensor supports only one data lane.
-- 
2.34.1

