Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B1D34251D
	for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Nov 2025 09:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763545083; cv=none; b=JstdrnhkJMev8KamHredABjIFdS5WvQiiv2Db/hVJrsH/Q66kMoXLpqqgPnv9IpkuwcliTsrIHJQzi0i3oV070ERQJVOFDt0A+HIiOwHAMW5GTvgG+T9LIoSfML8bOmJEc0lnOJqG3eiDaRVQIcKwlVep5skVR6fwrRrfjNKWIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763545083; c=relaxed/simple;
	bh=fS73+8UFmpoMhXhoSrrEBEDEPMUf8L3kuWO0IATAcBQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=C6P4Q9HFAdk2a8h+P8EJLdxVptEwENG2prjb1PPFATWOaCHQ0UdZivR2HipTtdQE+rdJz9jJFlEicG4iRgAkamTaohGa4MlcVNIMTELP1uXCpDp+tJ3BojLvSEcVMGuACpnYPGiBlWz22HYuThIJISBMf5HrUk8eqrGawswZyWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=k+Gbl97K; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="k+Gbl97K"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-34378c914b4so14411182a91.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Nov 2025 01:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763545079; x=1764149879; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ubuvZu8UXjwzbNHQQ4TMJLE6NP3+wMZqSlEavbkbwfE=;
        b=k+Gbl97KhMbVLLoi5u4JwOZBV+S9bSIF+9QZPAz0FCLlXzL48puwZbZE03KQiKnKFV
         j4chK8GnSC49Qzbw6vxMQ2gZ4gs2Wctz9j+Hls/+Y1JVEhsSv8E1hbYOibs2tOdGx5ev
         Lk1+V6T25qU7PWMXluyxyivFpPp9qxet/HgZMBTWceJlgPf9fK+reFHzydv9H72WXWpd
         jlE0fE3oQ8QZhzEDEIBBLSRxKnwEiU/G5o+ishNFpyEqFR0Nu38c4mLKj860mrEwIGHN
         FniKHsq6hPSdLROTPniDtN3xsLOJyq+MugBmlbmm2FpkPd2raqXQR4bxjUP0hvgOYlfc
         CrFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763545079; x=1764149879;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ubuvZu8UXjwzbNHQQ4TMJLE6NP3+wMZqSlEavbkbwfE=;
        b=wV2DVCkESd0NoIhBVF68xGQpuovIyYaEFMu2W8qeOuAz8xw7Nljt21xEXv1XKccB/Y
         6z5AxQdh/4fS2G0ZLll7qsNCD94DDj7qKpVcxYhfOZ9LEHtYIJCWNqvP2b/NfjXv/HH9
         ZYINzq7uPs7uMJcK+qUPntujLVH+eyDkKsGYNo1YFgO5hUgpBFqWNXaKTBycmknvou7q
         nY9ZE4uT0lfytLXLLSSgPW98v6DdhIfs/UofRsJdsr7eltGiWPnhP0ckfHstYEZtFB3t
         SGlJYZYlvU/P/wq6/JA4GPGXb4e5wn7qKdz+4MP3sR7RkGfoRgdS6db73j7J7J+KiVp5
         AHiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAcuKNoG1ZMS5IG9A/rxKfWUJ8fr0hv1c8VNTTtmm6CfuAopZnisHQcZN7SNg8RgvkYkzwVIDXJqjmJMAGrl9E2g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYLAAWcTw/yQ3gVsRJKeijmKD0PbPnEiABnWV3owCBM2WjRp/3
	/yLxHS0p1v/jZ94bDPitZxH1MW0OVpjpDXqKN2juJlNAQyszL2FAoOgUS/l/8RpEB8GYMWZgfeP
	FCYxHRQ==
X-Google-Smtp-Source: AGHT+IG15jZcElsOZf23LvgWF56vfE6m0WnIv1lETIZF6tDEING2pkP0x4ilHSrzxs+0SfZRZW7P3o1c08k=
X-Received: from dlbdx14.prod.google.com ([2002:a05:7022:e0e:b0:119:49ca:6b84])
 (user=royluo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:240f:b0:119:e569:f26c
 with SMTP id a92af1059eb24-11b410f54e9mr6703291c88.21.1763545079465; Wed, 19
 Nov 2025 01:37:59 -0800 (PST)
Date: Wed, 19 Nov 2025 09:37:47 +0000
In-Reply-To: <20251119093749.292926-1-royluo@google.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251119093749.292926-1-royluo@google.com>
X-Mailer: git-send-email 2.52.0.rc1.455.g30608eb744-goog
Message-ID: <20251119093749.292926-2-royluo@google.com>
Subject: [PATCH v7 1/2] dt-bindings: usb: dwc3: Add Google Tensor G5 DWC3
From: Roy Luo <royluo@google.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Peter Griffin <peter.griffin@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>, Roy Luo <royluo@google.com>, 
	Badhri Jagan Sridharan <badhri@google.com>, Doug Anderson <dianders@google.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
2.52.0.rc1.455.g30608eb744-goog

