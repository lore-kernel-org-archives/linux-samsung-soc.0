Received: from mail-oo1-f73.google.com (mail-oo1-f73.google.com [209.85.161.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940E721A458
	for <linux-samsung-soc@vger.kernel.org>; Mon,  6 Oct 2025 23:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759792918; cv=none; b=ODtznzif+O99S2JnbywMoGk3QpBgi9+pOEn10oK7GF3XZux7CDlktWYZJq4EVMEW1vGVkDqVsurlwfaz9nZKEQWzc9aaQUs7+A3h4mOw1agneu4Bi+M2VJNY90eUFccZG+ZpYStreqUixFz+Ci+HitMHW7NRR+fMGkgEb6XMYaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759792918; c=relaxed/simple;
	bh=UViTHWvwXuqcjmgVhoJDzPkLVSAoP6S0yomom/AscBs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZhOhDCXscnep0vSK4VvpsV2/92MDCelWZGuaEpxe3wsGKpwsePNOs0nglif7XoKmEqZjIss63WibL8Av/s8cPAl1GQKjJt2/t2QqdVFMrqPhqxmxHGmZCoRvXeHHVJpUE2GtjlBhULO2xqstZ3M+e0wzMpvKQDfJ1LiagTcRnew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dARvVH29; arc=none smtp.client-ip=209.85.161.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dARvVH29"
Received: by mail-oo1-f73.google.com with SMTP id 006d021491bc7-64a207e24feso5540924eaf.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Oct 2025 16:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759792916; x=1760397716; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=EoPxQXwQ5XFM/6+OUgDgFqK1K2D8fPLQvjVzNWUSG1k=;
        b=dARvVH292hn74XaNx57yl9m1Qvoz6SGvtXKIyXc5ToyQtVJ8g4w4amNTkxaQWbqumP
         w7okBvWM0J7d8jihA8bYEr6DVBdGaguMRyrOcsysSHGsfDzUKOgYc7zAMHCnR2M5Kuck
         WRpvF6rT8ZsZNobFrlOX5MMfsBLOpqcYWvNOg2PANzeNaanMvNYXEYjivxytVwx3jfxp
         jdWOJ/3l+erE3wuYi886QGoLl5SROapItko8hgAX/Jcw8qZGKIe1wdUVWwu858Vvrkbt
         uwIf1x+deKaKIzNf97N8+zf0MszhekUAMzS+S7BWK9X7itbn7zy7KLpVWTp6IuLWXUqY
         10UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759792916; x=1760397716;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EoPxQXwQ5XFM/6+OUgDgFqK1K2D8fPLQvjVzNWUSG1k=;
        b=RqI0YYJplkdR3aJbrqOnEniEuXoD9rgKdOxjqtIEMsysgZbtrNV2UZqoaEctA+mXz0
         d0CejwEUc3QIQqatXmXG4fOcyCjuIEKtjv1RC6jaPgGxeox2ZFMlRKQGWeFW6mZK1Kdf
         GubuO3gD5WaFp29w1JpBAbDOBI44BmwGphCJ9oWbNCj94zp+jF68hlI6pLjfwaDUROyK
         AvGtWZ8eEpVp3KDKuuI2khVzf1ODkE3v3tDn+vLeoMVy8OuqoCgHIrMJaNKWE3zc4JB4
         kwgkd7cCL4+38PvY2r9ILTJ+rSbnSQb7IiS4OGE4Cyn8LCKYNJp+1FbjsIrOrliRbdoE
         zAqg==
X-Forwarded-Encrypted: i=1; AJvYcCUZ6ozpcrJIBQWUV9nF+OoNidJZUXkhosM+0Zeya6OLnMoeP05QBYbJTy6hJE050D65Lr8LAz8X+G0dhHjF025dZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOP7d37v2DSZKxAwNLCQgsDlcVdcFZdFNw6KJC7bxH/5WNWCkE
	U7lsEHFApBQ2iWGYnHjgaFzVwoGMzJ8fcN1IRYcfY8/klJMBBcK8qLki5oyZJqa/LK/hX/PuhG0
	gfkCISA==
X-Google-Smtp-Source: AGHT+IHuvSLSe+7hqIjhfAafsJ/Rg53JuStEyumsyKGui3lJI0P+5OWjCcwfbXPLbHA2q9kxTGLsRs1awBo=
X-Received: from oala19.prod.google.com ([2002:a05:6870:b153:b0:359:cc61:b60e])
 (user=royluo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6870:959a:b0:345:bbd6:b0a1
 with SMTP id 586e51a60fabf-3b10283e13cmr8039798fac.30.1759792915730; Mon, 06
 Oct 2025 16:21:55 -0700 (PDT)
Date: Mon,  6 Oct 2025 23:21:23 +0000
In-Reply-To: <20251006232125.1833979-1-royluo@google.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251006232125.1833979-1-royluo@google.com>
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20251006232125.1833979-3-royluo@google.com>
Subject: [PATCH v1 2/4] dt-bindings: usb: dwc3: Add Google SoC DWC3 USB
From: Roy Luo <royluo@google.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>, Roy Luo <royluo@google.com>, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Document the DWC3 USB bindings for Google Tensor SoCs.

Signed-off-by: Roy Luo <royluo@google.com>
---
 .../bindings/usb/google,snps-dwc3.yaml        | 144 ++++++++++++++++++
 1 file changed, 144 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/google,snps-dwc3.yaml

diff --git a/Documentation/devicetree/bindings/usb/google,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/google,snps-dwc3.yaml
new file mode 100644
index 000000000000..3e8bcc0c2cef
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/google,snps-dwc3.yaml
@@ -0,0 +1,144 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright (c) 2025, Google LLC
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/google,snps-dwc3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Google DWC3 USB SoC Controller
+
+maintainers:
+  - Roy Luo <royluo@google.com>
+
+description:
+  Describes the Google DWC3 USB block, based on Synopsys DWC3 IP.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - google,lga-dwc3
+      - const: google,snps-dwc3
+
+  reg:
+    minItems: 3
+    maxItems: 3
+
+  reg-names:
+    description: |
+      The following memory regions must present:
+        - dwc3_core: Core DWC3 IP registers.
+        - host_cfg_csr: Hibernation control registers.
+        - usbint_csr: Hibernation interrupt registers.
+    items:
+      - const: dwc3_core
+      - const: host_cfg_csr
+      - const: usbint_csr
+
+  interrupts:
+    minItems: 3
+    maxItems: 3
+
+  interrupt-names:
+    description: |
+      The following interrupts must present:
+        - dwc_usb3: Core DWC3 interrupt.
+        - hs_pme_irq: High speed remote wakeup interrupt for hibernation.
+        - ss_pme_irq: Super speed remote wakeup interrupt for hibernation.
+    items:
+      - const: dwc_usb3
+      - const: hs_pme_irq
+      - const: ss_pme_irq
+
+  clocks:
+    minItems: 3
+    maxItems: 3
+
+  clock-names:
+    minItems: 3
+    maxItems: 3
+
+  resets:
+    minItems: 5
+    maxItems: 5
+
+  reset-names:
+    items:
+      - const: usbc_non_sticky
+      - const: usbc_sticky
+      - const: usb_drd_bus
+      - const: u2phy_apb
+      - const: usb_top_csr
+
+  power-domains:
+    minItems: 2
+    maxItems: 2
+
+  power-domain-names:
+    description: |
+      The following power domain must present:
+          - usb_psw_pd: The child power domain of usb_top_pd. Turning it on puts the controller
+                         into full power state, turning it off puts the controller into power
+                         gated state.
+          - usb_top_pd: The parent power domain of usb_psw_pd. Turning it on puts the controller
+                         into power gated state, turning it off completely shuts off the
+                         controller.
+    items:
+      - const: usb_psw_pd
+      - const: usb_top_pd
+
+  iommus:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - interrupt-names
+  - clocks
+  - resets
+  - reset-names
+  - power-domains
+  - power-domain-names
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
+            compatible = "google,lga-dwc3", "google,snps-dwc3";
+            reg = <0 0x0c400000  0 0xd060>, <0 0x0c450000 0 0x14>, <0 0x0c450020 0 0x8>;
+            reg-names = "dwc3_core", "host_cfg_csr", "usbint_csr";
+            interrupts = <GIC_SPI 580 IRQ_TYPE_LEVEL_HIGH 0>,
+                         <GIC_SPI 597 IRQ_TYPE_LEVEL_HIGH 0>,
+                         <GIC_SPI 598 IRQ_TYPE_LEVEL_HIGH 0>;
+            interrupt-names = "dwc_usb3", "hs_pme_irq", "ss_pme_irq";
+            clocks = <&hsion_usbc_non_sticky_clk>,  <&hsion_usbc_sticky_clk>,
+                     <&hsion_u2phy_apb_clk>;
+            clock-names = "usbc_non_sticky", "usbc_sticky", "u2phy_apb";
+            resets = <&hsion_resets_usbc_non_sticky>, <&hsion_resets_usbc_sticky>,
+                     <&hsion_resets_usb_drd_bus>, <&hsion_resets_u2phy_apb>,
+                     <&hsion_resets_usb_top_csr>;
+            reset-names = "usbc_non_sticky", "usbc_sticky",
+                     "usb_drd_bus", "u2phy_apb",
+                     "usb_top_csr";
+            power-domains = <&hsio_n_usb_psw_pd>, <&hsio_n_usb_pd>;
+            power-domain-names = "usb_psw_pd", "usb_top_pd";
+            phys = <&usb_phy 0>;
+            phy-names = "usb2-phy";
+            snps,quirk-frame-length-adjustment = <0x20>;
+            snps,gfladj-refclk-lpm-sel-quirk;
+            snps,incr-burst-type-adjustment = <4>;
+        };
+    };
+...
-- 
2.51.0.618.g983fd99d29-goog

