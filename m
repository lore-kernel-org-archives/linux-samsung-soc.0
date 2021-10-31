Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE230C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 31 Oct 2021 12:22:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B38D660F9E
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 31 Oct 2021 12:22:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231720AbhJaMYz (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 31 Oct 2021 08:24:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231857AbhJaMYy (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 31 Oct 2021 08:24:54 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92989C061764
        for <linux-samsung-soc@vger.kernel.org>; Sun, 31 Oct 2021 05:22:22 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id f8so33361098edy.4
        for <linux-samsung-soc@vger.kernel.org>; Sun, 31 Oct 2021 05:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4hAAB9ACVGB7w+5kN6PqXP+giYjWZ8rzjhqYUsb2soQ=;
        b=tjyz05UAvEZeR+kQ75NlySwkepTuKYMqx5I3q57MUpX7MKgJSmnaMUPMwEhGRpfycy
         n2cLROtK8MOo0BcrjMwbvdwuemUh3b7OGnESGtyLaai/EPMQNZWgMRPqEorWVFf5RvHH
         lFu7O7usjBu8fTxLOgWo+xFBrP/Ed4oNB9EI/VgGj6iEekppWtWsjiPF8lpWE0bmugiu
         RQ/VDXyZHY5YLMxeD1LrDzHbyX2w1cPTTAPUtawtewhfKo4kHKo2GGBIW352q7uVqIvG
         nJ+lZWXnWWnBA+zROr1/3+9SlL/MfIqoMwkn1OX9R+sNhjCRkuZDRXu2do8zY/KA17GS
         X7yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4hAAB9ACVGB7w+5kN6PqXP+giYjWZ8rzjhqYUsb2soQ=;
        b=aiAd5m211F+Fy7XXFWXgwaStf/kKts+HSh3KbI44sUbHWZxakp6C1GgCgjwU/YPczh
         zzg2JGJFW+dhfjUZVwvTyQ8PjKtGHPSp/i38y0NbirepVUO4mJ3Yiv4WkuFX7yk36ku1
         uJV9cjITtx+FRR2HFxKsXnbBEZrpqTiemXkAMxwmDfMgJMI57TX98pPakpuybYFdP5M0
         GGZhudVeXPbjJezocxnc0Hjf3SfcV1L7VXryK35Ie6bA1yev4Q51pKeubv85xh/oFuC8
         6145DuRWzDN2F1vLm43PfUSklH6U2X5vthEM4WoAg0/LXijchcSa7LK3Vz3SFKtXdcSy
         zkmQ==
X-Gm-Message-State: AOAM533f5Q4txatPydNB3z8/dRDSs//0/Cu3Nu/7Ecbi+CZwf4972GYW
        YeYYC6IWc2cNh6WtIWiplKvNPg==
X-Google-Smtp-Source: ABdhPJw1btUJn7dyIICN98vaTkAsHX3B/Uv+co666O+A3jpDVitVf+48qEz1YZu90eIvjdvpsZlgAw==
X-Received: by 2002:a17:906:269a:: with SMTP id t26mr28852315ejc.20.1635682941200;
        Sun, 31 Oct 2021 05:22:21 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id x3sm7738974edd.67.2021.10.31.05.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Oct 2021 05:22:20 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 02/12] dt-bindings: watchdog: Document Exynos850 watchdog bindings
Date:   Sun, 31 Oct 2021 14:22:06 +0200
Message-Id: <20211031122216.30212-3-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211031122216.30212-1-semen.protsenko@linaro.org>
References: <20211031122216.30212-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Exynos850 SoC has two CPU clusters:
  - cluster 0: contains CPUs #0, #1, #2, #3
  - cluster 1: contains CPUs #4, #5, #6, #7

Each cluster has its own dedicated watchdog timer. Those WDT instances
are controlled using different bits in PMU registers, new
"samsung,index" property is added to tell the driver which bits to use
for defined watchdog node.

Also on Exynos850 the peripheral clock and the source clock are two
different clocks. Provide a way to specify two clocks in watchdog device
tree node.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
Changes in v2:
  - Stated explicitly that Exynos850 driver requires 2 clocks
  - Used single compatible for Exynos850
  - Added "index" property to specify CPU cluster index
  - Fixed a typo in commit message: dedicater -> dedicated

 .../bindings/watchdog/samsung-wdt.yaml        | 44 +++++++++++++++++--
 1 file changed, 40 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
index 93cd77a6e92c..f29d0ca4eced 100644
--- a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
@@ -22,25 +22,32 @@ properties:
       - samsung,exynos5250-wdt                # for Exynos5250
       - samsung,exynos5420-wdt                # for Exynos5420
       - samsung,exynos7-wdt                   # for Exynos7
+      - samsung,exynos850-wdt                 # for Exynos850
 
   reg:
     maxItems: 1
 
   clocks:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
 
   clock-names:
-    items:
-      - const: watchdog
+    minItems: 1
+    maxItems: 2
 
   interrupts:
     maxItems: 1
 
+  samsung,index:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Index of CPU cluster on which watchdog is running (in case of Exynos850)
+
   samsung,syscon-phandle:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
       Phandle to the PMU system controller node (in case of Exynos5250,
-      Exynos5420 and Exynos7).
+      Exynos5420, Exynos7 and Exynos850).
 
 required:
   - compatible
@@ -59,9 +66,38 @@ allOf:
               - samsung,exynos5250-wdt
               - samsung,exynos5420-wdt
               - samsung,exynos7-wdt
+              - samsung,exynos850-wdt
     then:
       required:
         - samsung,syscon-phandle
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - samsung,exynos850-wdt
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Bus clock, used for register interface
+            - description: Source clock (driving watchdog counter)
+        clock-names:
+          items:
+            - const: watchdog
+            - const: watchdog_src
+        samsung,index:
+          enum: [0, 1]
+      required:
+        - samsung,index
+    else:
+      properties:
+        clocks:
+          items:
+            - description: Bus clock, which is also a source clock
+        clock-names:
+          items:
+            - const: watchdog
 
 unevaluatedProperties: false
 
-- 
2.30.2

