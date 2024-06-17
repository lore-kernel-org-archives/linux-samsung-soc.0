Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C235F16133C
	for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Jun 2024 16:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718642714; cv=none; b=irAU/HOWr7PYKzziXWctpjMIdlnUwQUBcpAd6IkY81/bEN9oWoMxYFF8HDT10K36z61efAUChV4nMHCDv7luiAos6AzOrdDJ1kIduy/lyekPJ/j3VXY4xHlhwaFHiptDHih9hl2lCA17smaQGkZHAdk0I8FM0LFomkTetfUx9Kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718642714; c=relaxed/simple;
	bh=h0islHa4RkW5pe719QjdceKNaJbSiTjAjQtyf2K3k1k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uj+jSopEROGDCZmLk3ZZp6hl8Q+diXiHALBf+CsytPCbtas25FnyrZOERI7VtbvIviO4d1efhZrQxgdSFceesN4URC6rdUSGdvS4xRGqfq1O1YRgOIoUMBDCYaaInc9VeSjaHn/eO+2jQKAlvJpqkFhAieZckQngGgweF1GsfGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LzVAlRqT; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LzVAlRqT"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a6ef64b092cso558032566b.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Jun 2024 09:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718642711; x=1719247511; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wYub/RSqb8Rt0WMbKUbwYUc1IlmByIMY38T9EwCcE9I=;
        b=LzVAlRqTV9QRe7ggfH5az5w8hvnECKeyo4ujMqPWOnTw5/eYIbXvQ96cQ/bBRrl0Xa
         66Nc0h4WvMpWr+GIAljh2IJI6TSct7yqlqGx5L027K9HKfDI/igWOzz2F3S78qT8pD7H
         y7x5a4EVxdeb9R0uEphqU8Q3X/zNBzd/hTPtpo1X8lu+54L9LYGQmZbUI65b65Ag4a/K
         DrHWDSuclKKMooxH3v2xty736Qd8eUA5CQl3nt8WNTH5icR1YlNcjegr9H/0uWtw6Aor
         Bpc38jTyvCv5piSQG1Nxi/A6c/Tjcsev1tUwfbhTHuRbYEqBOUxKe+3D3j73jqdX7fgz
         tGmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718642711; x=1719247511;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wYub/RSqb8Rt0WMbKUbwYUc1IlmByIMY38T9EwCcE9I=;
        b=Iawypjw6C2ZbiQpLfR8nxwsDnLA69k1WZWKD5VP/TG5esSd7XYee8Ny5y5Pv3kJrFi
         86qSynz37KUvu6UxecT6aGMWDq9qRUPHbuFlPgyWp8/2jZQsMlQk/byiwcw1jgGC6owp
         sma8CNmtnFFkAzc0n+D0aW9F19YlUPXYdeuBJv8lkYGIVtL9ngO7yrgbCtp9rr9Bzcu4
         NZ5iNIfeklNle2k4S7bFii7WR7UA+1paXzxfhKDnUlOS0n5zx5ReQVaQsCI/dzDLrsqQ
         erfQ1KpzB+W63O5fa3jsCb2plcWQF/97sRO4voLFf72eNNgQlnM0Ow5DMGvfi4IDc/4z
         ui2g==
X-Forwarded-Encrypted: i=1; AJvYcCWTnDObf3vKd7ZY4wysb6p5moQJvUDuCiHvJsDfbiAIrLEtRqgaA6bkNJ2vBN4acGmMnV68ZYnabjFCpuoqOIC/DwUZxN1ytlpU+fgwIxkqI2Y=
X-Gm-Message-State: AOJu0Yxq8I9QYFQzBQzfAaFQRPiuCTe8Z9BjFRH+noXKN4GsFdwK7FQk
	/mJHAe18T0RxZslouGVZQWG9ECDmMOiuKG3o7CtE7r0fiHV5LHxReClqigxcHdY=
X-Google-Smtp-Source: AGHT+IHv0ukUOJDUc8BdVmzy7hmS+1oi69QOBMofoFgHRV33yO4xcJwLLTOoJRJaGOBhau06DyTjJg==
X-Received: by 2002:a17:907:6d25:b0:a6e:a97c:fc9a with SMTP id a640c23a62f3a-a6f60cef313mr888080866b.8.1718642711038;
        Mon, 17 Jun 2024 09:45:11 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56f4170bsm527139966b.157.2024.06.17.09.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 09:45:10 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 17 Jun 2024 17:44:42 +0100
