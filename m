Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EFE8C43217
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 11 Jan 2022 20:19:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350733AbiAKUTF (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 11 Jan 2022 15:19:05 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:60258
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1346036AbiAKUSd (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 11 Jan 2022 15:18:33 -0500
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 3737E4005A
        for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Jan 2022 20:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1641932310;
        bh=B7eb4svBYjse6OhWKfcBGRECU3OCvQCpw+6zWu1iivQ=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=OpZcVWBU8SzPeuGWrFObaLhoLGBVoVp3PiRYY1SYS/75YCoqwme+HBsx01DpYz/E+
         5d2FTuunOE4UiIpau09zDllVS5qr6rQaxC7a92eRMpqNpwkeZtjZy5KhXx37XdI2S7
         4w10W5Q0MRvuPcPttV8Qx6T8RAracqD2ePffS8Fo4Xd70+dcPbEhi/8yV3xebbxg+w
         dpBiZ+sYTlRHx375g1Xl6w3wz+l/A+QO821jZ9IU7hTHgw2fiEYrMYLagCjl2p2LJ4
         YwyM6q0MOiiYOeSFOxaLGZ68OLAOv0xCNQsQWzJqKz2YR7Ps5v6ZUKwK4JL/HX3bMq
         NOQHPkOtivEMw==
Received: by mail-ed1-f71.google.com with SMTP id g2-20020a056402424200b003f8ee03207eso204321edb.7
        for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Jan 2022 12:18:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B7eb4svBYjse6OhWKfcBGRECU3OCvQCpw+6zWu1iivQ=;
        b=4jQlABJj6y4uayaZmvJK8NZrqvfwobckALVNVo4jYXbgjagHseMZov5/R6eDtmE91m
         yhSn8S/pTnSMQ2z1kWi2v4ACUtXPPUz2pFtreyVsBr8e8hRGm6AzL6+e2VTky0UC00ns
         XpCWql4Y7RNUIDvOUfvKSqKb40mSYNfeVo29C41LtKc+Xmn/PX/uv4INyY++D5Adx1Dy
         vKRBeeouan2qJSuvE9X0dBtLfCUBpxcF3/IEJNazgwCAzu4xEwWgcopEbM0RsB8nDrwi
         lIHUKcRopUwYx2f4Ov2SH91h1WQhqllDFD43YtcQsQ1x80gjPUxeTsoWY/k7/e+lPCVR
         N65w==
X-Gm-Message-State: AOAM532WIEwpvs8qaa2u1brMQZb+6L1nlFG6od9R3x2NoxdxFWFvLwtR
        mS5tw0TzRDErktYFuCGwWhzXcpWIDOGb0ORS+UdJM80sZhSAkJgWwH8Ffv1f8c5Ek9CYnf2VQrM
        S5Tgg7UclCYouZLuoEHVIBcjW6itELrvQ4GNXd9N4tTD4EduR
X-Received: by 2002:a17:906:9743:: with SMTP id o3mr4917473ejy.162.1641932307873;
        Tue, 11 Jan 2022 12:18:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyDLMQAtYvvGFLQbylU0wX+h2/hT+LQs+a2r74G9q823h9VzJ2eJOEH3H9exRQ9Re9sKec2MA==
X-Received: by 2002:a17:906:9743:: with SMTP id o3mr4917457ejy.162.1641932307713;
        Tue, 11 Jan 2022 12:18:27 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id e4sm4030881ejs.13.2022.01.11.12.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 12:18:26 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Tomasz Figa <tomasz.figa@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Chanho Park <chanho61.park@samsung.com>,
        Alim Akhtar <alim.akhtar@gmail.com>
Subject: [PATCH v2 25/28] dt-bindings: pinctrl: samsung: describe Exynos850 and ExynosAutov9 wake-ups
Date:   Tue, 11 Jan 2022 21:17:19 +0100
Message-Id: <20220111201722.327219-19-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220111201426.326777-1-krzysztof.kozlowski@canonical.com>
References: <20220111201426.326777-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Older Samsung Exynos SoC pin controller nodes (Exynos3250, Exynos4,
Exynos5, Exynos5433) with external wake-up interrupts, expected to have
one interrupt for multiplexing these wake-up interrupts.  Also they
expected to have exactly one pin controller capable of external wake-up
interrupts.

It seems however that newer ARMv8 Exynos SoC like Exynos850 and
ExynosAutov9 have differences of their pin controller node capable of
external wake-up interrupts:
1. No multiplexed external wake-up interrupt, only direct,
2. More than one pin controller capable of external wake-up interrupts.

Add dedicated Exynos850 and ExynosAutov9 compatibles.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../samsung,pinctrl-wakeup-interrupt.yaml     | 27 ++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
index 6b684a53119b..a822f70f5702 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
@@ -16,9 +16,12 @@ description: |
   controller.
 
   External wake-up interrupts for Samsung S3C/S5P/Exynos SoC pin controller.
-  Only one pin-controller device node can include external wake-up interrupts
-  child node (in other words, only one External wake-up interrupts
+  For S3C24xx, S3C64xx, S5PV210 and Exynos4210 compatible wake-up interrupt
+  controllers, only one pin-controller device node can include external wake-up
+  interrupts child node (in other words, only one External wake-up interrupts
   pin-controller is supported).
+  For newer controllers, multiple pin-controller device node can include
+  external wake-up interrupts child node.
 
   See also Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml for
   additional information and example.
@@ -32,6 +35,8 @@ properties:
       - samsung,s5pv210-wakeup-eint
       - samsung,exynos4210-wakeup-eint
       - samsung,exynos7-wakeup-eint
+      - samsung,exynos850-wakeup-eint
+      - samsung,exynosautov9-wakeup-eint
 
   interrupts:
     description:
@@ -41,7 +46,6 @@ properties:
 
 required:
   - compatible
-  - interrupts
 
 allOf:
   - if:
@@ -56,6 +60,8 @@ allOf:
         interrupts:
           minItems: 6
           maxItems: 6
+      required:
+        - interrupts
 
   - if:
       properties:
@@ -67,6 +73,8 @@ allOf:
         interrupts:
           minItems: 4
           maxItems: 4
+      required:
+        - interrupts
 
   - if:
       properties:
@@ -81,5 +89,18 @@ allOf:
         interrupts:
           minItems: 1
           maxItems: 1
+      required:
+        - interrupts
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - samsung,exynos850-wakeup-eint
+              - samsung,exynosautov9-wakeup-eint
+    then:
+      properties:
+        interrupts: false
 
 additionalProperties: false
-- 
2.32.0

