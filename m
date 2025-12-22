Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E152FF664
	for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Dec 2025 21:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766439106; cv=none; b=hZas+ITcYE7ZXmST5LANbzH9eYII+0W3AOD76I3Y7+6RtQaFbvijMxpy0rTxuVKAdtwxpPkZPnjybRm4pWxRI2Sz5lmdwPGcm4T+pGnzJQ9coooTyNZIMlCPiQTDwPBTwS/H0xIjmFraO0nt5WDzHNZmqBgDALKnktFoJu3Ne/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766439106; c=relaxed/simple;
	bh=V/MthuzjpdgySHPr4fd3G1SYz+Sz3GXYCBSx4+Jrmds=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CV21HM0BJr4nDgn07Le0aFCBFh2SEkJAxzGlYu+Z7dGM+c1j3UdnAwaNYlSVFcBXwN+vGU76cSLWyzKjQ/PUI/ecCd0sJNdpyVOWanh4YRKQGyYEIxZnKu9N31K6bMQ/tODvONpW88qhBKZHxvm1oe1Qbwojjea+kDt+mx6m1/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UYs/tITM; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UYs/tITM"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-bb27b422cf2so7668441a12.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Dec 2025 13:31:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766439104; x=1767043904; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=gVF2WomVdPFzNIoefnUCnz93OVDZpJzBA0U6XyUPFKk=;
        b=UYs/tITM0+5NjptcuHP+pCUxVrhhiQ6sFAefllx0pJkb9muw7nJxxoKPd0jfy8F72x
         qFspDV/BQLs1SaHnr2zXagE4jHSNOsSEnRpVGHXWO0TSMBoueOYEhtjuNH+whgN4rii8
         YyOVxySsCaB1epclZoKCvAgLyMSOMOyQhtIDUEpL1feF+aSz85USUHLbazlfiALsFohZ
         36XXioqnUZa4ZTGhUkLXY+rrLvArH51R/89Pdq5/1WrYgY/rMk4Tt2ux1zAERBFBk4wj
         YoWhzox1ubZPgND9VEFsps/VFOnBVZ3/BKo6saZqpTOSfjYszYul49Vvqr4ryp6l+jsU
         +wtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766439104; x=1767043904;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gVF2WomVdPFzNIoefnUCnz93OVDZpJzBA0U6XyUPFKk=;
        b=n3/PVEHsvGQ4V1x205WJ6kubQJtE7wA4iWawF1aZocFIcF3dpZcbTPN7GIMpGrdnQ8
         nlac/q9ZlfK5+6IaM599noSF3R9wiAI+noSslRL6zKbRLJiOu0eq3861c445nY9TZ+C6
         e/gh4UwmBZMdm2Hp95Ks/5EnzOV4hKhDQNyioA76cG0DiNSUpv/uj7yf1F5CLZzo29TZ
         zG1dhdPDHDdCVsGw3p+Z/oCNYVXA1A83txDDt6Vkyrvsyb+vbUEu61TZftjDFRJHqQmK
         vsbz5bdOodZmwx8fvD2HXmsc+85y8d7W7OFfS7DOh5zLYThmn3vob5kpbz9X+x8LFOtW
         CAPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkqmW++aw8IV4RxffESfyHx/kc5RTHBYd66fXrwofMGUTyzwcYYyy7EsXhSjrq3UmJIqCjQn1JDQGUXngbZpY+GQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6FF0NiwdUgLMgl4U9Zd/PlcjPFsbo3EBH3s2Q1OKnc/hAIbiF
	qfNzHeQr830wmME0kVoUWPE0AfmnoTYatqZym4gkpnhmyTDCiBnmTBwj7tH9TCiVznrNBs3tnRN
	FrC3+IQ==
X-Google-Smtp-Source: AGHT+IEadse2H2MBU5amRT0HmVakvYhU12erWvzXxONZUG4g9KJkyb2AnDvGW+Q4/OY40rrIvihJgmg3uXM=
X-Received: from dybqr5.prod.google.com ([2002:a05:7301:6085:b0:2ae:5b73:d751])
 (user=royluo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:e008:b0:2ae:5b9d:63ef
 with SMTP id 5a478bee46e88-2b05ebb2f43mr7833481eec.12.1766439104201; Mon, 22
 Dec 2025 13:31:44 -0800 (PST)
Date: Mon, 22 Dec 2025 21:31:26 +0000
In-Reply-To: <20251222-phyb4-v9-0-82c0b671b070@google.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251222-phyb4-v9-0-82c0b671b070@google.com>
X-Developer-Key: i=royluo@google.com; a=ed25519; pk=nTq1n8WcJActRWe1s8jdcy+TzpTK4a+IYRCIWvQfq5k=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766439100; l=5832;
 i=royluo@google.com; s=20251120; h=from:subject:message-id;
 bh=V/MthuzjpdgySHPr4fd3G1SYz+Sz3GXYCBSx4+Jrmds=; b=C8VFwpL/N7rzYa8Hq9kAJZRSHbCDiUqw/Y25LIYyJCo/9pt5NOTi8xLYRxQ8CciWUq6fZksOI
 K8yXP3jhB/ZAShqN8WpZGJg5vcvkJVy5+wBtbfJ3irC1fwxlXqc+LZ1
X-Mailer: b4 0.14.2
Message-ID: <20251222-phyb4-v9-1-82c0b671b070@google.com>
Subject: [PATCH v9 1/2] dt-bindings: phy: google: Add Google Tensor G5 USB PHY
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
index 5b11839cba9de1e9e43f63787578edd8c429ca39..8a2e94be2f5c5e6e7315bb7bec385798dbd52493 100644
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

