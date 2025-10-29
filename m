Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B22331A7E2
	for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Oct 2025 21:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761774061; cv=none; b=EuEu2a1tl1c/MWL3nh0DVu5HT6H/W6oSOvmQREso3GVJNQKDD9BEjMC/P2YNrRf0Abrd2zOsq9Nz586guc93TE62Kpriz1JfqCt94K+I8nBxPM+OybG7XUFg/ShHbILwHxYRIofiTEttD/C0KpDM5kHPhZwDJT2ykZ0Y+rju5Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761774061; c=relaxed/simple;
	bh=vDOoW9LH/vWfUtbBpYt/dlPJdZKdk+EOLZ7/KxPzTxs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=j4fc/zDvsvk/etTGXzQUdL2qqjfLx+UshJf7jqTTY+toifcE2feVwUCtaAv6z4OCDoVoRHUBIVv9d8pVuODfiV8SlyvbL1tRnpdHYPmwYeq5rjLYS50zUFlE8UcBXdYCwFYfEiMbvNWGZrkpUBg+IlDf+DJVhw2PIsRHzIyp7m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LQcXsiuR; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LQcXsiuR"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-272b7bdf41fso3829385ad.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Oct 2025 14:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761774059; x=1762378859; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=q/TLi9zqr3TmkEqRKNugGrU2dzYH7WuLg9EN/41Yje0=;
        b=LQcXsiuRzJYWCm6JDgDfDfiT+jnqO9YK7gir7wGyePsAIwwLfe+MMviQ5vfqmOW9Uu
         XfnenogdoZNsLYtMDp2RC5ZG16MZpxzpMvPquvrHazjiaU4hIxnLQaniAb+SWZnyclTz
         74mHoXoBlMDP1RGpU5UVCi1at+q+IIT2eAcAlRpObE3hsDOKhrw5BtoTIdVD5cjb1tbB
         887qGhPSio2lTEubHv6Eeoiw+cEh8ybwAFIeI8QiAm4BV1MYs8r3aHjDPcoGp6Visx0x
         ZHUXd3vYAsuxYCjN1rTezkOfZ/LlkUkZ/2I34qaMCTx7jEKcG/ORvoaoZD6s0AKUzU5R
         atFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761774059; x=1762378859;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q/TLi9zqr3TmkEqRKNugGrU2dzYH7WuLg9EN/41Yje0=;
        b=DHpINQAdMQRWfKxEOAPfmmjMfn0l+07I0VQYQXU1HWf9h05oF9ovwzUVUsyMua4FkW
         ODLlLxK4f6XiKHRFQ6zOp0zhOdksb+1yzF9D6ITuqCrL7w5ugc4Gj+zEFWjKanKHdpBT
         Xg9P2oH510420BH8wbZ0OBVaJ1kjHrBPTnKbmnFGFDsmP12Uh4l3U7n1HkPSWenqs4+i
         2E+zhli0JHSnJbSTu+hEVPJghX9bxAV3mQ+HsL71Sx31WX1XUJQzxBwa1jPTqWCdoEpR
         +uJbNwmHda3KFdSwi5EfC+u2cGxzMw9IOG6GTEbBbqj+kHgB9XB5y2ClnD7IYrecL+Sv
         jVQQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8/NUjeWEkwtZfxQ5p4+n0TGZDmrtt0ciTCc4NnMrjxrYkgj49XlWKI0MapNKH7LnVxCt+2bqdo4WPvv/webQNEw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUYKeNSeOWfloGAMmxourNwoqJ9AQnvw3MXgBgtsPbTKcFUivO
	/AR5+DDQgsNpeNDBLrAMJ86gCALM+JBnvlwCbgx7tQP4kEXf70JMEMBR3p3RGcwclrNQqNwD77G
	3RdBYNw==
