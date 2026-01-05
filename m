Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A57732AAD4
	for <linux-samsung-soc@vger.kernel.org>; Mon,  5 Jan 2026 09:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767603706; cv=none; b=G1DzkWMeB0ThmsXHU8PmWE31kNJ+/a3qA9++F/m/uIb0204wf9IgIpxxUekPTSEvHLp64r6UBzRcf/HatICQyyaLZfGKp9Quct4a9bBhuffUgO5xNvrh7oqVRcCicV/1UYGbpaA/Q+CaS6uKrLGZqpyMTJ3jSPktEg/D72XXeF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767603706; c=relaxed/simple;
	bh=cDTIGWVXEzPLuyGXqisxpp/99/qwRzUDF6t1zWY9mLU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CUujgqxPTe7uShQl84c4Pb9TLyrTAQMTHxqdKO0eBI83mDdLNK9HZqSx/9c3DNeS0WIjhgHixo3fsir0zSObuAACyIgCxp7iLaROgPv7B767n19P6NvgCut24l6VcN+JeyaLWJawSO286xpnki4Q6MUM9KUbs85CeJkax40+q4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Bhnccrez; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Bhnccrez"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-64ba9a00b5aso16394251a12.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 05 Jan 2026 01:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767603701; x=1768208501; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g5aG9UiTB7Vj3Otot6zn2A2WjymKMwzj8kzNU4i6XLo=;
        b=BhnccrezHD8NDD4vmVMM1d17cLa6u75J9l+ec4naBeMeMxDIYPpXDJDFLUJnqoQ5AV
         9tkNxQey0u9b6F+F1ghgv/2Q7PqTC49uXjiO7gDO2dAxaQC8dlYF3j73fTDpbIlYSVBo
         onqbHSswT40jBTTEKvQ/YtgYJQKjm859Jy11q4RfkhEwV40Zgu5y22wp9ObNLfQXVPwT
         69nvj6OFHeoD4iTLYnbAiDHF5r1NmVzqPurw0xjo3nrC/YLoUMnXFTSn3rnc4ksu+/mC
         rdVpj5frVnq/R9NfLGkvjJ9ExP0XPkl+tj+zcf+xFpEUTJvyJojNutGb3soJWqYPrqj7
         RYww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767603701; x=1768208501;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=g5aG9UiTB7Vj3Otot6zn2A2WjymKMwzj8kzNU4i6XLo=;
        b=V7HXZ7yrkjDiKdpvwqiD1wWIarGnXgXwe+CVCVVvfbirdshQVyPCdeGTqxrlb+XEl4
         qSin/bxobrrdI8Yd8fWGDjY/1RHZlyNXwq/srjgqMLoF/cNVPf1uhwrJV0C4ibQP24vr
         wZSpvziPRc6glH+kxHUyg0GZfOOX91ccVPpVjyBgsvP5qjydFT3u2KLOcKZJN1t5Dit1
         oGLRSGpWIKj9+fz1l//yxhvypQlYFkU6o36LhbiLMK4CuMNXUkXCH0TMQD547ZHb8Dce
         NpNhVxNQYSCYE1SHQKl5/trZV0tESP3C1O0d9TIVlDeqoaQp0ItYw6sT4p4MYKd6A2PN
         F3sw==
X-Forwarded-Encrypted: i=1; AJvYcCVLHIGR/6hsv3+2vHwE5HBj9B7AxXRfggEgMVgYfR/SkK8fm/TIa9sTkiPNhtEabvE7lXFrJqWPXJPkqEKPvrUhtg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yytk7ShWRZL7WqCls23ksrYTFlGWgjMsMUzKfytge16vVHqp4tI
	hddJ2fHXrnJ72cwg2gyil+j0suPC9oLSH/LjD3mdeJ1+FgXYTSW21shcGcO8n0uwqIA=
