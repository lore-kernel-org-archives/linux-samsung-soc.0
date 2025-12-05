Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C47F2E0934
	for <linux-samsung-soc@vger.kernel.org>; Fri,  5 Dec 2025 02:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764901634; cv=none; b=KKjfJWyfbi7ijYfmm4EP396Bq8/QXlVcHY57InMk9S6drgl3DBnrJluhYwKlxjKWjlgxnHppWy0nrs5SI+xpTX4hZjdfE5De64yJlAnaU3b9eed9bZYcRYJgXTBTXvvZUyA0BqkpxpucaBcrm6IVeQCz8/V0d4T/UJpG/0hXCD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764901634; c=relaxed/simple;
	bh=3hhHYv63VxhT7YPcfGEaAxZVxTD9R5oA1GqPr8KMQc4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jbqtnvT0gvRt/qpV4CWU4qNrGXeWQvxZiOnMjBefgVQlYo6iFUISOR6yKRR06LLa5Fc9mfkQGM8kElbCtOit8391I7f1sU/Mlv6qePfAFOG1UE16YhkU8rOwqcSQhsCQzRKMIOt7ZHMkqjvHsYUvmtyEJPxHUtKHAhCBH5Vn5lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Y3Kz5CMb; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Y3Kz5CMb"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-bf493d248baso2629585a12.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 04 Dec 2025 18:27:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764901632; x=1765506432; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=oVsk9a4aQdQP/c0wiqQ2Q1y0yBOFK98goZ8NXwTr67U=;
        b=Y3Kz5CMbALUAz43iOiNJo013bY2W0UFfZZOvgI5OjYKN01fbNx64QFdqEhgrv8B0Gx
         LTc0e8OwHPstCdsLfsllumnDYmQN72PcNAFO8vjXnV4C6djlJx+YFHF2dZDHQiw9mXxQ
         Jjlv+BAQ2q1yYItJLIt29fLbIgO46hr2Q4vIhw+wO88dRQBAHyK78sqIVJMhwqzR08ZD
         Q/TNt5wh55Ud0yANv+8eyry4ZfHplg1QZ6wWiz89qfspfqU543NBnGmDQn9otKPFJzMg
         tQ3vMZoFXWY3b4zEWOl5HQ29x/O3ZqKDyAE3OmUR6wezH3AFYZi837KSv00bsOPJKj4B
         DDFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764901632; x=1765506432;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oVsk9a4aQdQP/c0wiqQ2Q1y0yBOFK98goZ8NXwTr67U=;
        b=G/JEnHBlJj2zUQRMp2heDYWeWEHRvzgE1CyDvx+c1U4xuAGgNbxtTQc4LoIzeE5pFQ
         EUQYNq2QwTdxSgloY28NovVhDyrrZPUUVI0Utf0lv/pQMy688APU74npOnSDjFnubMPw
         hGkJ1urM+ccR9gKrMVjUXuecufL527r2TzUqyMnxavWq641ZIBhJZTLeLPAzqJym+v10
         xwya0uVdw+2jZSkMyd4GTpm28q5xijjm4TZ12ciSXYlo3VHZaF9GlYfYdsGEkZRw48Qr
         +8j7PNFB/av9zoOXGNN8umHOG0V15ZxEL0Mi/cdfZ2Z5gbr+i7X5vfJDc24wbgILPEyQ
         G7lw==
X-Forwarded-Encrypted: i=1; AJvYcCXzfuPkGaK6r53U7QgkrUtJ2suDQ2pewxqliP/wBV50MWEKxUY7F2g+8tvW4+PJS2W0I2gW/84IyC1u2pQ2UG4ExQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCAC/Rm/LcInfU+RqpVe705K3pR68FIbbtF4T35EIiIILGbxcy
	H/nAjP+JQhfbQMg989cLYoE28MdZW6WF5a5HJnEvV5kmeg0z4YrmN5q43E42KioQDoe+izwZWLD
	DFUgdFw==
