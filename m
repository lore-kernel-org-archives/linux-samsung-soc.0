Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B4F1AF0B0;
	Thu, 12 Dec 2024 21:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734037760; cv=none; b=A5Wm1V4p0iqLfVDmu6Q5cOM/jpXn8ykrmt5aNqo338AlV4r23ZmHP4OvMIs4hpRh8SttHA0567NMH7rJLeaa744qJzJUWqiDWNXfEKgGcPqNFCxzDVwqm/3MsVHIs+J6xaj6Vby4m2AO7lzp/MNIH304edJZxYP+UNwUuhWkm5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734037760; c=relaxed/simple;
	bh=gUnnizAdulAwxg+3Tnxh6d0BvTK9I11iWmyGXZBMs44=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IDRIRvem5MUwB/V8hqY6gqaBRfM7hYnX5940z34B2nq9EVrpR/X8kV7doSR2D2UA4qaCu/aTKsGZ1sAgeq/nroNhqRi8OcbOg06g1LB2ewLk9b825Qe1slVISfIIoBZjDi3FEqN0gBOm3ZD+Tju4rJOF7EQnaN5kyOiQKo1RM2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yg58MWPz; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yg58MWPz"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5d0f6fa6f8bso1532500a12.0;
        Thu, 12 Dec 2024 13:09:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734037757; x=1734642557; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nN9qy6kzaYRcTvspSPXcPestPQ9vGh5brGqrf6epwWw=;
        b=Yg58MWPzOmlty/VHvQRYECpQmIoTtlHeVtQt+VBmqvpEuRofOwgBHjPiT3sdTvpcAo
         0vL7eSubpcivTkmI2Zx1t5mBxyJ8GW41wBpEqtqCTij+4WUakG7emEEavT158TMLXwRI
         Wz5Ek3LZ6jBKPcK/K7tCYmGNjhIWXnK2jNw7NYsF7NZCWL4T9CYeek4kBUW9eR8j9ROR
         B6NDSw3OGdH22FPx5pGd9wdypSwRYKxI01JmBTggfe3fX0OznJJRa/8IgPjaS9TvDl9G
         JzNyeX4eaQxVrUdlDibV6i7RYjFPWPKWp9UFAjCC9djLT+vCeyGfohAC/so2WTAYXPBd
         TQCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734037757; x=1734642557;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nN9qy6kzaYRcTvspSPXcPestPQ9vGh5brGqrf6epwWw=;
        b=wFPu2JGO7kkT/zFItVMKSpnkDm+Pt32g/V+KDd+iitrj369gS2uwm73di+RsJDEYLa
         iPD7WqWQso3ycjgstadPwG8co2eKqfvagEwkxtx2q5JxXD1UPscpOayCn1ARbL9M3wxX
         S8kJrDpJJJAUhpuBWo9vcZNHSvgJj+dNG5AvJ5kqDacrheau+N0JwYi9yrnCpuSWbnZq
         fdOSVdQf35jlzVXrTVB1il+y05iX0sxM4bL2pnrkkrpMbgi5AUvETArWDK7szZFRSBwJ
         UeZOV+GqUZEkctoFRSJnEbia30HcYxq0XXKWMBEGeGBteHRnDcB02SCp2juhGxAVjgXV
         bePw==
X-Forwarded-Encrypted: i=1; AJvYcCUIk+TKBgNkSr4P2HmbDvvlTZmMaQcMdeSNiNhljaYPBDfKiOLcmGK9icbCPWeJj3GDertBL4KYjtw6@vger.kernel.org, AJvYcCXO5KjBC1mMcwVZ3l02QXj3Z4Mgwa6U6NtGlxxL4yOLmPA8/XaMWSCERjQZ30EazRCxDnO/mfdF8OA3dljZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzTm85VaGDkFs9zRDi8G9BD1GyfndeT/Sce/Ep2+J0SwyPGPk2s
	w4HRVeRfteHNi0UwHDpWNYkQO/QWwQu5PNhjvCTACO36sxaYzJyW
