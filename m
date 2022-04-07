Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C17BDC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  7 Apr 2022 20:34:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230034AbiDGUf7 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 7 Apr 2022 16:35:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230048AbiDGUfm (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 7 Apr 2022 16:35:42 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D5892A8DFF
        for <linux-samsung-soc@vger.kernel.org>; Thu,  7 Apr 2022 13:21:13 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id i38so3290839lfv.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 07 Apr 2022 13:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=z3JBr/Ttk7vxXbtA7Vt1dI5zaBzrSMklwGnLl7DuQF8=;
        b=k1zUJORmR8UXVnkZNcWeOp/6IT8g5UMti0Cye0c+lX5Th5oxgyZHD/umuo5csEVQIC
         lqgW3KYvapSL+87pXafFH8W0ncqlD8tpuknBCTHhvDCMNSvUu15mTe3YURilc8LHkWBv
         l2iONbTQPeGZEOE1GozbutDGrLnkWzBMkwyKzNxYDKIGloy1Th9or6aKgnNqcu6Qd59B
         EgwC/BG+2hfGLKsRXCnG1HQN6KKoX+wPRrv2GfdFtnWql4zqpmdlj1MZJiZdFdDjfxZN
         XlhdZnQyJflevAui3tvhtFOZzNHvcO7R5yOc7a3vkd9NnfTsWqXaUcssTxsbQ2MrSDJC
         ESDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=z3JBr/Ttk7vxXbtA7Vt1dI5zaBzrSMklwGnLl7DuQF8=;
        b=jsRZTvkJfo7aTo729WfXLXBeLbxVMUwlo6fsLwBGzRtpLltw7EuImeUICByvLl0zoa
         14eJXB2jEnCmlbtI48e1szbNYyja/04nEZPU/6XEKXCzT1Qf+8M//HWLAaOJwFaXCMCb
         2+YFmhOVUYgVSB1tnPU7bE0O6I99NHsK0r05Ev2CHy7JKV8MzZK9iPuEJAd3DzN5j2RF
         uwFDuQFZs8a8aVYLBSB6jFmIzxPdTHnWp/giDPCoyYAW0dZjYzBE+AbAEGmA/n7xL/hG
         LmJB000K2aaLBHz1WzHkxI17rkRNKYaDwTG+OcqqjPLrDScwzje/xQhQNqK0nqHv8vgq
         mPOQ==
X-Gm-Message-State: AOAM530nfQ9fi5sEQow/V6lfNTg4VvSJTWrVPgp4vjGpnuwEQKeBg/q0
        rbfdf0TwAYN3E6ywzEnvNEPE6XRmrmaeYwUm
X-Google-Smtp-Source: ABdhPJxVW1FZgomHKEdT3i2TbB5n2ep9jmVmh3X4KT0JDr9MKjb6LQUXqQHR1E83MJwDd8YNhwdvYw==
X-Received: by 2002:a17:907:6e04:b0:6e0:95c0:47b8 with SMTP id sd4-20020a1709076e0400b006e095c047b8mr14960993ejc.483.1649360493289;
        Thu, 07 Apr 2022 12:41:33 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id j17-20020a05640211d100b00419357a2647sm10015528edw.25.2022.04.07.12.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Apr 2022 12:41:32 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [RESEND PATCH v2] dt-bindings: timer: exynos4210-mct: describe known hardware and its interrupts
Date:   Thu,  7 Apr 2022 21:41:27 +0200
Message-Id: <20220407194127.19004-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Most of the Samsung Exynos SoCs use almost the same Multi-Core Timer
block, so only two compatibles were used so far (for Exynos4210 and
Exynos4412 flavors) with Exynos4210-one being used in most of the SoCs.
However the Exynos4210 flavor actually differs by number of interrupts.

Add new compatibles, maintaining backward compatibility with Exynos4210,
and constraints for number of interrupts.  This allows to exactly match
the Exynos MCT hardware.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../timer/samsung,exynos4210-mct.yaml         | 67 ++++++++++++++++++-
 1 file changed, 64 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.yaml b/Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.yaml
index f11cbc7ccc14..1584944c7ac4 100644
--- a/Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.yaml
+++ b/Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.yaml
@@ -19,9 +19,20 @@ description: |+
 
 properties:
   compatible:
-    enum:
-      - samsung,exynos4210-mct
-      - samsung,exynos4412-mct
+    oneOf:
+      - enum:
+          - samsung,exynos4210-mct
+          - samsung,exynos4412-mct
+      - items:
+          - enum:
+              - samsung,exynos3250-mct
+              - samsung,exynos5250-mct
+              - samsung,exynos5260-mct
+              - samsung,exynos5420-mct
+              - samsung,exynos5433-mct
+              - samsung,exynos850-mct
+              - tesla,fsd-mct
+          - const: samsung,exynos4210-mct
 
   clocks:
     minItems: 2
@@ -63,6 +74,56 @@ required:
   - interrupts
   - reg
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos3250-mct
+    then:
+      properties:
+        interrupts:
+          minItems: 8
+          maxItems: 8
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos5250-mct
+    then:
+      properties:
+        interrupts:
+          minItems: 6
+          maxItems: 6
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - samsung,exynos5260-mct
+              - samsung,exynos5420-mct
+              - samsung,exynos5433-mct
+              - samsung,exynos850-mct
+    then:
+      properties:
+        interrupts:
+          minItems: 12
+          maxItems: 12
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - tesla,fsd-mct
+    then:
+      properties:
+        interrupts:
+          minItems: 16
+          maxItems: 16
+
 additionalProperties: false
 
 examples:
-- 
2.32.0

