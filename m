Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CAAC336ED3
	for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Nov 2025 19:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762802948; cv=none; b=du7rEFpR73hdd4WRpNZozDvld36mJghto1x6zHVoAHUWhSdzTj99Y7Aog8AC+W6hMyWXlwq9sOHQ8iGg7fvHwg86yQ6fSIBYAPVSvKlQvrGMci/w1/tqyMyLd2t1+4lNGsyNzSfAeVZw98KFRDtH16bp+dnd09piu3XNMzYoe5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762802948; c=relaxed/simple;
	bh=tg0hD3bAsokB+sNMkDp5zswpWKbl3nvQ7gPQzb6+rJc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EgyQ5g49nftxJN61Rd3bDsypB1HMOoIipKdQ0Lf4rgJJvGC1N7Spmp6hNSp9DCFterPFVZFh95am902CEXcTl47kN3k04/HiyHFAaxBqMYJMGdBeYEHFHKYUmtotbn+Hdl/iwiwZWz8cQmc8tpKJXkFYZ0Pj/ocv02mkhiYVOQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kAyJc5Jq; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kAyJc5Jq"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b714b1290aeso574576466b.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Nov 2025 11:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762802943; x=1763407743; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uSZz9jWuIHisRe8wOS8N84JguuB1ECjaPpku1rLPAeE=;
        b=kAyJc5JqGGwD2QVjoBUT1nEZXaei+kmyrrpA4TqIw8xXZLe+DEX9s4k58DZTpoX460
         yfQCNR6XxvIjZ7NGczisyWde9wcjpT5TkV5IQDiA+Mmw7C4JnNraR3pg6lS2Ct/szyWv
         FIDOa6Vt7sQ6O4NqfXeDC2jsp1FvBeYUv4wJ+Zd49NLCgPEG6O3xH2vWUw1GrKGyzmzV
         L4ObZjZgVCld4BrYmG6k94XvX9SOoYEUYmrCQQPBeriCR9s6s9v0LfgbzRBHwDkiylRH
         +gR9jivYs5F0uS4jGSy30+Nm65r0IRIFmdShLICPuGWuK60tJgdXV5hKMisUpKaC1yY8
         s7fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762802943; x=1763407743;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uSZz9jWuIHisRe8wOS8N84JguuB1ECjaPpku1rLPAeE=;
        b=LctWXulr/wT7y9sfnPhtrEXDVMKCl5HemxLpv1nyc7zKx3JjOU0N6OXnHIsWCyTLch
         VfKc/dnIAe9bw0at93V5dJ9O9K8Lz+tWonFjWZ78KsDYcR6MRRRsqDDcUZMP9UJpdz7l
         3W8XiQx6H/5xoDGxg8tgrw3WLag3G56T6adczsaJUeUbRtATRcMPs0p0ZcMD0coE+A+b
         ukuqWGTZPS6Xi1tTE2bNhulUD+2qY8k7mu8eX2M0J0mxvwhGLfzB9R0bm3ReWZ/g18Gy
         486bvhItZ5fvofFOxT8/0xyV3P7GrTDMmdP9el6/TmQnbMTLHjse2z0TFWnJC1Joxonc
         Mqyg==
X-Forwarded-Encrypted: i=1; AJvYcCUgCk3nd8zEFxGgMBxyl7yJshBSFZ0NJUBYEwIxwyafTJ1fHMzCQIY6rc+wMSJ0aYsnX1Ll/KzqwQYzVIiBYXC3+g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTb+qcYIiY3/mciXMM5s/s7hFpo7rg9MkTFWPIrDCha9zJxHeg
	TCzWGJ97ZK8QEKc7pBSWbvw9bTjmx2BgJ12oAnT3v4dgChms8DVhrbRjMKm058L8NhE=
X-Gm-Gg: ASbGncuO2LKP9hp+yk0CF1X1kEukC1VL2frxRg95Sq+tKEz3/t9iUDw7zmInFxeMEH/
	0DQYk1SVX9+Lt35pP/b8yroO1O+lU4qZtxMp2Jh6+r3MhpuzfU/FPqb1Df0nx7bKeh57rv4KvLY
	d6lfRYZ+XbrTxJH3SIR9AxwOuPVvzjWNvd/LkdvBoIrL3JhP9KMBECLwEO7hJrZSXA3/CmYLj3f
	GuJUAYipnOUrdmtDCl2lknFhoMRlbnGhs+AC2JuHwHoszeyEABs1pf1VgXQJhPTRmFEqkLM/AK6
	jcF+bwiDVtbyKUUhsrbtuUPulKFHkO2+/DvKludkwil4IrgAVDecz9VcmOK58iNxvPERQMNSutX
	ezbBy1Gr5mze8oFwwEaXxhKB8kUGTF7/HyFJrENR6DGke1ynBQu3COy4qk03T7wgdMqHE0SQqR4
	jMq6x8IPTM4EZqyLP4CJwPvcjblIXH7ZMpx9qfI++BEWbCW6jVshM1PlwySasR
