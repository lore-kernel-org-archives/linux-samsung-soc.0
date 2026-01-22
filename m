Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81BF42848D
	for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Jan 2026 15:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769096629; cv=none; b=DcotxMsolMU8DwQCbL2C7Hftnza1HXgwscEdBjttJt5iN/T8kl6oNpMD6xnxok/n7Gq5p+AK8r5mIhlZy447OHzi21G4ZJpdUx8e+BY+2N4xnWT8vEG1iNPQdyvXh55f0qZCo66wgplXRGTZEU0+tjz6iNUY9VDMcJ6MV51grVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769096629; c=relaxed/simple;
	bh=JAe9QiPX2OAOTXBK5frAvF1byeKXT5EVT6ooWSPHwtc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AvxRAdgjfrLfbhKHC8SDfVA7Mfg3sP7IPxslSB3e79yvZpoyWJ2kAGXEtF0p3dg3Q8+DENke/Azn9mSY4GycC7alrw3h8mdreGs1AOoIzYq7fIjIN1ZG02DkaeB8IZ+sEYk1LkMRq6QKyb0bBsRLuI9998CaNqQ0YzBE2ypEcRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dw4onMLv; arc=none smtp.client-ip=209.85.208.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dw4onMLv"
Received: by mail-ed1-f68.google.com with SMTP id 4fb4d7f45d1cf-652fdd043f9so1943075a12.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Jan 2026 07:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769096617; x=1769701417; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aDdL6m1qWe1Q8DlvJrfhuA2RG1L+tnnMYwyaBqhamlM=;
        b=dw4onMLvkO4OWnAydALa5IpFHVSJKWHIEg8YmyXleEn4F9ro6+pQ1qSQp/sc48kWFW
         67AVats6agTmJNqs0SObQRP8P1AeLStdS6cBYjctUC+7Sa1N11O95lfzJcdLsxHmZm8o
         weYYVUeoHzvzuU80c8pC+mVWe23uroOT2If3ylsnU+ZQgmTbUPEagvxUI2azDTl45Hqf
         UeGgbBMlKv8BXGEiEltYU2RxLus7wUYRzbCUHQkQCAQcTH5+F8sy3tCtVc7cwFLBHhTv
         GO/EFUbvMYXgexvWPQ//zRFrw6Bl9cgRQSAn+LLtFjellPZAuYUFSzAAf+PWnXCqo4MI
         IAJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769096617; x=1769701417;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aDdL6m1qWe1Q8DlvJrfhuA2RG1L+tnnMYwyaBqhamlM=;
        b=gMNbWFSx5IG03IHczYvGGYMzQ9LNnkCY+cwfeIVGVNwqi/0LMfWtnLIHmZ+e9ICP8Z
         /+v3lz4SBm/UPS3eSBPEKF22G1zA7zKQ/fsiaMjxFzYXo5U174JWzufw81O/imnb05Pe
         j3Wv2IUr8ATXWFZPaodKxNZXRecJYkeYah/v34NOOPCqNAWwjv5wiYT6O2GU0NcRGlPF
         DJzZ3AYKeD9BwH07NpalzoiXb1AnaqHpup+nj/qMI94J+nG0B3ohCnaDuE3Vg5fTMca0
         76hxvVORNswXr+/eLPEWLN2tFzGYuG5ks62CfRTqO+cFMLMJXqkSpjMmTYERGqVbI6j4
         lgQw==
X-Forwarded-Encrypted: i=1; AJvYcCV/kVXVd+sG+bFHZsNomdSA2l0rEC5K/gadYAqOkC7XTfvBEq5SNYiX1EJC4/9fhWnGyJVapNYav7QTB0B9vvbw4w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwADG1lvmHnUe9PxHeKgSTuc14H8VH2sZ/VU1yJhYHu79/J5EkM
	dkwG5QJwb5/kaftO7OJRpj0yRYK9VesMG2gcVO1HoWpea7qwZ4mEk6TD8EWXz8xWAZA=
X-Gm-Gg: AZuq6aKy0su7jbzZH/PZnuGJtTIPcn0o0VGO5xowuCDNUVyrUESiA82I2cDL1NK0Wme
	xuAUGpZ4zEABdw2v3HrueHJGkn7c2YTquacf2ZQ5MrGHREjrjFyNIwpciJKnCHWHaxXI3BR3lNM
	YRKz/e/U9RmsAwRjeUcw6niGL6Qn86VyoFFgp3DrN61N/W8iqX+9fGH1EQ2LLbT2lcZ+aqlU79k
	E1H9XdrU5bxws7PJ35HAw9RaBF/0srMeYA1Uwz5wyxvWxquWagY+hGYhy+AyNUU/HKa2+/Lalap
	UhvGgXI7+x43VNQf5lViKHE926EdWxzB7yK+iTVgdkH0ljTYFh2MOf9OcHVigKaJAosLf937A69
	xE4hqH2/m3r5R2phdQFG0mrSUJ6w4FkC7ZFA9trkTgdA2JqS8Z4CHSqXTnJ19dw46ixXjDCtWFh
	4oRQy8eIwTx8lp1JmwvdBvFPJ0hgxdpoannqWXCJCHqxTZJZYJODtpC+gUewr1jq8qA56YC8Fv2
	LvqTgNwS3XlyQ6b