X-Google-Smtp-Source: AGHT+IEPujoJ3nijE+UqlwXNbstczzvGNxfQoJRnqNmmihX0qo9/DsjtAnrBM7LUxRhHcAfRSSm82bbjemA=
X-Received: from dycez10.prod.google.com ([2002:a05:7301:578a:b0:2a4:6419:6f8f])
 (user=royluo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:2488:b0:2a4:3594:d53f
 with SMTP id 5a478bee46e88-2ab92d8f85emr4542702eec.12.1764901631556; Thu, 04
 Dec 2025 18:27:11 -0800 (PST)
Date: Fri, 05 Dec 2025 02:26:37 +0000
In-Reply-To: <20251205-controller-v9-0-9f158b18f979@google.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251205-controller-v9-0-9f158b18f979@google.com>
X-Developer-Key: i=royluo@google.com; a=ed25519; pk=nTq1n8WcJActRWe1s8jdcy+TzpTK4a+IYRCIWvQfq5k=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764901627; l=6281;
 i=royluo@google.com; s=20251120; h=from:subject:message-id;
 bh=3hhHYv63VxhT7YPcfGEaAxZVxTD9R5oA1GqPr8KMQc4=; b=X+Mmk4FeGOhfMhy3L7+g85WOJSOD525U7Su4modzWcFDzTegotJtp3xSt9mi3WcADxbzW85m5
 eqOouITL98UC6XLEJNdo4Pn0qHmM7OAHu23OXf8iZtI3UO9QC2CS0Pr
X-Mailer: b4 0.14.2
Message-ID: <20251205-controller-v9-1-9f158b18f979@google.com>
Subject: [PATCH v9 1/2] dt-bindings: usb: dwc3: Add Google Tensor G5 DWC3
From: Roy Luo <royluo@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, 
	"=?utf-8?q?Andr=C3=A9_Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Badhri Jagan Sridharan <badhri@google.com>, Doug Anderson <dianders@google.com>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>, Roy Luo <royluo@google.com>
Content-Type: text/plain; charset="utf-8"

Document the device tree bindings for the DWC3 USB controller found in
Google Tensor SoCs, starting with the G5 generation (codename: laguna).

The Tensor G5 silicon represents a complete architectural departure from
previous generations (like gs101), including entirely new clock/reset
schemes, top-level wrapper and register interface. Consequently,
existing Samsung/Exynos DWC3 USB bindings are incompatible, necessitating
this new device tree binding.

The USB controller on Tensor G5 is based on Synopsys DWC3 IP and features
Dual-Role Device single port with hibernation support.

Signed-off-by: Roy Luo <royluo@google.com>
---
 .../devicetree/bindings/usb/google,lga-dwc3.yaml   | 140 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 2 files changed, 141 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/google,lga-dwc3.yaml b/Documentation/devicetree/bindings/usb/google,lga-dwc3.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..95be84c843f5da0e80ef5ef1ac9193019b5eb2a0
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/google,lga-dwc3.yaml
@@ -0,0 +1,140 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright (c) 2025, Google LLC
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/google,lga-dwc3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Google Tensor Series G5 (Laguna) DWC3 USB SoC Controller
+
+maintainers:
+  - Roy Luo <royluo@google.com>
+
+description:
+  Describes the DWC3 USB controller block implemented on Google Tensor SoCs,
+  starting with the G5 generation (laguna). Based on Synopsys DWC3 IP, the
+  controller features Dual-Role Device single port with hibernation add-on.
+
+properties:
+  compatible:
+    const: google,lga-dwc3
+
+  reg:
+    items:
+      - description: Core DWC3 IP registers.
+
+  interrupts:
+    items:
+      - description: Core DWC3 interrupt.
+      - description: High speed power management event for remote wakeup.
+      - description: Super speed power management event for remote wakeup.
+
+  interrupt-names:
+    items:
+      - const: core
+      - const: hs_pme
+      - const: ss_pme
+
+  clocks:
+    items:
+      - description: Non-sticky module clock.
+      - description: Sticky module clock.
+
+  clock-names:
+    items:
+      - const: non_sticky
+      - const: sticky
+
+  resets:
+    items:
+      - description: Non-sticky module reset.
+      - description: Sticky module reset.
+      - description: DRD bus reset.
+      - description: Top-level reset.
+
+  reset-names:
+    items:
+      - const: non_sticky
+      - const: sticky
+      - const: drd_bus
+      - const: top
+
+  power-domains:
+    items:
+      - description: Power switchable domain, the child of top domain.
+          Turning it on puts the controller into full power state,
+          turning it off puts the controller into power gated state.
+      - description: Top domain, the parent of power switchable domain.
+          Turning it on puts the controller into power gated state,
+          turning it off completely shuts off the controller.
+
+  power-domain-names:
+    items:
+      - const: psw
+      - const: top
+
+  iommus:
+    maxItems: 1
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
+          - description: USB host controller configuration register offset.
+          - description: USB custom interrrupts control register offset.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - power-domains
+  - power-domain-names
+  - google,usb-cfg-csr
+
+allOf:
+  - $ref: snps,dwc3-common.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        usb@c400000 {
+            compatible = "google,lga-dwc3";
+            reg = <0 0x0c400000  0 0xd060>;
+            interrupts = <GIC_SPI 580 IRQ_TYPE_LEVEL_HIGH 0>,
+                         <GIC_SPI 597 IRQ_TYPE_LEVEL_HIGH 0>,
+                         <GIC_SPI 598 IRQ_TYPE_LEVEL_HIGH 0>;
+            interrupt-names = "core", "hs_pme", "ss_pme";
+            clocks = <&hsion_usbc_non_sticky_clk>,  <&hsion_usbc_sticky_clk>;
+            clock-names = "non_sticky", "sticky";
+            resets = <&hsion_resets_usbc_non_sticky>, <&hsion_resets_usbc_sticky>,
+                     <&hsion_resets_usb_drd_bus>, <&hsion_resets_usb_top>;
+            reset-names = "non_sticky", "sticky", "drd_bus", "top";
+            power-domains = <&hsio_n_usb_psw>, <&hsio_n_usb>;
+            power-domain-names = "psw", "top";
+            phys = <&usb_phy 0>;
+            phy-names = "usb2-phy";
+            snps,quirk-frame-length-adjustment = <0x20>;
+            snps,gfladj-refclk-lpm-sel-quirk;
+            snps,incr-burst-type-adjustment = <4>;
+            google,usb-cfg-csr = <&usb_cfg_csr 0x0 0x20>;
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 772af0072fff0921000c6fe27c018666c1579e48..61f5768b31ae31cd72f4c2a3b74398f9473e192b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10662,6 +10662,7 @@ P:	Documentation/process/maintainer-soc-clean-dts.rst
 C:	irc://irc.oftc.net/pixel6-kernel-dev
 F:	Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
 F:	Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
+F:	Documentation/devicetree/bindings/usb/google,lga-dwc3.yaml
 F:	arch/arm64/boot/dts/exynos/google/
 F:	drivers/clk/samsung/clk-gs101.c
 F:	drivers/phy/samsung/phy-gs101-ufs.c

-- 
2.52.0.223.gf5cc29aaa4-goog

