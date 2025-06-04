Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931FD19D07E
	for <linux-samsung-soc@vger.kernel.org>; Wed,  4 Jun 2025 15:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749050751; cv=none; b=PMcC+pfi8QQrDTtsn0z32yhHsGTl3XEusIEaIrJzPjxeaKqBfhqsweCL/kVaWDoWGLmvimb8h/lKcYWwpsxugnIAtWhO7ahfJrON7Pm1hsB45eSnIy+qC0FKXPkixQN/VCCZ59G913pbyEBZwJGYIHemAXck6itjRPz6iXD893g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749050751; c=relaxed/simple;
	bh=AJLbutT5f80u713gohP/P4oFnY0KLyNPkjsRDaAt050=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o3OMfeJV7qQbimwSSmGPfrLitGnCpn0/IaRWG/GcQFhK5gAAPWC2q2vrdj1xprBtiMpyEh5pOxUpZdwAhn8sE8EYh7eZhxsPNAbZkAtMV5s9BRBNUSgpw8588pviH4z/rbeBjDnI+EDt6+S3mSNPEamEelD4v/Z2FXNMUVq0Dnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oY+sXTUS; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oY+sXTUS"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-604f5691bceso12670690a12.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 Jun 2025 08:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749050748; x=1749655548; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KXs2zA73ZRuBPLzY+I20lVoCbiqQa8Pw8YT+g/k8k0Q=;
        b=oY+sXTUSMmseGBluOqETW0Zj8coxx/IaSM0V/MNyb7xbL4qEi3Xj27Ej05lAZQzA+w
         IAC2+kGnZ5OeinpsrAIviaAVcVlH4zZN2LtmxHGkGKh7CiuhFShA4Gu57EVkXxSv5vIy
         FtYmafPI60dYcaQPaloxTEKx1/tmbR22+GyjAA1SotuxSFIrC1EoO6lJF5/wtdoIB/VZ
         +fpKuBXTUViaYzxBrEAVfVsk4CjIcrdBD3Y4ymmVFB3cpRPTBpwezrKv7P0o6tT+7809
         G5u7SWkwsUhekFTz6sGDzNQ52gSoNy+SjW+xvuS0rhIQJ3w+2IYU1a7pmX5QXbOWVvv+
         e3gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749050748; x=1749655548;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KXs2zA73ZRuBPLzY+I20lVoCbiqQa8Pw8YT+g/k8k0Q=;
        b=NU6FYSGn92Xdi+faQv43CqwsSIYDNYgaxWHOGYcLyhITz7hdwc0yUGfkEHDDazxU6r
         rt8lcw5gAnoRQHW/p8gk3jErvnXDYJdwF2pRbbLTUcOT1+kXGSKQVq+ZGXJ7yDw1SlMw
         Q0UxbPQbZhdWjSD7ZsLZUPclqNTP7U1ymgyfx3AgpVpWE4vLMiCtCNz+mEEP9kt2hmc4
         TJA9B7q5GwS7aDPvwesvMsuRl42ZBbPDzwOiz030DbUjNoQJA3a1bSQpY7xkg+Ib6IeB
         ZnY6y2aUAAObe8XwocmX+vi5DgkaGf4vzgm7hv6PQVlOPI6yBOJPkLCQdMOCZYHuKU8f
         ZKlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYuWignrIPHdbD4wzIc+2PBYqlP8MkkRQAkvyneRJRH+n5tWglskO+AFsp7DHgdfB8oIivOIX2ptNZ4FqKFh0Dtw==@vger.kernel.org
X-Gm-Message-State: AOJu0YycmEN7pU3vMDP52Lb1e1hp7Ws9Chyc7RuGMvpdairxytFUX5fy
	oVYSaP9/0dnuoMR18LZtkAlBS7mbzgXMSbnxXz0SIr6HqVd2jlXP7sa6H4jQBkGNVSc=
X-Gm-Gg: ASbGncsNsMHxouCMOQah6hM//TepGpYBt1Xj35E8m2zGyWkyTPEddwmsCWhEbwSFAsm
	WJrL97FtZa+gHKCHslqOFxZJ3NzgEcXdT3GNgbEVbHE+ELQ2Y73Olkqd3YYjHDvnnvCZsFLHTzg
	7f6ycQlp+3HpylutcnHzOytjih1naVlVNx4YNAp5iHRaCf6vzR/h+laH8IFt+XVxU1TVHDqNwps
	JFx81ze3fUswRAFnDcMKTRexyBnzqs4vXoAGhlviypFbxLv0CMKy85TzeSMRYz08Gqkscxc9ayl
	+YKdTAZySB8rINEEim2+5AUCNrlvN8RqdlVmBtHeFW9oz9ov/948hQfIrxkTCJwu+h0KcF3g4bV
	MlLIPubgLPkVsGUIyAnVu8gy8zlcgAJgz7SI=