X-Google-Smtp-Source: AGHT+IFp4Nb0Sqv+lUeapxXU50UZ70IvOd7/8OXWBTaTDcVRGEo2OioMu2sexdsxPqumNEOUbAc0JQ==
X-Received: by 2002:a17:907:7206:b0:b6d:4fe5:ead8 with SMTP id a640c23a62f3a-b72e037b177mr1015877866b.25.1762802942524;
        Mon, 10 Nov 2025 11:29:02 -0800 (PST)
Received: from puffmais2.c.googlers.com (254.48.34.34.bc.googleusercontent.com. [34.34.48.254])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf97d16esm1168178166b.35.2025.11.10.11.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 11:29:02 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 10 Nov 2025 19:28:49 +0000
Subject: [PATCH v4 06/20] dt-bindings: mfd: Add samsung,s2mpg11-pmic
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251110-s2mpg1x-regulators-v4-6-94c9e726d4ba@linaro.org>
References: <20251110-s2mpg1x-regulators-v4-0-94c9e726d4ba@linaro.org>
In-Reply-To: <20251110-s2mpg1x-regulators-v4-0-94c9e726d4ba@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

The Samsung S2MPG11 PMIC is similar to the existing S2MPG10 PMIC
supported by this binding, but still differs enough from it to justify
a separate binding.

It is a Power Management IC for mobile applications with buck
converters, various LDOs, power meters, NTC thermistor inputs, and
additional GPIO interfaces and typically complements an S2MPG10 PMIC in
a main/sub configuration as the sub-PMIC.

Like S2MPG10, communication is via the Samsung ACPM firmware and it
therefore needs to be a child of the ACPM firmware node.

Add the PMIC, the regulators node, and the supply inputs of the
regulator rails, with the supply names matching the datasheet.

Note: S2MPG11 is typically used as the sub-PMIC together with an
S2MPG10 PMIC in a main/sub configuration, hence the datasheet and the
binding both suffix the supplies with an 's'.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v4:
- Krzysztof:
  - move to new separate binding samsung,s2mpg11-pmic.yaml
  - add example

v3:
- move to new samsung,s2mpg10.yaml file
- deny 'clocks' property
- mention NTC thermistor inputs in commit message
- move all patternProperties to top-level

v2:
- add | to vinb*-supply description for better formatting to mark as
  literal style
- mention GPIOs in commit message
---
 .../bindings/mfd/samsung,s2mpg11-pmic.yaml         | 88 ++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/samsung,s2mpg11-pmic.yaml b/Documentation/devicetree/bindings/mfd/samsung,s2mpg11-pmic.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..62cedbbd9d8c4cb7e9dfc039c1c747e334903b20
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/samsung,s2mpg11-pmic.yaml
@@ -0,0 +1,88 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/samsung,s2mpg11-pmic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S2MPG11 Power Management IC
+
+maintainers:
+  - André Draszik <andre.draszik@linaro.org>
+
+description: |
+  This is part of the device tree bindings for the S2MPG11 Power Management IC
+  (PMIC).
+
+  The Samsung S2MPG11 is a Power Management IC for mobile applications with buck
+  converters, various LDOs, power meters, NTC thermistor inputs, and additional
+  GPIO interfaces and typically complements an S2MPG10 PMIC in a main/sub
+  configuration as the sub-PMIC.
+
+properties:
+  compatible:
+    const: samsung,s2mpg11-pmic
+
+  interrupts:
+    maxItems: 1
+
+  regulators:
+    type: object
+    $ref: /schemas/regulator/samsung,s2mpg11-regulator.yaml
+    description:
+      List of child nodes that specify the regulators.
+
+  wakeup-source: true
+
+patternProperties:
+  "^vinb(([1-9]|10)s|[abd])-supply$":
+    description:
+      Phandle to the power supply for each buck rail of this PMIC. There is a
+      1:1 mapping of numbered supply to rail, e.g. vinb1s-supply supplies
+      buck1s. The remaining mapping is as follows
+        vinba - bucka
+        vinbb - buck boost
+        vinbd - buckd
+
+  "^vinl[1-6]s-supply$":
+    description: |
+      Phandle to the power supply for one or multiple LDO rails of this PMIC.
+      The mapping of supply to rail(s) is as follows
+        vinl1s - ldo1s, ldo2s
+        vinl2s - ldo8s, ldo9s
+        vinl3s - ldo3s, ldo5s, ldo7s, ldo15s
+        vinl4s - ldo10s, ldo11s, ldo12s, ldo14s
+        vinl5s - ldo4s, ldo6s
+        vinl6s - ldo13s
+
+required:
+  - compatible
+  - interrupts
+  - regulators
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/regulator/samsung,s2mpg10-regulator.h>
+
+    pmic {
+        compatible = "samsung,s2mpg11-pmic";
+        interrupts-extended = <&gpa0 7 IRQ_TYPE_LEVEL_LOW>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&pmic_int>;
+        wakeup-source;
+
+        vinl1s-supply = <&buck8m>;
+        vinl2s-supply = <&buck6s>;
+
+        regulators {
+            buckd {
+                regulator-name = "vcc_ufs";
+                regulator-ramp-delay = <6250>;
+                enable-gpios = <&gpp0 1 GPIO_ACTIVE_HIGH>;
+                samsung,ext-control = <S2MPG11_EXTCTRL_UFS_EN>;
+            };
+        };
+    };

-- 
2.51.2.1041.gc1ab5b90ca-goog