X-Google-Smtp-Source: AGHT+IHjZCapQlgh36DZaiJIbU3mEEeF0xr5npuEpjzvxQ1RgmrSJTd3OvlwYm13zuS1GDPmiCuLj+1oRUQ=
X-Received: from plbla5.prod.google.com ([2002:a17:902:fa05:b0:27e:eb0e:15aa])
 (user=royluo job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ea03:b0:292:fe19:8896
 with SMTP id d9443c01a7336-294def36a78mr46266815ad.52.1761774058892; Wed, 29
 Oct 2025 14:40:58 -0700 (PDT)
Date: Wed, 29 Oct 2025 21:40:31 +0000
In-Reply-To: <20251029214032.3175261-1-royluo@google.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251029214032.3175261-1-royluo@google.com>
X-Mailer: git-send-email 2.51.1.851.g4ebd6896fd-goog
Message-ID: <20251029214032.3175261-2-royluo@google.com>
Subject: [PATCH v5 1/2] dt-bindings: phy: google: Add Google Tensor G5 USB PHY
From: Roy Luo <royluo@google.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Doug Anderson <dianders@google.com>, Joy Chakraborty <joychakr@google.com>, 
	Naveen Kumar <mnkumar@google.com>, Roy Luo <royluo@google.com>, 
	Badhri Jagan Sridharan <badhri@google.com>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Document the device tree bindings for the USB PHY interfaces integrated
with the DWC3 controller on Google Tensor SoCs, starting with G5
generation. The USB PHY on Tensor G5 includes two integrated Synopsys
PHY IPs: the eUSB 2.0 PHY IP and the USB 3.2/DisplayPort combo PHY IP.

Due to a complete architectural overhaul in the Google Tensor G5, the
existing Samsung/Exynos USB PHY binding for older generations of Google
silicons such as gs101 are no longer compatible, necessitating this new
device tree binding.

Signed-off-by: Roy Luo <royluo@google.com>
---
 .../bindings/phy/google,gs5-usb-phy.yaml      | 127 ++++++++++++++++++
 1 file changed, 127 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/google,gs5-usb-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/google,gs5-usb-phy.yaml b/Documentation/devicetree/bindings/phy/google,gs5-usb-phy.yaml
new file mode 100644
index 000000000000..8a590036fbac
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/google,gs5-usb-phy.yaml
@@ -0,0 +1,127 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2025, Google LLC
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/google,gs5-usb-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Google Tensor Series (G5+) USB PHY
+
+maintainers:
+  - Roy Luo <royluo@google.com>
+
+description: |
+  Describes the USB PHY interfaces integrated with the DWC3 USB controller on
+  Google Tensor SoCs, starting with the G5 generation.
+  Two specific PHY IPs from Synopsys are integrated, including eUSB 2.0 PHY IP
+  and USB 3.2/DisplayPort combo PHY IP.
+
+properties:
+  compatible:
+    const: google,gs5-usb-phy
+
+  reg:
+    items:
+      - description: USB3.2/DisplayPort combo PHY core registers.
+      - description: USB3.2/DisplayPort combo PHY Type-C Assist registers.
+      - description: USB2 PHY configuration registers.
+      - description: USB3.2/DisplayPort combo PHY top-level registers.
+
+  reg-names:
+    items:
+      - const: usb3_core
+      - const: usb3_tca
+      - const: usb2_cfg
+      - const: usb3_top
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
+    minItems: 2
+    items:
+      - description: USB2 PHY clock.
+      - description: USB2 PHY APB clock.
+      - description: USB3.2/DisplayPort combo PHY clock.
+      - description: USB3.2/DisplayPort combo PHY firmware clock.
+    description:
+      USB3 clocks are optional if the device is intended for USB2-only
+      operation.
+
+  clock-names:
+    minItems: 2
+    items:
+      - const: usb2
+      - const: usb2_apb
+      - const: usb3
+      - const: usb3_fw
+
+  resets:
+    minItems: 2
+    items:
+      - description: USB2 PHY reset.
+      - description: USB2 PHY APB reset.
+      - description: USB3.2/DisplayPort combo PHY reset.
+    description:
+      USB3 clocks are optional if the device is intended for USB2-only
+      operation.
+
+  reset-names:
+    minItems: 2
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
+            compatible = "google,gs5-usb-phy";
+            reg = <0 0x0c410000 0 0x20000>,
+                  <0 0x0c430000 0 0x1000>,
+                  <0 0x0c450014 0 0xc>,
+                  <0 0x0c637000 0 0xa0>;
+            reg-names = "usb3_core", "usb3_tca", "usb2_cfg", "usb3_top";
+            #phy-cells = <1>;
+            clocks = <&hsion_usb2_phy_clk>, <&hsion_u2phy_apb_clk>;
+            clock-names = "usb2", "usb2_apb";
+            resets = <&hsion_resets_usb2_phy>,
+                     <&hsion_resets_u2phy_apb>;
+            reset-names = "usb2", "usb2_apb";
+            power-domains = <&hsio_n_usb_pd>;
+            orientation-switch;
+        };
+    };
+...
-- 
2.51.1.851.g4ebd6896fd-goog

