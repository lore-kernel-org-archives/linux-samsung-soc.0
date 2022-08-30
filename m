Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F03CECAAA1
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 30 Aug 2022 18:09:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232226AbiH3SJe (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 30 Aug 2022 14:09:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231928AbiH3SJd (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 30 Aug 2022 14:09:33 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D29E7DF54
        for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Aug 2022 11:09:31 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id z23so9369051ljk.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Aug 2022 11:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=7KlMwSftGItCgKJxWHQ5GZjTJzLdgW+jcQpEYqciYc4=;
        b=pK/oDQ7CoMZf/zNFpOshGLYYgcHCTaEQa7UscX45UN78z+c23pTNRCZZ71n1XED/vE
         wy8gTaUDTFW2C1q3V5abCXi+V8F750wmQdsxui5vVojKq1WXHUu3vvWoHyO5BMhhIzuK
         Z78RvG/BK5Z7mNhfTNtgez7bWX4qqCwH9++U+ewSI0BIsknD3f62v/pQYP6s1EhID3M/
         o+Be2G8YX4JdlINjN+R/duOxPVeDlZgXFxfOuxp55N2H4sBWWWRfEuGeUCVPZ4Su6Tn9
         XPH3Ot4cWip5doW0agH7+Iq6ydq7hE8dHgarOd28H3DxjFzWShlvvnElXcrgZ5wvEstQ
         GPJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=7KlMwSftGItCgKJxWHQ5GZjTJzLdgW+jcQpEYqciYc4=;
        b=Geb6sbEA6Jmqipe78/Z93AFR5xG0haGTLGtn+L2Kf4zWbIye6l68sxDGA12oXLd30E
         GyVLNlTs3w8wTV51h8vL7aINwPeIEW26lmlDsrZJngvNCwAfJlSJfUbVraFzpnOXQ8fk
         5SpuHN8DIhsqwtZ6Tm49BSXrsv4jCpExO8vXn7UklwKTnvYBGlDwMNRs45CJBqKidNTj
         8RlpEcKqdjF/luRC1DBZF+yYrV//2SYH1+ipXKJjMTC6k6oRTJIsHRMcpJKd28LrFf52
         bskHZTJ1JfyVgl2u1Rw6Rh8cK+u7SAKsHRM/ZfNh57ZBcvHo92LoIOoyQiDtDrfd4t0a
         CIVA==
X-Gm-Message-State: ACgBeo2wqDdCk6Xmfgpbt/ShVikxUcEbwEhjvC3D2BCXrrtNmFQ0kK7l
        Wf2fNb7yrAJ54uN2HKF4SGh+G27KgPQy8dk0
X-Google-Smtp-Source: AA6agR5VYOBi9QqZLUTVUp2RhaoIqdnw8GUDEh0Rv2km8tN8UY6OZJCfNgmVM/9CVhmi9OX73tmg3w==
X-Received: by 2002:a2e:9956:0:b0:263:5bc8:c16a with SMTP id r22-20020a2e9956000000b002635bc8c16amr4813642ljj.436.1661882969852;
        Tue, 30 Aug 2022 11:09:29 -0700 (PDT)
Received: from krzk-bin.. (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id b20-20020a056512061400b0049478cc4eb9sm322078lfe.230.2022.08.30.11.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 11:09:29 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Inki Dae <inki.dae@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [RESEND PATCH dt v2] dt-bindings: media: samsung,exynos5250-gsc: convert to dtschema
Date:   Tue, 30 Aug 2022 21:09:27 +0300
Message-Id: <20220830180927.16686-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Convert the Samsung Exynos SoC G-Scaler bindings to DT schema.

Changes done during conversion:
1. A typical (already used) properties like clocks, iommus and
   power-domains.
2. Require clocks, because they are essential for the block to operate.
3. Describe the differences in clocks between the Exynos5250/5420 and
   the Exynos5433 G-Scalers.  This includes the fifth Exynos5433 clock
   "gsd" (GSCL Smart Deck) which was added to the DTS, but not to the
   bindings and Linux driver.  Similarly to Exynos5433 DECON change [1],
   the clock should be used.

[1] https://lore.kernel.org/all/6270db2d-667d-8d6f-9289-be92da486c25@samsung.com/
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Rob,
You already reviewed the patch:
https://lore.kernel.org/all/20220630231643.GA3513958-robh@kernel.org/
however it was not picked up through media, so can you take it?

In case media would pick it up, then:
Reviewed-by: Rob Herring <robh@kernel.org>

Changes since v1:
1. Remove Joonyoung Shim from maintainers (emails bounce).
---
 .../devicetree/bindings/media/exynos5-gsc.txt |  38 ------
 .../media/samsung,exynos5250-gsc.yaml         | 109 ++++++++++++++++++
 2 files changed, 109 insertions(+), 38 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/exynos5-gsc.txt
 create mode 100644 Documentation/devicetree/bindings/media/samsung,exynos5250-gsc.yaml

diff --git a/Documentation/devicetree/bindings/media/exynos5-gsc.txt b/Documentation/devicetree/bindings/media/exynos5-gsc.txt
deleted file mode 100644
index 1872688fa408..000000000000
--- a/Documentation/devicetree/bindings/media/exynos5-gsc.txt
+++ /dev/null
@@ -1,38 +0,0 @@
-* Samsung Exynos5 G-Scaler device
-
-G-Scaler is used for scaling and color space conversion on Exynos5 SoCs.
-
-Required properties:
-- compatible: should be one of
-	      "samsung,exynos5250-gsc"
-	      "samsung,exynos5420-gsc"
-	      "samsung,exynos5433-gsc"
-	      "samsung,exynos5-gsc" (deprecated)
-- reg: should contain G-Scaler physical address location and length.
-- interrupts: should contain G-Scaler interrupt number
-
-Optional properties:
-- samsung,sysreg: handle to syscon used to control the system registers to
-  set writeback input and destination
-
-Example:
-
-gsc_0:  gsc@13e00000 {
-	compatible = "samsung,exynos5250-gsc";
-	reg = <0x13e00000 0x1000>;
-	interrupts = <0 85 0>;
-};
-
-Aliases:
-Each G-Scaler node should have a numbered alias in the aliases node,
-in the form of gscN, N = 0...3. G-Scaler driver uses these aliases
-to retrieve the device IDs using "of_alias_get_id()" call.
-
-Example:
-
-aliases {
-	gsc0 =&gsc_0;
-	gsc1 =&gsc_1;
-	gsc2 =&gsc_2;
-	gsc3 =&gsc_3;
-};
diff --git a/Documentation/devicetree/bindings/media/samsung,exynos5250-gsc.yaml b/Documentation/devicetree/bindings/media/samsung,exynos5250-gsc.yaml
new file mode 100644
index 000000000000..878397830a4d
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/samsung,exynos5250-gsc.yaml
@@ -0,0 +1,109 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/samsung,exynos5250-gsc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung Exynos SoC G-Scaler
+
+maintainers:
+  - Inki Dae <inki.dae@samsung.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
+  - Seung-Woo Kim <sw0312.kim@samsung.com
+
+description:
+  G-Scaler is used for scaling and color space conversion on Samsung Exynos
+  SoCs.
+
+  Each G-Scaler node should have a numbered alias in the aliases node, in the
+  form of gscN, N = 0...3.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - samsung,exynos5250-gsc
+              - samsung,exynos5420-gsc
+          - const: samsung,exynos5-gsc
+      - enum:
+          - samsung,exynos5433-gsc
+      - const: samsung,exynos5-gsc
+        deprecated: True
+
+  clocks:
+    minItems: 1
+    maxItems: 5
+
+  clock-names:
+    minItems: 1
+    maxItems: 5
+
+  interrupts:
+    maxItems: 1
+
+  iommus:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  reg:
+    maxItems: 1
+
+  samsung,sysreg:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Syscon used to control the system registers to set writeback input and destination.
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+  - interrupts
+  - reg
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - samsung,exynos5-gsc
+              - samsung,exynos5250-gsc
+              - samsung,exynos5420-gsc
+    then:
+      properties:
+        clocks:
+          maxItems: 1
+        clock-names:
+          items:
+            - const: gscl
+    else:
+      properties:
+        clocks:
+          minItems: 5
+        clock-names:
+          items:
+            - const: pclk
+            - const: aclk
+            - const: aclk_xiu
+            - const: aclk_gsclbend
+            - const: gsd
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/exynos5250.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    video-scaler@13e00000 {
+        compatible = "samsung,exynos5250-gsc", "samsung,exynos5-gsc";
+        reg = <0x13e00000 0x1000>;
+        interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
+        power-domains = <&pd_gsc>;
+        clocks = <&clock CLK_GSCL0>;
+        clock-names = "gscl";
+        iommus = <&sysmmu_gsc0>;
+    };
-- 
2.34.1

