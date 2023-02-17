Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CB4BC6379F
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 17 Feb 2023 15:07:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230084AbjBQPHC (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 17 Feb 2023 10:07:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229928AbjBQPHB (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 17 Feb 2023 10:07:01 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C41D2ED67
        for <linux-samsung-soc@vger.kernel.org>; Fri, 17 Feb 2023 07:06:38 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id cn2so5395870edb.4
        for <linux-samsung-soc@vger.kernel.org>; Fri, 17 Feb 2023 07:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BVUO1aupwuc3SgbflJXaaYp+FkC1sn4UMeGDXbO6xHU=;
        b=rzKbDKDFnboK8nfAzvrMTvJw6Y/TCnHtmj9dSm3gBcZw0H7LD1DGg32N+3QxYOeC6V
         MSVe/+QCQ+QI8h6J+w5yWvR1qrK1d9IOLRF5J9BdQxpni7QON4pQcGDedOorfkCeeg2C
         sZGGyIF/Ue4MSwysYFNPPNyuVrD3Sg0jwZdTCXIdSE5u/8Sv/7HNJSln6ZW/v2W721VW
         +KcVLOxbEK8+axr0Rb9YHX7ARvLTVHD872g4BSEPPd6lSbTk3dL+IQH9I+o0REaJLaZH
         eVEOqL8cqFSRxWTuy6Ok+uxUD8b5pMbduELxj6+MxiTz+xcUeFlTYmXWFF3FefP8RSYU
         rosA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BVUO1aupwuc3SgbflJXaaYp+FkC1sn4UMeGDXbO6xHU=;
        b=HpseF+Y28NwJcuVORhMH3s2FylLCwEyptFvXhWO+GxetAVuyr7wciedOpnLDkEldhp
         89ywLjPseSLRe0WO/U3a8edwSTR4LkEJhNgZl1uOFbdhcrJgexxnRnwALo6GvA4HU/1Z
         zXPMpJxWiCW4ESyyar3MchM7Ud4SmOEtvmSQmUr30dOVXm45DE634I5iSeF1fZ1dsDxx
         D9wqm+uHgKKZ+70BDy4Bsstl9wm1Ri816rLW8nG9IEUizGjIj9Ic1fR1V4ZQHzK4nkp+
         BsDxszqnrahlFRtBll+dOi25zDINcHx8wFnRQzscahwugEfoNMe371hqQTt7A/sTOekr
         /upw==
X-Gm-Message-State: AO0yUKUVDYAFCEtMN0Na+jFF4ZRmididyg3cBDNTiEsODj0UtvbMs0Xc
        A850M76uvrfursc0NsDrN9QJSg==
X-Google-Smtp-Source: AK7set/MvpCwrmh0RJ26YKS8BemE7jtkrXyaF5g1Kn3SlB6NSMddMwdN2RsYzr6IDqPTECc1uZs1rA==
X-Received: by 2002:a17:906:f75b:b0:88c:a43d:81bc with SMTP id jp27-20020a170906f75b00b0088ca43d81bcmr8775238ejb.58.1676646394818;
        Fri, 17 Feb 2023 07:06:34 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id fx15-20020a170906b74f00b008b14ba6c954sm2221303ejb.194.2023.02.17.07.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 07:06:34 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        - <patches@opensource.cirrus.com>,
        Adrien Grassein <adrien.grassein@gmail.com>,
        Randy Li <ayaka@soulik.info>, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/3] ASoC: dt-bindings: wlf,wm8960: Convert to dtschema
Date:   Fri, 17 Feb 2023 16:06:25 +0100
Message-Id: <20230217150627.779764-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Convert the Wolfson WM8960 audio codecs bindings to DT schema.

Changes against original binding:
1. Document clocks and clock-names - already present in DTS and used
   by Linux driver.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

One DTS warning still remains:
  uniphier-pxs2-gentil.dtb: wm8960@1a: Unevaluated properties are not allowed ('port@0' was unexpected)

I am not sure if this is correct usage of endpoints. I would assume the
codec should be used only as DAI.
---
 .../devicetree/bindings/sound/wlf,wm8960.yaml | 88 +++++++++++++++++++
 .../devicetree/bindings/sound/wm8960.txt      | 42 ---------
 2 files changed, 88 insertions(+), 42 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/wlf,wm8960.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/wm8960.txt

diff --git a/Documentation/devicetree/bindings/sound/wlf,wm8960.yaml b/Documentation/devicetree/bindings/sound/wlf,wm8960.yaml
new file mode 100644
index 000000000000..ee8eba7f0104
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/wlf,wm8960.yaml
@@ -0,0 +1,88 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/wlf,wm8960.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Wolfson WM8960 audio codec
+
+maintainers:
+  - patches@opensource.cirrus.com
+
+properties:
+  compatible:
+    const: wlf,wm8960
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: mclk
+
+  '#sound-dai-cells':
+    const: 0
+
+  wlf,capless:
+    type: boolean
+    description:
+      If present, OUT3 pin will be enabled and disabled together with HP_L and
+      HP_R pins in response to jack detect events.
+
+  wlf,gpio-cfg:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    maxItems: 2
+    description: |
+      A list of GPIO configuration register values.
+       - gpio-cfg[0]: ALRCGPIO of R9 (Audio interface)
+       - gpio-cfg[1]: {GPIOPOL:GPIOSEL[2:0]} of R48 (Additional Control 4).
+
+  wlf,hp-cfg:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    maxItems: 3
+    description: |
+      A list of headphone jack detect configuration register values:
+       - hp-cfg[0]: HPSEL[1:0] of R48 (Additional Control 4).
+       - hp-cfg[1]: {HPSWEN:HPSWPOL} of R24 (Additional Control 2).
+       - hp-cfg[2]: {TOCLKSEL:TOEN} of R23 (Additional Control 1).
+
+  wlf,shared-lrclk:
+    type: boolean
+    description:
+      If present, the LRCM bit of R24 (Additional control 2) gets set,
+      indicating that ADCLRC and DACLRC pins will be disabled only when ADC
+      (Left and Right) and DAC (Left and Right) are disabled.
+      When WM8960 works on synchronize mode and DACLRC pin is used to supply
+      frame clock, it will no frame clock for captrue unless enable DAC to
+      enable DACLRC pin. If shared-lrclk is present, no need to enable DAC for
+      captrue.
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - $ref: dai-common.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        audio-codec@1a {
+            compatible = "wlf,wm8960";
+            reg = <0x1a>;
+            clocks = <&clks 0>;
+            clock-names = "mclk";
+            #sound-dai-cells = <0>;
+            wlf,hp-cfg = <3 2 3>;
+            wlf,gpio-cfg = <1 3>;
+            wlf,shared-lrclk;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/sound/wm8960.txt b/Documentation/devicetree/bindings/sound/wm8960.txt
deleted file mode 100644
index 85d3b287108c..000000000000
--- a/Documentation/devicetree/bindings/sound/wm8960.txt
+++ /dev/null
@@ -1,42 +0,0 @@
-WM8960 audio CODEC
-
-This device supports I2C only.
-
-Required properties:
-
-  - compatible : "wlf,wm8960"
-
-  - reg : the I2C address of the device.
-
-Optional properties:
-  - wlf,shared-lrclk: This is a boolean property. If present, the LRCM bit of
-	R24 (Additional control 2) gets set, indicating that ADCLRC and DACLRC pins
-	will be disabled only when ADC (Left and Right) and DAC (Left and Right)
-	are disabled.
-	When wm8960 works on synchronize mode and DACLRC pin is used to supply
-	frame clock, it will no frame clock for captrue unless enable DAC to enable
-	DACLRC pin. If shared-lrclk is present, no need to enable DAC for captrue.
-
-  - wlf,capless: This is a boolean property. If present, OUT3 pin will be
-	enabled and disabled together with HP_L and HP_R pins in response to jack
-	detect events.
-
-  - wlf,hp-cfg: A list of headphone jack detect configuration register values.
-		The list must be 3 entries long.
-		hp-cfg[0]: HPSEL[1:0] of R48 (Additional Control 4).
-		hp-cfg[1]: {HPSWEN:HPSWPOL} of R24 (Additional Control 2).
-		hp-cfg[2]: {TOCLKSEL:TOEN} of R23 (Additional Control 1).
-
-  - wlf,gpio-cfg: A list of GPIO configuration register values.
-		  The list must be 2 entries long.
-		  gpio-cfg[0]: ALRCGPIO of R9 (Audio interface)
-		  gpio-cfg[1]: {GPIOPOL:GPIOSEL[2:0]} of R48 (Additional Control 4).
-
-Example:
-
-wm8960: codec@1a {
-	compatible = "wlf,wm8960";
-	reg = <0x1a>;
-
-	wlf,shared-lrclk;
-};
-- 
2.34.1

