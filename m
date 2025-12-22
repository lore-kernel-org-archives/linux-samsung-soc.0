Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFAD4326934
	for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Dec 2025 16:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766421037; cv=none; b=TPDDUNGGoB7EjqL2xBeAGohQK6AdYSN4a1XbfxLB/pn9V2wuXCm6Eh9/y/QCnqivTEClEPJCyxvCmDW/EXLEWxHD+cRzmYCVyadRhV7dVnlzZ/R8T384b+phtsYHXCB+DOfFGupMF5t9SoOhcGwq3Yw4OeHB4wDUNbkbABHk0yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766421037; c=relaxed/simple;
	bh=McUiHXa4sDY4TxK9myaei/Das6DSOvZ5DH9n9HIK5z0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mwNVClW2HJUgLA4R53JoCqoISlT7qVUSLMQUFj5D7AZkcspgm4qq39VDM0TJPv1yujHragjeMqRfAW6MivRnYt6KhKHLUmOT/PSINe0KqbgS1ziYAv6r/PZ298kmsulRe1MZ8UtOJKa6lDCVB2Xz9YaBtZEFMr18FHGTcdR8GUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AaDFUFk+; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AaDFUFk+"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42e2d52c24dso1752866f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Dec 2025 08:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766421034; x=1767025834; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wlhs/F8IClVmoUeoQn46BTOR0VEDNo6dJrg+YAjVNP4=;
        b=AaDFUFk+4C5ybqHKozZbBrHhoOp0kQbfR2Bm/9jMt4HrWErk6JLrX7yERzjLK1F/Ig
         7sY0/ZH2GIavDjViP2ewAhrv7V0jbyB+TWnwhkXvT3s/QhB7cPNrhiZHwOMVaxIshRXm
         6FlfwnZb/5ExHVart+ynHbmDrGxgZFQMQPfUvh3q2eVJ3XbvJvR4vNslT+PvDBQGHcl4
         o9qSO3RRnMY5rHRhCBFrAxh0JHLJBXZuEAOzcNaUSVb9pCrnvPD/zBHRwZJGvCsREFfA
         0MiC5Gif1gw71Ogl30razyKrRzmzwch1qwrOA0AiRiKQW91Y1gbr5NANaz/RfX/+/hcm
         JO0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766421034; x=1767025834;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wlhs/F8IClVmoUeoQn46BTOR0VEDNo6dJrg+YAjVNP4=;
        b=QC4XCf36+lcz125jHWD0FXV/CzCsNVuey1FkwBoWn6FSra3f8YVlygim/fEacLfOn1
         mVdGS6nnM9ffzH4MV7R/8oHteJQYZHc3Te+JEVAeqvkKqmzH/4Cx02n8HwyuiKwxk+5B
         oZPIjpOx2wNxbIKknFGdd8qjPNWbkhtdMitgt8WTgChZGqmVE7Qmo07eqTMIbwlRvAWo
         VwqpHbvE0wLbHXcoCNrdJimKjvtiscdvCa4qyH6O5CP07BGO0lN05eYz90Ot1K09Viac
         kr4/Rghm3GO8rwdGc18koziN1RKmYE1aMVrsvHT6n6by7C5xDkiAza1BuTXIlhIXUkBI
         Q5+Q==
X-Forwarded-Encrypted: i=1; AJvYcCU0gSqdsmWQo7gr95np8t2lr7+de9c1iYDqzvErfukR+nO10CddA7RgtiF4A3TFfowSgeJmZB0J+fs8Jet/b8rrhw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzI8EMD8t5WwveRCAS93fXXVQ4rij+3yB/QNuxNutwgWLDgfPnZ
	1dJo3swR3sCy8PNhH1BVyrb6n+yJyHD0VZioMaIiShguuRcv6axxTOC21uhCh4obm5k=
X-Gm-Gg: AY/fxX4N8nEaLL1ySavX2Qhzn1Vs8JUZqoA/Hg9DwDk8BW6B7EXpn8ygXlhv+CHBYTv
	enWcqlWP7Cz4A7gjJ04AISEyg6+/sEMj7qmEPWsSRW2jlRAisianpk7ILAPagPHMmVjaGeUn3DY
	+BTfuCbzyS9RxJ/LPyVrT9ARr78XvJfS+gORjuGTxTuXelSJbb4p/NsyNVMUkid2eSQZfCl+vzi
	9q3JDqS34eEqMgoGdDt/t0OzxjkgTyyzdGMPAhpNqgJqvVoYQqWchHPiK+e0j0XAix2OuzqC7Qq
	nfaGaMbkH/k5RxNPH1lEqzecwQsh+6g3sz/LQHKq8QWZMIdbLqhkWGEc9nq2lnD366ShWu/Oo7K
	nR//CxFj68Mra+MscXy97Ine9vaVkY5JyLsX1tjZFJ4fFZHfUqmy7bra5l6C9WsXwGKOeJVtfbN
	miW34pDuJh7059swqZSx/ZW9Fb8iNmOeN79gFqC03yQA9mWtrkApva1HXEnTD7bw2O7q1i0kTfX
	kE=
X-Google-Smtp-Source: AGHT+IFsMafyDmIztGS5eFQmA3T+ssMBvK+Usv9rZU++fuZY5gKcMu9PEAPmRCs7wEEjvON8LVqWEQ==
X-Received: by 2002:a05:6000:220c:b0:431:752:671e with SMTP id ffacd0b85a97d-4324e4c906cmr14343129f8f.15.1766421034026;
        Mon, 22 Dec 2025 08:30:34 -0800 (PST)
Received: from ta2.c.googlers.com (62.221.76.34.bc.googleusercontent.com. [34.76.221.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa4749sm23071258f8f.37.2025.12.22.08.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 08:30:33 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 22 Dec 2025 16:30:05 +0000
Subject: [PATCH v4 1/5] dt-bindings: nvmem: add google,gs101-otp
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251222-gs101-chipid-v4-1-aa8e20ce7bb3@linaro.org>
References: <20251222-gs101-chipid-v4-0-aa8e20ce7bb3@linaro.org>
In-Reply-To: <20251222-gs101-chipid-v4-0-aa8e20ce7bb3@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Srinivas Kandagatla <srini@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, semen.protsenko@linaro.org, 
 willmcvicker@google.com, kernel-team@android.com, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766421032; l=2189;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=McUiHXa4sDY4TxK9myaei/Das6DSOvZ5DH9n9HIK5z0=;
 b=CAQSD5FGU+EphuBCmrULdCUhE7IlVwlUPWIGhc6icc4yiw5qm4ZAkkXHyrcgxE3+TDcTEJzxJ
 juUMNR5p/1kACyIXO1B0V4+ZF5hS6VMH48BNxDvFr7kMnXW3AMP9FVK
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Add binding for the OTP controller found on Google GS101.

Reviewed-by: André Draszik <andre.draszik@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 .../bindings/nvmem/google,gs101-otp.yaml           | 61 ++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvmem/google,gs101-otp.yaml b/Documentation/devicetree/bindings/nvmem/google,gs101-otp.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..99e322c72f9ee1766f3393e604991364c41456fe
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/google,gs101-otp.yaml
@@ -0,0 +1,61 @@
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
+  can be stored. The OTP controller register space is of interest as well
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
+  clock-names:
+    const: pclk
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
+  - clock-names
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
+        clock-names = "pclk";
+        interrupts = <GIC_SPI 752 IRQ_TYPE_LEVEL_HIGH>;
+    };

-- 
2.52.0.322.g1dd061c0dc-goog

