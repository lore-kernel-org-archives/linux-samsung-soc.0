Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 231FBC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 31 Mar 2022 21:17:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237196AbiCaVSz (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 31 Mar 2022 17:18:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232587AbiCaVSz (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 31 Mar 2022 17:18:55 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02B1D237FE6
        for <linux-samsung-soc@vger.kernel.org>; Thu, 31 Mar 2022 14:17:07 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id z92so719383ede.13
        for <linux-samsung-soc@vger.kernel.org>; Thu, 31 Mar 2022 14:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nGcgYb47kFSx74hsKvREuLMWHX29e0A5Arswhl9so/I=;
        b=Qpdl0PbxwpOkOlh910SskE4x/GdaL9SnivqJYn79n/FxmKqv7Qs3m2aJI1WjeytT9W
         IRgg5DNFp/nnzwnHLekDO4NesduELa8+gWKKbQfiMqgNaKmi7daEavGKioqJiPoMV5q4
         TeasXyT+DtVJ2PS3j4Vz2vJcLygBYqnwwWTyHpk5QfeBZIKblQujEim/RHFAXLFSkMQo
         +tlUwGLq1z1WU9o0XncaBWOhDT5jsJldMWUd/9Ts0xzfmRYiaZyAIbll/jov3zWmvH0e
         pW44+ulRxVV1X2mHK4ayByZ7j2ctjB1x/dMyX2wCf5LGU4Nl7EGAwS6wHDGoQ9Ymhvw8
         cWXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nGcgYb47kFSx74hsKvREuLMWHX29e0A5Arswhl9so/I=;
        b=Q+jgXlHqMd1CU/ZsH4CEGFa1f/82H3IBLO4AMCR/5t0zLk+I0J02Qk6lF5tIoSTeKh
         G9GbeA0bDUJmzRNRxtVnYezLJOjXCrkY7SGpMXwMG2tWJv+tpPJE97I0/Dd5YgN2VF2U
         imkPa7ME6RL1q/XEyYBCbQ2Wxu5+4Tkxoo1FbEBeKjD7caZTb21+F/22Kb8pe4H60cRo
         /S6OtWa60efa3lmUbyWPxnTJ2AWoV2rAqnoeaxVU4aBWcSrZnFpZISzPzmAlnOLwJ+ZX
         ikA4/MCYm+qxGOULy/U2BdoOILRBC+GffaJjfkFriXb+n3AC5+Tg/osW72Kj+cnYTcnM
         xF7Q==
X-Gm-Message-State: AOAM5317W3DMM4fdj+csVm4+paTe6a0xscYLY/QIX2RVsr9GXkHJwSqx
        RLGBmvVe+pUjM4PEVcWzuLyxsQ==
X-Google-Smtp-Source: ABdhPJxNK4evBG/fjORvTq2QCSAzbQ+XVW5+JJOQVqLpEY5JfONx42J+VjQtSuAlKnwFD9fDJndCYw==
X-Received: by 2002:a05:6402:2747:b0:419:4817:ba22 with SMTP id z7-20020a056402274700b004194817ba22mr17922903edd.253.1648761425514;
        Thu, 31 Mar 2022 14:17:05 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id nc13-20020a1709071c0d00b006dfa376ee55sm202518ejc.131.2022.03.31.14.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Mar 2022 14:17:04 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 1/2] regulator: dt-bindings: maxim,max8997: correct array of voltages
Date:   Thu, 31 Mar 2022 23:16:52 +0200
Message-Id: <20220331211653.175200-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

uint32-array with voltages should be within one bracket pair <>, not
each number in its own <>.  Also the number of elements in the array
should be defined within "items:".

This fixes DT schema warnings like:

  maxim,max8997.example.dtb: pmic@66: max8997,pmic-buck1-dvs-voltage:
    [[1350000, 1300000, 1250000, 1200000, 1150000, 1100000, 1000000, 950000]] is too short

Fixes: 1d2104f21618 ("regulator: dt-bindings: maxim,max8997: convert to dtschema")
Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Patch is independent of DTS.
---
 .../bindings/regulator/maxim,max8997.yaml     | 55 +++++++++++--------
 1 file changed, 31 insertions(+), 24 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/maxim,max8997.yaml b/Documentation/devicetree/bindings/regulator/maxim,max8997.yaml
index d5a44ca3df04..6305a9abaead 100644
--- a/Documentation/devicetree/bindings/regulator/maxim,max8997.yaml
+++ b/Documentation/devicetree/bindings/regulator/maxim,max8997.yaml
@@ -32,8 +32,9 @@ properties:
 
   max8997,pmic-buck1-dvs-voltage:
     $ref: /schemas/types.yaml#/definitions/uint32-array
-    minItems: 1
-    maxItems: 8
+    items:
+      minItems: 1
+      maxItems: 8
     description: |
       A set of 8 voltage values in micro-volt (uV) units for buck1 when
       changing voltage using GPIO DVS.
@@ -44,8 +45,9 @@ properties:
 
   max8997,pmic-buck2-dvs-voltage:
     $ref: /schemas/types.yaml#/definitions/uint32-array
-    minItems: 1
-    maxItems: 8
+    items:
+      minItems: 1
+      maxItems: 8
     description: |
       A set of 8 voltage values in micro-volt (uV) units for buck2 when
       changing voltage using GPIO DVS.
@@ -56,8 +58,9 @@ properties:
 
   max8997,pmic-buck5-dvs-voltage:
     $ref: /schemas/types.yaml#/definitions/uint32-array
-    minItems: 1
-    maxItems: 8
+    items:
+      minItems: 1
+      maxItems: 8
     description: |
       A set of 8 voltage values in micro-volt (uV) units for buck5 when
       changing voltage using GPIO DVS.
@@ -267,14 +270,17 @@ if:
 then:
   properties:
     max8997,pmic-buck1-dvs-voltage:
-      minItems: 8
-      maxItems: 8
+      items:
+        minItems: 8
+        maxItems: 8
     max8997,pmic-buck2-dvs-voltage:
-      minItems: 8
-      maxItems: 8
+      items:
+        minItems: 8
+        maxItems: 8
     max8997,pmic-buck5-dvs-voltage:
-      minItems: 8
-      maxItems: 8
+      items:
+        minItems: 8
+        maxItems: 8
 
 examples:
   - |
@@ -303,20 +309,21 @@ examples:
                                              <&gpx0 6 GPIO_ACTIVE_HIGH>,
                                              <&gpl0 0 GPIO_ACTIVE_HIGH>;
 
-            max8997,pmic-buck1-dvs-voltage = <1350000>, <1300000>,
-                                             <1250000>, <1200000>,
-                                             <1150000>, <1100000>,
-                                             <1000000>, <950000>;
+            max8997,pmic-buck1-dvs-voltage = <1350000 1300000
+                                              1250000 1200000
+                                              1150000 1100000
+                                              1000000  950000>;
+
+            max8997,pmic-buck2-dvs-voltage = <1100000 1000000
+                                               950000  900000
+                                              1100000 1000000
+                                               950000  900000>;
 
-            max8997,pmic-buck2-dvs-voltage = <1100000>, <1000000>,
-                                             <950000>,  <900000>,
-                                             <1100000>, <1000000>,
-                                             <950000>,  <900000>;
 
-            max8997,pmic-buck5-dvs-voltage = <1200000>, <1200000>,
-                                             <1200000>, <1200000>,
-                                             <1200000>, <1200000>,
-                                             <1200000>, <1200000>;
+            max8997,pmic-buck5-dvs-voltage = <1200000 1200000
+                                              1200000 1200000
+                                              1200000 1200000
+                                              1200000 1200000>;
 
             pinctrl-0 = <&max8997_irq>, <&otg_gp>, <&usb_sel>;
             pinctrl-names = "default";
-- 
2.32.0

