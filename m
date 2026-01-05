Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679B032AACF
	for <linux-samsung-soc@vger.kernel.org>; Mon,  5 Jan 2026 09:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767603708; cv=none; b=KjE3SxGzryBMxWep3ozl6DAh0MOsRHAQYwf4rA+P89aSsy9GpLt0gH+R5C7LN6GIgbwMnsvjWJxSwRupl3SZ3sNBkB/yg1fe1Nmp0fLs7M8W6cX5Oskic7tFfLXeGRN/vr+HruwGrw6Xw1lYLIvifE3XEOpu5bfEaxD/5c3t2ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767603708; c=relaxed/simple;
	bh=eUj+8YlOMKUNf5NBtFGcV3w0vZQRcRxLXSHd68Howms=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cQLh/0IFaW3EKYFHrl1Em+0tbom8FKYSJPOKmSwKQPf0Bh6fVeiDFAwsZXSIULHavEmAqtNGeCeAAxyp9/gZm+lQK4F2TOSE4Z+VnQ2lKB1u/SAN7XbTtJk+UubRRkd9AkYLH8GsmEFYAP6qSK8tlIGFmuN2lOv3meh7jB3CvAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kxIckNs3; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kxIckNs3"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b725ead5800so1956978066b.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 05 Jan 2026 01:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767603703; x=1768208503; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SNYCoocek2VrCaA3pJ1kEtxh2+5LCdMec/cid7tZc1Y=;
        b=kxIckNs3pcZk2QQHUAheYFAcP1DoI+NV0u7wLL2uwmqDBllGox4r9yrn9TrIpLTPtg
         zF0uQ8pUGuztmt7tdzAiTCcHMwLzZSOsL0W/ux/3IJxQj8FhGEw+4j5NCYkEtnWrgiw9
         YhV4yDF+ddWTNriUB10/LcePkP4gyBNqysSD9yDh68gqrluuT8mr/pEatoPbZORlKrGe
         EyPIxpzwnLgWF9oS0tVFwih4d9MtLQNu60o3jkjqIDCzMkACnkyfn1ayFSBvY4kfCe4j
         ET4SOztw0EO58UKRUkVl6EMN5+ih7TRIiioesoCJaWTo2k7qpxsMmN0mRMXOkYC6/BSJ
         aULQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767603703; x=1768208503;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SNYCoocek2VrCaA3pJ1kEtxh2+5LCdMec/cid7tZc1Y=;
        b=pjFc3Y5QWl7Pr7gk8OpMRyh/Q/UWo0yfZOBHGhGjT0WbPv2bu8phAgDxRL7EEIMTz/
         zmmW8/GOmkT0J7/4kyDGthji3cH5vcNif5pVIfzruMmHl2MRjUwpiRj/xSFXBjToz8bz
         sqXspQeek97BTP9FwC5RbCYz5unaF9JY0kK3hqjWfi0O4YGRTq3BWVdiY8Rwd8uUtji9
         u/WnjDxbAwyd/A4L5GJ7qeVP7BxXkqSFZgzZrYHJFw2JG/DQnVbiEkPNJPmhOFQePnlU
         gB7yEjGO9Nc6ja9ys7Vw1/VETY4Of4UKNwLKQqsC9c6OcQSnYaL0voxW6gorz3RjSTfK
         7dxw==
X-Forwarded-Encrypted: i=1; AJvYcCW+QZ+5/wIjlvyLl2cFLyNfsdViIeDBWZnjs75uWdoIcwNlmzfc/PeGyYWoePDMn+KSInkdzTJZ5YSnmmBMYHa/2w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp0nc+Ng9v55F2F8c2NFpLFrt3Ug2za0KezuZwNkZlBdB/05ne
	qTYPK1NFcn5A+mpNx4sZbLImyNDy8+pQRh5vX2s8LzTZ3syK2ctaYfR95YZfqlGcb6s=
X-Gm-Gg: AY/fxX65OYd24MBjPbWEgK3utINDl0mfbz/ULYZAmJoin37hrT+KNS0gQL6/+1cUco4
	dT92PtQV/BEBAwJ3wb0gDrtEXY3HGsOq/trNKl/2JqVdwFu/veCXYJYvoHhAM6+4eWLiDxSDdOC
	HTDTygvbChLzxWOS63B0i5xODU6Fd+ILYgWT3KU6R9enAo86tD2eRM36ZK6Zh7HS9FvFArVVmsg
	sKHBa4YQecqw9we5MjLOlDdN0+vJr4A7Nyd0jIqRfyh+Qk5Gqdz+sU+FLwH3P3gfqtq9PNaurxM
	pp0gY4h+q3iwfTK1puFQKgVCUCoSOuAi69xATnlGFo3SwsiRHBMc0CI3UXhI62OEkLXl/oB4ztr
	BEV6+AJG+zpHWcS9j4St/918YF/vzZMaOr1PzslVUlkJK3uZfiqv4cPydBVl2zeOiWqDlRzeFjQ
	hpFt+dGst8vwxAMxePnIycasADxC3c4YifxmXY6eERKGlcnRme0rAl2jkeCSo+5dQv8DFUQp1+K
	94KmQ==
X-Google-Smtp-Source: AGHT+IEMhCRz3n6iUPPLVom/XCfPxIRru78z7Q3ad65RUSf5g00tOnFRHp+Tss4eC3M+LwxuogmXvw==
X-Received: by 2002:a17:907:94c9:b0:b70:7cd8:9098 with SMTP id a640c23a62f3a-b8037288a09mr5164076866b.61.1767603702943;
        Mon, 05 Jan 2026 01:01:42 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f0ecb9sm5384010466b.56.2026.01.05.01.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 01:01:42 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 05 Jan 2026 09:01:41 +0000
Subject: [PATCH v6 05/20] dt-bindings: mfd: samsung,s2mpg10-pmic: Link to
 its regulators
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260105-s2mpg1x-regulators-v6-5-80f4b6d1bf9d@linaro.org>
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
2.52.0.351.gbe84eed79e-goog

