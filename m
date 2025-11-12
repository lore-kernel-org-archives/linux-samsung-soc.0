Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2CA22F261F
	for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Nov 2025 08:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762936158; cv=none; b=n6ufpPZXDFxKJxfqkfNYh7w41Q1GSSinrRnF+dFZvhwpMPzAGYx3ejeEau3hPv9FZBtEMLvYQN1HhkAjyKMibufGY82FBMv6hJ4XlNOBiLoLBvdr1CBqGBogWzPsgLl35AGz60o6HsSqQQacR0AXXnIeNMvOEKCzUHXoZYPORFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762936158; c=relaxed/simple;
	bh=dEcSRRQtvE4xP0095DiinVR5fFEjss1bE4Kb607L5bU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pLoZtA0dgmeRMF56jWC2k72Z+FjU8hyMOABM3O+O03no3WfekxKdpPt4DeIe9Rny/G70N/hAkSIi+AykR4YLYeU4yO2wc4VDzUZYXkvHhqoRZ4iGfqLPJspT2oIhAX9FgxaLRVrTvs3moZHDcO+ShPwbQ6pz4D6tgi/TxaGq9Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UCnqASjD; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UCnqASjD"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42b3c965df5so297313f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Nov 2025 00:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762936155; x=1763540955; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JtogQFcSHlN8gkfKXvyp9GsEsbrpcQ/U+ViAyh1NORc=;
        b=UCnqASjDhudrSXX61bOwzWzYt8j9RKmc5pwdUoPXDcC2WVoy9wtdNoxI1i6SlV0opu
         t77fcK4yGqR3deYRj/zzTm65oka/BTLPB7JiioJwsDHwIiKV1L0cRpfDIpfST2ybRKEJ
         furXOP8QvjG5VofJomX+4EnWp+3pnxQBuvg4yTRDF0UE4GrymChZ6DlRg8YzLH+4Wn1i
         fFYNES2v9ULyV/jqbknXzDiaoRHQIjeOoqyYPy9yQERm1DOYpW6riYfZZ4NDFD0kveE/
         P+P6xxWP9T0Jm7saVljrwTe8b+Do6MPj8aCoA3RPCD1nO9gCqn92CU8pfpEyyZ2iA5fT
         zccg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762936155; x=1763540955;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JtogQFcSHlN8gkfKXvyp9GsEsbrpcQ/U+ViAyh1NORc=;
        b=BBGnGlT1NTOKEL27+jUsra7FRChChcX1u+6vIM8A0t52Iml8dsOmNTSKL4XTf1KIzK
         he25WqOJ+2kfRgTYDcTeekVdOvAo34WES+MRz7ayJ/ItgEoCH471pyTiTtH6Fj7w5SeI
         xpubRSJqheCJPL0pvTpAZUsZSuYa4kLWZLFtVWCknjC3m9/+RTvP0jti6wDrd1EUawGM
         HqWTD1qZLE43RE1OmNS5eESh64A8PjTV4bJVyiWNMoIjL7MKxVhf6gSbFkIgclW9bId3
         exKCGjpM4f0Fbs49U/n8j5HwpOtO4V3mUqH8y9lsivXBBODZNGWPnl+VGfS8qMtMgLou
         3jnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBkBy5bRazsPX8E2wcEE6BXgXwG9qzEw04chWTmZYEbm48mwct9JAEMOL0JMptmrD+MOvuXOO/UzTvytChuM+rZg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPMoCRyFIaVMwU0iy7+Hdgv5RLFz3Rw8rbkqLwkI8Wc5KrNQab
	fOYsr7ygm9AlhscBuIygFQ1X5R1djiRi5lsX0SqhATu6iYtP03BqP53RJ5wDoD8EbLk=
