Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E13E9C54EAA
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 27 Jan 2023 19:58:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232557AbjA0T6H (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 27 Jan 2023 14:58:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233133AbjA0T5i (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 27 Jan 2023 14:57:38 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DDB58CAA0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Jan 2023 11:55:40 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id bp15so9766463lfb.13
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Jan 2023 11:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OTbIA/qsw+iEJ2j+G0MzDhcSxbI2hiwezMO1CX++Hek=;
        b=UiNtolU4E4LMirZ4Bc6hCbF2Jcz5w1QeiV10veN90X6hOIKK6DxgcHncK03SxrGbJm
         /sKRRXKFATHToB6UbvzOI6DakGvCBirwe1kIXq/2TgIYNH6wmNJijrbE9FDSYzHQN6/l
         7OSjUm4C8UrSXDLHi2D2oWYMcrIk8xYxY0Kjfr/y1HOuMlCbtilFiPYiQf9e2y55r7yX
         ghfx0IWmgbsvSZcPtiuvRPp6De5wdvuVrGDXfVqn92uOUfyWQrnB7Q4OcK4TGqN29mUC
         X0URPMHiV9YBbge0/mJIrfUgH6wuXfK3YEUKnmCoyZz0RiHwmlvgPSzbFqCspJwiJQbf
         lj0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OTbIA/qsw+iEJ2j+G0MzDhcSxbI2hiwezMO1CX++Hek=;
        b=yQDhBvQA4FDQ/D9SED5dnITBUi7Fe0QuU1CfrCtq5bLgxQ7dxhNb4NUjTMLznJkvme
         bVKL9aEMzEdJ5f2OEbZco+l3jaitAGDycfQE1CTmxF8zEgvKtucOsksGJukBeQA7uy72
         mpQZXq2GYk70szEIc6Fkp03LWMPSe8RJw6Ibj0bvg4FbjPD8E/u8dH2RAZMsIobwOpvp
         E4a+9bLeHG/gvTdQShpzZXPABkoRDFlFKxnPevBa5o4ZOBz7UY/PROmrAHPG5Hu8I4oV
         pYof8sJDE0iIWYsylohhHd905cbeM4Xlnx6rUULpimzcRjXQljROu3cRjXBC+dO4n+P7
         CnAg==
X-Gm-Message-State: AFqh2kpbd+7P4j/UEW+GFntQwztkSKKt4MDyMN/EsxedDCXBPtoyEpTd
        gIYVkTUt7gFdeIcP9sR05CNMdB3rXfwd3tl4
X-Google-Smtp-Source: AK7set8phgbSxSEwh8u2STG/34e8GAiaEpnPycQ0+6PFVjzYXOkOdLXAox+v4Bj7Ov9boXJSQBqgbw==
X-Received: by 2002:a05:6000:1001:b0:2bf:dafe:43d7 with SMTP id a1-20020a056000100100b002bfdafe43d7mr129204wrx.16.1674848468608;
        Fri, 27 Jan 2023 11:41:08 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id y17-20020adffa51000000b002238ea5750csm5822417wrr.72.2023.01.27.11.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 11:41:08 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Cc:     replicant@osuosl.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        =?UTF-8?q?Martin=20J=C3=BCcker?= <martin.juecker@gmail.com>,
        Henrik Grimler <henrik@grimler.se>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/8] dt-bindings: soc: samsung: exynos-pmu: allow phys as child
Date:   Fri, 27 Jan 2023 20:40:50 +0100
Message-Id: <20230127194057.186458-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230127194057.186458-1-krzysztof.kozlowski@linaro.org>
References: <20230127194057.186458-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The MIPI and DisplayPort phys are actually part of the Power Management
Unit system controller, thus allow them as its children, instead of
specifying as separate device nodes with syscon phandle.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/soc/samsung/exynos-pmu.yaml      | 71 +++++++++++++++----
 1 file changed, 57 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index 13bb8dfcefe6..f7c141dd11ec 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -31,20 +31,28 @@ select:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - samsung,exynos3250-pmu
-          - samsung,exynos4210-pmu
-          - samsung,exynos4412-pmu
-          - samsung,exynos5250-pmu
-          - samsung,exynos5260-pmu
-          - samsung,exynos5410-pmu
-          - samsung,exynos5420-pmu
-          - samsung,exynos5433-pmu
-          - samsung,exynos7-pmu
-          - samsung,exynos850-pmu
-          - samsung-s5pv210-pmu
-      - const: syscon
+    oneOf:
+      - items:
+          - enum:
+              - samsung,exynos3250-pmu
+              - samsung,exynos4210-pmu
+              - samsung,exynos4412-pmu
+              - samsung,exynos5250-pmu
+              - samsung,exynos5260-pmu
+              - samsung,exynos5410-pmu
+              - samsung,exynos5420-pmu
+              - samsung,exynos5433-pmu
+              - samsung,exynos7-pmu
+              - samsung,exynos850-pmu
+              - samsung-s5pv210-pmu
+          - const: syscon
+      - items:
+          - enum:
+              - samsung,exynos5250-pmu
+              - samsung,exynos5420-pmu
+              - samsung,exynos5433-pmu
+          - const: simple-mfd
+          - const: syscon
 
   reg:
     maxItems: 1
@@ -64,6 +72,10 @@ properties:
     minItems: 1
     maxItems: 32
 
+  dp-phy:
+    $ref: /schemas/phy/samsung,dp-video-phy.yaml
+    unevaluatedProperties: false
+
   interrupt-controller:
     description:
       Some PMUs are capable of behaving as an interrupt controller (mostly
@@ -74,6 +86,10 @@ properties:
       Must be identical to the that of the parent interrupt controller.
     const: 3
 
+  mipi-phy:
+    $ref: /schemas/phy/samsung,mipi-video-phy.yaml
+    unevaluatedProperties: false
+
   reboot-mode:
     $ref: /schemas/power/reset/syscon-reboot-mode.yaml
     type: object
@@ -117,6 +133,23 @@ allOf:
         - clock-names
         - clocks
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - samsung,exynos5250-pmu
+              - samsung,exynos5420-pmu
+              - samsung,exynos5433-pmu
+    then:
+      properties:
+        dp-phy: true
+        mipi-phy: true
+    else:
+      properties:
+        dp-phy: false
+        mipi-phy: false
+
 examples:
   - |
     #include <dt-bindings/clock/exynos5250.h>
@@ -130,4 +163,14 @@ examples:
         #clock-cells = <1>;
         clock-names = "clkout16";
         clocks = <&clock CLK_FIN_PLL>;
+
+        dp-phy {
+            compatible = "samsung,exynos5250-dp-video-phy";
+            #phy-cells = <0>;
+        };
+
+        mipi-phy {
+            compatible = "samsung,s5pv210-mipi-video-phy";
+            #phy-cells = <1>;
+        };
     };
-- 
2.34.1