X-Gm-Gg: AY/fxX7OvX7AvshVtMTA2+nqC5diPg7Xyr9oZ3AcKd/GVNbfuOd8PR5W6IE3UVefFMU
	hx/3mJIaVUFW2ZVxt3qG5iFyjCqcjK10s6pX4N64s+JH5HuGaEWAG6u93LuM16wDCzxwXn7EjDB
	+XLmzUnywkwIZRuoSYZ7AZCgXb0O6WsWrRmJa+QrUnQ8f8BzlY7J9Fxf/fN7c1pz5P6SKubeUIW
	6oRk1JdPPl6DrMXdPvhtOOBFmzdfX7gcB4Uz0zIW8HxdhfwaxbLfumFJiGTAN03E2REutN+KqtS
	lSmnoQTMPor2DC2YAwMNZH3O+QEI0ty0nlVKurJFN+0p8kC1NNwqaDrpbPwZ5fhFzrjCOaVjoIC
	dYeMn/dC2V7kO0Ix0d1ce46czf5a476FCe0f81Gy1yFO09DLdyXCvG1JYjfD00o0RgSPFaX8ts9
	4i0CLjst5V6AxLaIGg8fWosxZ8A+PTKopxEVJ62eIyOPJFFPVExGQsDbeWaulcevcOu3BmnEZs8
	rXP7w==
X-Google-Smtp-Source: AGHT+IFoBKeSVDsupuRxjxp2fuvvNtk/MkHxHnvNLpwYXyVfiMeBXdQyDeOmYvEJFR5Fl5glt5Wcbw==
X-Received: by 2002:a17:907:fdca:b0:b7a:2ba7:1988 with SMTP id a640c23a62f3a-b8036ebbbd0mr4659371866b.9.1767603701295;
        Mon, 05 Jan 2026 01:01:41 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f0ecb9sm5384010466b.56.2026.01.05.01.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 01:01:40 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 05 Jan 2026 09:01:38 +0000
Subject: [PATCH v6 02/20] regulator: dt-bindings: add s2mpg10-pmic
 regulators
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260105-s2mpg1x-regulators-v6-2-80f4b6d1bf9d@linaro.org>
References: <20260105-s2mpg1x-regulators-v6-0-80f4b6d1bf9d@linaro.org>
In-Reply-To: <20260105-s2mpg1x-regulators-v6-0-80f4b6d1bf9d@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Lee Jones <lee@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Juan Yescas <jyescas@google.com>, 
 kernel-team@android.com, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2

The S2MPG10 PMIC is a Power Management IC for mobile applications with
buck converters, various LDOs, power meters, RTC, clock outputs, and
additional GPIO interfaces.

It has 10 buck and 31 LDO rails. Several of these can either be
controlled via software (register writes) or via external signals, in
particular by:
    * one out of several input pins connected to a main processor's:
        *  GPIO pins
        * other pins that are e.g. firmware- or power-domain-controlled
          without explicit driver intervention
    * a combination of input pins and register writes.

Control via input pins allows PMIC rails to be controlled by firmware,
e.g. during standby/suspend, or as part of power domain handling where
otherwise that would not be possible. Additionally toggling a pin is
faster than register writes, and it also allows the PMIC to ensure that
any necessary timing requirements between rails are respected
automatically if multiple rails are to be enabled or disabled quasi
simultaneously.

While external control via input pins appears to exist on other
versions of this PMIC, there is more flexibility in this version, in
particular there is a selection of input pins to choose from for each
rail (which must therefore be configured accordingly if in use),
whereas other versions don't have this flexibility.

Add documentation related to the regulator (buck & ldo) parts like
devicetree definitions, regulator naming patterns, and additional
properties.

S2MPG10 is typically used as the main-PMIC together with an S2MPG11
PMIC in a main/sub configuration, hence the datasheet and the binding
both suffix the rails with an 'm'.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
v4:
- Krzysztof:
  - move additionalProperties to after allOf
  - use $defs, not definitions

v3:
- drop PCTRLSEL values that can be described using standard properties
  (Krzysztof), drop useless ones, rename the remaining ones
- drop maxItems:1 where not needed (Krzysztof)
- samsung,ext-control-gpios -> enable-gpios (Krzysztof)
- fix LDO20M_EN pin name -> VLDO20M_EN

v2:
- drop | (literal style mark) from samsung,ext-control-gpios
  description
