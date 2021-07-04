Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76D33C07E95
	for <linux-samsung-soc@archiver.kernel.org>; Sun,  4 Jul 2021 09:05:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 645D160241
	for <linux-samsung-soc@archiver.kernel.org>; Sun,  4 Jul 2021 09:05:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229732AbhGDJH7 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 4 Jul 2021 05:07:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbhGDJH7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 4 Jul 2021 05:07:59 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70FE8C061764
        for <linux-samsung-soc@vger.kernel.org>; Sun,  4 Jul 2021 02:05:24 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id u14so15016192pga.11
        for <linux-samsung-soc@vger.kernel.org>; Sun, 04 Jul 2021 02:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Zfs9GH2yaBtMHWGozT8LK4EDRSgQ+jOLmdRPGev0590=;
        b=hokU7Y/0CfgaXcV0HQX7ATdBqtWrKnwP3DLSgmdh3IsBlE5dLGEufFkyVMqJfGFcHW
         XlXuTBLp0OJYLcGD5OPYev+l6+1SsEQ11msmeXTqCP69AY8U9zOQpc94kI23VHzC3zEF
         rwuLGFzO8kT+ceuT+OIAoBsi5ZvXX9kyNoyDg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Zfs9GH2yaBtMHWGozT8LK4EDRSgQ+jOLmdRPGev0590=;
        b=iTAVgAG9Xrx3ztqrfArmjYDFa0ue7TuM19E9Nagd1iojJFiLtwqwbjbEkmKA7yHyk6
         qVLhOfGcsDul/Z30vrGY7SrHv1+2jIiDOzlBg6lGXieXwF/gL1eq50R5esSU1pIj8S6j
         BTcVhxrW/r2vhmqO8jXmyMI3y4c4BT8iOPyQ2Xg6ONB9wmIOTgUguOdtHFq74wQve4a4
         FmE5iJDwO8YkM6h9Y5OKjQUNCeTCTMtaQUb+RhMQwqNlX1Bme+l+1c3ElOADMao4C7C6
         GnapMpjtZTOBY1+jrAjtVHpJkobUpW7IOAUfWLaQ+gaKMEBskaJFE0xoQsHt0Md3D/1l
         d8AQ==
X-Gm-Message-State: AOAM5320q0WZ8b0pU9NmlUT1zwUyiRGW/yJOoTZiX1v9PQ6l2JTQ2Lhr
        QAMjUdsFWDGWluEjYpgLTEA+4A==
X-Google-Smtp-Source: ABdhPJylFxgAaZUHAxrnfv37PiMrZYviDifzRPGliCtQwUUOVDI6SGf0gutg/rm0zOGwLGg9TQTw3A==
X-Received: by 2002:a65:684d:: with SMTP id q13mr3023080pgt.163.1625389524019;
        Sun, 04 Jul 2021 02:05:24 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a884:1ae9:772f:6f0f:3e24])
        by smtp.gmail.com with ESMTPSA id m24sm3360793pgd.60.2021.07.04.02.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jul 2021 02:05:23 -0700 (PDT)
From:   Jagan Teki <jagan@amarulasolutions.com>
To:     Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Marek Vasut <marex@denx.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Fabio Estevam <festevam@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: [RFC PATCH 12/17] dt-bindings: display: bridge: samsung,mipi-dsim: Add i.MX8MM support
Date:   Sun,  4 Jul 2021 14:32:25 +0530
Message-Id: <20210704090230.26489-13-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210704090230.26489-1-jagan@amarulasolutions.com>
References: <20210704090230.26489-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Samsung MIPI DSIM bridge can also be found in i.MX8MM SoC.

Add dt-bingings for it.

Cc: Rob Herring <robh+dt@kernel.org>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 .../display/bridge/samsung,mipi-dsim.yaml     | 84 ++++++++++++++++++-
 1 file changed, 83 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml b/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
index b2970734ffd7..bd12d5706291 100644
--- a/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
@@ -26,6 +26,7 @@ properties:
       - samsung,exynos5410-mipi-dsi
       - samsung,exynos5422-mipi-dsi
       - samsung,exynos5433-mipi-dsi
+      - fsl,imx8mm-mipi-dsim
 
   reg:
     maxItems: 1
@@ -39,6 +40,10 @@ properties:
   '#size-cells':
     const: 0
 
+  assigned-clock-parents: true
+  assigned-clock-rates: true
+  assigned-clocks: true
+
   clocks:
     minItems: 2
     maxItems: 5
@@ -102,7 +107,7 @@ properties:
         properties:
           endpoint@0:
             $ref: /schemas/graph.yaml#/properties/endpoint
-            description: sub-node describing the input from MIC
+            description: sub-node describing the input from MIC or LCDIF
 
         unevaluatedProperties: false
 
@@ -128,6 +133,30 @@ required:
 
 allOf:
   - $ref: ../dsi-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: fsl,imx8mm-mipi-dsim
+
+    then:
+      properties:
+        clocks:
+          minItems: 2
+
+        clock-names:
+          items:
+            - const: bus_clk
+            - const: sclk_mipi
+
+        ports:
+          required:
+            - port@0
+            - port@1
+
+      required:
+        - ports
+
   - if:
       properties:
         compatible:
@@ -221,6 +250,59 @@ additionalProperties:
   type: object
 
 examples:
+  - |
+    #include <dt-bindings/clock/imx8mm-clock.h>
+    #include <dt-bindings/power/imx8mm-power.h>
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    dsi@32e10000 {
+       compatible = "fsl,imx8mm-mipi-dsim";
+       reg = <0x32e10000 0x400>;
+       clocks = <&clk IMX8MM_CLK_DSI_CORE>,
+                <&clk IMX8MM_CLK_DSI_PHY_REF>;
+       clock-names = "bus_clk", "sclk_mipi";
+       assigned-clocks = <&clk IMX8MM_CLK_DSI_CORE>,
+                         <&clk IMX8MM_VIDEO_PLL1_OUT>,
+                         <&clk IMX8MM_CLK_DSI_PHY_REF>;
+       assigned-clock-parents = <&clk IMX8MM_SYS_PLL1_266M>,
+                         <&clk IMX8MM_VIDEO_PLL1_BYPASS>,
+                         <&clk IMX8MM_VIDEO_PLL1_OUT>;
+       assigned-clock-rates = <266000000>, <594000000>, <27000000>;
+       interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
+       phys = <&mipi_phy 0>;
+       phy-names = "dsim";
+       power-domains = <&dispmix_blk_ctl IMX8MM_BLK_CTL_PD_DISPMIX_MIPI_DSI>;
+       samsung,burst-clock-frequency = <891000000>;
+       samsung,esc-clock-frequency = <54000000>;
+       samsung,pll-clock-frequency = <27000000>;
+       status = "disabled";
+
+       ports {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          port@0 {
+             reg = <0>;
+             #address-cells = <1>;
+             #size-cells = <0>;
+
+             dsi_in_lcdif: endpoint@0 {
+                reg = <0>;
+                remote-endpoint = <&lcdif_out_dsi>;
+             };
+          };
+
+          port@1 {
+             reg = <1>;
+
+             dsi_out_panel: endpoint {
+                remote-endpoint = <&panel_in_dsi>;
+             };
+          };
+       };
+    };
+
   - |
     #include <dt-bindings/clock/exynos5433.h>
     #include <dt-bindings/gpio/gpio.h>
-- 
2.25.1

