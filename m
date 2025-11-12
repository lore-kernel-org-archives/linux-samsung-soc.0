Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794B8335079
	for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Nov 2025 12:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762950823; cv=none; b=HR+QqZPim05HUPB6Sy9zhP7Rv5SSY6L/00Qe7j7yeCmaROHeXc2I7w9+p5fN+6e3+FzR5kvvclAD937Q8wBX52PGY8/P3zNAJ2eGuAYjx8hgjm/UktE1eikfNFuaduGuda174rBdFHM6nGycsKMNP8uSBwR2dVZrgw4JD5GkeJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762950823; c=relaxed/simple;
	bh=d9cHU13fFbCVRuXvMiXwPmUVkpMZfy3GZGlcMRZ6zyM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Jkv+1rfmTsVsCPxb2m3PZgnMTVXyPSSPfxTOowmmDl9ZfEnwtotmuu6HAsSetwiDduyD8r51zHc5zCgZ+cmMweNIzt7oufbRi/sXF/7uaEAPOMesHxIeYakJOjC5WAra5JZndb1LjoiTXlM7FMCGr9c92VoCZ5rbD34qwydoB4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vI2Iau4l; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vI2Iau4l"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b9a72a43e42so767147a12.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Nov 2025 04:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762950819; x=1763555619; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DL8GJ0K0iNwYW+A1OoM+d4qx21RJUKEPvPuxNBd2KIY=;
        b=vI2Iau4lgxZ6XGBrCi6YefUIbqfmEHW5hJl1TCrzr5Zsm1YBkG3MzIfaOjVEpXg34S
         ISiXUMhoB/1328PEMxRu2TStIRwpiXDK4s8eDuA9CMPLa37vbkNNnMqXvG6G180AqYMI
         9g4/dDjxrNNaiheYgck9upBL8VZbEHV7GFISSn3Zlb69c70a3vMLn3GOBWCifV04TAZ4
         VSVA+GRs/8/mqMzq0uR5VgRZipj7Ap7SluZ5Jqxz5fcS3eK5lVMrVp6hPf6UdoAZRo7m
         iGOdbr86y0PrcegfPNxtNiy3bRWBUyg1sT53h4Pq/Qzw6s3qInYeCXJNzdz8sfVad4Ok
         g8fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762950819; x=1763555619;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DL8GJ0K0iNwYW+A1OoM+d4qx21RJUKEPvPuxNBd2KIY=;
        b=P4SeDodHzxI5bMnL4i3Dbg4d/1iMHeZgOEu5gcAHxWuvH3AExO35rNrCMv8YjoWZoL
         UVm1l+idoIbKzb4YAciCGBCLAy+fYqR6VKOQBuzNkG6StJ8pLKHWJ6KwcFSdcJoRYrKn
         feAp2frzIjc+IvmJtz70D6cWB0V2B6NTIEjsKv2WKcsuVMZk0uRr19C7lI7RJIuHi2mW
         +ZvgtCCkUX/dtRLhV1A3TgwpJ3B+0PBFfaCZLqXhnu7ISmhSaKC01DUt5nSjOZQo70Cz
         EWLm2SDhP139ybrEO6r9EBgOrXT5MKhq4PMDL3CdtDNy19NUftrhqAn67vplbnP+1gDi
         FtkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXd859VVdJKL6jaFnG1XBIaSwQORlTV2szZn7QgLxkAX1JcETvVG+yCjU1blEd5ObW8XVIcdx0K4JSrT4yc0YKiwg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb1jSPX6QdLU98fT+u3EDvSLWs31SjhICwJ0/X2w4fGHeSIou4
	/XXdcgjLPRd9PhFBrBJJbCc5mq4qaRCj56FUxfCsgXk2n3PBPd74HXTo48LxwV/hYcompBgNb0A
	baSt/Mw==
X-Google-Smtp-Source: AGHT+IHW6MkJJN6CNX2hfnUNdBNBx+IM3THZOwO6ahE5BTDHOZbstitebr0A6VvJc7/SjssqfaCawsE5+Tw=
X-Received: from dlaj13.prod.google.com ([2002:a05:701b:280d:b0:119:b185:ea6a])
 (user=royluo job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:19c8:b0:295:613f:3d6a
 with SMTP id d9443c01a7336-2984edacc5fmr40942345ad.29.1762950819047; Wed, 12
 Nov 2025 04:33:39 -0800 (PST)
Date: Wed, 12 Nov 2025 12:32:56 +0000
In-Reply-To: <20251112123257.3755489-1-royluo@google.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251112123257.3755489-1-royluo@google.com>
X-Mailer: git-send-email 2.51.2.1041.gc1ab5b90ca-goog
Message-ID: <20251112123257.3755489-2-royluo@google.com>
Subject: [PATCH v6 1/2] dt-bindings: usb: dwc3: Add Google Tensor G5 DWC3
From: Roy Luo <royluo@google.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Peter Griffin <peter.griffin@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>, Roy Luo <royluo@google.com>, 
	Badhri Jagan Sridharan <badhri@google.com>, Doug Anderson <dianders@google.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

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
 .../bindings/usb/google,lga-dwc3.yaml         | 140 ++++++++++++++++++
 1 file changed, 140 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/google,lga-dwc3.yaml

diff --git a/Documentation/devicetree/bindings/usb/google,lga-dwc3.yaml b/Documentation/devicetree/bindings/usb/google,lga-dwc3.yaml
new file mode 100644
index 000000000000..95be84c843f5
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
-- 
2.51.2.1041.gc1ab5b90ca-goog

