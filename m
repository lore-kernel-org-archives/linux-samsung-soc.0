Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36B432F740
	for <linux-samsung-soc@vger.kernel.org>; Sat, 27 Dec 2025 12:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766838277; cv=none; b=Q4zNspR4lZYLbzeCVmDAaep6prM0WYEuztdRZrB2jKUAOddQLEp1OB3GXxhiA+ikDxdHFRO+pHgJjSairJog56QcKLNVKrCMO1+qXO5fZ9O90g7xG38syiRpytItVXEHmCnS+na287ZoHBn4Xs7fuEtpDLnTgBYhA0bVVQKlwV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766838277; c=relaxed/simple;
	bh=aubReYwjqANuwkLNLEVgfFzepyO8fT5RaOuCKS4xuyE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q++yyCdaQlvo+UoyMefPtZBpKrlEjEKQosj34j4q4D47QyBnTdkoBfNqBNKMPR7qOzlWaLriLYujRMjlg77E0KFZxBRiE7mHgIarLdaRsBiLMjbMLU3K2C+f/MGqZbLZn/JmIvOId6BINDB0w2fL7ZUzPdrbR44YarTSJQFTKsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DOluwDvN; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DOluwDvN"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-64d02c01865so9108335a12.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 27 Dec 2025 04:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766838271; x=1767443071; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5W1/4QyvrrrF6qZFn1ADTO8hKq/uJgt895DTkpi0Lzo=;
        b=DOluwDvN7MVa81mgJVKi1f/zYUnMuMESjeuXZmeDMhPO0uanfabtbYVTAk44OdDCxl
         khxhFP4lh1L1Fyw/Flj7vqaILNIrft4GJoWTDRwqLFeE3zJX7jff7dgwI3gRwqIQoYV5
         L9KEr1UtNb3XN47Bl0hjCSGnPL6/5Jv31AtT9j7uk8zOJcf+tPDNL/ARfcjqZI5SYZRR
         5OgDlfG+ASHSX32PwgN8Ll/Bqwah+skmq3ilHK14+z68p6YEXppQ90G/P58ICs7boNP8
         qrK2oeoXGjwskOxzWsdRuyhIBb+G4Gl8DcOdqqXopLuEFL7FWcm0PGUjoKITM+r3hMqR
         /n5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766838271; x=1767443071;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5W1/4QyvrrrF6qZFn1ADTO8hKq/uJgt895DTkpi0Lzo=;
        b=EIJYWFgSPc+zgLHAblXzCP9OgQwv41nZAGIgpriPOMFaCirBTZkQdDLfQwHhr5SEKo
         E0Jks6Ur+qVWXq1pED3YqYu7cXmYJNibemTZCZfE4TEKpI/143a7TPfpv84wKzuTw8UI
         0V3OdsIsuVENTTkYAglasodCEUgPF4QpCKwxH9MGbBqbL8acJHx+BaSrOAX7kwV4Rs+k
         h+V3FrxYEmiT4bMQ8Hdkc8NmYJuWFbXWl3YNOOyKQbO3uSVRRqQ9AO9EwiVOGiT/I1QF
         /W2cbKdJljYXR3Jv9JKj7SzT/8vBnO2CBNSn42TTZQo5mVIsl4SJsDyYsa5His5hSjy7
         M2Bw==
X-Forwarded-Encrypted: i=1; AJvYcCUt44ksDrIOgT7tiv0iEjZvqUeFeuRBJZemZagCKkYESWO9aEhgcRbIeSvOSIGfcSjhKCr9L+n75Z/Jg5ETqnwSNg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCYxzrJ0BnI2ZMMKSki2F3lfhEtPkqyXnK63pkv6BQxsjDAhwk
	tGJitIiaxMKYDn9S6LyUaZNpsKjppPRO6XuG6SSonYq1/aL2L46aWYgk/A5P0hFsQcM=
X-Gm-Gg: AY/fxX53CeLLz8GFIpyDwMiRsYw3RTbfj625liZQWc3tfKaR+gsiau5eFQuxFRf65Us
	y+fSC2OQlTXFN1H6ARr4TPdeyTN513mux+VSOExv5JZjJDF5rb81Lrb86KFuO7rfoosQMRzTiwx
	wTo41tx9GlMPnaGvj46e33sWMzeE2kudEjutHVhSiFGyc5gqDMh8ZY/H6T+m+rteQcUtZQkWB9S
	nVgk/7bX9Z2oZznO2gZvI/ZAjw/njel+JY7nPwlZNj0GXshB2Gi1B2hd67anQJuvtrxF74QuSVK
	rA7hx6a9Vd9S7usYgJZ+s/0xLQboOxoP3ms1IulgWdsk+hBSG40m9EcEWQ+SKMZjyCEOm7dhpej
	L14fQSp8SfxHeB3kSS6RgPm4C6QgRQPUyJMIzgFL7g1nqshY1K6eM565A8DXL3aa0pIHTOVazLF
	51iIRLy2YxBhDMgu30vM5nKmeQaRDm9a8De2UAX8n1Y45ozEsjXRaislaQAiekIT/nbeBxMZRRN
	QB0tA==
X-Google-Smtp-Source: AGHT+IHKNrgbFALiao/cpd7mt183lE5L6kyEfG9J/2ltABs41Gj1m0uvaXUI2oj79RKqq8FnsABI3w==
X-Received: by 2002:a05:6402:51cc:b0:64b:a1e6:8018 with SMTP id 4fb4d7f45d1cf-64ba1e6832dmr21235958a12.31.1766838270685;
        Sat, 27 Dec 2025 04:24:30 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b916adc61sm25932659a12.31.2025.12.27.04.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 04:24:30 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sat, 27 Dec 2025 12:24:28 +0000
Subject: [PATCH v5 06/21] dt-bindings: mfd: Add samsung,s2mpg11-pmic
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251227-s2mpg1x-regulators-v5-6-0c04b360b4c9@linaro.org>
References: <20251227-s2mpg1x-regulators-v5-0-0c04b360b4c9@linaro.org>
In-Reply-To: <20251227-s2mpg1x-regulators-v5-0-0c04b360b4c9@linaro.org>
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

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
2.52.0.351.gbe84eed79e-goog

