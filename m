Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC5632AACD
	for <linux-samsung-soc@vger.kernel.org>; Mon,  5 Jan 2026 09:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767603708; cv=none; b=U+ZxE/0EHoUslpcCQ7lgEzelj3+ToXVZ9teTgUADTdkr3dtQDDrANFGCj0Nz3xpN0Bf7qKWy3hV3rOp/bKVcW2mGJcqHmHWzYpbOLhcf9r+6noW3TLmD0rUayzmAfl7aDljkjRkBak0NcIaJu7Isg+JdWq3KO1hCJUcqHn6oNYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767603708; c=relaxed/simple;
	bh=aubReYwjqANuwkLNLEVgfFzepyO8fT5RaOuCKS4xuyE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XjOUmozyeAPdFNj9epG4ic62FMYmBzVWX62vt71SNwfSu+b4UlqRKYuXYDkO82RqaJGUoIAWbYar+ssm4zjMq+MeUtbogWvS9fj+2+wAM0d0X+T4fOToNRCrzvzY6j0laFgxfcAZpvq01hf4RE5KIYvcjJLcfiw8+/ZRY3OMPic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yCjSF9Cs; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yCjSF9Cs"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-64ba74e6892so19358068a12.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 05 Jan 2026 01:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767603704; x=1768208504; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5W1/4QyvrrrF6qZFn1ADTO8hKq/uJgt895DTkpi0Lzo=;
        b=yCjSF9CsppFCDSlhTit1XntcRS2VIfLQwiGjd2oLenlVwkBWRJl6EUPUFEuFgpAqb5
         S/ReMBl/lnd3juF8P0RFiGIAg4ZDKuW49t0nM5f71P2jisD1ZDXRW7rBtIrj1l+s1MpQ
         3kzhGTQh0rZrVT99GTLUpuidnQ63yFQ6tuqXyRyyqjD0EDsuU5ID7wE2sWIs/uQ4aCNa
         UEZIbwv7Vc0j8pg/kfwt3zU6bH/N3JyTAFeUwDcaT1KZ5erlt0ug31X+7lAcJRYpekKu
         H1j0JspPoOnHyoSvs4dVEHrJw4zgkEDq94qzE/GFiyPqyDgPSCeNSG4upfe2S1kiVQvw
         ubQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767603704; x=1768208504;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5W1/4QyvrrrF6qZFn1ADTO8hKq/uJgt895DTkpi0Lzo=;
        b=bbqptzFc+czJl4MsCyTsUwoCWml6v8XeefMXT1/bRNTzjaZM9sAnmBQvUpZ+R5NgWi
         fMcmURa2RKcNvcCpxmzTYxgx+p5WoTffPemqbD2Vuf2Oo6dOwPEpOFsODXFxzp0XY1M+
         zIema57RMv9EC0cDL0/of9cnMuQPyoWgYOx+O4UDRpnMGFsxSBAJUMRIMHHa3J5iD09a
         Zc9GUdz868Gs5m2Ury/3AuKATDN/YQVYsetlF2Tmcp66nP9GeMNSJiAk7MiyxtuPMIoZ
         brN9iHq93PIf2pd+bA7v4YKs9KPsakopQr6tGkgwAo2GinnFTvtFAam5QLDjP5sgCHx0
         lV0g==
X-Forwarded-Encrypted: i=1; AJvYcCUSQeMwUoqLRk7cz65lv0ncHQC/OJ1v93P5hlrCWXY95GzIzGIQCeqpxTYe8qSmxtCnN+OCNFJp1b+ORtSMiM2GTA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq1aMf40uo59aWUMdLEabDoFRFH3CSAHeuyIt3BBRRu13qsMjF
	PraI7G0yPXzon61aut8/r72Ir1Ll+jp4oku1xpWLm+Judx6EGsmTNiyTuo/jzaroEhQ=
X-Gm-Gg: AY/fxX5NY3JS8zEFA1+51nDXpNzQOQGAtbI3du5p9ZEBnMsjWzSEp0fIgIBdgfKvgWT
	JLdkmVV+o4zUmTWyX44xhsE0HO6Jm+lwGNwv3mW+/KfWUnRj4ir9GyKfzhgtAgWm+13sGqSXzTN
	zk6TxpAnPCRsiFCPYM+v411CjnPCdzHE7JUUT130ASO5YmPxcDZpiuJB6WTXixXxlL/J1PSfUBw
	T7yo8+zkE+9h+Rb0Jg8Ef8BDkhlRtjcBPG6+bx+qjmVylyny+ssEaA7L4LG3om7nc2NXwmUnZmx
	1Y3WpFx9wjcWCTERP7EQovIZ9U/0LqWi/BC2kotYlEdNhHogroPkmkSgMNXxcCR7HJ9wo0/4LO+
	LY9cG4G5TO9Owe/9HuC7psiD7E6WVtjZOzNtSwo/azDBwkdhowATVXg+QwlVNHYVFe0nWCOSEKq
	ReQn+T3RsUbj2mJwoL+W2VIPFph0naPBHTRvMIfGL3NQvqexgkdSV0t10xKVPWzwZSpFhuuuU/q
	Ex+9w==
X-Google-Smtp-Source: AGHT+IHybXHHNMvOSBwJoAL1yd8LuSR2TLHTL8LaPWQ5jPyfAMZ3/vyTjIsZupiSCPkSLv6GAFSsvQ==
X-Received: by 2002:a17:906:6a19:b0:b7a:1be1:86e7 with SMTP id a640c23a62f3a-b80372287a8mr4738073466b.63.1767603703497;
        Mon, 05 Jan 2026 01:01:43 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f0ecb9sm5384010466b.56.2026.01.05.01.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 01:01:43 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 05 Jan 2026 09:01:42 +0000
Subject: [PATCH v6 06/20] dt-bindings: mfd: Add samsung,s2mpg11-pmic
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260105-s2mpg1x-regulators-v6-6-80f4b6d1bf9d@linaro.org>
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