Subject: [PATCH v3 1/6] dt-bindings: phy: samsung,usb3-drd-phy: add gs101
 compatible
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240617-usb-phy-gs101-v3-1-b66de9ae7424@linaro.org>
References: <20240617-usb-phy-gs101-v3-0-b66de9ae7424@linaro.org>
In-Reply-To: <20240617-usb-phy-gs101-v3-0-b66de9ae7424@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, 
 kernel-team@android.com, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0

Add a dedicated google,gs101-usb31drd-phy compatible for Google Tensor
gs101 SoC.

It needs additional clocks enabled for register access, and additional
memory regions (PCS & PMA) are required for successful configuration.

It also requires various power supplies (regulators) for the internal
circuitry to work. The required voltages are:
* pll-supply: 0.85V
* dvdd-usb20-supply: 0.85V (+10%, -7%)
* vddh-usb20-supply: 1.8V (+10%, -7%)
* vdd33-usb20-supply: 3.3V (+10%, -7%)
* vdda-usbdp-supply: 0.85V
* vddh-usbdp-supply: 1.8V

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v3:
* drop descriptions of reg items (Krzysztof)
  Rather than coming up with another description for the reg items, I
  opted to fully drop the descriptions from the reg items as reg-names
  describes these already using the standard, well-known
  abbreviations.
* add required power supplies
v2: avoid having nested else/if, and instead change the existing 'else'
    to explicitly state the platforms using 'if'
---
 .../bindings/phy/samsung,usb3-drd-phy.yaml         | 77 +++++++++++++++++++++-
 1 file changed, 75 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
index 452e584d9812..16321cdd4919 100644
--- a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
@@ -25,6 +25,7 @@ description: |
 properties:
   compatible:
     enum:
+      - google,gs101-usb31drd-phy
       - samsung,exynos5250-usbdrd-phy
       - samsung,exynos5420-usbdrd-phy
       - samsung,exynos5433-usbdrd-phy
@@ -57,7 +58,15 @@ properties:
       the OF graph bindings specified.
 
   reg:
-    maxItems: 1
+    minItems: 1
+    maxItems: 3
+
+  reg-names:
+    minItems: 1
+    items:
+      - const: phy
+      - const: pcs
+      - const: pma
 
   samsung,pmu-syscon:
     $ref: /schemas/types.yaml#/definitions/phandle
@@ -72,6 +81,19 @@ properties:
     description:
       VBUS Boost 5V power source.
 
+  pll-supply:
+    description: Power supply for the USB PLL.
+  dvdd-usb20-supply:
+    description: DVDD power supply for the USB 2.0 phy.
+  vddh-usb20-supply:
+    description: VDDh power supply for the USB 2.0 phy.
+  vdd33-usb20-supply:
+    description: 3.3V power supply for the USB 2.0 phy.
+  vdda-usbdp-supply:
+    description: VDDa power supply for the USB DP phy.
+  vddh-usbdp-supply:
+    description: VDDh power supply for the USB DP phy.
+
 required:
   - compatible
   - clocks
@@ -81,6 +103,40 @@ required:
   - samsung,pmu-syscon
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: google,gs101-usb31drd-phy
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Gate of main PHY clock
+            - description: Gate of PHY reference clock
+            - description: Gate of control interface AXI clock
+            - description: Gate of control interface APB clock
+            - description: Gate of SCL APB clock
+        clock-names:
+          items:
+            - const: phy
+            - const: ref
+            - const: ctrl_aclk
+            - const: ctrl_pclk
+            - const: scl_pclk
+        reg:
+          minItems: 3
+        reg-names:
+          minItems: 3
+      required:
+        - reg-names
+        - pll-supply
+        - dvdd-usb20-supply
+        - vddh-usb20-supply
+        - vdd33-usb20-supply
+        - vdda-usbdp-supply
+        - vddh-usbdp-supply
+
   - if:
       properties:
         compatible:
@@ -100,7 +156,20 @@ allOf:
             - const: phy_utmi
             - const: phy_pipe
             - const: itp
-    else:
+        reg:
+          maxItems: 1
+        reg-names:
+          maxItems: 1
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - samsung,exynos5250-usbdrd-phy
+              - samsung,exynos5420-usbdrd-phy
+              - samsung,exynos850-usbdrd-phy
+    then:
       properties:
         clocks:
           minItems: 2
@@ -109,6 +178,10 @@ allOf:
           items:
             - const: phy
             - const: ref
+        reg:
+          maxItems: 1
+        reg-names:
+          maxItems: 1
 
 additionalProperties: false
 

-- 
2.45.2.627.g7a2c4fd464-goog