X-Received: by 2002:a05:6402:26c6:b0:658:278a:7014 with SMTP id 4fb4d7f45d1cf-6584874e4b8mr46576a12.4.1769096616724;
        Thu, 22 Jan 2026 07:43:36 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-654535c49f4sm16334363a12.31.2026.01.22.07.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 07:43:36 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 22 Jan 2026 15:43:30 +0000
Subject: [PATCH v7 03/20] regulator: dt-bindings: add s2mpg11-pmic
 regulators
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260122-s2mpg1x-regulators-v7-3-3b1f9831fffd@linaro.org>
References: <20260122-s2mpg1x-regulators-v7-0-3b1f9831fffd@linaro.org>
In-Reply-To: <20260122-s2mpg1x-regulators-v7-0-3b1f9831fffd@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Juan Yescas <jyescas@google.com>, 
 kernel-team@android.com, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2

The S2MPG11 PMIC is a Power Management IC for mobile applications with
buck converters, various LDOs, power meters, NTC thermistor inputs, and
additional GPIO interfaces. It typically complements an S2MPG10 PMIC in
a main/sub configuration as the sub-PMIC.

S2MPG11 has 12 buck, 1 buck-boost, and 15 LDO rails. Several of these
can either be controlled via software (register writes) or via external
signals, in particular by:
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

Since S2MPG11 is typically used as the sub-PMIC together with an
S2MPG10 as the main-PMIC, the datasheet and the binding both suffix the
rails with an 's'.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
Note: checkpatch suggests to update MAINTAINERS, but the new file is
covered already due to using a wildcard.

v4:
- Krzysztof:
  - move additionalProperties to after allOf
  - use $defs, not definitions
- update samsung,ext-control: description

v3:
- mention NTC thermistor inputs in commit message
- drop PCTRLSEL values that can be described using standard properties
  (Krzysztof), drop useless ones, rename the remaining ones
- drop maxItems:1 where not needed (Krzysztof)
- samsung,ext-control-gpios -> enable-gpios (Krzysztof)
- drop buckboost from 'allOf' limitation - not needed as it has its own
  specific description

