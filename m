Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2626D6F533
	for <linux-samsung-soc@vger.kernel.org>; Wed, 13 Mar 2024 18:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710354079; cv=none; b=hnKUg4Rxfa3cV6tL/5hCmdM3sz7TSLwf/TQX8FasLimoSw5roxvevScj5+8Kua7kN7Ujqrijf1HInF21JlsWqrgEhIQ1ZwKk++KBHlFFoNox2q0Y9xYvXKKVOE/OkOVVD3HDbirkB1zCbKI/vXtFWlmf+FsxuPEk5+DzX4eozK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710354079; c=relaxed/simple;
	bh=N0pWrZyQXrTMiGtBwdpPCskwTIccqQFj9gl2+9UdKi4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cz0Z3I3CNxGcIdcBuVgXASsqUlL6BEk1GXDPKiKEqMtPISGUyOaX9pZXuq829qspRMEIyLntw58GfC0XXa3X2ZWhD4MLfJ65Dmx9Dlrwn98dWD/C5ZqSxEEf42jJ9ud0sFQqsbUTWQ7g2HcEzqtWv0biyCa8VtSwET2VDl2NJ4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aMZyKlNf; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aMZyKlNf"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-33e82c720f8so79716f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 13 Mar 2024 11:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710354074; x=1710958874; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6om7OCpDfnkdw/VSs/QMebeECIcaK8bcG7xAOFS/8ys=;
        b=aMZyKlNfVNglczypgL2a21gBKtzGAtV5DAB1aGG9qTp0klUlSKuHgZCnDJG7Sw3xyr
         9XmGaCJRnXP2iHbmzkwe0Nei5Usauytts6Bj5fDSCm/ueU2/poPw7Wn+SQnfjvwBkNr4
         mzmpViYnBxz6RptJI08yxwXI7pQf3wBNtNdFc1aGjOgz0zBD48A9bQOsqVll2/grQl8W
         9+ca4p5NDd73gjNU3Octg2idV/5dAFs1oMbLfVcjGEhoDjNx3rnTmufgHQ+qdA50Vxi6
         UHUGez9UlE0jS2PSwZMQcr4qpyKfg9mO6FNBAhI39yjb9iWZIoau1Gw5NeKOWplsoISn
         km1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710354074; x=1710958874;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6om7OCpDfnkdw/VSs/QMebeECIcaK8bcG7xAOFS/8ys=;
        b=ZHSoLQx6xMMpDC8vOApBbZ1AMe4vys/I9si9KFktDwBKVP4F83tuYapkA0489ntVPT
         rSg/URumLQkr25LtlzLdegi802rOVNonxAW0v7/9foG0cfYt9QfJNBRX7nDkosB1Dq8C
         FOAetmK5KDyZoNQrZ3KtVXbzWCWxHP/9l/97Ka8L23bLmCT6wYlkH7Ij7XPNSPd7RbpG
         6B11b6oknztdeRjsQXtrCZ0xVfSC4+NqD/F0rEQCaeKT5NLnpHVoJycvXPXGLHPRz5iQ
         /pTA9MSjK/ZYTVpBFPIHE0RmjJt1DNO+hkCPPK9Nm9wLujzPF9x0ihdh7VNE2FM9Fz/W
         +pPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGUjyTQBkZf+qYbQ69hb+5vKg9UsYXG84anbCC+MXYdPxogWzCqlPfjXhtzZPPtHgc1WFhXrw+/NfXWQouB4am0c7ZFKjMmI1hW745av0/Bps=
X-Gm-Message-State: AOJu0Yws/J6PEqUBOeswI3iRw9BjDQUn0eodRuyfUXZDjlQj24mpCqVD
	1VlcRasF6aWDLY4JgckMUsk71jEbq2cSg4/IGNOdOjhD0DGsFE3dGOWTEYhev90=
X-Google-Smtp-Source: AGHT+IFMrRVOk317baIYag+ylVYYi/NIeJlRZwlC5NfJro2DkXXq8GsZwmxjKwOeCmQki0tbMmpxnQ==
X-Received: by 2002:a05:600c:450c:b0:413:1285:6e40 with SMTP id t12-20020a05600c450c00b0041312856e40mr576503wmo.20.1710354074410;
        Wed, 13 Mar 2024 11:21:14 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id v6-20020a05600c444600b00412f83e0c11sm3024337wmn.22.2024.03.13.11.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 11:21:13 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: display: samsung,exynos5-dp: convert to DT Schema
