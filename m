Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E863EC32771
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 26 Sep 2022 14:33:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234521AbiIZOdI (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 26 Sep 2022 10:33:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234738AbiIZOcs (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 26 Sep 2022 10:32:48 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B257A3889
        for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Sep 2022 05:48:09 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id i26so10623021lfp.11
        for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Sep 2022 05:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date;
        bh=TaqQlRA9wMfkARh78jCqln27UUwKbuylUFjHkD67rpg=;
        b=Yk0Iq9iDQsVLdnYNYspsrcCL0hhDqAFV0SatmPDdDKQJS3hw9qyUVO+CdKiMiVPtca
         lAtGsNeo8Rt932S6YTaMzUPdvTj+d8mPt6t3Wg/pS3rBCaeSj36im/JkCzfql8JH8Pw0
         XcDxh90O0TeATsXti4FyniKh9leXabX0jD5GdJUjKcP1BgGjUQCDpr4cnj6/mwqajI3v
         8btWRDCCttGHE8TIsvdEZ5Qez74AMZptqdBBZ15X/5o8hC5IpSRTY28+4BvuvbGDtT/Q
         qkgOxmK+aeoZTxLTjOIRSYjJhJL+Tak7B5VCnz3Y4R4wB1iD/+VZ3znY/pHKVo/qYxdc
         GFRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date;
        bh=TaqQlRA9wMfkARh78jCqln27UUwKbuylUFjHkD67rpg=;
        b=v9SpyhYDIG6989HrnHimWDyVNeoci1xelpk56bR705MnT8aWeqF6/2Xe4L2beUnUU7
         AOvlMzS3noZ+GakCEAqh1OIHVP3E5/3qjRnMwwA+tu7CB0Uwm3C9SIrP0n6JB0w8zSZw
         4FMZaDXdCKtGmL0GFP0bP7mxu3WnSJ3LZargtb/AAUbkAFbUpkQocEwG6Oh7qmEcxf/T
         y6fgTlMzXRxIgQWjeiEMdqEvcmOxnx6HMpedpnVx/FWtC67hg+e0mCISLY5x583d75FN
         /LrpZDSdOyESc14FA7/4xhHVpQreF+vS13e+817/OVJcz7JL96b8ZyLip/Zb2pXGnUqp
         rU4A==
X-Gm-Message-State: ACrzQf09wmDS5SkZuEmXOjYSz0huvHI7H9lzj9GLuVvZd7VeJbhe7YOs
        NtdRo6sDEYlM0TqXhq2D+opkPw==
X-Google-Smtp-Source: AMsMyM7X2TuiHZ6rTF+imwhIm5sZ7t0irrXCWlBYENBZ1CAfDlt6e9yjEcF6RXeHBf2x71MSDaOsSQ==
X-Received: by 2002:a05:6512:22c9:b0:499:cb5d:c138 with SMTP id g9-20020a05651222c900b00499cb5dc138mr8654673lfu.490.1664196487970;
        Mon, 26 Sep 2022 05:48:07 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id 17-20020ac24851000000b0049496855494sm2532457lfy.104.2022.09.26.05.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 05:48:04 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: samsung: soc: match preferred naming in entire compatible
Date:   Mon, 26 Sep 2022 14:47:57 +0200
Message-Id: <20220926124757.475471-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Compatible is a string-array, therefore the "select" should look for
anything containing Samsung SoC part.  This allows to validate cases
like:
 - "samsung,exynos5250-gsc", "samsung,exynos5-gsc"
 - "samsung,exynos5250-pmu", "syscon"
 - "tesla,fsd-mct", "samsung,exynos4210-mct"

Since Tesla FSD builts on top of Exynos blocks, add an adidtional
pattern for it.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/arm/samsung/samsung-soc.yaml     | 26 +++++++++++++++----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-soc.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-soc.yaml
index 653f85997643..bb1fdc205b44 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-soc.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-soc.yaml
@@ -18,17 +18,33 @@ description: |
     samsung,exynos5433-cmu-isp
 
 select:
-  properties:
-    compatible:
-      pattern: "^samsung,.*(s3c|s5pv|exynos)[0-9a-z]+.*$"
+  allOf:
+    - properties:
+        $nodename:
+          pattern: '^[a-z]'
+    - properties:
+        compatible:
+          contains:
+            pattern: "^samsung,.*(s3c|s5pv|exynos)[0-9a-z]+.*$"
   required:
     - compatible
 
 properties:
   compatible:
     oneOf:
-      - description: Preferred naming style for compatibles of SoC components
-        pattern: "^samsung,(s3c|s5pv|exynos|exynosautov)[0-9]+-.*$"
+      - description: Preferred naming style for compatibles of S3C/S5P/Exynos SoC components
+        minItems: 1
+        items:
+          - pattern: "^samsung,(s3c|s5pv|exynos|exynosautov)[0-9]+-.*$"
+          - {}
+          - {}
+
+      - description: Preferred naming style for compatibles of Tesla FSD SoC components
+        minItems: 1
+        items:
+          - pattern: "^tesla,fsd-.*$"
+          - {}
+          - {}
 
       # Legacy compatibles with wild-cards - list cannot grow with new bindings:
       - enum:
-- 
2.34.1

