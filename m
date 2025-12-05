Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7BE028751B
	for <linux-samsung-soc@vger.kernel.org>; Fri,  5 Dec 2025 03:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764906861; cv=none; b=ozUqXOKcM04OYRYFlb3OGK29xzh5pPdYsZWaw+OR2bxGH3xuiXc5UymtmILq2RNNDjT86q3JC3bVhiGuoxPO9ewpIJRg7FHbX76oLXgxF3YiU1+upVnuqiwwEha3bW4Y7lWZTgFXDOq6e1sXGFGelziFsOMPknb2n41Iro5VKmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764906861; c=relaxed/simple;
	bh=ptdeaHvryRd3du/x5tpdu2A1Uhs07EexzpJqndowuTI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rTQn8klE0TMIG8JUXBZFT6qHuZb0HbG9Vqb7xuy68rn6db6jeMi1zNVmw1GrtSipBdVLNgYKV4bIac7ApkkDMtziqF0lSqBH3a9xL+zBsxuSJN9cLUOM+mCvExtTXA2ZJ6IJV1Ihw761MeipjFUMsPSduqAJgu7WO1MzmMJQ6C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NIVW3TJl; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NIVW3TJl"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-bb27b422cf2so2629694a12.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 04 Dec 2025 19:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764906859; x=1765511659; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=K9IGhhvh09/PIVE8FZGaGUaKOpFrMLUGBlF8mQupvrs=;
        b=NIVW3TJlIxnUTmGDW7tmFLcxu6kc17SC8v7UlNDzuSezlwj1aPEBvsKuKvIX3cDDQU
         GdiIaksxrtZxFRYMoYlK7TGZSeR8RJj3dcoAryVQjQBp1BgAr2WtQwm6lQaJSlKpdTMM
         1+YfSOMqP/VCeWqewTXLMUOcrBdd3JvtWHyRi7uPwqQSaX6qfUnoN1AyM4xTABy6Vl8M
         CcBBQp3kGQUGuD51td5UiN8dGSCFAx+4I28/Dbvg3Tnv7ZhVMhzzyQjzfBrzWzveS1hO
         EEqxNpvkhBCOioeI/JiNlUGSmZ8mQINQPYvuaHGdfrq3oY8iTOX3TG0TQkIRHt1L7PkA
         5Caw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764906859; x=1765511659;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K9IGhhvh09/PIVE8FZGaGUaKOpFrMLUGBlF8mQupvrs=;
        b=qc5VQRxp/KvVd/w0+81Kk55skRe3aSS1+kDdoKPxreo5eHUkh5HVoOyw/ufB9g1q7Q
         z19JeK1XsZZS5xqDyNwhthncpkL2cV79h50oq8nlh/NMPdJqMdEtKM6SznlPxAj6rk5U
         xQNE/RvezZPzT6Ywi/bdVU984uqvGCAZyo3bEy5kw5MEFLJiwZsbJj7a0tiwE4a1j2g9
         g1QJAKFyhcHDEc/eqEhNXiAcusQ/Q+2ppnTRNBmmUiFwY1S7Eo/Src9yx3mHfFHpA8Id
         SdV4ToVyYnJrWfapVoZubE9MA+3IdyRw1l9hFTZ1UeDc0oLzPtu/kQUDwQFTHQVa/yYi
         pDfw==
X-Forwarded-Encrypted: i=1; AJvYcCUI/1ztSEzlkRmiB/r+C9uX9JawdwuPnS66zuwWF+coW9uQs7JbWK4KDOg0J1o1K4MtCQnV7chnypCrpntv+kKl1w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy09nc0tTpL7ZJVMxnbUvuErbn66R67kkksKbMUlkDDPlIxosfj
	aA0X/mX/mlFIXNENyBkp0Un/y68odL6g6rwEiiZsnFurIGCElwp4do3pglJFuVgzqL2q1P1MVz/
	EJs8QdA==
X-Google-Smtp-Source: AGHT+IHJpPLIk0H+cBqi++ALzxQ5eQ6VgFjZGF6TauEmA3BNaoNKC/nHWwqyPRjeswPpZJ68VVj4Ud32D8o=
X-Received: from dybbs18.prod.google.com ([2002:a05:7300:a212:b0:2a2:3f59:eef5])
 (user=royluo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:d09:b0:2a4:3593:9686
 with SMTP id 5a478bee46e88-2ab92d39d8amr5864583eec.3.1764906859075; Thu, 04
 Dec 2025 19:54:19 -0800 (PST)
Date: Fri, 05 Dec 2025 03:54:11 +0000
In-Reply-To: <20251205-phyb4-v8-0-c59ea80a4458@google.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251205-phyb4-v8-0-c59ea80a4458@google.com>
X-Developer-Key: i=royluo@google.com; a=ed25519; pk=nTq1n8WcJActRWe1s8jdcy+TzpTK4a+IYRCIWvQfq5k=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764906855; l=5759;
 i=royluo@google.com; s=20251120; h=from:subject:message-id;
 bh=ptdeaHvryRd3du/x5tpdu2A1Uhs07EexzpJqndowuTI=; b=q5ohSaGg7OpLG4b4ODFHBEYmeqz1yVI6mZnXTBU2XgYOPQGfz5Ten0zXX12PwvMmv7x03fc6H
 5JSFNmnffTnDAlpSA0UoomGjan0EmjhV5SDd8ay7fdQnshlMwukAKSC
X-Mailer: b4 0.14.2
Message-ID: <20251205-phyb4-v8-1-c59ea80a4458@google.com>
Subject: [PATCH v8 1/2] dt-bindings: phy: google: Add Google Tensor G5 USB PHY
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
index 772af0072fff0921000c6fe27c018666c1579e48..27e6f9e20f5e83b861c6a04dededb93b8561715c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10661,6 +10661,7 @@ S:	Maintained
 P:	Documentation/process/maintainer-soc-clean-dts.rst
 C:	irc://irc.oftc.net/pixel6-kernel-dev
 F:	Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
+F:	Documentation/devicetree/bindings/phy/google,lga-usb-phy.yaml
 F:	Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
 F:	arch/arm64/boot/dts/exynos/google/
 F:	drivers/clk/samsung/clk-gs101.c

-- 
2.52.0.223.gf5cc29aaa4-goog

