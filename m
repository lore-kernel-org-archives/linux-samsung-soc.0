Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2502FC43219
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  8 Feb 2022 17:19:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383499AbiBHRTZ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 8 Feb 2022 12:19:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352669AbiBHRTW (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 8 Feb 2022 12:19:22 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7306C0613CA
        for <linux-samsung-soc@vger.kernel.org>; Tue,  8 Feb 2022 09:19:18 -0800 (PST)
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 6E2EE4004C
        for <linux-samsung-soc@vger.kernel.org>; Tue,  8 Feb 2022 17:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1644340757;
        bh=xz+e2Key3mN9wN61xdroLJbkY7yAPV1tZJHM8lGcmj4=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=luCaGGDJauHTYulIzxh1oWS5W8+JXEagn3vJNY2FxKr8gkQX7dqRkJJMe3E1VWe8Z
         Eq9Jz+7nCDUcst4Q61kFocM5eUYvgB8MxXyV6HLrpi13saI7PaT97z9ubEEhijLQRp
         WLJiazsfkZvV8cHykwg079fcEkUv4HA8mQgDULYte/5Z+R0f83OY1cpLq84XRqMv8p
         Mg2VhlSvDID1N9PSJGS2KBfJlrUxO2SlM7BQzR0a+2fPWDWJao8k9aDuR1ZnIfa+GA
         Z+7Isc51SN2d0m3pgD8AELLtbACRfZndnyGdlXtIZQtW8/MVITTueBDpeSt4absCX5
         2ksjnnD16tuEA==
Received: by mail-ej1-f71.google.com with SMTP id la22-20020a170907781600b006a7884de505so6041700ejc.7
        for <linux-samsung-soc@vger.kernel.org>; Tue, 08 Feb 2022 09:19:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xz+e2Key3mN9wN61xdroLJbkY7yAPV1tZJHM8lGcmj4=;
        b=D78L9Itqvr9wFlvFQ9DCUtFKXnF2as+U4rTOvZqRBUZCeyLgCZ/uHuwSv7swHFm2G4
         WCaj0VkB8MRJU8ZfZjcXZ3CgtNUjK0CNeCIXsl7rVC5qh3uTUZ+t/qoZt913WenzgzbC
         KGKCAK5Gj4+5CHZFOLF5MM17sCUMTbggUMthMAxpl71fgL1tjHaf/6oER90TefOQiR32
         BgYe6b49HRBCIljkZpM3tYUpJYqmFAXI17Pt7j8kWj+6W1KqyCt+YunuYzRznCjN8Oz2
         5EEyEzdwLGD/Dg/cM7AbF5HxmEp2cyp4FoYYuuyESpVSWUcqP9Iv4PTqIa8c6OaYX2jR
         XSfw==
X-Gm-Message-State: AOAM530QAGApSZFqdaJ3ZxG844HzlwLbacmi2du12imrKuXMm8lL3g1C
        t5Tbw3F6vqkpRwWL9JwCUC6aV9grBopqmDCllAZRuuQsnMhOVFWjcGPbuH8004UUBh1beenq+Iq
        jLANCtV8PzPTWj0PC0em3nFkpgRjxQxcVHHULg1BIEHK8o4NR
X-Received: by 2002:a17:906:3d72:: with SMTP id r18mr4481089ejf.111.1644340756991;
        Tue, 08 Feb 2022 09:19:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzQyCyrqP/YqXHfEAo7IFUzQx4++eo+ig8qWHqbf9DAruggxjPaZtPMpWwxC0+hH1p/f+OZFQ==
X-Received: by 2002:a17:906:3d72:: with SMTP id r18mr4481063ejf.111.1644340756736;
        Tue, 08 Feb 2022 09:19:16 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id r10sm5125550ejy.148.2022.02.08.09.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 09:19:16 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>
Subject: [PATCH 05/10] dt-bindings: display: samsung,exynos7-decon: convert to dtschema
Date:   Tue,  8 Feb 2022 18:18:18 +0100
Message-Id: <20220208171823.226211-6-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220208171823.226211-1-krzysztof.kozlowski@canonical.com>
References: <20220208171823.226211-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Convert the Exynos7 DECON display controller bindings to DT schema
format.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../bindings/display/exynos/exynos7-decon.txt |  65 ----------
 .../samsung/samsung,exynos7-decon.yaml        | 120 ++++++++++++++++++
 2 files changed, 120 insertions(+), 65 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/exynos/exynos7-decon.txt
 create mode 100644 Documentation/devicetree/bindings/display/samsung/samsung,exynos7-decon.yaml

diff --git a/Documentation/devicetree/bindings/display/exynos/exynos7-decon.txt b/Documentation/devicetree/bindings/display/exynos/exynos7-decon.txt
deleted file mode 100644
index 53912c99ec38..000000000000
--- a/Documentation/devicetree/bindings/display/exynos/exynos7-decon.txt
+++ /dev/null
@@ -1,65 +0,0 @@
-Device-Tree bindings for Samsung Exynos7 SoC display controller (DECON)
-
-DECON (Display and Enhancement Controller) is the Display Controller for the
-Exynos7 series of SoCs which transfers the image data from a video memory
-buffer to an external LCD interface.
-
-Required properties:
-- compatible: value should be "samsung,exynos7-decon";
-
-- reg: physical base address and length of the DECON registers set.
-
-- interrupts: should contain a list of all DECON IP block interrupts in the
-		 order: FIFO Level, VSYNC, LCD_SYSTEM. The interrupt specifier
-		 format depends on the interrupt controller used.
-
-- interrupt-names: should contain the interrupt names: "fifo", "vsync",
-	"lcd_sys", in the same order as they were listed in the interrupts
-        property.
-
-- pinctrl-0: pin control group to be used for this controller.
-
-- pinctrl-names: must contain a "default" entry.
-
-- clocks: must include clock specifiers corresponding to entries in the
-         clock-names property.
-
-- clock-names: list of clock names sorted in the same order as the clocks
-               property. Must contain "pclk_decon0", "aclk_decon0",
-	       "decon0_eclk", "decon0_vclk".
-- i80-if-timings: timing configuration for lcd i80 interface support.
-
-Optional Properties:
-- power-domains: a phandle to DECON power domain node.
-- display-timings: timing settings for DECON, as described in document [1].
-		Can be used in case timings cannot be provided otherwise
-		or to override timings provided by the panel.
-
-[1]: Documentation/devicetree/bindings/display/panel/display-timing.txt
-
-Example:
-
-SoC specific DT entry:
-
-	decon@13930000 {
-		compatible = "samsung,exynos7-decon";
-		interrupt-parent = <&combiner>;
-		reg = <0x13930000 0x1000>;
-		interrupt-names = "lcd_sys", "vsync", "fifo";
-		interrupts = <0 188 0>, <0 189 0>, <0 190 0>;
-		clocks = <&clock_disp PCLK_DECON_INT>,
-			 <&clock_disp ACLK_DECON_INT>,
-			 <&clock_disp SCLK_DECON_INT_ECLK>,
-			 <&clock_disp SCLK_DECON_INT_EXTCLKPLL>;
-		clock-names = "pclk_decon0", "aclk_decon0", "decon0_eclk",
-				"decon0_vclk";
-		status = "disabled";
-	};
-
-Board specific DT entry:
-
-	decon@13930000 {
-		pinctrl-0 = <&lcd_clk &pwm1_out>;
-		pinctrl-names = "default";
-		status = "okay";
-	};
diff --git a/Documentation/devicetree/bindings/display/samsung/samsung,exynos7-decon.yaml b/Documentation/devicetree/bindings/display/samsung/samsung,exynos7-decon.yaml
new file mode 100644
index 000000000000..afa137d47922
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/samsung/samsung,exynos7-decon.yaml
@@ -0,0 +1,120 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/samsung/samsung,exynos7-decon.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung Exynos7 SoC Display and Enhancement Controller (DECON)
+
+maintainers:
+  - Inki Dae <inki.dae@samsung.com>
+  - Joonyoung Shim <jy0922.shim@samsung.com>
+  - Seung-Woo Kim <sw0312.kim@samsung.com>
+  - Kyungmin Park <kyungmin.park@samsung.com>
+  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+
+description: |
+  DECON (Display and Enhancement Controller) is the Display Controller for the
+  Exynos7 series of SoCs which transfers the image data from a video memory
+  buffer to an external LCD interface.
+
+properties:
+  compatible:
+    const: samsung,exynos7-decon
+
+  clocks:
+    minItems: 4
+    maxItems: 4
+
+  clock-names:
+    items:
+      - const: pclk_decon0
+      - const: aclk_decon0
+      - const: decon0_eclk
+      - const: decon0_vclk
+
+  display-timings:
+    $ref: ../panel/display-timings.yaml#
+
+  i80-if-timings:
+    type: object
+    description: timing configuration for lcd i80 interface support
+    properties:
+      cs-setup:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Clock cycles for the active period of address signal is enabled until
+          chip select is enabled.
+        default: 0
+
+      wr-active:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Clock cycles for the active period of CS is enabled.
+        default: 1
+
+      wr-hold:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Clock cycles for the active period of CS is disabled until write
+          signal is disabled.
+        default: 0
+
+      wr-setup:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Clock cycles for the active period of CS signal is enabled until
+          write signal is enabled.
+        default: 0
+
+  interrupts:
+    items:
+      - description: FIFO level
+      - description: VSYNC
+      - description: LCD system
+
+  interrupt-names:
+    items:
+      - const: fifo
+      - const: vsync
+      - const: lcd_sys
+
+  power-domains:
+    maxItems: 1
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+  - interrupts
+  - interrupt-names
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/exynos7-clk.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    display-controller@13930000 {
+        compatible = "samsung,exynos7-decon";
+        reg = <0x13930000 0x1000>;
+        interrupt-names = "fifo", "vsync", "lcd_sys";
+        interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clock_disp 100>, /* PCLK_DECON_INT */
+                 <&clock_disp 101>, /* ACLK_DECON_INT */
+                 <&clock_disp 102>, /* SCLK_DECON_INT_ECLK */
+                 <&clock_disp 103>; /* SCLK_DECON_INT_EXTCLKPLL */
+        clock-names = "pclk_decon0",
+                      "aclk_decon0",
+                      "decon0_eclk",
+                      "decon0_vclk";
+        pinctrl-0 = <&lcd_clk &pwm1_out>;
+        pinctrl-names = "default";
+    };
-- 
2.32.0

