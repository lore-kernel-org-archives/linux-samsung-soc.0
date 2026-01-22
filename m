Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188384219FA
	for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Jan 2026 15:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769096631; cv=none; b=o1oylLJWnMHTG2eg1Q/9l0ryAtfmKjD/tU5Qc8aR+FhrkM4ZBEiXNe1T0YhPnr7B1gsKoWGbelY7XQ73Wtd0DqZ2z2FBLro9j9tnTD+vYp+NBs8yFb2SPqFnE53ba+Fc8wKR3tEFIhMRXZwuJwzoCR3hHmKlQBqBY7xtjuNcCLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769096631; c=relaxed/simple;
	bh=LOORAY9pMK8aYglYEfvAWMcpI0Yqtaw7s6Ex0EGCPkw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kDhGLlreeEa81T7l8O6aawp/gQQxPxh4oj0cgz2SAGGuCCBkWJtAckWutZ6P3EKVQSOrMNKs6mAuaWGZkcBStW9czn/8qfePDx8jEb9Iv/DbQwZI6nvGUu/xhPAM1MCG9hTWI8utJ/aYe90WSsorV1HMF9wjpYJyH9bNtJWKfnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ATI/XPGI; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ATI/XPGI"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b883c8dfb00so96721166b.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Jan 2026 07:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769096619; x=1769701419; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/cev7GX1j0sgIdefoqITFqaZrJh3oQgkUM/rFT3vkdM=;
        b=ATI/XPGIpFMIQN/VgxJxYDZU3PJ57Jd2HfxKcZ6/s1pCVG2BLAg3e5gByQbw1Ekxxx
         7of0ecQVEbx3a5vqqa5Nh9FRN4ppDT9CKg9Qn7IZam7LkpT1Bs9L0CcUDI+XDaLJxCcQ
         xiZQmH7sH8ulET+2wbDonqLOBo+gYnLGuqlx0dslXIPpsj5IUb0TjD8AJgdOaDkiNYcq
         qbwl1Kw/z51VXiLLaL4ed/Rl7p1yCXtlHv/e2pbT2f5qSbH9IooEKVaIuAUVjuZ63DNt
         hugFz7QwzbVSgk56TBPY91gVBOsIs92NzCf5NCMM8t7jfl3cXLDI5jpVNxoJSnOtYiXS
         J8kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769096619; x=1769701419;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/cev7GX1j0sgIdefoqITFqaZrJh3oQgkUM/rFT3vkdM=;
        b=gA0mmmndTYm09ENZSoGpCNeACsqOagOzUTcp4jUo0NVrW7Q3mHA65Nma7pjrSepOG0
         3BX3exwZRdH3jrkqg34PYvX4OdgLWd16ntz/ff5gkbb9YHmM0MTR2UjTLxI9gOV+wdL0
         wJQ9rYbhrZBXO3viL3elJc0oqMJXOdO69EnOPrRrVykoYdM4nwuvq3J8qUAqtdNERkBg
         FvyqFuvM2yo4nJgdjykh7oAkbfBHIEAdgk15iTRCxvsPTu1cI/Ha5UtwNUXUC5CRCHVj
         kVzqnUi5J75YehynUI79H6egJ27SqMFQjT0Qx0dE/z1vXaeMuRMdCD9JQEpHMBXZxsWY
         YpDA==
X-Forwarded-Encrypted: i=1; AJvYcCWiiElrBv0U1GODF9A3PM2meQVlrjQEMx2VWwirZ9A6DmXuLhs2UAh9BSPNwk83mNOKRRPwmpZNiuDFD67aIZbOgA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxrbBmbGXl4VlOhsJMa9LLjLyedRWdPMsEkaoJW8hGMe6eqKSJZ
	uaU+jjMGTquFBSRmqgiN65TIj79o+sONzZAqzMkf54QRbQJYJUjm4bX5yFu2YVIKUDY=
X-Gm-Gg: AZuq6aJTpFTDAx8sksO/RBaNix/xYa0XjTUCu6JR6TXLMOyNJw0p17kRC9huGJziy81
	wODl50ijOxdchH6AyY9v78ZaRPWT75kQWUHrckwQapDSx2OH79n/5k03TWXnmQTmnZZPLCmVq6D
	s/s+0LTmSevFhO3J3XOOkMMRETME5FpDBoWde2gs0OHZc4ZQO8nHxLAyPMoEc7mGA8UAUqkFvQl
	sht/DzqGwgEisLj3vyq5BRucGdeav6pVTMwudwT+jlXxF2jSFrdD3NI1n2UpmBmK4EhKHV2Ya0X
	XrWkg+JhAtx/UEYRDYanTlJP58Ws5updOHa/o7Q6mSQkrxrHgR+26yFt+iAqFP9jT1txpX14nb1
	JujxSe6q3VKVw7nivDQRrN9jEz5ikHY5maCJg+uFM01ERTM7Bg1l2LWcFuL0ckOhYtswFmIc7am
	YixTChGSdBTtH6Ast5Vt8VszxnzqOx9XDpS2hTmdcDU1J8U3nm4siRjaV6r9N4WlrvU78fFrL/c
	tUhGA==
