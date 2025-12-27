Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3BF622256F
	for <linux-samsung-soc@vger.kernel.org>; Sat, 27 Dec 2025 00:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766796833; cv=none; b=Fnr6g5hmcvEZ3EOXV3IwTuZ3JtMrkxWkfeaeM3xaUiVS8dUHwVqQxo9X9VcWiW+kHekzO9lCElgtPojRKRdzUWOMlQ8rJvVw1igcYcBdGKPv6lGAqIA1NpnY9LGjIBfW5IsvpgDCyHAunM2uyaGDVMR0s4bq/O9cee1C+GWLDXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766796833; c=relaxed/simple;
	bh=yO5DAcUjBQX68ofPNIg3Y07ecCOxCD4cuKyrN6eAnIg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PxBQM83bVYeBymuoWDgGQ7H5BhD/COPSr0DqqmfkxS6pLYJEAu6CHCMsWWyQpY7R4Oz+7hzojNP/wLX0KZ9lOoHift4hJWGfsVO99D9o9gi8pUf76W/+y2r4EMQ2imfkxwjLRnNm6Y27xzaldpBYN8/6w7FytEGY3T1OcvKAdrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ylPGDwqV; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ylPGDwqV"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2a0f0c7a06eso153398465ad.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Dec 2025 16:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766796830; x=1767401630; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LlaDIAdKGeeEE97V6RgS1GwSBK9EgzDYZZe0KxdpZdU=;
        b=ylPGDwqVHjTX+He83KUeRLnk1WCj7I8353OfRjo3YfKQmsjz5XTrsCivDixizLQYfE
         DqeteFi0jYewL5uVds4zzY8zZSld9gsbdO1bt5ICJz79pGPL5kt3xCQkLQ3VATFJi/7P
         uawPdTdqcCv8xDDSCTteoczmpADAyUW2JJQLnIGWPLwSFzoV2p50iqPweD3g/l5pjJo3
         MUDMjx65iScg9IVAkPup1naTiGSbf9lSSEQ9hA0hKFNtzN+7WjvCt/Yx+10/ofR1lki+
         TRCuL/a8s4mnyZBkQdsUQK0uH6gm+7j8Z4rg3aHK4F3+XB/BNCvf1Cifga3fnOvfUt/v
         hvoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766796830; x=1767401630;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LlaDIAdKGeeEE97V6RgS1GwSBK9EgzDYZZe0KxdpZdU=;
        b=oTVAfbu+hcNJPEzqBw91lP90MW4gg0rIzGNQelD1ewxeULspC2+5aHb0eux2h48leJ
         rGBsC8EjK9Qzi2G1BpEga0DX3FePk6Qofifjgd/oZ8Q/JwMDogoOHTuyxrriKyOpckdG
         sq0e0IWvrt90IoJd9VLZ9whbYTTucMydfSUXyQk+uJyD9QHMyUY/uNF4Pr7QmnQR04eI
         QjemOaz6W4trFzmurfEaMx2fO3tRTFnEstBwYROrl3QmAhEDL8KrBv3B6/FY8UIwVdwo
         b6VnwyDoKj4XoUUtdg9xQzJ6b1s0z61numChFhOXGST2Esqz4dr/rwnOZJKSdgopAfEZ
         xAZg==
X-Forwarded-Encrypted: i=1; AJvYcCUcp21CFlMeIOAMl8SJpATxkVPdaB/fYKtombmh0RCRplegQYQOtdLaWcNzqdQfEZuNraqNUleYUI2rHFm4fuDPnw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi3MFTD/CgQkbxYKsJTaUX6DfxROv46QXeB//lp/QCvYyWhN3S
	+1XpjDAFNcXFD1I5FDFmSlWc1WHwHOge32fj3y2innipzYv3XJ74/if6k0r7fO1o/odXyn18fiV
	DkDqIQw==
