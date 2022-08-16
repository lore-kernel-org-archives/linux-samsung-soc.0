Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13381C32774
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 16 Aug 2022 13:30:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235760AbiHPNao (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 16 Aug 2022 09:30:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235772AbiHPNaZ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 16 Aug 2022 09:30:25 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C798FB8A6F
        for <linux-samsung-soc@vger.kernel.org>; Tue, 16 Aug 2022 06:30:22 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id s9so10524578ljs.6
        for <linux-samsung-soc@vger.kernel.org>; Tue, 16 Aug 2022 06:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=5Maa5mHCDvID2XEbeA3TvbZciKfZbejdkqWh3jCTW2w=;
        b=WBByk97cZs3CogZGSwc4iXNJ+Pjg63T3GFhsuU/mdkJvXfscSR4OMJdBNNP2eyRAqe
         cPko9V6kv7gwBdG5ksCTrM+P+isaIeMzepjszn+q7YYVmBNftGz0M3F5JlKP8ubhPVJY
         GYujjeKW/pJjNhyhd4V+ApiN0Am69HJWyJKK6+sBJr1b9HcSZjbctPsfpDog4Kc8+WiJ
         gdYsmVgD3JqCCE1lSM8m4P277ehknAHp8beR11tD82aF3wpIEg4nn/3au0XhAda/g6HW
         Ib4WdGdO3XqU+CITfIN3NxnvoXUUPgIevepPrCtfaQDX9D5MZY97TZigqt9VvDNT6wEL
         IodA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=5Maa5mHCDvID2XEbeA3TvbZciKfZbejdkqWh3jCTW2w=;
        b=0xnlh+7pX67mCMZEB8hT20fLeepM4yUpIOBwHLDxCAYAREllxUdBJLOYqV+puHYCaw
         iz5rWw7W8Bo3xd9m1lFl72X1IzozG60U+JF2Y2BWbvcU8t2M/7CJgaehUIyJGHPYfTEn
         TpRBT4/im9iqwx6PDzUJEqJNhxCrpwToX+Fh5DG4f7nygR4/vWmCAJ91gpZs2Eanwpqo
         AUFFInXa7vrIIAVPR34cnl9TEJp0BtaTLoERI6vrodRabiNlatEJkHDB40yJxqstWGq4
         p8fccllMq/KxA7y59MUMPXr7ryGf5FoLTM8ajC3fZodGzwxtJOfCkzAIPgwpoTpL7gyB
         8CtA==
X-Gm-Message-State: ACgBeo1DVJzqKYghDibZtgZNZO8foT9i5kUHQGCkwaLN7c+kkH4zgAym
        4ydWosBe41WO1EYdWkh4tHchvw==
X-Google-Smtp-Source: AA6agR5KkdbueNzav6IGro95WRos+dXgFJPzwKDgHnq+77Qu54W5MBRJc0paIAniQQ8p8D0SCY52+Q==
X-Received: by 2002:a2e:8e71:0:b0:261:74ad:ab5f with SMTP id t17-20020a2e8e71000000b0026174adab5fmr5785039ljk.387.1660656620931;
        Tue, 16 Aug 2022 06:30:20 -0700 (PDT)
Received: from krzk-bin.. (d15l54g8c71znbtrbzt-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1782:dd68:b0c1:c1a4])
        by smtp.gmail.com with ESMTPSA id k19-20020a2eb753000000b0025e42f8e771sm1816301ljo.34.2022.08.16.06.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 06:30:20 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Tomasz Figa <tomasz.figa@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] dt-bindings: pinctrl: samsung: stop using bindings header with constants
Date:   Tue, 16 Aug 2022 16:30:15 +0300
Message-Id: <20220816133016.77553-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220816133016.77553-1-krzysztof.kozlowski@linaro.org>
References: <20220816133016.77553-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The bindings header with pin controller register values is being
deprecated and DTS already switched to a DTS-local header.

Do not reference the bindings header in schema and replace the defines
with raw values.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../pinctrl/samsung,pinctrl-pins-cfg.yaml     |  1 -
 .../bindings/pinctrl/samsung,pinctrl.yaml     | 63 ++++++++-----------
 2 files changed, 27 insertions(+), 37 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-pins-cfg.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-pins-cfg.yaml
index 9869d4dceddb..f796f27bf0e6 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-pins-cfg.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-pins-cfg.yaml
@@ -20,7 +20,6 @@ description: |
   The values used for config properties should be derived from the hardware
   manual and these values are programmed as-is into the pin pull up/down and
   driver strength register of the pin-controller.
-  See also include/dt-bindings/pinctrl/samsung.h with useful constants.
 
   See also Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml for
   additional information and example.
diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
index 3a65c66ca71d..dafa51c69c06 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
@@ -15,9 +15,6 @@ description: |
   This is a part of device tree bindings for Samsung S3C/S5P/Exynos SoC pin
   controller.
 
-  Pin group settings (like drive strength, pull up/down) are available as
-  macros in include/dt-bindings/pinctrl/samsung.h.
-
   All the pin controller nodes should be represented in the aliases node using
   the following format 'pinctrl{n}' where n is a unique number for the alias.
 
