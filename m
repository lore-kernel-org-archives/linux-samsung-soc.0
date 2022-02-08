Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79405C4167B
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  8 Feb 2022 17:19:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383768AbiBHRT3 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 8 Feb 2022 12:19:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1383850AbiBHRT2 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 8 Feb 2022 12:19:28 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBBCDC061578
        for <linux-samsung-soc@vger.kernel.org>; Tue,  8 Feb 2022 09:19:26 -0800 (PST)
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id BBB2D3F33A
        for <linux-samsung-soc@vger.kernel.org>; Tue,  8 Feb 2022 17:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1644340765;
        bh=4Kqc6L6Q9tC6aVZ4IcSd8iWDDGh3wUIB157CLAeaaFw=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=ibYGVrIRnBuFyQEKSCxKTgsyCSJoCMzWqOTLANyHjXssJZ5cnT8RQyfqnKthwY64u
         iUXhWZc+WrtyPUTkVXSd+DxbBZ+wCMbUQ0TmIhKpUw55PXwkXPP59u3nk5zo8HJYgQ
         TjYCsCevonIYzBvp322txMq791xpP1d3nRDANwDb7jq395To/CxWeTI0bFYdkT6Ash
         PhUbCol+zlEsG7KpdJHr0V3k4bi3lBQw/tITxoqXmjxiYM7vZPyC8j2Wtp8ivDIAgV
         eHvk9wZlZUzbkVpp+QiTp6TnA15mC4jUhh9uPNMjagzT76qx7x1qBncD79f4rHLgpw
         aHnreKzISvy9w==
Received: by mail-ej1-f71.google.com with SMTP id o4-20020a170906768400b006a981625756so6061728ejm.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 08 Feb 2022 09:19:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4Kqc6L6Q9tC6aVZ4IcSd8iWDDGh3wUIB157CLAeaaFw=;
        b=goy3cQMV/jUQgFA83SYVwh2F8Dxbj9Avc0++w8/lvBLGPRdtlA2yHs/9dF0gcWwhf7
         1AxEs9aH4k8I8S/M/wO4We1/sNpN7iL4PZGNc60NTo2GQByzZsfMP+hhYr1lDzlDdRaw
         k6LLuf3OJuHI2xVh7x5TxhyHa2oxgd609Sfe9q9kuTVGSChwT8IPbHs2V3IQH/aVoF9v
         TBQSHCKcjp9Se8/eeHb4viZ4VFta/nQhEFvwwibBsnh0pZtZYfMyshrd+T/8JOxDt4cX
         fwI6ZkGbwm2QPXNfNFf8Vs5GW+vi013LxB2qxNbeqTq4yZy1YZlvUD4CtrdzVlGH1C8w
         OD0Q==
X-Gm-Message-State: AOAM5326zQ17FYDaTPbIReYoj+g99wv9grqmbXA/8X/4k/42nY+AFz5G
        VqxBw/LzWCqKkTTtm5RZEABYD7au/eQoGllKqTRrXuohQ/d7JisFt8rVGputIjx3MRmXPitguId
        kusvxx+7bFIGtFu7FthZ/8k5hAxHPhXvMOUVfn0dOLTsXzW2P
X-Received: by 2002:a05:6402:510b:: with SMTP id m11mr5597636edd.290.1644340765078;
        Tue, 08 Feb 2022 09:19:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxRZNXcZzMs0TAC2gPdxKPihRqli2IMBZU42Ls1ax0iChpkOJ4tgyVxzgjOsC0cDw2k6wkGXQ==
X-Received: by 2002:a05:6402:510b:: with SMTP id m11mr5597617edd.290.1644340764811;
        Tue, 08 Feb 2022 09:19:24 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id r10sm5125550ejy.148.2022.02.08.09.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 09:19:24 -0800 (PST)
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
Subject: [PATCH 10/10] dt-bindings: display: samsung,exynos-fimd: convert to dtschema
Date:   Tue,  8 Feb 2022 18:18:23 +0100
Message-Id: <20220208171823.226211-11-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220208171823.226211-1-krzysztof.kozlowski@canonical.com>
References: <20220208171823.226211-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Convert the S3C/S5P/Exynos FIMD bindings to DT schema format.

The conversion includes also updates to the bindings, matching the
current DTS and Linux driver: adding optional iommus and power-domains.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../bindings/display/exynos/samsung-fimd.txt  | 107 ----------
 .../display/samsung/samsung,fimd.yaml         | 198 ++++++++++++++++++
 2 files changed, 198 insertions(+), 107 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/exynos/samsung-fimd.txt
 create mode 100644 Documentation/devicetree/bindings/display/samsung/samsung,fimd.yaml

