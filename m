Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B054F28504D
	for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Nov 2025 17:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763660223; cv=none; b=YTa4vqDdLOEfiuh3vFm+LftPY3tp5PRhYWthEvMU4ruD10hmSX34a0eFlsGiBwzQL4O3iKrJiRJsCeBw9xnZUlf1+REiEX0XzOAI1eQzcVPb+otdyBXZTK9i43ZJQpGUB9JapHahvqImEU6/YtDSwPNTN2/MytNW0GS0YZ3/C/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763660223; c=relaxed/simple;
	bh=/nlRAijHBYdsP293gnShy0fE1HhhnOtosa4NIMB2pDM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=uoRrtY9pz40/6/cjmV25KU8oivAW9IZ1hxIdW8qLzufp9KFO9ZnY4j6Ia+OCXWtlvWJ82xTIThtLLsxgl0egpjgePPTLU1pLSRW4tpl20EsZkqdC5W0LelTINnofV0wfskZk7bm+rvkcLwnBw3ezBUr1TTK/iZkPyKP2Y0eeHLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RugDmnNn; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RugDmnNn"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-7bf15b82042so1681092b3a.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Nov 2025 09:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763660220; x=1764265020; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UYKYFwNEQpdo2niOcoCQ+9hrIxMyptwAEyhO1F6F0P8=;
        b=RugDmnNnVcKu9ATOHbiHys5N9NJhye1tG//fVBIyKNA0YXtwwIiFYI18womJTi05EJ
         zv9l1tsW7IYaDTDztcmOrVsbz3vapJateb7YCpAHOgD223loNJrOm111/tMCscWlfu1y
         FkDhdL6a2lx1A+y0l0+UBtunT7eKYJ89+gSesmvYMmpaWK3+q0a/ttXLVm88IGqPwZvB
         sYzInGSAgkfJqi9Ujxqk3er6g4ofGAgTYez3EnHc1bIz3LAEb6n8ytOaPu+rqdDGDNWT
         SAl4/N1uLq3SJwX/hHc8/I3ICQpdZWNq/X9ecka2J/WiEllJxYVw2xQ5jfRpzs3mqJ5I
         XHKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763660220; x=1764265020;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UYKYFwNEQpdo2niOcoCQ+9hrIxMyptwAEyhO1F6F0P8=;
        b=MTCjgKAqHXnyTRuS+mzZbXLRz68nAtHNe+abSAtL8CwNLiL4Nqo+DsVdANLKpyzgLW
         SXAdB/wJp+CEDKsDCO/mdk93JNHz/MivObwtLpPT+1g7ZDadQ2ksH8c0yALCgxPsggCw
         757u3DKlEhK/3JN+XG28TZ2OWvYwqxLPOi4ZUDq7tnTp89X24lxvRsF8r+EFae7mGbuh
         RrnXvTeRUizH5a1Sm2Kz9w5KE6a8ZZOI9rhNwwYHM9SX4nwFjNg3tPHjTQ93kOkHRsXu
         9DX8p+HjKIq5xeg4uekHyaWVKkW0LcwO5FG2G7/S5+R87Rww5Eo5YGyz50eWD1Mlzwpb
         xgvA==
X-Forwarded-Encrypted: i=1; AJvYcCV4EnDmhAhUIOzbymllsgEWbdS9wTJvdZWLKhJNJHTbOJhQkKofUjXJj5VrrGbGIP5uLwwyK6Ipk41eS6h68DfxTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwimlfVf+NmtDU5kGz010Prpo068zStGckndr5Xo0exUsIM8ZOn
	0K01fptL9wvuky6g5cMeiMFierizvG+WHnQzTMhkvgWAtT5+b3v2KQHEjU9NgynGKyVVNT++/Lz
	EgqdkTw==
X-Google-Smtp-Source: AGHT+IEEioZM6++kQzrL7puAiFpulDJQBCemZP7kwWZkX+1d1todtDD+KaCy8lRZMXpYLS9GWuETJNyMVYY=
X-Received: from dlbay33.prod.google.com ([2002:a05:7022:6621:b0:11c:5640:3de5])
 (user=royluo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:1b12:b0:11a:26dc:eb61
 with SMTP id a92af1059eb24-11c95735ddamr930764c88.7.1763660219952; Thu, 20
 Nov 2025 09:36:59 -0800 (PST)
Date: Thu, 20 Nov 2025 17:36:41 +0000
In-Reply-To: <20251120-phyb4-v6-0-b6694e1f0caf@google.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251120-phyb4-v6-0-b6694e1f0caf@google.com>
X-Developer-Key: i=royluo@google.com; a=ed25519; pk=nTq1n8WcJActRWe1s8jdcy+TzpTK4a+IYRCIWvQfq5k=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763660216; l=5106;
 i=royluo@google.com; s=20251120; h=from:subject:message-id;
 bh=/nlRAijHBYdsP293gnShy0fE1HhhnOtosa4NIMB2pDM=; b=OtgUI8TiSQQ3qjNKPmkO1gps1OW2/r18VExz8XfJT1PK4cN6ccCF38j3DpneIPr20f3mpnhzi
 vk8owTmMP1VBy5WlDaRr9sItysw6vjqGt12AWl+7cMAteJ2RVHB/STz
X-Mailer: b4 0.14.2
Message-ID: <20251120-phyb4-v6-1-b6694e1f0caf@google.com>
Subject: [PATCH v6 1/2] dt-bindings: phy: google: Add Google Tensor G5 USB PHY
From: Roy Luo <royluo@google.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, 
	"=?utf-8?q?Andr=C3=A9_Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Badhri Jagan Sridharan <badhri@google.com>, Doug Anderson <dianders@google.com>, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, Joy Chakraborty <joychakr@google.com>, 
	Naveen Kumar <mnkumar@google.com>, Roy Luo <royluo@google.com>
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

Signed-off-by: Roy Luo <royluo@google.com>
---
 .../bindings/phy/google,lga-usb-phy.yaml           | 133 +++++++++++++++++++++
 1 file changed, 133 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/google,lga-usb-phy.yaml b/Documentation/devicetree/bindings/phy/google,lga-usb-phy.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..a0dd8e1afa56950b8371545e462db24cbb9a7959
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
+description: |
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
+        usb_phy: usb_phy@c410000 {
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

-- 
2.52.0.rc1.455.g30608eb744-goog