---
 .../regulator/samsung,s2mpg10-regulator.yaml       | 158 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 .../regulator/samsung,s2mpg10-regulator.h          |  39 +++++
 3 files changed, 198 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/samsung,s2mpg10-regulator.yaml b/Documentation/devicetree/bindings/regulator/samsung,s2mpg10-regulator.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..7252f94b3a8f3ae339ff6cf3080786ba88d44f7e
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/samsung,s2mpg10-regulator.yaml
@@ -0,0 +1,158 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/samsung,s2mpg10-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S2MPG10 Power Management IC regulators
+
+maintainers:
+  - André Draszik <andre.draszik@linaro.org>
+
+description: |
+  This is part of the device tree bindings for the S2MG10 Power Management IC
+  (PMIC).
+
+  The S2MPG10 PMIC provides 10 buck and 31 LDO regulators.
+
+  See also Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml for
+  additional information and example.
+
+properties:
+  # 1 LDO with possible (but limited) external control
+  ldo20m:
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    description:
+      Properties for a single LDO regulator.
+
+    allOf:
+      - $ref: "#/$defs/s2mpg10-ext-control"
+
+    properties:
+      regulator-ramp-delay: false
+
+      samsung,ext-control:
+        minimum: 11
+
+patternProperties:
+  # 10 bucks
+  "^buck([1-9]|10)m$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    description:
+      Properties for a single buck regulator.
+
+    allOf:
+      - $ref: "#/$defs/s2mpg10-ext-control"
+
+    properties:
+      regulator-ramp-delay:
+        enum: [6250, 12500, 25000]
+        default: 6250
+
+      samsung,ext-control:
+        maximum: 10
+
+  # 12 standard LDOs
+  "^ldo(2[1-9]?|3[0-1])m$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    description:
+      Properties for single LDO regulator.
+
+    properties:
+      regulator-ramp-delay: false
+
+  # 12 LDOs with possible external control
+  "^ldo([3-689]|1[046-9])m$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    description:
+      Properties for a single LDO regulator.
+
+    allOf:
+      - $ref: "#/$defs/s2mpg10-ext-control"
+
+    properties:
+      regulator-ramp-delay: false
+
+      samsung,ext-control:
+        maximum: 10
+
+  # 6 LDOs with ramp support, 5 out of those with possible external control
+  "^ldo(1[1235]?|7)m$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    description:
+      Properties for a single LDO regulator.
+
+    allOf:
+      - $ref: "#/$defs/s2mpg10-ext-control"
+
+    properties:
+      regulator-ramp-delay:
+        enum: [6250, 12500]
+        default: 6250
+
+      samsung,ext-control:
+        maximum: 10
+
+$defs:
+  s2mpg10-ext-control:
+    properties:
+      samsung,ext-control:
+        description: |
+          These rails can be controlled via one of several possible external
+          (hardware) signals. If so, this property configures the signal the PMIC
+          should monitor. For S2MPG10 rails where external control is possible other
+          than ldo20m, the following values generally corresponding to the
+          respective on-chip pin are valid:
+            - 0 # S2MPG10_EXTCTRL_PWREN - PWREN pin
+            - 1 # S2MPG10_EXTCTRL_PWREN_MIF - PWREN_MIF pin
+            - 2 # S2MPG10_EXTCTRL_AP_ACTIVE_N - ~AP_ACTIVE_N pin
+            - 3 # S2MPG10_EXTCTRL_CPUCL1_EN - CPUCL1_EN pin
+            - 4 # S2MPG10_EXTCTRL_CPUCL1_EN2 - CPUCL1_EN & PWREN pins
+            - 5 # S2MPG10_EXTCTRL_CPUCL2_EN - CPUCL2_EN pin
+            - 6 # S2MPG10_EXTCTRL_CPUCL2_EN2 - CPUCL2_E2 & PWREN pins
+            - 7 # S2MPG10_EXTCTRL_TPU_EN - TPU_EN pin
+            - 8 # S2MPG10_EXTCTRL_TPU_EN2 - TPU_EN & ~AP_ACTIVE_N pins
+            - 9 # S2MPG10_EXTCTRL_TCXO_ON - TCXO_ON pin
+            - 10 # S2MPG10_EXTCTRL_TCXO_ON2 - TCXO_ON & ~AP_ACTIVE_N pins
+
+          For S2MPG10 ldo20m, the following values are valid
+            - 11 # S2MPG10_EXTCTRL_LDO20M_EN2 - VLDO20M_EN & LDO20M_SFR
+            - 12 # S2MPG10_EXTCTRL_LDO20M_EN - VLDO20M_EN pin
+
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 12
+
+      enable-gpios:
+        description:
+          For rails where external control is done via a GPIO, this optional
+          property describes the GPIO line used.
+
+    dependentRequired:
+      enable-gpios: [ "samsung,ext-control" ]
+
+allOf:
+  # Bucks 8, 9, and LDO 1 can not be controlled externally - above definition
+  # allows it and we deny it here. This approach reduces repetition.
+  - if:
+      anyOf:
+        - required: [buck8m]
+        - required: [buck9m]
+        - required: [ldo1m]
+    then:
+      patternProperties:
+        "^(buck[8-9]|ldo1)m$":
+          properties:
+            samsung,ext-control: false
+
+additionalProperties: false
diff --git a/MAINTAINERS b/MAINTAINERS
index adbe6a93a3927174af26318a6eb9db667c0b4ad0..03fbdb9d1565664528e0ccf7d08596f80441b301 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23312,6 +23312,7 @@ F:	drivers/mfd/sec*.[ch]
 F:	drivers/regulator/s2*.c
 F:	drivers/regulator/s5m*.c
 F:	drivers/rtc/rtc-s5m.c
