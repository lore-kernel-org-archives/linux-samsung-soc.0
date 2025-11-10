Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12F4336EC1
	for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Nov 2025 19:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762802946; cv=none; b=cqJrTrD/kccRjUHShKRNQMdTOIrHbtXIxybVVp1dqRhNGMHFMsCVPuiC98X9MJejhpRW84orPhc+Ng7AIghiOPE9rVpa383fcaOB6U7Zsv/AEx8X4DoQPP32hdXqYfs0mWSA9IpwOZKbgb62j8Gi7ID0zLl317gv9yINvzb6V3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762802946; c=relaxed/simple;
	bh=vr6RxEgpRiqHUk8X8wejxw+5jKyx/+2PeqGfiI/1qw8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vb7mbn/8/wImw1Ay80YKjH3VqLOppLlG3J1GVGjrqUeQCW+LfYGsJuOjQDIdcXb6pYX2wjn1BjuS2iyo2FGUIOjtwebpk6ISRp0taxkkGSyr+EiadVUkyjsiIEmV8e5k2r/5hvKseBjvQtugC16I8kLSYzMtPxIAkUZjRJzcoN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mMFI5WWG; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mMFI5WWG"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b7272012d30so629498066b.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Nov 2025 11:29:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762802942; x=1763407742; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dJP3xn5w556q22fk22x1v3x1DdvW2KK6ZMHkjIju+gU=;
        b=mMFI5WWGt2QMFTb9RzQr+5O+c/VyTVOWBcX0mt9h33oPJJluB5/7FbPRNa9mF9W5At
         hquo6jNkfxYHJqX92U9izLyJDUXxS0Sjn28mJ0qzqSCng5YMGW+3GTLvycPd4sLPTTQi
         +cqtBSW/GDnf3kHiDJAGNjZgTGtSCuS3DoOdW7z+YjM96kHZxFG/2jYhEYhbuXedljlN
         n081YrqDqozPh84Ac/cRmiymCh86bvQeeNEV14kayfFJB28V/O+Y33dUQFxTwueIeEIj
         hXQUmBeSQaxtU+iRbVLJPyx1yXKh3ILz1HkvgZ5s1o3WSkTKQp5i6TioCOk62yoJcYhu
         dRLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762802942; x=1763407742;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dJP3xn5w556q22fk22x1v3x1DdvW2KK6ZMHkjIju+gU=;
        b=hwKf7B34e58nKO23/fw1WM76GxLK8GPjuLkx3Bso7O+42Gm0ybAVjG0NqOxCyUno7x
         ORqgqaWw55y5v+6CDkTlTkKrkDsaiCcdWOzCGollRJoUvS6j6obc63tLiellOEVXzuIs
         1WA8a/h2JEhKtvEAUa7ezgLuu99Umbn64apDPMdCVaA71HjNe9ZxbTedBNcRLZtHDG7f
         0qfc9B/bspi0JHzRWWPyQRuMDcfhuv5o73ob7RJGMQsCOpiDtqX/ilLe8Bc2q60ZZ9Wo
         J1AofxPkXNPgGgZCavfKEK7QqCcm12G8jocNMNJyMcg+98eSod3tCMsYdQ504/+MbAz0
         VczQ==
X-Forwarded-Encrypted: i=1; AJvYcCUks3IqgGKXo7OyBbvAbz2Gd8JwLRPGSuUFXP5PxpKBy6z81rATWwuHz4OOm/UgwpHj3QHHmqweHcUu/nzxPzcPGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+W1yInulZotJ06B/P1xz+mr4Vq4HCM7h6TUDcxAYY8tNMXN5m
	jxWVgIcCMsXk0PFlUHOx4L3o4Xc1Mmqu+r3+X3TtLsRPhMLiFsy6IZhjrQtiyTUQRDE=
X-Gm-Gg: ASbGnctTkwShfu5P5mZyE+WsJ2cYwslzN7pcWOtjR3PA4GtpjtRQWJUSwjWxMP+pZSw
	y79qgUZ/+jugI2Z0V1SASiyi4tuddO1YsekIdwSpKpO3WZFkWP6UTIbaR6I9PxUjesEi5FDpo90
	MRC6dI+vXzOwmD7WfTjUnVlfJM0/w4wkN8kK92+RwJwfntqq2OkBi+5cav+4/9rhu+wqA5Jekv3
	FX0u3UeSnhaL3WmKZiqJ96eQUTZ3ROEsflIDUrrEgOvXMT/Mny/S3xTv7SmeAeR+8EFOdKn57yg
	04GJJoLJVi+MwbwA0cDddVblfe5KC/kaKyBKCuKcQDstw08gSucFDlLbKuchLmrkSh2a5vQYciM
	6gahwe4uDfUobxGpAGUdKn5JQPKjaidhYIQAviI+KZVwrUMKYPHXwxgj3S4WJ1tcT6n6U2vzdRD
	YgB+iV0/OCMJ1jkhcy3OBp0Qqfa22w5jypWQy/V6KQuf7wmvVg1RFeB34OabmbR2Mo2HgeEsA=
X-Google-Smtp-Source: AGHT+IER280qngV4eaj2hj/ImB6hOgWWKOhNkqzG5nImM12xY/4hFX9cFnSFQkOOg0D7SoaJs4N1yg==
X-Received: by 2002:a17:907:7203:b0:b70:b661:cfcb with SMTP id a640c23a62f3a-b72e0410257mr1039055666b.31.1762802942053;
        Mon, 10 Nov 2025 11:29:02 -0800 (PST)
Received: from puffmais2.c.googlers.com (254.48.34.34.bc.googleusercontent.com. [34.34.48.254])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf97d16esm1168178166b.35.2025.11.10.11.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 11:29:01 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 10 Nov 2025 19:28:48 +0000
Subject: [PATCH v4 05/20] dt-bindings: mfd: samsung,s2mpg10-pmic: Link to
 its regulators
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251110-s2mpg1x-regulators-v4-5-94c9e726d4ba@linaro.org>
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

Update the regulators node to link to the correct and expected
samsung,s2mpg10-regulators binding, in order to describe the regulators
available on this PMIC.

Additionally, describe the supply inputs of the regulator rails, with
the supply names matching the datasheet.

While at it, update the description and example slightly.

Note: S2MPG10 is typically used as the main-PMIC together with an
S2MPG11 PMIC in a main/sub configuration, hence the datasheet and the
binding both suffix the supplies with an 'm'.

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
2.51.2.1041.gc1ab5b90ca-goog

