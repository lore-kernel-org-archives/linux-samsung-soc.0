Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC56F302769
	for <linux-samsung-soc@vger.kernel.org>; Fri, 10 Oct 2025 20:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760127392; cv=none; b=Myy3fKshenK7gMltNi2O22sE0ATnX/VHhePxXOaMRPpzq4kGd5CUQzioAzUUCmkWyjbOP8tD5v/wa+hbOLjURR8bOfycVOz1l5ckONEFa2F2QNhIe+96+kHFQXTi8gcDGPWlG2vfDyFN1H7dww/LbNZJBI6YgHQwWgml4UacqMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760127392; c=relaxed/simple;
	bh=5laxyqh7RGrWvj7i4MuNeBhW45V+0GW5m1xO8+53Fn4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=u45Cyqzyx1MCaH8jPd8UZKH6ckPHKdGYvAsy6OYaTNUWNGRS/KxpByrBHhUffAAyWP03tnw7H+tOYUM7MYGJrqBeFlZ5oUtiMKE47w+561zwnzyPSKyZ7usBOOp370ChmDY+W075n6YwI2UZ8l4E6yEVP7ylgc7SPb5C0xGOSJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WNT4nE6/; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WNT4nE6/"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-334b0876195so6787801a91.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 10 Oct 2025 13:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760127390; x=1760732190; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rDMjRNZuXBcadxapfJv5DZnyvTWebZelvolDUVBwbeA=;
        b=WNT4nE6/hYpYSD2D400uErVO+dV2m9ZDnCKnmwkjkAmGjHZCBb/YDtYnAu7cDe6ea9
         kS1Tf+Nt7ez5xbfw2dcTeJoClyiKFVmV1EzP27ve8qBgmMOnKMVSO978Bb3PLduj28mh
         V0NJEm5gMawxi0BOkmV14f4b0CUU5oI1CxmGe9nbrMvjXdXUev3p6oHeA1rZ0XGJaqOB
         9F40YpXACBfNOXkYcArsSdf2pv4GdYcTERevZ8iqzy6gArGq8LuFw4mNKMZNqOrPd0+I
         g9qVHG+4Grla7lAMy1PxUiaXFPkGNi4UgvcjmRg2iG4qS3rCe27/6pm/8P4W+T7WMI0G
         t6Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760127390; x=1760732190;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rDMjRNZuXBcadxapfJv5DZnyvTWebZelvolDUVBwbeA=;
        b=SlRgHG+rWJhoUcPEzEQRzGQ1lif4G9cs7SiVq/76OwcjMr8/oq5iEzW/gdPYaevQBN
         WeXhkKJN1lNvjo6vBsann/n4qoLM68rYBlWA+Evz+fn91giPS2Dm1IzROqz+1m0X7Gne
         rA3wQjf9dqX67DSLvTpbKxvgdEjBNvWsONoS+8aazXO0WnUzRQW9GBlg/z+y9T7dE/Xd
         0NmdAa1ftqXHeLbuT+9bE5K6FKcWAbGt9FPuSRtatBFtd/GK7VP/bZkHlyangN1kLJLi
         EsECpCn5y69n1gJKNAth6RLODimMVNMzctHbYZTwpWqf3cizp9Wkuy1ApQW81XM0hpxh
         gjIg==
X-Forwarded-Encrypted: i=1; AJvYcCVwXzT+gjFIYE/AKLfZDmLK4IPYQaEsLApVhBNgjQ+e9TKnIXqJN4rL84ntJDscySUjY5Wd7Xu84cs+gEoNibwizw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXwH0F2Qk28yFx4mIUEqWQHBonm5xo2xhDfkwToGDNXqt6CCKx
	WiCqMhqeuIF3yi+mGb3euEtxjQQDigi5+XXNwuQ/jcOpAmFTWpD2ckwmRiT44FhotTJpXZfe4LV
	4zDEG2A==
X-Google-Smtp-Source: AGHT+IG2O2/hmz4EGHxbz6LI/FnWz/lYeOwpP5uEupOv3mruD2AaSSt/AAWUjN2TixtwciX5BwSqJ0FHSFw=
X-Received: from pjff6.prod.google.com ([2002:a17:90b:5626:b0:330:6c04:207])
 (user=royluo job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4a83:b0:32e:b87e:a961
 with SMTP id 98e67ed59e1d1-33b511173bfmr19125944a91.5.1760127389914; Fri, 10
 Oct 2025 13:16:29 -0700 (PDT)
Date: Fri, 10 Oct 2025 20:16:06 +0000
In-Reply-To: <20251010201607.1190967-1-royluo@google.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251010201607.1190967-1-royluo@google.com>
X-Mailer: git-send-email 2.51.0.740.g6adb054d12-goog
Message-ID: <20251010201607.1190967-4-royluo@google.com>
Subject: [PATCH v3 3/4] dt-bindings: phy: google: Add Google Tensor G5 USB PHY
From: Roy Luo <royluo@google.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>, Roy Luo <royluo@google.com>, 
	Badhri Jagan Sridharan <badhri@google.com>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
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
 .../bindings/phy/google,gs5-usb-phy.yaml      | 88 +++++++++++++++++++
 1 file changed, 88 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/google,gs5-usb-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/google,gs5-usb-phy.yaml b/Documentation/devicetree/bindings/phy/google,gs5-usb-phy.yaml
new file mode 100644
index 000000000000..a40de31ac768
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/google,gs5-usb-phy.yaml
@@ -0,0 +1,88 @@
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
+  The hardware can support three PHY interfaces, which are selected using the
+  first phandle argument in the PHY specifier::
+    0 - USB high-speed.
+    1 - USB super-speed.
+    2 - DisplayPort
+
+properties:
+  compatible:
+    const: google,gs5-usb-phy
+
+  reg:
+    items:
+      - description: USB2 PHY configuration registers.
+      - description: DisplayPort top-level registers.
+      - description: USB top-level configuration registers.
+
+  reg-names:
+    items:
+      - const: u2phy_cfg
+      - const: dp_top
+      - const: usb_top_cfg
+
+  "#phy-cells":
+    const: 1
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
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
+  - resets
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
+            reg = <0 0x0c450014 0 0xc>,
+                  <0 0x0c637000 0 0xa0>,
+                  <0 0x0c45002c 0 0x4>;
+            reg-names = "u2phy_cfg", "dp_top", "usb_top_cfg";
+            #phy-cells = <1>;
+            clocks = <&hsion_usb2_phy_reset_clk>;
+            resets = <&hsion_resets_usb2_phy>;
+            power-domains = <&hsio_n_usb_pd>;
+            orientation-switch;
+        };
+    };
+...
-- 
2.51.0.740.g6adb054d12-goog

