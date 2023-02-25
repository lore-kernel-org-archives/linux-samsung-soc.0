Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CA41C64EC7
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 25 Feb 2023 16:03:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229567AbjBYQDD (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 25 Feb 2023 11:03:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229507AbjBYQDD (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 25 Feb 2023 11:03:03 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 162CB10AB5
        for <linux-samsung-soc@vger.kernel.org>; Sat, 25 Feb 2023 08:03:01 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id p26so1649753wmc.4
        for <linux-samsung-soc@vger.kernel.org>; Sat, 25 Feb 2023 08:03:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dY5QkGaNbdQhkrm/R09T7pM9MLXR4hJxvYcs/q4usnM=;
        b=OXK61ifrJ2LDcTLhKwZwHS7GafV9cHK0ZEZm7BDGGqDpzCS9U1W0FiMFkQXeyYnZ1+
         dRnzcj66RDyYJzO2ATVrkwA1filfnUL0cmGUy82O7S62NSskOK/N8/DjhZTQf6A3RGuq
         4rZUyXepp6ef9PK3VkmNgMVyby+YEqV6EKGa2cFyz4FvW+4NevAlhvP7nESiU11U3B8m
         DbBjC0yRXt/Js9m85MjI+IIezEW5PObxZni8lBXQDfxVYA3Rj4AuSk8Eqlb/zyP0cuvL
         88316GnunEUxPwQa/Xzr28irhYyzzygOJojp74+Z4WgMovhZ8Lpyzty7/LjCRnrb8t2N
         MS9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dY5QkGaNbdQhkrm/R09T7pM9MLXR4hJxvYcs/q4usnM=;
        b=c9yYa7WUXGnGjOaqAuoNP5r+tTAHn4ZSYxG4SMkvH8NSTAg3fCks3vZf1RtKQTo68k
         bkc4m0eU/bKZI+E53fYXOI732O6vSSKjxsQTJ4W3Y4xpc+d2cCj0yG6EU2tlPNXU3vpy
         ODWy8XIb9IFvsUb7MqNL2HXHYh7enwz4JIAekMlTiO0oLuiqw6VFZPsCGsw+GYaPI6MI
         MJr3nHef6wsn3ZzS4HciGrubYU+iDM/B4w+/jRfCenaP+g8uhrjhdncyM50EmZJypW3/
         f104C9Lki4wIMZUvEowlqFqK+AwutnjEANDfS1eP0OGksiKBl44aceHK34On2I2MJHrD
         jezA==
X-Gm-Message-State: AO0yUKWvtz9xamnrLR2fOEWFvgIOiFc33si9OlUUnnCmrE2QdGo6LFXk
        dFfp3cpE/sRVJFUd4aYj4ZnU0g==
X-Google-Smtp-Source: AK7set/ewIkpDOoWCTgaHZjfcxbX2NC+BMDb9ytrUWeSn1tmD5qUQXGcVFEqswzPcYIcahYCVcsH8A==
X-Received: by 2002:a05:600c:331b:b0:3eb:2da4:f32d with SMTP id q27-20020a05600c331b00b003eb2da4f32dmr3609378wmp.26.1677340979559;
        Sat, 25 Feb 2023 08:02:59 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id fc19-20020a05600c525300b003e215a796fasm3266868wmb.34.2023.02.25.08.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Feb 2023 08:02:59 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] dt-bindings: display/bridge: toshiba,tc358764: convert to dtschema
Date:   Sat, 25 Feb 2023 17:02:51 +0100
Message-Id: <20230225160252.18737-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Convert the Toshiba TC358764 bridge bindings to DT schema.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../display/bridge/toshiba,tc358764.txt       | 35 --------
 .../display/bridge/toshiba,tc358764.yaml      | 89 +++++++++++++++++++
 2 files changed, 89 insertions(+), 35 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/bridge/toshiba,tc358764.txt
 create mode 100644 Documentation/devicetree/bindings/display/bridge/toshiba,tc358764.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358764.txt b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358764.txt
deleted file mode 100644
index 8f9abf28a8fa..000000000000
--- a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358764.txt
+++ /dev/null
@@ -1,35 +0,0 @@
-TC358764 MIPI-DSI to LVDS panel bridge
-
-Required properties:
-  - compatible: "toshiba,tc358764"
-  - reg: the virtual channel number of a DSI peripheral
-  - vddc-supply: core voltage supply, 1.2V
-  - vddio-supply: I/O voltage supply, 1.8V or 3.3V
-  - vddlvds-supply: LVDS1/2 voltage supply, 3.3V
-  - reset-gpios: a GPIO spec for the reset pin
-
-The device node can contain following 'port' child nodes,
-according to the OF graph bindings defined in [1]:
-  0: DSI Input, not required, if the bridge is DSI controlled
-  1: LVDS Output, mandatory
-
-[1]: Documentation/devicetree/bindings/media/video-interfaces.txt
-
-Example:
-
-	bridge@0 {
-		reg = <0>;
-		compatible = "toshiba,tc358764";
-		vddc-supply = <&vcc_1v2_reg>;
-		vddio-supply = <&vcc_1v8_reg>;
-		vddlvds-supply = <&vcc_3v3_reg>;
-		reset-gpios = <&gpd1 6 GPIO_ACTIVE_LOW>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		port@1 {
-			reg = <1>;
-			lvds_ep: endpoint {
-				remote-endpoint = <&panel_ep>;
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358764.yaml b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358764.yaml
new file mode 100644
index 000000000000..866607400514
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358764.yaml
@@ -0,0 +1,89 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/toshiba,tc358764.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Toshiba TC358764 MIPI-DSI to LVDS bridge
+
+maintainers:
+  - Andrzej Hajda <andrzej.hajda@intel.com>
+
+properties:
+  compatible:
+    const: toshiba,tc358764
+
+  reg:
+    description: Virtual channel number of a DSI peripheral
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+
+  vddc-supply:
+    description: Core voltage supply, 1.2V
+
+  vddio-supply:
+    description: I/O voltage supply, 1.8V or 3.3V
+
+  vddlvds-supply:
+    description: LVDS1/2 voltage supply, 3.3V
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Video port for MIPI DSI input, if the bridge DSI controlled
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Video port for LVDS output (panel or connector).
+
+    required:
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+  - vddc-supply
+  - vddio-supply
+  - vddlvds-supply
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        bridge@0 {
+            compatible = "toshiba,tc358764";
+            reg = <0>;
+
+            reset-gpios = <&gpd1 6 GPIO_ACTIVE_LOW>;
+            vddc-supply = <&vcc_1v2_reg>;
+            vddio-supply = <&vcc_1v8_reg>;
+            vddlvds-supply = <&vcc_3v3_reg>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@1 {
+                    reg = <1>;
+                    lvds_ep: endpoint {
+                      remote-endpoint = <&panel_ep>;
+                    };
+                };
+            };
+        };
+    };
-- 
2.34.1

