Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC1A6C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  7 Jun 2022 08:54:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236520AbiFGIyG (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 7 Jun 2022 04:54:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238853AbiFGIxt (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 7 Jun 2022 04:53:49 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78FE1E15FF
        for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Jun 2022 01:53:47 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id n10so33802275ejk.5
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Jun 2022 01:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9z6WrFwb2fPXlQl3Uyym8/TioSfH3qqjKkRFpZGE28g=;
        b=qhsiWn7NWGHI1rEEL3xWQ3iES5hVECosmvK1IierJBoeDO0Dx/wYKX5UFNRVXZEb8z
         svuBwCCwRUpMel616GqqyT5+KzgcswKzIe1dXuwlZTtafjBV7K3DLfKx2CFuyRzKv2h7
         KJKuHjHez4pafG48WzeJ2XmOY8FIolXTh+n27xqPeeCY7Q+vjH0Mv5xS8T4O/KmanaNo
         7np3TLDZuBek270r5UHGV7CDjlY8jUn2QyTNJA9MR7HAqVwEYB81vjSgTqW1qikASxce
         yEKjNSBZeIQMorBWeKGjGK6hjojAuHI6xSxBpJLfTfaHLTW001kGUo3GfIrvLkoOyNgp
         5CNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9z6WrFwb2fPXlQl3Uyym8/TioSfH3qqjKkRFpZGE28g=;
        b=A359SsSS/ozYgmtlrx/hkBrSu09/PtBfcLhjZJddjVo2NqBoPPuti4mixT0berBFYr
         55r3olAhiJR05i7NUXP2R1RUP5DiClaWDqb6PybYEytbS+AuODe6MGkY3QmYYF1leB67
         gu6aCoVBqdkGra72oQfy09/fzCYoE2OX59M7mMIeH5SJ9MzJ+SPDYKqzdeJ21rMhbdfn
         ZEpTU+ce7vhGDiOYIP2uNrOtCCE2v2dhsDSc3NqgqLQTP0raVsxpA1q5pSgYP5x7R7Ix
         z0uzlvoV9x+0hNkB6DRamxUigaQnrEvRkNI/Sk6udKRjyAaZx4wXaBZ2l6bgT5mu77QT
         VtHw==
X-Gm-Message-State: AOAM532xnB8ToaZDp03myxtSYI+ZICNQF+iuH0BZtmUN3j+ty+iEZ8H/
        LTZcTGFvyKohEaV/vT0bs/Laow==
X-Google-Smtp-Source: ABdhPJwIZgnqzzbhzjlmEhZvB2RsAnSMQYSXIpeaomKW9o+4SvNwnoMf+SXfJ+psJEfcfXByw7jtdg==
X-Received: by 2002:a17:906:d195:b0:711:357a:d33d with SMTP id c21-20020a170906d19500b00711357ad33dmr13454683ejz.517.1654592025898;
        Tue, 07 Jun 2022 01:53:45 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id k16-20020a1709061c1000b00705cdfec71esm7176703ejg.7.2022.06.07.01.53.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 01:53:45 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/3] dt-bindings: leds: skyworks,aat1290: convert to dtschema
Date:   Tue,  7 Jun 2022 10:53:41 +0200
Message-Id: <20220607085343.72414-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Convert the Skyworks Solutions, Inc. AAT1290 Current Regulator bindings
to DT Schema.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/leds/leds-aat1290.txt | 77 ---------------
 .../bindings/leds/skyworks,aat1290.yaml       | 96 +++++++++++++++++++
 2 files changed, 96 insertions(+), 77 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-aat1290.txt
 create mode 100644 Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml

diff --git a/Documentation/devicetree/bindings/leds/leds-aat1290.txt b/Documentation/devicetree/bindings/leds/leds-aat1290.txt
deleted file mode 100644
index 62ed17ec075b..000000000000
--- a/Documentation/devicetree/bindings/leds/leds-aat1290.txt
+++ /dev/null
@@ -1,77 +0,0 @@
-* Skyworks Solutions, Inc. AAT1290 Current Regulator for Flash LEDs
-
-The device is controlled through two pins: FL_EN and EN_SET. The pins when,
-asserted high, enable flash strobe and movie mode (max 1/2 of flash current)
-respectively. In order to add a capability of selecting the strobe signal source
-(e.g. CPU or camera sensor) there is an additional switch required, independent
-of the flash chip. The switch is controlled with pin control.
-
-Required properties:
-
-- compatible : Must be "skyworks,aat1290".
-- flen-gpios : Must be device tree identifier of the flash device FL_EN pin.
-- enset-gpios : Must be device tree identifier of the flash device EN_SET pin.
-
-Optional properties:
-- pinctrl-names : Must contain entries: "default", "host", "isp". Entries
-		"default" and "host" must refer to the same pin configuration
-		node, which sets the host as a strobe signal provider. Entry
-		"isp" must refer to the pin configuration node, which sets the
-		ISP as a strobe signal provider.
-
-A discrete LED element connected to the device must be represented by a child
-node - see Documentation/devicetree/bindings/leds/common.txt.
-
-Required properties of the LED child node:
-- led-max-microamp : see Documentation/devicetree/bindings/leds/common.txt
-- flash-max-microamp : see Documentation/devicetree/bindings/leds/common.txt
-                       Maximum flash LED supply current can be calculated using
-                       following formula: I = 1A * 162kohm / Rset.
-- flash-max-timeout-us : see Documentation/devicetree/bindings/leds/common.txt
-                         Maximum flash timeout can be calculated using following
-                         formula: T = 8.82 * 10^9 * Ct.
-
-Optional properties of the LED child node:
-- function : see Documentation/devicetree/bindings/leds/common.txt
-- color : see Documentation/devicetree/bindings/leds/common.txt
-- label : see Documentation/devicetree/bindings/leds/common.txt (deprecated)
-
-Example (by Ct = 220nF, Rset = 160kohm and exynos4412-trats2 board with
-a switch that allows for routing strobe signal either from the host or from
-the camera sensor):
-
-#include "exynos4412.dtsi"
-#include <dt-bindings/leds/common.h>
-
-led-controller {
-	compatible = "skyworks,aat1290";
-	flen-gpios = <&gpj1 1 GPIO_ACTIVE_HIGH>;
-	enset-gpios = <&gpj1 2 GPIO_ACTIVE_HIGH>;
-
-	pinctrl-names = "default", "host", "isp";
-	pinctrl-0 = <&camera_flash_host>;
-	pinctrl-1 = <&camera_flash_host>;
-	pinctrl-2 = <&camera_flash_isp>;
-
-	camera_flash: led {
-		function = LED_FUNCTION_FLASH;
-		color = <LED_COLOR_ID_WHITE>;
-		led-max-microamp = <520833>;
-		flash-max-microamp = <1012500>;
-		flash-max-timeout-us = <1940000>;
-	};
-};
-
-&pinctrl_0 {
-	camera_flash_host: camera-flash-host {
-		samsung,pins = "gpj1-0";
-		samsung,pin-function = <1>;
-		samsung,pin-val = <0>;
-	};
-
-	camera_flash_isp: camera-flash-isp {
-		samsung,pins = "gpj1-0";
-		samsung,pin-function = <1>;
-		samsung,pin-val = <1>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml b/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml
new file mode 100644
index 000000000000..919ee0e30b10
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml
@@ -0,0 +1,96 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/skyworks,aat1290.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Skyworks Solutions, Inc. AAT1290 Current Regulator for Flash LEDs
+
+maintainers:
+  - Jacek Anaszewski <jacek.anaszewski@gmail.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
+
+description: |
+  The device is controlled through two pins:: FL_EN and EN_SET. The pins when,
+  asserted high, enable flash strobe and movie mode (max 1/2 of flash current)
+  respectively. In order to add a capability of selecting the strobe signal
+  source (e.g. CPU or camera sensor) there is an additional switch required,
+  independent of the flash chip. The switch is controlled with pin control.
+
+properties:
+  compatible:
+    const: skyworks,aat1290
+
+  enset-gpios:
+    maxItems: 1
+    description: EN_SET pin
+
+  flen-gpios:
+    maxItems: 1
+    description: FL_EN pin
+
+  led:
+    $ref: common.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      led-max-microamp: true
+
+      flash-max-microamp:
+        description: |
+          Maximum flash LED supply current can be calculated using following
+          formula:: I = 1A * 162 kOhm / Rset.
+
+      flash-max-timeout-us:
+        description: |
+          Maximum flash timeout can be calculated using following formula::
+            T = 8.82 * 10^9 * Ct.
+
+    required:
+      - flash-max-microamp
+      - flash-max-timeout-us
+      - led-max-microamp
+
+  pinctrl-names:
+    items:
+      - const: default
+      - const: host
+      - const: isp
+
+  pinctrl-0: true
+  pinctrl-1: true
+  pinctrl-2: true
+
+required:
+  - compatible
+  - enset-gpios
+  - flen-gpios
+  - led
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/leds/common.h>
+
+    // Ct = 220 nF, Rset = 160 kOhm
+    led-controller {
+        compatible = "skyworks,aat1290";
+        flen-gpios = <&gpj1 1 GPIO_ACTIVE_HIGH>;
+        enset-gpios = <&gpj1 2 GPIO_ACTIVE_HIGH>;
+
+        pinctrl-names = "default", "host", "isp";
+        pinctrl-0 = <&camera_flash_host>;
+        pinctrl-1 = <&camera_flash_host>;
+        pinctrl-2 = <&camera_flash_isp>;
+
+        led {
+            label = "flash";
+            function = LED_FUNCTION_FLASH;
+            color = <LED_COLOR_ID_WHITE>;
+            led-max-microamp = <520833>;
+            flash-max-microamp = <1012500>;
+            flash-max-timeout-us = <1940000>;
+        };
+    };
-- 
2.34.1