Date: Wed, 13 Mar 2024 19:21:08 +0100
Message-Id: <20240313182108.12458-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert Samsung Exynos5250/5420 SoC Display Port Controller bindings to
DT schema with changes:
1. Drop samsung,hpd-gpio, because it is not used by Linux driver.
   Existing usage in DTS is going to be fixed.
2. Add power-domains, already used in DTS.

This Display Port controller is actually variant of Analogix Display
Port bridge, however new DT Schema does not reference analogix,dp.yaml,
because of incompatibilities in the driver.  The analogix,dp.yaml
expects two ports, input and output, but Linux Exynos DP DRM driver and
DTS use only one port: output.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/display/exynos/exynos_dp.txt     | 112 ------------
 .../display/samsung/samsung,exynos5-dp.yaml   | 159 ++++++++++++++++++
 2 files changed, 159 insertions(+), 112 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/exynos/exynos_dp.txt
 create mode 100644 Documentation/devicetree/bindings/display/samsung/samsung,exynos5-dp.yaml

diff --git a/Documentation/devicetree/bindings/display/exynos/exynos_dp.txt b/Documentation/devicetree/bindings/display/exynos/exynos_dp.txt
deleted file mode 100644
index 3a401590320f..000000000000
--- a/Documentation/devicetree/bindings/display/exynos/exynos_dp.txt
+++ /dev/null
@@ -1,112 +0,0 @@
-The Exynos display port interface should be configured based on
-the type of panel connected to it.
-
-We use two nodes:
-	-dp-controller node
-	-dptx-phy node(defined inside dp-controller node)
-
-For the DP-PHY initialization, we use the dptx-phy node.
-Required properties for dptx-phy: deprecated, use phys and phy-names
-	-reg: deprecated
-		Base address of DP PHY register.
-	-samsung,enable-mask: deprecated
-		The bit-mask used to enable/disable DP PHY.
-
-For the Panel initialization, we read data from dp-controller node.
-Required properties for dp-controller:
-	-compatible:
-		should be "samsung,exynos5-dp".
-	-reg:
-		physical base address of the controller and length
-		of memory mapped region.
-	-interrupts:
-		interrupt combiner values.
-	-clocks:
-		from common clock binding: handle to dp clock.
-	-clock-names:
-		from common clock binding: Shall be "dp".
-	-phys:
-		from general PHY binding: the phandle for the PHY device.
-	-phy-names:
-		from general PHY binding: Should be "dp".
-
-Optional properties for dp-controller:
-	-interlaced:
-		interlace scan mode.
-			Progressive if defined, Interlaced if not defined
-	-vsync-active-high:
-		VSYNC polarity configuration.
-			High if defined, Low if not defined
-	-hsync-active-high:
-		HSYNC polarity configuration.
-			High if defined, Low if not defined
-	-samsung,hpd-gpio:
-		Hotplug detect GPIO.
-			Indicates which GPIO should be used for hotplug
-			detection
-	-video interfaces: Device node can contain video interface port
-			nodes according to [1].
-	- display-timings: timings for the connected panel as described by
-		Documentation/devicetree/bindings/display/panel/display-timing.txt
-
-For the below properties, please refer to Analogix DP binding document:
- * Documentation/devicetree/bindings/display/bridge/analogix,dp.yaml
-	-phys (required)
-	-phy-names (required)
-	-hpd-gpios (optional)
-	 force-hpd (optional)
-
-Deprecated properties for DisplayPort:
--interlaced:            deprecated prop that can parsed from drm_display_mode.
--vsync-active-high:     deprecated prop that can parsed from drm_display_mode.
--hsync-active-high:     deprecated prop that can parsed from drm_display_mode.
--samsung,ycbcr-coeff:   deprecated prop that can parsed from drm_display_mode.
--samsung,dynamic-range: deprecated prop that can parsed from drm_display_mode.
--samsung,color-space:   deprecated prop that can parsed from drm_display_info.
--samsung,color-depth:   deprecated prop that can parsed from drm_display_info.
--samsung,link-rate:     deprecated prop that can reading from monitor by dpcd method.
--samsung,lane-count:    deprecated prop that can reading from monitor by dpcd method.
--samsung,hpd-gpio:      deprecated name for hpd-gpios.
-
--------------------------------------------------------------------------------
-
-Example:
-
-SOC specific portion:
-	dp-controller {
-		compatible = "samsung,exynos5-dp";
-		reg = <0x145b0000 0x10000>;
-		interrupts = <10 3>;
-		interrupt-parent = <&combiner>;
-		clocks = <&clock 342>;
-		clock-names = "dp";
-
-		phys = <&dp_phy>;
-		phy-names = "dp";
-	};
-
-Board Specific portion:
-	dp-controller {
-		display-timings {
-			native-mode = <&lcd_timing>;
-			lcd_timing: 1366x768 {
-				clock-frequency = <70589280>;
-				hactive = <1366>;
-				vactive = <768>;
-				hfront-porch = <40>;
-				hback-porch = <40>;
-				hsync-len = <32>;
-				vback-porch = <10>;
-				vfront-porch = <12>;
-				vsync-len = <6>;
-			};
-		};
-
-		ports {
-			port@0 {
-				dp_out: endpoint {
-					remote-endpoint = <&bridge_in>;
-				};
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/display/samsung/samsung,exynos5-dp.yaml b/Documentation/devicetree/bindings/display/samsung/samsung,exynos5-dp.yaml
new file mode 100644
index 000000000000..daf90cda453e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/samsung/samsung,exynos5-dp.yaml
@@ -0,0 +1,159 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/samsung/samsung,exynos5-dp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung Exynos5250/Exynos5420 SoC Display Port
+
+maintainers:
+  - Inki Dae <inki.dae@samsung.com>
+  - Seung-Woo Kim <sw0312.kim@samsung.com>
+  - Kyungmin Park <kyungmin.park@samsung.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
+
+properties:
+  compatible:
+    const: samsung,exynos5-dp
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: dp
+
+  display-timings:
+    $ref: /schemas/display/panel/display-timings.yaml#
+
+  interrupts:
+    maxItems: 1
+
+  hpd-gpios:
+    description:
+      Hotplug detect GPIO.
+      Indicates which GPIO should be used for hotplug detection
+
+  phys:
+    maxItems: 1
+
+  phy-names:
+    items:
+      - const: dp
+
+  power-domains:
+    maxItems: 1
+
+  interlaced:
+    type: boolean
+    deprecated: true
+    description:
+      Interlace scan mode. Progressive if defined, interlaced if not defined.
+
+  vsync-active-high:
+    type: boolean
+    deprecated: true
+    description:
+      VSYNC polarity configuration. High if defined, low if not defined
+
+  hsync-active-high:
+    type: boolean
+    deprecated: true
+    description:
+      HSYNC polarity configuration. High if defined, low if not defined
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Port node with one endpoint connected to a dp-connector node.
+
+    required:
+      - port
+
+  samsung,ycbcr-coeff:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    deprecated: true
+    description:
+      Deprecated prop that can parsed from drm_display_mode.
+
+  samsung,dynamic-range:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    deprecated: true
+    description:
+      Deprecated prop that can parsed from drm_display_mode.
+
+  samsung,color-space:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    deprecated: true
+    description:
+      Deprecated prop that can parsed from drm_display_info.
+
+  samsung,color-depth:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    deprecated: true
+    description:
+      Deprecated prop that can parsed from drm_display_info.
+
+  samsung,link-rate:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    deprecated: true
+    description:
+      Deprecated prop that can reading from monitor by dpcd method.
+
+  samsung,lane-count:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    deprecated: true
+    description:
+      Deprecated prop that can reading from monitor by dpcd method.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - phys
+  - phy-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/exynos5250.h>
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    dp-controller@145b0000 {
+        compatible = "samsung,exynos5-dp";
+        reg = <0x145b0000 0x1000>;
+        clocks = <&clock CLK_DP>;
+        clock-names = "dp";
+        interrupts = <10 3>;
+        interrupt-parent = <&combiner>;
+        phys = <&dp_phy>;
+        phy-names = "dp";
+        pinctrl-0 = <&dp_hpd>;
+        pinctrl-names = "default";
+        power-domains = <&pd_disp1>;
+
+        samsung,color-space = <0>;
+        samsung,color-depth = <1>;
+        samsung,link-rate = <0x0a>;
+        samsung,lane-count = <2>;
+        hpd-gpios = <&gpx0 7 GPIO_ACTIVE_HIGH>;
+
+        ports {
+            port {
+                dp_out: endpoint {
+                    remote-endpoint = <&bridge_in>;
+                };
+            };
+        };
+    };
-- 
2.34.1