X-Gm-Gg: ASbGncuL4nZ6ZcerQoCnjb5jY1sV1G9MeBwAxK2D0laPI3nHQ+HfQ68CBZyAr98c4fW
	78JtrlwUKz97jnT2MKpTYzKajDgQXXM8wFjNG1jjnmyBKTb7T0sWBPw2shR4aSnsTO7ZxVQR7pf
	HKl6lRYDwq2p48G3LiqUXTz+j2c8yoA2VT6CHCluoKJpP2rtm7Gue0Egnd/jOYakk+bNKNp+3to
	MJwt0zO1pmjvp1QzJrg+WIizwsrwS4kVzxlDIEtHcY6gFZvLXbkdCY9fcFzaQZHpdT6UTb7Il5w
	F/dFh1CkTNj53xIKk1ajMRSda51tvhmvxbgt75GKP0NcHrKkLtbuPd9dxh8AbD8nqjVMjIzOUAl
	d/vD56gIVRR9GG9w6/xu4Eu59vFZ6dW98hop979KtgjNbb8RSt3uK/A4PalxEsYHCMMBUW5QPzR
	m+vn5fODBCLtzwnaQkZAA9Z6m5/s/eYXeXg1LqyhzWs55seYWwXIDH+jf4
X-Google-Smtp-Source: AGHT+IEU4FFylzRDbDiqTl5SDdc681V6U/fIzfBAB7L0TgSU5N2M6VMTglal8026StadrPU/haIBUA==
X-Received: by 2002:a05:6000:2888:b0:429:cc1c:c2e with SMTP id ffacd0b85a97d-42b4bb90b6bmr1430374f8f.1.1762936154894;
        Wed, 12 Nov 2025 00:29:14 -0800 (PST)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac677ab75sm31571428f8f.35.2025.11.12.00.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 00:29:14 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 12 Nov 2025 08:29:05 +0000
Subject: [PATCH v2 1/5] dt-bindings: nvmem: add google,gs101-otp
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-gs101-otp-v2-1-bff2eb020c95@linaro.org>
References: <20251112-gs101-otp-v2-0-bff2eb020c95@linaro.org>
In-Reply-To: <20251112-gs101-otp-v2-0-bff2eb020c95@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: semen.protsenko@linaro.org, willmcvicker@google.com, 
 kernel-team@android.com, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762936153; l=1979;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=dEcSRRQtvE4xP0095DiinVR5fFEjss1bE4Kb607L5bU=;
 b=OOX0r/TY8rkVTDOz28jm+bgdNooRzs/EvPWQacDtL9RIRn5yJEOAYEXSxltqVpFD4s7fZonIU
 jteQzbYy5l0BJ5yhYs/b58SW4kymeDF8K5hTUQLkv3HwXTDar9OlFds
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Add binding for the OTP controller found on Google GS101.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 .../bindings/nvmem/google,gs101-otp.yaml           | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvmem/google,gs101-otp.yaml b/Documentation/devicetree/bindings/nvmem/google,gs101-otp.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..ea87216761dbab9a7a5cecd87a553a6a2a1783f7
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/google,gs101-otp.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/nvmem/google,gs101-otp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Google GS101 OTP Controller
+
+maintainers:
+  - Tudor Ambarus <tudor.ambarus@linaro.org>
+
+description: |
+  OTP controller drives a NVMEM memory where system or user specific data
+  can be stored. The OTP controller register space if of interest as well
+  because it contains dedicated registers where it stores the Product ID
+  and the Chip ID (apart other things like TMU or ASV info).
+
+allOf:
+  - $ref: nvmem.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: google,gs101-otp
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  reg:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/google,gs101.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    efuse@10000000 {
+        compatible = "google,gs101-otp";
+        reg = <0x10000000 0xf084>;
+        clocks = <&cmu_misc CLK_GOUT_MISC_OTP_CON_TOP_PCLK>;
+        interrupts = <GIC_SPI 752 IRQ_TYPE_LEVEL_HIGH>;
+    };

-- 
2.51.2.1041.gc1ab5b90ca-goog

