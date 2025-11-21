Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC23533BBBF
	for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Nov 2025 08:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763715402; cv=none; b=cKcnxsObtoltBo62k1933Wv+264bHWgBVk723a1XVvZoZ1Yr1kcNkftEx7LKYNVs3XWcAeo52L69R0Oc7W6eBRoRqThFMOmB4pbPvXnfnRH555IThUg1ICAhiyToVjd3QaRgyrEqnkH6l37uDvueR7MLFpBjEOjdBO2R32qwN8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763715402; c=relaxed/simple;
	bh=VBoVbKgeWDxu8xXRvm5tzauXBx7SZr8OxNtDvYDeHzE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rO60NPPB0RqfV2iu4Wjy77Et7xzoEeVZlv9JQOtjSSiw/J/m3genwnSj8YoHKmoMuInnQT4dgl3oggStktFg/NBgZWZCKFnTxmSeOAWsdXNsue7TJiUELHigLtr2LWuvTeNand3pp/jf9fqBrogOgLR3PaCxLp1UEYAVFizIl3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pTS1Tf6l; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pTS1Tf6l"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b99f6516262so6047555a12.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Nov 2025 00:56:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763715400; x=1764320200; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vn5NP0cGfea74Y3lyKidjSUH1ktUHughQxZQCQ+D1PI=;
        b=pTS1Tf6lNku/qwziZuneu5ie9bF9zL6Rbs0C0dkZYtDFEhN74BYJNyj+DoliH90xDG
         IS+HShXh3Sk6lIQpO3Z2fHBbxdov9W9NkjUs3KavNSjd4YBmNGMbzrwRdRcsx5gAAyyi
         tGi3nan659/2nZlupgYlqhUdKVHfQHAD5tIPj9eC5CfnqnaqHu73W6emZtrm+GME6R7J
         X/JedJcZuqwjhvNFwniHPd4oOxYAWL0ySfx6X0TzlrMPHHxpYpu10AQ+uf6zENTRK6I6
         z4nebTvWLRs/rMdGqam6k4/hdoXYg3diZ82tPebdG6bKuRUxk1t0RS68i4YUlwOnF4+H
         QoKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763715400; x=1764320200;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vn5NP0cGfea74Y3lyKidjSUH1ktUHughQxZQCQ+D1PI=;
        b=lcHEtJZolZef4ZIuyQ3ocIFKXtUHtyWPo5FaamLJ2OAuCVjiQMIWhoFInLpBWZr1yH
         3+WmqzLb9YoP2ggeqtEdp6CmVkZn66znWZI2g5HcAPHpzrScdnJQ4vsEWZYGwuS1sYeY
         UH6A0DqHm7jpMdn7TVVPcZeQ8/ctnA9e6O/5KkOF5LDMAmd9n04RtlxEq/6nrCzBZtvd
         RVQZlso5TD4lXAeGlVq5h2Ywxze3c3f1wXUpgA2G2cN6OPgUgL16gzl/Y4JivIkFbSoZ
         h6DyOtU7cA68FwbWd3rAQxJGesAJHNvqckXEqmzl9mwti2Cpb+y8XzUZFIoO8n/rpagd
         SKVA==
X-Forwarded-Encrypted: i=1; AJvYcCWQgdDx68xCteJTgWOzWuewg83ZFiASbK4GBHOFGhLnKe9ZXZNS6/BxoFgnynOUuHuAk3bH1OcICZvmm0/w5R0SMA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmM/AkafBVHgFPdM1yHUrYeO8FvOfNq8X2dnGSA06wlYN8gWXY
	T5t2NkNN8Z4/iYX9jxSVdCNPUTFXh5iMyB4+KMRrxVDr+EgFduGt53VYzEv2abOF+3801YwoHGP
	oroKIDA==
X-Google-Smtp-Source: AGHT+IFDdMrxjcppPqZfJnrNK+kHi6vCcjIwY4Y4M84oDtTvGViCP2xfFlDlQI2nSCDqp2hpRVKi0C8hcL4=
X-Received: from dyt23.prod.google.com ([2002:a05:693c:8097:b0:2a2:454c:f92])
 (user=royluo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:8244:b0:2a4:3592:cf5d
 with SMTP id 5a478bee46e88-2a7190a344bmr490773eec.1.1763715400036; Fri, 21
 Nov 2025 00:56:40 -0800 (PST)
Date: Fri, 21 Nov 2025 08:56:20 +0000
In-Reply-To: <20251121-phyb4-v7-0-df644fa62180@google.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251121-phyb4-v7-0-df644fa62180@google.com>
X-Developer-Key: i=royluo@google.com; a=ed25519; pk=nTq1n8WcJActRWe1s8jdcy+TzpTK4a+IYRCIWvQfq5k=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763715395; l=5147;
 i=royluo@google.com; s=20251120; h=from:subject:message-id;
 bh=VBoVbKgeWDxu8xXRvm5tzauXBx7SZr8OxNtDvYDeHzE=; b=JphE5nvH33SArlOM73vQrNifT2e2HTZhhsvejgwZZqcbKMf4uy7kEWN7cNqIV3T++Xd2oXXpm
 RgQz1NaN+s1A6BFoDCkIGeCsYi7VcpigMPTn7NwOtv4qAIGumq+GMdY
X-Mailer: b4 0.14.2
Message-ID: <20251121-phyb4-v7-1-df644fa62180@google.com>
Subject: [PATCH v7 1/2] dt-bindings: phy: google: Add Google Tensor G5 USB PHY
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
	Naveen Kumar <mnkumar@google.com>, Roy Luo <royluo@google.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>
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

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Roy Luo <royluo@google.com>
---
 .../bindings/phy/google,lga-usb-phy.yaml           | 133 +++++++++++++++++++++
 1 file changed, 133 insertions(+)

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

-- 
2.52.0.rc2.455.g230fcf2819-goog

