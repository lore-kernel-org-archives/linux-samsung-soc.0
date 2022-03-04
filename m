Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 119C1C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  4 Mar 2022 12:25:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239675AbiCDM0C (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 4 Mar 2022 07:26:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237994AbiCDM0A (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 4 Mar 2022 07:26:00 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13B8E1B370E
        for <linux-samsung-soc@vger.kernel.org>; Fri,  4 Mar 2022 04:25:11 -0800 (PST)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 0299E3F600
        for <linux-samsung-soc@vger.kernel.org>; Fri,  4 Mar 2022 12:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646396707;
        bh=kgcW8NoeEKgqEQpiOeMGrdb/y3sIE8kBcUfOjO129hk=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=fQNI9Uhm4NJdl9xhP2x3BlXd2S0fXP9eztnguiTwhpmg/+FpA02kmLh4wZzjCkTLr
         Ml5+6vEhP3Fr5u9jykiWvz62Voc5oBMEM8AI0BzQz58st4DStfwAsEiOjbzDisJ976
         HL6ZmRxKbD8MW0qnwobKZfy4SOCHaAwSfweCNoARf2+2qBErkFNLpUF0x04l/gXmuL
         iGhBsPpv49tMCSKkqHrUkDuhmYq9F/Ala/6YaK8Pg+gN+HzANPoiZhYXukaZJfN1eO
         8UcnokuFzjmRsDFmmP/kdam+v5tDqf0/XGvW7nW6WMF5DLf7gWcmAjn8MH1MnA7A4Y
         uT/NfHGL5r4qw==
Received: by mail-ed1-f69.google.com with SMTP id x22-20020a05640226d600b0041380e16645so4521495edd.8
        for <linux-samsung-soc@vger.kernel.org>; Fri, 04 Mar 2022 04:25:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kgcW8NoeEKgqEQpiOeMGrdb/y3sIE8kBcUfOjO129hk=;
        b=obBYw8fiuUGfEKBZHNim/zvka+3EZmS7RAjwf0x5W2d8rKP+UGOlg8lro+ndd8OdIB
         +twYRX5mIOqNJonFBHOMRxXPG+rWzAErEZEr2EFXZCnVr26NRgXllCQPV+c8NeWNH0MH
         B/YaQBBa+nNLbjeHlrU9//UjejPmgtxPuMQC/upaumO2Ch9qNgxLbUjW7eoCo+A9fphS
         7mCOABd/E3o37MaJcws0leuwXqV5iYwU5hwGgZXKKdjCwcMcF79+XpXHlDkfskP4/aKi
         3hJq7/n9Feb0LSac0U42aj95O87Vv2AUhnP+WeWn+Q0JzKdVZDeatwhmXS6Q1uyg0Y9R
         PM0w==
X-Gm-Message-State: AOAM530IXPALp/gA460KxlFgfjBFWC53bhVMXYwRo1jIrk+vzdKkPo5M
        Sd95vT/QWFLQAl2oUXqSFd9V48D4TXIqupEZz6URKuZO4VvAdRUGsAijOSKr0NQO9z7hY+QJt0J
        NayiRdiUATOHuh+hbjQAJQhAKvVtJt9tRKUaPjRZIYHH67MSM
X-Received: by 2002:a17:907:70c1:b0:6ce:78ff:bad4 with SMTP id yk1-20020a17090770c100b006ce78ffbad4mr31164815ejb.68.1646396701949;
        Fri, 04 Mar 2022 04:25:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy6Wvt1ALjXyOY5O7427bhp34XMAl6I3Ap8zIOpaKncvQpm4/ZUjYymTNh6SzZvWw89ZXr/bw==
X-Received: by 2002:a17:907:70c1:b0:6ce:78ff:bad4 with SMTP id yk1-20020a17090770c100b006ce78ffbad4mr31164791ejb.68.1646396701612;
        Fri, 04 Mar 2022 04:25:01 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id r23-20020aa7da17000000b00415a1431488sm2047368eds.4.2022.03.04.04.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Mar 2022 04:25:00 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 1/4] dt-bindings: timer: exynos4210-mct: describe known hardware and its interrupts
Date:   Fri,  4 Mar 2022 13:24:21 +0100
Message-Id: <20220304122424.307885-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220304122424.307885-1-krzysztof.kozlowski@canonical.com>
References: <20220304122424.307885-1-krzysztof.kozlowski@canonical.com>
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

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
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