v2:
- fix commit message typos: s2mp1 -> s2mpg1
- mention GPIOs in commit message
---
 .../regulator/samsung,s2mpg11-regulator.yaml       | 136 +++++++++++++++++++++
 .../regulator/samsung,s2mpg10-regulator.h          |  14 +++
 2 files changed, 150 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/samsung,s2mpg11-regulator.yaml b/Documentation/devicetree/bindings/regulator/samsung,s2mpg11-regulator.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..119386325d1b5b6b0fe35c1f17d86e3671fe0fc4
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/samsung,s2mpg11-regulator.yaml
@@ -0,0 +1,136 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/samsung,s2mpg11-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S2MPG11 Power Management IC regulators
+
+maintainers:
+  - André Draszik <andre.draszik@linaro.org>
+
+description: |
+  This is part of the device tree bindings for the S2MG11 Power Management IC
+  (PMIC).
+
+  The S2MPG11 PMIC provides 12 buck, 1 buck-boost, and 15 LDO regulators.
+
+  See also Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml for
+  additional information and example.
+
+properties:
+  buckboost:
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    description:
+      Properties for the buck-boost regulator.
+
+    properties:
+      regulator-ramp-delay: false
+
+patternProperties:
+  # 12 bucks
+  "^buck(([1-9]|10)s|[ad])$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    description:
+      Properties for a single buck regulator.
+
+    allOf:
+      - $ref: "#/$defs/s2mpg11-ext-control"
+
+    properties:
+      regulator-ramp-delay:
+        enum: [6250, 12500, 25000]
+        default: 6250
+
+  # 11 standard LDOs
+  "^ldo([3-79]|1[01245])s$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    description:
+      Properties for a single LDO regulator.
+
+    properties:
+      regulator-ramp-delay: false
+
+  # 2 LDOs with possible external control
+  "^ldo(8|13)s$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    description:
+      Properties for single LDO regulator.
+
+    allOf:
+      - $ref: "#/$defs/s2mpg11-ext-control"
+
+    properties:
+      regulator-ramp-delay: false
+
+  # 2 LDOs with ramp support and possible external control
+  "^ldo[12]s$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    description:
+      Properties for a single LDO regulator.
+
+    allOf:
+      - $ref: "#/$defs/s2mpg11-ext-control"
+
+    properties:
+      regulator-ramp-delay:
+        enum: [6250, 12500]
+        default: 6250
+
+$defs:
+  s2mpg11-ext-control:
+    properties:
+      samsung,ext-control:
+        description: |
+          These rails can be controlled via one of several possible external
+          (hardware) signals. If so, this property configures the signal the PMIC
+          should monitor. The following values generally corresponding to the
+          respective on-chip pin are valid:
+            - 0 # S2MPG11_EXTCTRL_PWREN - PWREN pin
+            - 1 # S2MPG11_EXTCTRL_PWREN_MIF - PWREN_MIF pin
+            - 2 # S2MPG11_EXTCTRL_AP_ACTIVE_N - ~AP_ACTIVE_N pin
+            - 3 # S2MPG11_EXTCTRL_G3D_EN - G3D_EN pin
+            - 4 # S2MPG11_EXTCTRL_G3D_EN2 - G3D_EN & ~AP_ACTIVE_N pins
+            - 5 # S2MPG11_EXTCTRL_AOC_VDD - AOC_VDD pin
+            - 6 # S2MPG11_EXTCTRL_AOC_RET - AOC_RET pin
+            - 7 # S2MPG11_EXTCTRL_UFS_EN - UFS_EN pin
+            - 8 # S2MPG11_EXTCTRL_LDO13S_EN - VLDO13S_EN pin
+
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 8
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
+  # Bucks 4, 6, 7 and 10 can not be controlled externally - above definition
+  # allows it and we deny it here. This approach reduces repetition.
+  - if:
+      anyOf:
+        - required: [buck4s]
+        - required: [buck6s]
+        - required: [buck7s]
+        - required: [buck10s]
+    then:
+      patternProperties:
+        "^buck([467]|10)s$":
+          properties:
+            samsung,ext-control: false
+
+additionalProperties: false
diff --git a/include/dt-bindings/regulator/samsung,s2mpg10-regulator.h b/include/dt-bindings/regulator/samsung,s2mpg10-regulator.h
index 4a6bf13442f50bb1c475728722eaebd0ec3dcbfa..d9c16bba4d85809df99c2887b8dc61ea1bea5ad1 100644
--- a/include/dt-bindings/regulator/samsung,s2mpg10-regulator.h
+++ b/include/dt-bindings/regulator/samsung,s2mpg10-regulator.h
@@ -20,6 +20,10 @@
  *
  * ldo20m supports external control, but using a different set of control
  * signals.
+ *
+ * S2MPG11 regulators supporting these are:
+ * - buck1s .. buck3s buck5s buck8s buck9s bucka buckd
+ * - ldo1s ldo2s ldo8s ldo13s
  */
 #define S2MPG10_EXTCTRL_PWREN       0 /* PWREN pin */
 #define S2MPG10_EXTCTRL_PWREN_MIF   1 /* PWREN_MIF pin */
@@ -36,4 +40,14 @@
 #define S2MPG10_EXTCTRL_LDO20M_EN2  11 /* VLDO20M_EN & LDO20M_SFR */
 #define S2MPG10_EXTCTRL_LDO20M_EN   12 /* VLDO20M_EN pin */
 
+#define S2MPG11_EXTCTRL_PWREN       0 /* PWREN pin */
+#define S2MPG11_EXTCTRL_PWREN_MIF   1 /* PWREN_MIF pin */
+#define S2MPG11_EXTCTRL_AP_ACTIVE_N 2 /* ~AP_ACTIVE_N pin */
+#define S2MPG11_EXTCTRL_G3D_EN      3 /* G3D_EN pin */
+#define S2MPG11_EXTCTRL_G3D_EN2     4 /* G3D_EN & ~AP_ACTIVE_N pins */
+#define S2MPG11_EXTCTRL_AOC_VDD     5 /* AOC_VDD pin */
+#define S2MPG11_EXTCTRL_AOC_RET     6 /* AOC_RET pin */
+#define S2MPG11_EXTCTRL_UFS_EN      7 /* UFS_EN pin */
+#define S2MPG11_EXTCTRL_LDO13S_EN   8 /* VLDO13S_EN pin */
+
 #endif /* _DT_BINDINGS_REGULATOR_SAMSUNG_S2MPG10_H */

-- 
2.52.0.457.g6b5491de43-goog