X-Google-Smtp-Source: AGHT+IEpnyZ5RcSizQ8OwBQIqB98hY8tFDyFT8RcDjsboJfv/HhXCPW14p5ZpmW4M5LV1bKLv8xaOw==
X-Received: by 2002:a05:6402:84d:b0:604:e99e:b78f with SMTP id 4fb4d7f45d1cf-606ea3b00f1mr3402513a12.16.1749050747900;
        Wed, 04 Jun 2025 08:25:47 -0700 (PDT)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-606ed984f63sm1051640a12.58.2025.06.04.08.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 08:25:47 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 04 Jun 2025 16:25:44 +0100
Subject: [PATCH 05/17] dt-bindings: mfd: samsung,s2mps11: add s2mpg11-pmic
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250604-s2mpg1x-regulators-v1-5-6038740f49ae@linaro.org>
References: <20250604-s2mpg1x-regulators-v1-0-6038740f49ae@linaro.org>
In-Reply-To: <20250604-s2mpg1x-regulators-v1-0-6038740f49ae@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

The Samsung S2MPG11 PMIC is similar to the existing S2MPG10 PMIC
supported by this binding.

It is a Power Management IC for mobile applications with buck
converters, various LDOs, and power meters and typically complements an
S2MPG10 PMIC in a main/sub configuration as the sub-PMIC.

Like S2MPG10, communication is not via I2C, but via the Samsung ACPM
firmware, it therefore doesn't need a 'reg' property but needs to be a
child of the ACPM firmware node instead.

Add the PMIC, the regulators node, and the supply inputs of the
regulator rails, with the supply names matching the datasheet.

Note: S2MPG11 is typically used as the sub-PMIC together with an
S2MPG10 PMIC in a main/sub configuration, hence the datasheet and the
binding both suffix the supplies with an 's'.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 .../devicetree/bindings/mfd/samsung,s2mps11.yaml   | 70 ++++++++++++++++++----
 1 file changed, 58 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml b/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
index 0b834a02368f7867a2d093cbb3a9f374bb2acf41..f859a7e4a962a6013712ac6c62dd04eeadc5e0f4 100644
--- a/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
+++ b/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
@@ -21,6 +21,7 @@ properties:
   compatible:
     enum:
       - samsung,s2mpg10-pmic
+      - samsung,s2mpg11-pmic
       - samsung,s2mps11-pmic
       - samsung,s2mps13-pmic
       - samsung,s2mps14-pmic
@@ -70,21 +71,46 @@ required:
 unevaluatedProperties: false
 
 allOf:
+  - if:
+      not:
+        properties:
+          compatible:
+            const: samsung,s2mpg10-pmic
+    then:
+      properties:
+        system-power-controller: false
+
   - if:
       properties:
         compatible:
           contains:
-            const: samsung,s2mpg10-pmic
+            enum:
+              - samsung,s2mpg10-pmic
+              - samsung,s2mpg11-pmic
     then:
       properties:
         reg: false
+        samsung,s2mps11-acokb-ground: false
+        samsung,s2mps11-wrstbi-ground: false
+
+      oneOf:
+        - required: [interrupts]
+        - required: [interrupts-extended]
+
+    else:
+      required:
+        - reg
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,s2mpg10-pmic
+    then:
+      properties:
         regulators:
           $ref: /schemas/regulator/samsung,s2mpg10-regulator.yaml
 
-        samsung,s2mps11-acokb-ground: false
-        samsung,s2mps11-wrstbi-ground: false
-
       patternProperties:
         "^vinb([1-9]|10)m-supply$":
           description:
@@ -112,16 +138,36 @@ allOf:
               vinl14m - ldo21m
               vinl15m - ldo10m, ldo22m, ldo26m, ldo27m
 
-      oneOf:
-        - required: [interrupts]
-        - required: [interrupts-extended]
-
-    else:
+  - if:
       properties:
-        system-power-controller: false
+        compatible:
+          contains:
+            const: samsung,s2mpg11-pmic
+    then:
+      properties:
+        regulators:
+          $ref: /schemas/regulator/samsung,s2mpg11-regulator.yaml
 
-      required:
-        - reg
+      patternProperties:
+        "^vinb(([1-9]|10)s|[abd])-supply$":
+          description:
+            Phandle to the power supply for each buck rail of this PMIC. There
+            is a 1:1 mapping of numbered supply to rail, e.g. vinb1s-supply
+            supplies buck1s. The remaining mapping is as follows
+              vinba - bucka
+              vinbb - buck boost
+              vinbd - buckd
+
+        "^vinl[1-6]s-supply$":
+          description: |
+            Phandle to the power supply for one or multiple LDO rails of this
+            PMIC. The mapping of supply to rail(s) is as follows
+              vinl1s - ldo1s, ldo2s
+              vinl2s - ldo8s, ldo9s
+              vinl3s - ldo3s, ldo5s, ldo7s, ldo15s
+              vinl4s - ldo10s, ldo11s, ldo12s, ldo14s
+              vinl5s - ldo4s, ldo6s
+              vinl6s - ldo13s
 
   - if:
       properties:

-- 
2.49.0.1204.g71687c7c1d-goog

