Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D35442147E4;
	Thu,  9 Jan 2025 09:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736413444; cv=none; b=IEAw2sVVc5C7ibJdTddB//lWBBSdTCIq2e1UUWGApAKuoT9JhAvVfuB77nq78CWp7+GAATizfnapYwKLi1UVqnmtQaheO/G4pKxX7EImCX8ssEzRjwInjwjAcRFPTE9rgq+DU+Z1ArdCmhvZffN5HNxZYUr+vOC91ay8SrgvU5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736413444; c=relaxed/simple;
	bh=xILKK43P/LIFgLwxGh1CuOmcQnxZi6EiysvJsh83kbw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pOcH5ibdwdRKug/H3ISvdgb9D51M5HxfL0tlTOTtoa1v0GJfVAVccQIMcBxI81NMOUuKEGumAkpR1qR6D4ckK+ea5nDFAIwK2y8BMCn586Ph12x2v6W8qt+X6aOPVjoZytQEGgvRV2hS3JSsQ8V68O0c15+5mFPFlUBs2O5/i+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kREAT91X; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kREAT91X"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-436345cc17bso5350245e9.0;
        Thu, 09 Jan 2025 01:04:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736413441; x=1737018241; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AATmeIywhPXpmS9/RGfjUbh+83T1nTe0P9ZqfpWyPjs=;
        b=kREAT91XolEv7ieAHHXR/bGhlVUrOXpwR7wlx7CWPp8Ghk3JjI4zJ+YYChJMLgiCii
         8XrYBS1dsku7a4sGSFpNUBph+0eVosV4ss2h9nguAt5QbqWIZnBFqSlF4ZJHp0PVaNz1
         96PIMybWKaj4w5lco45EhVsAGKkBk+bGPHu0mlXpZZQwjreuCz/n9RgnzcQiHA+Juymx
         2gxe7yNRh15BVEcEK5hBHB+2NmJezUdLRklarX1gfCgFIGZmutxjFEeMGJR2dlwGGW4/
         CfaYMZnh+8BfDV58pWB3vcVdJjnxhX9QUlugx7R0L+sWPy5rc18H1peLGydxXmfdmO3a
         65zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736413441; x=1737018241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AATmeIywhPXpmS9/RGfjUbh+83T1nTe0P9ZqfpWyPjs=;
        b=maSSQLIuh9X7C02PmpCrYtOpKFmr9WFToz/zf+31Pc/tKk1/9ptG89w7Aj2y3Eu1de
         U30rEmKYVnNzJNKyamK+70vCLoMItjVjm9CimnZm7SmQrmLMHswivES4wdxkDS89i5cz
         wg9PCrBbMkXskENLl8cvi8EhxyvYHqZSQhOt6nNzIuQc56i+UYUZgVzoA335/YMQzW2X
         E3D6rtiOUpdUIOGPhmMP8PalDsBu1LeubpWpRwsoc1v5lkCtIiie0NvLGWLTXFcHD0qx
         prsNWC5l8+VLqCsuTekr9RtkTxK+UnMKKc8NqBlgu8EVyupG0+VF9tcyz21jwMmQD8rE
         K7Qg==
X-Forwarded-Encrypted: i=1; AJvYcCUtHDxr5vLkWpCcn7ssqsbnIgvrzRDXM0q1HDykJvFErCRZfbhRxIIt+gUFQGf+yghCTHkRgIjvtAOWt0+d3yiAF78=@vger.kernel.org, AJvYcCV/yvAoXvgw5ypL6JkmvTWyjy9+n6BCPK/kuSeOec9ZKchwW5ziR/5oELDFgNOHghFFXYn9bq3og6QbSVg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoZlfpCk4SsQ1Ff70hwS0rYXZQYeMzOtNIUGXy24ZuBOr493MM
	CwkhKadj4ZBIOkRywnSldcgRdWYFziDXTdGvbknxNFNewrGnw+FP
