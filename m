Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F1F6C43217
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 21 Nov 2021 16:57:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238396AbhKURAC (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 21 Nov 2021 12:00:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238357AbhKUQ77 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 21 Nov 2021 11:59:59 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 416E1C06173E
        for <linux-samsung-soc@vger.kernel.org>; Sun, 21 Nov 2021 08:56:54 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id bu18so69408616lfb.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 21 Nov 2021 08:56:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Del8LI9YEPdJpP+4p1EB8ZApYUMffVccPxz+BZ6gv/k=;
        b=EKb8gYulhRPbZ9beHPNPqBsNdjnbkAtuOB/QvieqoqZEJVU+pUq5KCcegyAQyyi2yK
         /1H8n2mahcrLjPh2NsDlDwm83kfwA4d0zShVTAz7Maw7Z0pWxRyNnsHvY+NnZ5L2vVa9
         4cHWPy1mqHLtiLMkU2Jc804G74IpzdAaLigS58EUanX+7PR+z4Nm2dATY40hkGwR0izZ
         6SJWPiiPpPzty0WKsSGFM7R16/za3TFAJXPWfggGsHG279LHitIRMIpKMd9vQ9tUxHC2
         82nr3Frj1u03olscm9k1KHbE9WA9rXcegO2/sGT23sbg/7EQyCe+DQxAz1Q70mS28JLR
         Dwgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Del8LI9YEPdJpP+4p1EB8ZApYUMffVccPxz+BZ6gv/k=;
        b=2B3LxIg3UJR372FWef0Gq1/8ZuT5oLxwOx42DQgtBya0Re+vwdEKcLlPPhvFeUJNIS
         k8JDYhpD5Xlat43au8qyQ0IluA4aoj8ksMiGIviw+gJm0xys/bUgLvAaJxPRcfcUuC9j
         Rs70bk7V/bC/Gs92/34oUP6QTcge2cWI6REZNeoAWoV4pUilU3fBHNa5HWzK0WGs5bHQ
         jNPnweC6PIs4z/Ls9aCfqnZl22BES4Turc5Tw6UFianOKFqjyonPeN769oAnj0udE7eu
         kIz4cdb0xVFORHVNXm5nUJuNfBQb7uQaOETLcncFBu7NmUyV+ImUtNYKaEvl9lxfKE72
         RWuQ==
X-Gm-Message-State: AOAM530jjoaQl9CfcgjOdKfgSKSqPRUnnZQ8k4AHc81gN/iXiyttjNkx
        r4DCnVbfsPByBY95Ymo3Db0cNw==
X-Google-Smtp-Source: ABdhPJwByYlSUkKarH/6XQ7u6iIs3tUQ5iCRt+UZjCRsz3CVRb3RBS1aolkwMIh9NJJi+tWY7Y4NSg==
X-Received: by 2002:a2e:8753:: with SMTP id q19mr44493709ljj.310.1637513812661;
        Sun, 21 Nov 2021 08:56:52 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id j11sm720689ljc.9.2021.11.21.08.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Nov 2021 08:56:52 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH v4 02/12] dt-bindings: watchdog: Document Exynos850 watchdog bindings
Date:   Sun, 21 Nov 2021 18:56:37 +0200
Message-Id: <20211121165647.26706-3-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211121165647.26706-1-semen.protsenko@linaro.org>
References: <20211121165647.26706-1-semen.protsenko@linaro.org>
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---
Changes in v4:
  - Added R-b tag by Krzysztof Kozlowski
  - Added R-b tag by Rob Herring
  - Added R-b tag by Guenter Roeck

Changes in v3:
  - Renamed "samsung,index" property to more descriptive
    "samsung,cluster-index"
  - Disabled "samsung,cluster-index" property for SoCs other than
    Exynos850

Changes in v2:
  - Stated explicitly that Exynos850 driver requires 2 clocks
  - Used single compatible for Exynos850
  - Added "index" property to specify CPU cluster index
  - Fixed a typo in commit message: dedicater -> dedicated

 .../bindings/watchdog/samsung-wdt.yaml        | 45 +++++++++++++++++--
 1 file changed, 41 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
index 93cd77a6e92c..b08373336b16 100644
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
 
+  samsung,cluster-index:
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
@@ -59,9 +66,39 @@ allOf:
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
+        samsung,cluster-index:
+          enum: [0, 1]
+      required:
+        - samsung,cluster-index
+    else:
+      properties:
+        clocks:
+          items:
+            - description: Bus clock, which is also a source clock
+        clock-names:
+          items:
+            - const: watchdog
+        samsung,cluster-index: false
 
 unevaluatedProperties: false
 
-- 
2.30.2

