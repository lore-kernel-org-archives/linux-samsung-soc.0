Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E4A328278
	for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Nov 2025 13:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762866403; cv=none; b=LOjgCJ9Bvmj8wY9Ip8WZdmEdSCVLZpWTapHitgkypdHVXIgd5qQCQD5CSAD8GFWazsWu157MpW8ngtsNox7LnQDwP386DUuo4Ggd40sX5lJbkX5m4bpgfFo2knX8C8/q7tV5koVW9+bXLRzvYP6YM8qBj0WsQcpM/vfmh+6/+hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762866403; c=relaxed/simple;
	bh=ofBuQd7lqetZgPVZ0g+GIp8COY99/NjLPtsL6+57NOs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZvqcEgc9Z7oPSoE/4Ui7Vn0Gw0E9wJ/ZBeQvl/7sD1o5WMGa9NuriKWqIakpB0KyDzHyMs2Std8RrvoWM4cpWI55ZZXlL7nEzQjlLGQSQfD6eKaPsbWdkzdhHt5igNLtXOliUcSMahw74z2NIaEyyCsuy5euXMht/H2Q4HxWd+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LfdX6vCw; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LfdX6vCw"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2956cdcdc17so52420805ad.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Nov 2025 05:06:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762866401; x=1763471201; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LBcgmCCgSccCX8ofYrFtr94XQUmLnjr3zClogzAcn+A=;
        b=LfdX6vCwRgimHtzRykFliNg8zlWZuM49N1xLtvLHHYPNqLsiSYfmBzil8mbAQXiEqZ
         zqXHjgN4qXpsbCE8S0/TXG8ueX80rvWQueWKW1XTSZ15inAYCiMcZc0jyd7uAT6A5kLl
         2YI3nhptKKN5Uc3DotfVkulOYcJCwA5zFGYXD9dUZ66N5IzP4L0NNOjvGV/bINQi6P6G
         6B7ihlJ703NVAAL6zyfCVqRxbB32/+X1XLeCxFguAgAfjnqE9ADfXSXA/mUlEcZuq5lM
         A8r4PSL2/vJYfy2J3B1xNDxhBytdF4NUSb1b96NmR83eH4woVaKDtdKxMU95rMQS7ruG
         Ve9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762866401; x=1763471201;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LBcgmCCgSccCX8ofYrFtr94XQUmLnjr3zClogzAcn+A=;
        b=RbWpkE0CETqrDu8ct0jgz4p2qVMWVcND99Yp0GtBYX/vXlcyJFFAHLnfY3wK7pMW96
         mvdIYbNVNoXiSYTLvA8QVamttyC1QhFdlLls/FYlR2Io3ktyXyRw+CpCWfxEZoyTRlUD
         I/nvgNO+7BvrjGoTS767OA4vMIaqPTCD3oSH47nkMSRvWRQ4Od8+noymH53OnhtifcRV
         TwwJIO5p8MhcPOERokTq3RDQxUZpBWAO6kQkjLdXEjnBnYG3EJKwPtZXWrs94uEym/OY
         wn1KxBQSIJ7vMkbzUZjtoU/NOl/X1JSuDYgNEejRu3ouXWA2VYPsqcI3ygTNdBa60QXu
         /oaA==
X-Forwarded-Encrypted: i=1; AJvYcCWcXqjydTDxoonFAzkfvKIJFB9mdW9mofbwU20uV/6K958fUGmvrPGLk69pIvA/tlapMjyl1NNs+6AXVfFO7octcw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzYyMC94+6NfCiOruTHJf5ujbem2szOhL8+kojwtAKeU2sBwdAB
	n/Wp687kaDEVX4ovS0/v+YBb+4ZuJVPtSqTcQc81erZP76c7GRsbbsxWLdCMsRhlGd+pI5hV+2Q
	3dkh2JA==
X-Google-Smtp-Source: AGHT+IGQgl9qVH8CJWK20oLI/AcKbny4pU0rW4+H2E7KlvEZI9EtCWUObJzSqnn98ouD2skVKx+kP/Tzbh4=
X-Received: from dlbrj17.prod.google.com ([2002:a05:7022:f411:b0:119:78ff:fe15])
 (user=royluo job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e888:b0:295:8a21:155a
 with SMTP id d9443c01a7336-297e56d6144mr161827645ad.35.1762866401198; Tue, 11
 Nov 2025 05:06:41 -0800 (PST)
Date: Tue, 11 Nov 2025 13:06:23 +0000
In-Reply-To: <20251111130624.3069704-1-royluo@google.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251111130624.3069704-1-royluo@google.com>
X-Mailer: git-send-email 2.51.2.1041.gc1ab5b90ca-goog
Message-ID: <20251111130624.3069704-2-royluo@google.com>
Subject: [PATCH v5 1/2] dt-bindings: usb: dwc3: Add Google Tensor G5 DWC3
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
Google Tensor SoCs, starting with the G5 generation.

The Tensor G5 silicon represents a complete architectural departure from
previous generations (like gs101), including entirely new clock/reset
schemes, top-level wrapper and register interface. Consequently,
existing Samsung/Exynos DWC3 USB bindings are incompatible, necessitating
this new device tree binding.

The USB controller on Tensor G5 is based on Synopsys DWC3 IP and features
Dual-Role Device single port with hibernation support.

Signed-off-by: Roy Luo <royluo@google.com>
---
 .../bindings/usb/google,gs5-dwc3.yaml         | 140 ++++++++++++++++++
 1 file changed, 140 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/google,gs5-dwc3.yaml

diff --git a/Documentation/devicetree/bindings/usb/google,gs5-dwc3.yaml b/Documentation/devicetree/bindings/usb/google,gs5-dwc3.yaml
new file mode 100644
index 000000000000..bfaf6cbdfec3
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/google,gs5-dwc3.yaml
@@ -0,0 +1,140 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright (c) 2025, Google LLC
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/google,gs5-dwc3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Google Tensor Series (G5+) DWC3 USB SoC Controller
+
+maintainers:
+  - Roy Luo <royluo@google.com>
+
+description:
+  Describes the DWC3 USB controller block implemented on Google Tensor SoCs,
+  starting with the G5 generation. Based on Synopsys DWC3 IP, the controller
+  features Dual-Role Device single port with hibernation add-on.
+
+properties:
+  compatible:
+    const: google,gs5-dwc3
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
+            compatible = "google,gs5-dwc3";
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