X-Received: by 2002:a17:907:1b25:b0:b80:4030:1eca with SMTP id a640c23a62f3a-b880023748emr702788866b.2.1769096619311;
        Thu, 22 Jan 2026 07:43:39 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-654535c49f4sm16334363a12.31.2026.01.22.07.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 07:43:38 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 22 Jan 2026 15:43:32 +0000
Subject: [PATCH v7 05/20] dt-bindings: mfd: samsung,s2mpg10-pmic: Link to
 its regulators
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260122-s2mpg1x-regulators-v7-5-3b1f9831fffd@linaro.org>
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

Update the regulators node to link to the correct and expected
samsung,s2mpg10-regulators binding, in order to describe the regulators
available on this PMIC.

Additionally, describe the supply inputs of the regulator rails, with
the supply names matching the datasheet.

While at it, update the description and example slightly.

Note: S2MPG10 is typically used as the main-PMIC together with an
S2MPG11 PMIC in a main/sub configuration, hence the datasheet and the
binding both suffix the supplies with an 'm'.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
v4:
- separate bindings for s2mpg10-pmic and s2mpg11-pmic (Krzysztof)

v3:
- move to new samsung,s2mpg10.yaml file
- move all patternProperties to top-level
---
 .../bindings/mfd/samsung,s2mpg10-pmic.yaml         | 57 ++++++++++++++++++++--
 1 file changed, 54 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/samsung,s2mpg10-pmic.yaml b/Documentation/devicetree/bindings/mfd/samsung,s2mpg10-pmic.yaml
index 6475cd1d2d15e07d953c8b302c90c785835985e5..0ea1a440b983a47a55fc86d6251b89056ba51172 100644
--- a/Documentation/devicetree/bindings/mfd/samsung,s2mpg10-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/samsung,s2mpg10-pmic.yaml
@@ -10,12 +10,13 @@ maintainers:
   - André Draszik <andre.draszik@linaro.org>
 
 description: |
-  This is part of the device tree bindings for the S2MPG family of Power
-  Management IC (PMIC).
+  This is part of the device tree bindings for the S2MPG10 Power Management IC
+  (PMIC).
 
   The Samsung S2MPG10 is a Power Management IC for mobile applications with buck
   converters, various LDOs, power meters, RTC, clock outputs, and additional
-  GPIO interfaces.
+  GPIO interfaces and is typically complemented by S2MPG10 PMIC in a main/sub
+  configuration as the main PMIC.
 
 properties:
   compatible:
@@ -31,6 +32,7 @@ properties:
 
   regulators:
     type: object
+    $ref: /schemas/regulator/samsung,s2mpg10-regulator.yaml
     description:
       List of child nodes that specify the regulators.
 
@@ -38,6 +40,32 @@ properties:
 
   wakeup-source: true
 
+patternProperties:
+  "^vinb([1-9]|10)m-supply$":
+    description:
+      Phandle to the power supply for each buck rail of this PMIC. There is a
+      1:1 mapping of supply to rail, e.g. vinb1m-supply supplies buck1m.
+
+  "^vinl([1-9]|1[0-5])m-supply$":
+    description: |
+      Phandle to the power supply for one or multiple LDO rails of this PMIC.
+      The mapping of supply to rail(s) is as follows:
+        vinl1m - ldo13m
+        vinl2m - ldo15m
+        vinl3m - ldo1m, ldo5m, ldo7m
+        vinl4m - ldo3m, ldo8m
+        vinl5m - ldo16m
+        vinl6m - ldo17m
+        vinl7m - ldo6m, ldo11m, ldo24m, ldo28m
+        vinl8m - ldo12m
+        vinl9m - ldo2m, ldo4m
+        vinl10m - ldo9m, ldo14m, ldo18m, 19m, ldo20m, ldo25m
+        vinl11m - ldo23m, ldo31m
+        vinl12m - ldo29m
+        vinl13m - ldo30m
+        vinl14m - ldo21m
+        vinl15m - ldo10m, ldo22m, ldo26m, ldo27m
+
 required:
   - compatible
   - interrupts
@@ -49,6 +77,7 @@ examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
     #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/regulator/samsung,s2mpg10-regulator.h>
 
     pmic {
         compatible = "samsung,s2mpg10-pmic";
@@ -58,6 +87,8 @@ examples:
         system-power-controller;
         wakeup-source;
 
+        vinl3m-supply = <&buck8m>;
+
         clocks {
             compatible = "samsung,s2mpg10-clk";
             #clock-cells = <1>;
@@ -65,5 +96,25 @@ examples:
         };
 
         regulators {
+            buck8m {
+                regulator-name = "vdd_mif";
+                regulator-min-microvolt = <450000>;
+                regulator-max-microvolt = <1300000>;
+                regulator-ramp-delay = <6250>;
+            };
+
+            ldo1m {
+                regulator-name = "vdd_ldo1";
+                regulator-min-microvolt = <700000>;
+                regulator-max-microvolt = <1300000>;
+            };
+
+            ldo20m {
+                regulator-name = "vdd_dmics";
+                regulator-min-microvolt = <700000>;
+                regulator-max-microvolt = <1300000>;
+                regulator-always-on;
+                samsung,ext-control = <S2MPG10_EXTCTRL_LDO20M_EN2>;
+            };
         };
     };

-- 
2.52.0.457.g6b5491de43-goog