diff --git a/Documentation/devicetree/bindings/display/exynos/samsung-fimd.txt b/Documentation/devicetree/bindings/display/exynos/samsung-fimd.txt
deleted file mode 100644
index b3096421d42b..000000000000
--- a/Documentation/devicetree/bindings/display/exynos/samsung-fimd.txt
+++ /dev/null
@@ -1,107 +0,0 @@
-Device-Tree bindings for Samsung SoC display controller (FIMD)
-
-FIMD (Fully Interactive Mobile Display) is the Display Controller for the
-Samsung series of SoCs which transfers the image data from a video memory
-buffer to an external LCD interface.
-
-Required properties:
-- compatible: value should be one of the following
-		"samsung,s3c2443-fimd"; /* for S3C24XX SoCs */
-		"samsung,s3c6400-fimd"; /* for S3C64XX SoCs */
-		"samsung,s5pv210-fimd"; /* for S5PV210 SoC */
-		"samsung,exynos3250-fimd"; /* for Exynos3250/3472 SoCs */
-		"samsung,exynos4210-fimd"; /* for Exynos4 SoCs */
-		"samsung,exynos5250-fimd"; /* for Exynos5250 SoCs */
-		"samsung,exynos5420-fimd"; /* for Exynos5420/5422/5800 SoCs */
-
-- reg: physical base address and length of the FIMD registers set.
-
-- interrupts: should contain a list of all FIMD IP block interrupts in the
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
-               property. Must contain "sclk_fimd" and "fimd".
-
-Optional Properties:
-- power-domains: a phandle to FIMD power domain node.
-- samsung,invert-vden: video enable signal is inverted
-- samsung,invert-vclk: video clock signal is inverted
-- display-timings: timing settings for FIMD, as described in document [1].
-		Can be used in case timings cannot be provided otherwise
-		or to override timings provided by the panel.
-- samsung,sysreg: handle to syscon used to control the system registers
-- i80-if-timings: timing configuration for lcd i80 interface support.
-  - cs-setup: clock cycles for the active period of address signal is enabled
-              until chip select is enabled.
-              If not specified, the default value(0) will be used.
-  - wr-setup: clock cycles for the active period of CS signal is enabled until
-              write signal is enabled.
-              If not specified, the default value(0) will be used.
-  - wr-active: clock cycles for the active period of CS is enabled.
-               If not specified, the default value(1) will be used.
-  - wr-hold: clock cycles for the active period of CS is disabled until write
-             signal is disabled.
-             If not specified, the default value(0) will be used.
-
-  The parameters are defined as:
-
-    VCLK(internal)  __|??????|_____|??????|_____|??????|_____|??????|_____|??
-                      :            :            :            :            :
-    Address Output  --:<XXXXXXXXXXX:XXXXXXXXXXXX:XXXXXXXXXXXX:XXXXXXXXXXXX:XX
-                      | cs-setup+1 |            :            :            :
-                      |<---------->|            :            :            :
-    Chip Select     ???????????????|____________:____________:____________|??
-                                   | wr-setup+1 |            | wr-hold+1  |
-                                   |<---------->|            |<---------->|
-    Write Enable    ????????????????????????????|____________|???????????????
-                                                | wr-active+1|
-                                                |<---------->|
-    Video Data      ----------------------------<XXXXXXXXXXXXXXXXXXXXXXXXX>--
-
-The device node can contain 'port' child nodes according to the bindings defined
-in [2]. The following are properties specific to those nodes:
-- reg: (required) port index, can be:
-		0 - for CAMIF0 input,
-		1 - for CAMIF1 input,
-		2 - for CAMIF2 input,
-		3 - for parallel output,
-		4 - for write-back interface
-
-[1]: Documentation/devicetree/bindings/display/panel/display-timing.txt
-[2]: Documentation/devicetree/bindings/media/video-interfaces.txt
-
-Example:
-
-SoC specific DT entry:
-
-	fimd@11c00000 {
-		compatible = "samsung,exynos4210-fimd";
-		interrupt-parent = <&combiner>;
-		reg = <0x11c00000 0x20000>;
-		interrupt-names = "fifo", "vsync", "lcd_sys";
-		interrupts = <11 0>, <11 1>, <11 2>;
-		clocks = <&clock 140>, <&clock 283>;
-		clock-names = "sclk_fimd", "fimd";
-		power-domains = <&pd_lcd0>;
-		status = "disabled";
-	};
-
-Board specific DT entry:
-
-	fimd@11c00000 {
-		pinctrl-0 = <&lcd_clk &lcd_data24 &pwm1_out>;
-		pinctrl-names = "default";
-		status = "okay";
-	};
diff --git a/Documentation/devicetree/bindings/display/samsung/samsung,fimd.yaml b/Documentation/devicetree/bindings/display/samsung/samsung,fimd.yaml
new file mode 100644
index 000000000000..9cf5f120d516
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/samsung/samsung,fimd.yaml
@@ -0,0 +1,198 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/samsung/samsung,fimd.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S3C/S5P/Exynos SoC Fully Interactive Mobile Display (FIMD)
+
+maintainers:
+  - Inki Dae <inki.dae@samsung.com>
+  - Joonyoung Shim <jy0922.shim@samsung.com>
+  - Seung-Woo Kim <sw0312.kim@samsung.com>
+  - Kyungmin Park <kyungmin.park@samsung.com>
+  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+
+properties:
+  compatible:
+    enum:
+      - samsung,s3c2443-fimd
+      - samsung,s3c6400-fimd
+      - samsung,s5pv210-fimd
+      - samsung,exynos3250-fimd
+      - samsung,exynos4210-fimd
+      - samsung,exynos5250-fimd
+      - samsung,exynos5420-fimd
+
+  '#address-cells':
+    const: 1
+
+  clocks:
+    minItems: 2
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: sclk_fimd
+      - const: fimd
+
+  display-timings:
+    $ref: ../panel/display-timings.yaml#
+
+  i80-if-timings:
+    type: object
+    description: |
+      Timing configuration for lcd i80 interface support.
+      The parameters are defined as::
+      VCLK(internal)  __|??????|_____|??????|_____|??????|_____|??????|_____|??
+                        :            :            :            :            :
+      Address Output  --:<XXXXXXXXXXX:XXXXXXXXXXXX:XXXXXXXXXXXX:XXXXXXXXXXXX:XX
+                        | cs-setup+1 |            :            :            :
+                        |<---------->|            :            :            :
+      Chip Select     ???????????????|____________:____________:____________|??
+                                     | wr-setup+1 |            | wr-hold+1  |
+                                     |<---------->|            |<---------->|
+      Write Enable    ????????????????????????????|____________|???????????????
+                                                  | wr-active+1|
+                                                  |<---------->|
+      Video Data      ----------------------------<XXXXXXXXXXXXXXXXXXXXXXXXX>--
+
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
+  iommus:
+    minItems: 1
+    maxItems: 2
+
+  iommu-names:
+    items:
+      - const: m0
+      - const: m1
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
+  samsung,invert-vden:
+    type: boolean
+    description:
+      Video enable signal is inverted.
+
+  samsung,invert-vclk:
+    type: boolean
+    description:
+      Video clock signal is inverted.
+
+  samsung,sysreg:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to System Register syscon.
+
+  '#size-cells':
+    const: 0
+
+patternProperties:
+  "^port@[0-4]+$":
+    $ref: /schemas/graph.yaml#/properties/port
+    description: |
+      Contains ports with port with index::
+       0 - for CAMIF0 input,
+       1 - for CAMIF1 input,
+       2 - for CAMIF2 input,
+       3 - for parallel output,
+       4 - for write-back interface
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+  - interrupts
+  - interrupt-names
+  - reg
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos5420-fimd
+    then:
+      properties:
+        iommus:
+          minItems: 2
+          maxItems: 2
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/exynos4.h>
+
+    fimd@11c00000 {
+        compatible = "samsung,exynos4210-fimd";
+        interrupt-parent = <&combiner>;
+        reg = <0x11c00000 0x20000>;
+        interrupt-names = "fifo", "vsync", "lcd_sys";
+        interrupts = <11 0>, <11 1>, <11 2>;
+        clocks = <&clock CLK_SCLK_FIMD0>, <&clock CLK_FIMD0>;
+        clock-names = "sclk_fimd", "fimd";
+        power-domains = <&pd_lcd0>;
+        iommus = <&sysmmu_fimd0>;
+        samsung,sysreg = <&sys_reg>;
+
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        samsung,invert-vden;
+        samsung,invert-vclk;
+
+        pinctrl-0 = <&lcd_clk>, <&lcd_data24>;
+        pinctrl-names = "default";
+
+        port@3 {
+            reg = <3>;
+
+            fimd_dpi_ep: endpoint {
+                remote-endpoint = <&lcd_ep>;
+            };
+        };
+    };
-- 
2.32.0