X-Gm-Gg: ASbGncti5T7dlxliNMW+u7YazXQXmasVUycXTH54G9OXTAJWmnffVkVf3qhvYumhnv9
	KBm3PImTLOMp9IaO/ZY0rINQCl7v24txfzxDm0iiltdwrrdxCn+bThPHuIFOAUB6KohFqu0HZA9
	SsSmASTOPFUJD8srWB2EVZtvsMytviEB2gZv3fqMtxXLrv862tkYDBjYcRgLK7M3JPnGTyWy1ef
	qJ6QOY8h8W6gmi7S4xfsL+fsw4UBWBzhjXZwpjp3Aq9gDR4bg9149CsHcNfAPemy4ug
X-Google-Smtp-Source: AGHT+IERTCYWfJYYkVszTsbpSkVPOiDO17vUGSDsrzxOO1nszolFyLdHEMLSrp83Tj/zAKFwqxyp+A==
X-Received: by 2002:a05:6402:35d2:b0:5d0:cfb9:4132 with SMTP id 4fb4d7f45d1cf-5d63239e3f0mr1935496a12.18.1734037757096;
        Thu, 12 Dec 2024 13:09:17 -0800 (PST)
Received: from [192.168.31.111] ([194.39.226.133])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3d0f93d54sm9232348a12.68.2024.12.12.13.09.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 13:09:16 -0800 (PST)
From: Markuss Broks <markuss.broks@gmail.com>
Date: Thu, 12 Dec 2024 23:09:01 +0200
Subject: [PATCH 1/3] dt-bindings: soc: samsung: exynos-speedy: Document
 SPEEDY host controller bindings
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-speedy-v1-1-544ad7bcfb6a@gmail.com>
References: <20241212-speedy-v1-0-544ad7bcfb6a@gmail.com>
In-Reply-To: <20241212-speedy-v1-0-544ad7bcfb6a@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Markuss Broks <markuss.broks@gmail.com>, 
 Maksym Holovach <nergzd@nergzd723.xyz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734037753; l=2792;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=gUnnizAdulAwxg+3Tnxh6d0BvTK9I11iWmyGXZBMs44=;
 b=ndri8pJVWgLELporVKp1ht8IO8Ncb/897FweJq2tFszKSNCils5GX+Sa2P2ZAR7l8TNZWBDXC
 MdNOBLDJYT1Bjmd0ooTpO1UucpedTECQS4GsRAMFY4QCeCpmxY94DLm
X-Developer-Key: i=markuss.broks@gmail.com; a=ed25519;
 pk=p3Bh4oPpeCrTpffJvGch5WsWNikteWHJ+4LBICPbZg0=

Add the schema for the Samsung SPEEDY serial bus host controller.
The bus has 4 bit wide addresses for addressing devices
and 8 bit wide register addressing. Each register is also 8
bit long, so the address can be 0-f (hexadecimal), node name
for child device follows the format: node_name@[0-f].

Co-developed-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
---
 .../bindings/soc/samsung/exynos-speedy.yaml        | 78 ++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-speedy.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-speedy.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..304b322a74ea70f23d8c072b44b6ca86b7cc807f
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-speedy.yaml
@@ -0,0 +1,78 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/samsung/exynos-speedy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung Exynos SPEEDY serial bus host controller
+
+maintainers:
+  - Markuss Broks <markuss.broks@gmail.com>
+
+description:
+  Samsung SPEEDY is a proprietary Samsung serial 1-wire bus.
+  It is used on various Samsung Exynos chips. The bus can
+  address at most 4 bit (16) devices. The devices on the bus
+  have 8 bit long register line, and the registers are also
+  8 bit long each. It is typically used for communicating with
+  Samsung PMICs (s2mps17, s2mps18, ...) and other Samsung chips,
+  such as RF parts.
+
+properties:
+  compatible:
+    - items:
+        - enum:
+            - samsung,exynos9810-speedy
+        - const: samsung,exynos-speedy
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    - const: pclk
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+
+patternProperties:
+  "^[a-z][a-z0-9]*@[0-9a-f]$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      reg:
+        maxItems: 1
+
+    required:
+      - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    speedy0: speedy@141c0000 {
+      compatible = "samsung,exynos9810-speedy",
+                   "samsung-exynos-speedy";
+      reg = <0x141c0000 0x2000>;
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      pmic@0 {
+        compatible = "samsung,s2mps18-pmic";
+        reg = <0x0>;
+      };
+
+      regulator@1 {
+        compatible = "samsung,s2mps18-regulator";
+        reg = <0x1>;
+      };
+    };

-- 
2.47.0