+F:	include/dt-bindings/regulator/samsung,s2m*.h
 F:	include/linux/mfd/samsung/
 
 SAMSUNG S3C24XX/S3C64XX SOC SERIES CAMIF DRIVER
diff --git a/include/dt-bindings/regulator/samsung,s2mpg10-regulator.h b/include/dt-bindings/regulator/samsung,s2mpg10-regulator.h
new file mode 100644
index 0000000000000000000000000000000000000000..4a6bf13442f50bb1c475728722eaebd0ec3dcbfa
--- /dev/null
+++ b/include/dt-bindings/regulator/samsung,s2mpg10-regulator.h
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright 2021 Google LLC
+ * Copyright 2025 Linaro Ltd.
+ *
+ * Device Tree binding constants for the Samsung S2MPG1x PMIC regulators
+ */
+
+#ifndef _DT_BINDINGS_REGULATOR_SAMSUNG_S2MPG10_H
+#define _DT_BINDINGS_REGULATOR_SAMSUNG_S2MPG10_H
+
+/*
+ * Several regulators may be controlled via external signals instead of via
+ * software. These constants describe the possible signals for such regulators
+ * and generally correspond to the respecitve on-chip pins.
+ *
+ * S2MPG10 regulators supporting these are:
+ * - buck1m .. buck7m buck10m
+ * - ldo3m .. ldo19m
+ *
+ * ldo20m supports external control, but using a different set of control
+ * signals.
+ */
+#define S2MPG10_EXTCTRL_PWREN       0 /* PWREN pin */
+#define S2MPG10_EXTCTRL_PWREN_MIF   1 /* PWREN_MIF pin */
+#define S2MPG10_EXTCTRL_AP_ACTIVE_N 2 /* ~AP_ACTIVE_N pin */
+#define S2MPG10_EXTCTRL_CPUCL1_EN   3 /* CPUCL1_EN pin */
+#define S2MPG10_EXTCTRL_CPUCL1_EN2  4 /* CPUCL1_EN & PWREN pins */
+#define S2MPG10_EXTCTRL_CPUCL2_EN   5 /* CPUCL2_EN pin */
+#define S2MPG10_EXTCTRL_CPUCL2_EN2  6 /* CPUCL2_E2 & PWREN pins */
+#define S2MPG10_EXTCTRL_TPU_EN      7 /* TPU_EN pin */
+#define S2MPG10_EXTCTRL_TPU_EN2     8 /* TPU_EN & ~AP_ACTIVE_N pins */
+#define S2MPG10_EXTCTRL_TCXO_ON     9 /* TCXO_ON pin */
+#define S2MPG10_EXTCTRL_TCXO_ON2    10 /* TCXO_ON & ~AP_ACTIVE_N pins */
+
+#define S2MPG10_EXTCTRL_LDO20M_EN2  11 /* VLDO20M_EN & LDO20M_SFR */
+#define S2MPG10_EXTCTRL_LDO20M_EN   12 /* VLDO20M_EN pin */
+
+#endif /* _DT_BINDINGS_REGULATOR_SAMSUNG_S2MPG10_H */

-- 
2.52.0.351.gbe84eed79e-goog