X-Google-Smtp-Source: AGHT+IFdXmCN0u4mwRWY3qy77Zh8cuuoKlVEaOOUO4nfVPcIZQQ2y2aoetI8D8XkJwqZNnz/tP4uXOVy3WM=
X-Received: from dlbcm20.prod.google.com ([2002:a05:7022:6894:b0:11d:cde5:d78e])
 (user=royluo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:f68e:b0:11a:641f:ba11
 with SMTP id a92af1059eb24-121722eaec0mr21209839c88.29.1766796829667; Fri, 26
 Dec 2025 16:53:49 -0800 (PST)
Date: Sat, 27 Dec 2025 00:53:28 +0000
In-Reply-To: <20251227-phyb4-v10-0-e8caf6b93fe7@google.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251227-phyb4-v10-0-e8caf6b93fe7@google.com>
X-Developer-Key: i=royluo@google.com; a=ed25519; pk=nTq1n8WcJActRWe1s8jdcy+TzpTK4a+IYRCIWvQfq5k=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766796826; l=5832;
 i=royluo@google.com; s=20251120; h=from:subject:message-id;
 bh=yO5DAcUjBQX68ofPNIg3Y07ecCOxCD4cuKyrN6eAnIg=; b=Y9mnKBfrv2Vcz5viNwaqvzFo0OcadQFfBlwicMDic3XcsdlvHf2j/Zc1UrCHcX4KE0QZ8RFVc
 tLvF/umZnhyAR7TNQ8DTLJ+IiLk5BiNX2R+QBBw43H3ZLBuu8ukVw1u
X-Mailer: b4 0.14.2
Message-ID: <20251227-phyb4-v10-1-e8caf6b93fe7@google.com>
Subject: [PATCH v10 1/2] dt-bindings: phy: google: Add Google Tensor G5 USB PHY
From: Roy Luo <royluo@google.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, 
	"=?utf-8?q?Andr=C3=A9_Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: Badhri Jagan Sridharan <badhri@google.com>, Doug Anderson <dianders@google.com>, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, Joy Chakraborty <joychakr@google.com>, 
	Naveen Kumar <mnkumar@google.com>, Roy Luo <royluo@google.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="utf-8"

Document the device tree bindings for the USB PHY interfaces integrated
with the DWC3 controller on Google Tensor SoCs, starting with G5
generation (Laguna). The USB PHY on Tensor G5 includes two integrated
Synopsys PHY IPs: the eUSB 2.0 PHY IP and the USB 3.2/DisplayPort combo
PHY IP.

Due to a complete architectural overhaul in the Google Tensor G5, the
existing Samsung/Exynos USB PHY binding for older generations of Google
silicons such as gs101 are no longer compatible, necessitating this new
device tree binding.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Roy Luo <royluo@google.com>
---
 .../bindings/phy/google,lga-usb-phy.yaml           | 133 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 2 files changed, 134 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/google,lga-usb-phy.yaml b/Documentation/devicetree/bindings/phy/google,lga-usb-phy.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..427e2e3425f645f40c0813e29d6efe4f62b20609
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/google,lga-usb-phy.yaml
@@ -0,0 +1,133 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2025, Google LLC
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/google,lga-usb-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Google Tensor Series G5 (Laguna) USB PHY
+
+maintainers:
+  - Roy Luo <royluo@google.com>
+
+description:
+  Describes the USB PHY interfaces integrated with the DWC3 USB controller on
+  Google Tensor SoCs, starting with the G5 generation (laguna).
+  Two specific PHY IPs from Synopsys are integrated, including eUSB 2.0 PHY IP
+  and USB3.2/DisplayPort combo PHY IP.
+
+properties:
+  compatible:
+    const: google,lga-usb-phy
+
+  reg:
+    items:
+      - description: USB3.2/DisplayPort combo PHY core registers.
+      - description: USB3.2/DisplayPort combo PHY Type-C Assist registers.
+      - description: eUSB 2.0 PHY core registers.
+      - description: Top-level wrapper registers for the integrated PHYs.
+
+  reg-names:
+    items:
+      - const: usb3_core
+      - const: usb3_tca
+      - const: usb2_core
+      - const: usbdp_top
+
+  "#phy-cells":
+    description: |
+      The phandle's argument in the PHY specifier selects one of the three
+      following PHY interfaces.
+      - 0 for USB high-speed.
+      - 1 for USB super-speed.
+      - 2 for DisplayPort.
+    const: 1
+
+  clocks:
+    items:
+      - description: USB2 PHY clock.
+      - description: USB2 PHY APB clock.
+      - description: USB3.2/DisplayPort combo PHY clock.
+      - description: USB3.2/DisplayPort combo PHY firmware clock.
+
+  clock-names:
+    items:
+      - const: usb2
+      - const: usb2_apb
+      - const: usb3
+      - const: usb3_fw
+
+  resets:
+    items:
+      - description: USB2 PHY reset.
+      - description: USB2 PHY APB reset.
+      - description: USB3.2/DisplayPort combo PHY reset.
+
+  reset-names:
+    items:
+      - const: usb2
+      - const: usb2_apb
+      - const: usb3
+
+  power-domains:
+    maxItems: 1
+
+  orientation-switch:
+    type: boolean
+    description:
+      Indicates the PHY as a handler of USB Type-C orientation changes
+
+  google,usb-cfg-csr:
+    description:
+      A phandle to a syscon node used to access the USB configuration
+      registers. These registers are the top-level wrapper of the USB
+      subsystem and provide control and status for the integrated USB
+      controller and USB PHY.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to the syscon node.
+          - description: USB2 PHY configuration register offset.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - "#phy-cells"
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - power-domains
+  - orientation-switch
+  - google,usb-cfg-csr
+
+additionalProperties: false
+
+examples:
+  - |
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        usb-phy@c410000 {
+            compatible = "google,lga-usb-phy";
+            reg = <0 0x0c410000 0 0x20000>,
+                  <0 0x0c430000 0 0x1000>,
+                  <0 0x0c440000 0 0x10000>,
+                  <0 0x0c637000 0 0xa0>;
+            reg-names = "usb3_core", "usb3_tca", "usb2_core", "usbdp_top";
+            #phy-cells = <1>;
+            clocks = <&hsion_usb2_phy_clk>, <&hsion_u2phy_apb_clk>,
+                     <&hsion_usb3_phy_clk>, <&hsion_usb3_phy_fw_clk>;
+            clock-names = "usb2", "usb2_apb", "usb3", "usb3_fw";
+            resets = <&hsion_resets_usb2_phy>,
+                     <&hsion_resets_u2phy_apb>,
+                     <&hsion_resets_usb3_phy>;
+            reset-names = "usb2", "usb2_apb", "usb3";
+            power-domains = <&hsio_n_usb_pd>;
+            orientation-switch;
+            google,usb-cfg-csr = <&usb_cfg_csr 0x14>;
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index dc731d37c8feeff25613c59fe9c929927dadaa7e..faedcf6994e0be0c29c03dc424ca86bc9a1bbd70 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10721,6 +10721,7 @@ S:	Maintained
 P:	Documentation/process/maintainer-soc-clean-dts.rst
 C:	irc://irc.oftc.net/pixel6-kernel-dev
 F:	Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
+F:	Documentation/devicetree/bindings/phy/google,lga-usb-phy.yaml
 F:	Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
 F:	arch/arm64/boot/dts/exynos/google/
 F:	drivers/clk/samsung/clk-gs101.c

-- 
2.52.0.358.g0dd7633a29-goog