@@ -138,8 +135,6 @@ additionalProperties: false
 
 examples:
   - |
-    #include <dt-bindings/pinctrl/samsung.h>
-
     pinctrl@7f008000 {
         compatible = "samsung,s3c64xx-pinctrl";
         reg = <0x7f008000 0x1000>;
@@ -166,8 +161,8 @@ examples:
 
         uart0-data-pins {
             samsung,pins = "gpa-0", "gpa-1";
-            samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
-            samsung,pin-pud = <S3C64XX_PIN_PULL_NONE>;
+            samsung,pin-function = <2>;
+            samsung,pin-pud = <0>;
         };
 
         // ...
@@ -175,7 +170,6 @@ examples:
 
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
-    #include <dt-bindings/pinctrl/samsung.h>
 
     pinctrl@11400000 {
         compatible = "samsung,exynos4210-pinctrl";
@@ -197,9 +191,9 @@ examples:
 
         uart0-data-pins {
             samsung,pins = "gpa0-0", "gpa0-1";
-            samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
-            samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
-            samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
+            samsung,pin-function = <2>;
+            samsung,pin-pud = <0>;
+            samsung,pin-drv = <0>;
         };
 
         // ...
@@ -207,14 +201,14 @@ examples:
         sleep0: sleep-state {
             gpa0-0-pin {
                 samsung,pins = "gpa0-0";
-                samsung,pin-con-pdn = <EXYNOS_PIN_PDN_INPUT>;
-                samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_NONE>;
+                samsung,pin-con-pdn = <2>;
+                samsung,pin-pud-pdn = <0>;
             };
 
             gpa0-1-pin {
                 samsung,pins = "gpa0-1";
-                samsung,pin-con-pdn = <EXYNOS_PIN_PDN_OUT0>;
-                samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_NONE>;
+                samsung,pin-con-pdn = <0>;
+                samsung,pin-pud-pdn = <0>;
             };
 
             // ...
@@ -223,7 +217,6 @@ examples:
 
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
-    #include <dt-bindings/pinctrl/samsung.h>
 
     pinctrl@11000000 {
         compatible = "samsung,exynos4210-pinctrl";
@@ -272,26 +265,26 @@ examples:
 
         sd0-clk-pins {
             samsung,pins = "gpk0-0";
-            samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
-            samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
-            samsung,pin-drv = <EXYNOS4_PIN_DRV_LV4>;
+            samsung,pin-function = <2>;
+            samsung,pin-pud = <0>;
+            samsung,pin-drv = <3>;
         };
 
         sd4-bus-width8-pins {
             part-1-pins {
                 samsung,pins = "gpk0-3", "gpk0-4",
                                "gpk0-5", "gpk0-6";
-                samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
-                samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
-                samsung,pin-drv = <EXYNOS4_PIN_DRV_LV4>;
+                samsung,pin-function = <3>;
+                samsung,pin-pud = <3>;
+                samsung,pin-drv = <3>;
             };
 
             part-2-pins {
                 samsung,pins = "gpk1-3", "gpk1-4",
                                "gpk1-5", "gpk1-6";
-                samsung,pin-function = <EXYNOS_PIN_FUNC_4>;
-                samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
-                samsung,pin-drv = <EXYNOS4_PIN_DRV_LV4>;
+                samsung,pin-function = <4>;
+                samsung,pin-pud = <3>;
+                samsung,pin-drv = <3>;
             };
         };
 
@@ -299,16 +292,15 @@ examples:
 
         otg-gp-pins {
             samsung,pins = "gpx3-3";
-            samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
-            samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
-            samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
+            samsung,pin-function = <1>;
+            samsung,pin-pud = <0>;
+            samsung,pin-drv = <0>;
             samsung,pin-val = <0>;
         };
     };
 
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
-    #include <dt-bindings/pinctrl/samsung.h>
 
     pinctrl@10580000 {
         compatible = "samsung,exynos5433-pinctrl";
@@ -352,9 +344,9 @@ examples:
         initial_alive: initial-state {
             gpa0-0-pin {
                 samsung,pins = "gpa0-0";
-                samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
-                samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
-                samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+                samsung,pin-function = <0>;
+                samsung,pin-pud = <1>;
+                samsung,pin-drv = <0>;
             };
 
             // ...
@@ -363,7 +355,6 @@ examples:
 
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
-    #include <dt-bindings/pinctrl/samsung.h>
 
     pinctrl@114b0000 {
         compatible = "samsung,exynos5433-pinctrl";
@@ -384,9 +375,9 @@ examples:
         i2s0-bus-pins {
             samsung,pins = "gpz0-0", "gpz0-1", "gpz0-2", "gpz0-3",
                            "gpz0-4", "gpz0-5", "gpz0-6";
-            samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
-            samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
-            samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+            samsung,pin-function = <2>;
+            samsung,pin-pud = <0>;
+            samsung,pin-drv = <0>;
         };
 
         // ...
-- 
2.34.1