X-Gm-Gg: ASbGncunBB7MRMcb6x/UPIwo5zgP2uaYh6nqrdMY7w+r1VjWEWbNjyyb8+D6wFmnrn4
	iU9wfIMdYFtGOj+oD8UwROIh30oxYqGMqPXz8lEYoelB0fGec9gt5vlycFvE0+Ez5cOXLGZk9dc
	3HMHD9QKF3cXv5bAOD4pNEoXOA7cPVuNEoy6bIiQTroq7hoIdG/I/nB+3L7T+kzqvmgGg60H98L
	Qd/MhWso54XxlIlrwv2Pu+Sn5mizIZSGuVf1VK/54v/ekxtsNEhl83lwJLIiWyZ81EmJ8uM9aO2
	fOPKEA6l8HlTDsx0T74=
X-Google-Smtp-Source: AGHT+IGFcxivxoUtzo1x5HYX/6VWt8bW7xU3madFDp/wdFgOZ+AOfuU+UH/x3Sf7sd06GFipOX9rPQ==
X-Received: by 2002:a05:6000:1f88:b0:38a:615c:8223 with SMTP id ffacd0b85a97d-38a872f69c7mr5075223f8f.10.1736413440930;
        Thu, 09 Jan 2025 01:04:00 -0800 (PST)
Received: from ivaylo-T580.. (62-73-104-42.ip.btc-net.bg. [62.73.104.42])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4b80b2sm1196692f8f.80.2025.01.09.01.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 01:04:00 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/4] dt-bindings: soc: samsung: usi: add USIv1 and samsung,exynos8895-usi
Date: Thu,  9 Jan 2025 11:03:22 +0200
Message-ID: <20250109090325.595475-2-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250109090325.595475-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250109090325.595475-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add new constants for choosing the additional USIv1 configuration modes
in device tree. Those are further used in the USI driver to figure out
which value to write into SW_CONF register. Modify the current USI IP-core
bindings to include information about USIv1 and a compatible for
exynos8895.

In the original bindings commit, protocol mode definitions were named
with the version of the supported USI (in this case, V2) with the idea of
leaving enough room in the future for other versions of this block. This,
however, is not how the modes should be modelled. The modes are not
version specific and you should not be able to tell USI which version of
a mode to use - that has to be handled in the driver - thus encoding this
information in the binding is meaningless. Only one constant per mode is
needed, so while we're at it, add new constants with the prefix USI_MODE
and mark the old ones as depracated.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/soc/samsung/exynos-usi.yaml      | 99 ++++++++++++-------
 include/dt-bindings/soc/samsung,exynos-usi.h  | 17 +++-
 2 files changed, 79 insertions(+), 37 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
index 5b046932f..f711e23c0 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
@@ -11,11 +11,21 @@ maintainers:
   - Krzysztof Kozlowski <krzk@kernel.org>
 
 description: |
-  USI IP-core provides selectable serial protocol (UART, SPI or High-Speed I2C).
-  USI shares almost all internal circuits within each protocol, so only one
-  protocol can be chosen at a time. USI is modeled as a node with zero or more
-  child nodes, each representing a serial sub-node device. The mode setting
-  selects which particular function will be used.
+  The USI IP-core provides configurable support for serial protocols, enabling
+  different serial communication modes depending on the version.
+
+  In USIv1, configurations are available to enable either one or two protocols
+  simultaneously in select combinations - High-Speed I2C0, High-Speed
+  I2C1, SPI, UART, High-Speed I2C0 and I2C1 or both High-Speed
+  I2C1 and UART.
+
+  In USIv2, only one protocol can be active at a time, either UART, SPI, or
+  High-Speed I2C.
+
+  The USI core shares internal circuits across protocols, meaning only the
+  selected configuration is active at any given time. USI is modeled as a node
+  with zero or more child nodes, each representing a serial sub-node device. The
+  mode setting selects which particular function will be used.
 
 properties:
   $nodename:
@@ -31,6 +41,7 @@ properties:
           - const: samsung,exynos850-usi
       - enum:
           - samsung,exynos850-usi
+          - samsung,exynos8895-usi
 
   reg:
     maxItems: 1
@@ -64,7 +75,7 @@ properties:
 
   samsung,mode:
     $ref: /schemas/types.yaml#/definitions/uint32
-    enum: [0, 1, 2, 3]
+    enum: [0, 1, 2, 3, 4, 5, 6]
     description:
       Selects USI function (which serial protocol to use). Refer to
       <include/dt-bindings/soc/samsung,exynos-usi.h> for valid USI mode values.
@@ -101,37 +112,59 @@ required:
   - samsung,sysreg
   - samsung,mode
 
-if:
-  properties:
-    compatible:
-      contains:
-        enum:
-          - samsung,exynos850-usi
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - samsung,exynos850-usi
+
+    then:
+      properties:
+        reg:
+          maxItems: 1
+
+        clocks:
+          items:
+            - description: Bus (APB) clock
+            - description: Operating clock for UART/SPI/I2C protocol
+
+        clock-names:
+          maxItems: 2
+
+        samsung,mode:
+          enum: [0, 1, 2, 3]
+
+      required:
+        - reg
+        - clocks
+        - clock-names
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - samsung,exynos8895-usi
 
-then:
-  properties:
-    reg:
-      maxItems: 1
+    then:
+      properties:
+        reg: false
 
-    clocks:
-      items:
-        - description: Bus (APB) clock
-        - description: Operating clock for UART/SPI/I2C protocol
+        clocks:
+          items:
+            - description: Bus (APB) clock
+            - description: Operating clock for UART/SPI protocol
 
-    clock-names:
-      maxItems: 2
+        clock-names:
+          maxItems: 2
 
-  required:
-    - reg
-    - clocks
-    - clock-names
+        samsung,clkreq-on: false
 
-else:
-  properties:
-    reg: false
-    clocks: false
-    clock-names: false
-    samsung,clkreq-on: false
+      required:
+        - clocks
+        - clock-names
 
 additionalProperties: false
 
@@ -144,7 +177,7 @@ examples:
         compatible = "samsung,exynos850-usi";
         reg = <0x138200c0 0x20>;
         samsung,sysreg = <&sysreg_peri 0x1010>;
-        samsung,mode = <USI_V2_UART>;
+        samsung,mode = <USI_MODE_UART>;
         samsung,clkreq-on; /* needed for UART mode */
         #address-cells = <1>;
         #size-cells = <1>;
diff --git a/include/dt-bindings/soc/samsung,exynos-usi.h b/include/dt-bindings/soc/samsung,exynos-usi.h
index a01af169d..b46de214d 100644
--- a/include/dt-bindings/soc/samsung,exynos-usi.h
+++ b/include/dt-bindings/soc/samsung,exynos-usi.h
@@ -9,9 +9,18 @@
 #ifndef __DT_BINDINGS_SAMSUNG_EXYNOS_USI_H
 #define __DT_BINDINGS_SAMSUNG_EXYNOS_USI_H
 
-#define USI_V2_NONE		0
-#define USI_V2_UART		1
-#define USI_V2_SPI		2
-#define USI_V2_I2C		3
+#define USI_MODE_NONE		0
+#define USI_MODE_UART		1
+#define USI_MODE_SPI		2
+#define USI_MODE_I2C		3
+#define USI_MODE_I2C1		4
+#define USI_MODE_I2C0_1		5
+#define USI_MODE_UART_I2C1	6
+
+/* Deprecated */
+#define USI_V2_NONE		USI_MODE_NONE
+#define USI_V2_UART		USI_MODE_UART
+#define USI_V2_SPI		USI_MODE_SPI
+#define USI_V2_I2C		USI_MODE_I2C
 
 #endif /* __DT_BINDINGS_SAMSUNG_EXYNOS_USI_H */
-- 
2.43.0

