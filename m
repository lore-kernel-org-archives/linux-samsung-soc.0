Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37CEC19D07E
	for <linux-samsung-soc@vger.kernel.org>; Wed,  4 Jun 2025 15:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749050754; cv=none; b=cEBymktsmYFgFFcOPMimbxaZ2UREx9iZcPEFcQsWad8YTU6K13gkTWLHD/M96wj3oTIzKURmCP/506Vf/pii+QXEb1WZsyrQvqSQBoXVE4qjp4L9LpOfKBbPggnmFLZXTOTrTZez6afYwPg6PFAg6MlDxb8C/Ov8j45p8VmgyiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749050754; c=relaxed/simple;
	bh=bSQGBA37BpSgsJdlJNGFk9NhBYGGguunmVcoDXGfnjE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g1debZgEaIaj2zx4EuRJFo2zbYmclqrf5+uZQarRyvCHy9aS67ZI0n0sl2c+wFh9hu5+382sVLNDortxqTEXTBmSC3hPHfV7l0JVrzc+T8An1DI4aVfKShvSWHeH6EMVybkY3+QOexbDr7vUoK5yUmetgL54KbDU+1DhUD9wC4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HVFt7zeX; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HVFt7zeX"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-606fdbd20afso1477313a12.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 Jun 2025 08:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749050750; x=1749655550; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OVsIds4atv9b1Ndpam+Ic3xTK6Dfgv1Ul4T9xSV77wk=;
        b=HVFt7zeXGRb6vKV+gMBL6kFRaGmGrBIJdPOu+C8E0OO9KKJpO49mKgYpCG5ypxH26R
         Aytd49PigPijSLP73fY1mwlwhjwAeYr2f49D4LfOP0mR4RtBVeY9OZmJY6ji4znWZcwN
         FmmlhVkwr8NVPEsqC4FDMVNc/njmU88qO5SDv+/a2MOU4dHeGpucDnWPnvlcjd+nEoUy
         qEERHVryI2Bhru3a2rtmvlPuZttOKDZoLcfi1PmzC085MfM/vTLQlc3FkSs5PqzpOuCj
         ouf45+/+D1tOgH2S+b9yB9F8Q+fC0iJl4g/tuJLHwUVwBUfX87iwk+p736bePs/kXCSj
         g50A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749050750; x=1749655550;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OVsIds4atv9b1Ndpam+Ic3xTK6Dfgv1Ul4T9xSV77wk=;
        b=DmIkv8Qm1cJhEoOMESC5gKipO1EJBKIMoAkLDXANuL7O3D5cDzfa2Qx+9MImX1O4S1
         eojRUwmvsosUJyWhUqARaFqrX2yWDqQv0p5ReqIojI4DOGkYhoKaMP3FRXH+/IRKJR6R
         zgpMRh6n0mrvsdMxpWnyl/BSSiJtvSBlIvFZD/b6H/flfX+p+H6GZWvRsfS3jeuMAl/+
         LqQDSdFaHZXF2EkiMmbhl42d/NnbV5wINXWByRWvmfwXq0ifc7UGSJ79J51dGB47kell
         p+mVRg8IQF1WcaxpvEqhy7r/YO63mIlLRluOFLt9bZAjrx22nRXtWok5lUlKe4ZdIqko
         uHzA==
X-Forwarded-Encrypted: i=1; AJvYcCVUgC9MrlwDZKB0YYHIdcBIrrm8wA43Nvjz6FPmSF+184e/eP9Qn0xiVX6UzkcTnu7cEO0ArMevMCNj2rtsvX0L1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2pIG2JVoDXvu6who9NN5RN/KinZqDNMQOYWTR4T/5KlIMataJ
	JBrSK3wjehKzF4C9dCHi4jsTKfunZuJxaaRd9y1pwalZNDnt1nulhr1BDa3rO1nI3Ks=
X-Gm-Gg: ASbGncusgZaaeunf68b6Qwj0Zi/Yf0OWQmEyMxPhoMz8An8i+Y8GBCnyWeUBwAkHBP4
	31URnEgOw3UkPGBJeHKw48QjJEXWgCeZ1lsGzZHDEyVWRcFTVc/XW4jnKnAQHllZBWKpyQB8OI/
	8fxqWu9x5DC4i8U1S8t3Wha64375LvwiBpHTqTXWyiuxYlYob0EIIlWJR/N9bUyUGOBSN0hyj8/
	KZkz5Irer20olSmg+YgHLOnxonzUrVekqMFMxG6nmLRVcskQwK814mvoHa6I28PsQHwZJjuK4LZ
	U6OeAxIUK3qmD4YQoQWy7QfJAd4DP42w51nRxcugKzSkOx/ctvtKxQ8bkxEiX/sw3/JMoIrIAWU
	wv1ySV9TNV9HSLK90Fe+zXyM6ndXcE0YqXeM=
X-Google-Smtp-Source: AGHT+IGmpFLzdEaYYr7iQUhbbgsCIhZWT7QbCctj4zySD94PvS5LvY7Sr6dL7NlPVuoHoEkdg0F3SA==
X-Received: by 2002:a05:6402:34cb:b0:606:a26c:6f50 with SMTP id 4fb4d7f45d1cf-606e944ea6bmr3149657a12.5.1749050746634;
        Wed, 04 Jun 2025 08:25:46 -0700 (PDT)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-606ed984f63sm1051640a12.58.2025.06.04.08.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 08:25:46 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 04 Jun 2025 16:25:43 +0100
Subject: [PATCH 04/17] dt-bindings: mfd: samsung,s2mps11: add s2mpg10-pmic
 regulators
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250604-s2mpg1x-regulators-v1-4-6038740f49ae@linaro.org>
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

Add a regulators node to the s2mpg10-pmic to describe the regulators
available on this PMIC.

Additionally, describe the supply inputs of the regulator rails, with
the supply names matching the datasheet.

Note 1: S2MPG10 is typically used as the main-PMIC together with an
S2MPG11 PMIC in a main/sub configuration, hence the datasheet and the
binding both suffix the supplies with an 'm'.

Note 2: The binding needs to switch from 'additionalProperties' to
'unevaluatedProperties', to allow adding the specific -supply
properties for S2MPG10 only, as otherwise we'd have to resort to a
global wildcard with negating inside each of the compatible matches.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 .../devicetree/bindings/mfd/samsung,s2mps11.yaml   | 33 +++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml b/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
index d6b9e29147965b6d8eef786b0fb5b5f198ab69ab..0b834a02368f7867a2d093cbb3a9f374bb2acf41 100644
--- a/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
+++ b/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
@@ -67,7 +67,7 @@ required:
   - compatible
   - regulators
 
-additionalProperties: false
+unevaluatedProperties: false
 
 allOf:
   - if:
@@ -78,9 +78,40 @@ allOf:
     then:
       properties:
         reg: false
+
+        regulators:
+          $ref: /schemas/regulator/samsung,s2mpg10-regulator.yaml
+
         samsung,s2mps11-acokb-ground: false
         samsung,s2mps11-wrstbi-ground: false
 
+      patternProperties:
+        "^vinb([1-9]|10)m-supply$":
+          description:
+            Phandle to the power supply for each buck rail of this PMIC. There
+            is a 1:1 mapping of supply to rail, e.g. vinb1m-supply supplies
+            buck1m.
+
+        "^vinl([1-9]|1[0-5])m-supply$":
+          description: |
+            Phandle to the power supply for one or multiple LDO rails of this
+            PMIC. The mapping of supply to rail(s) is as follows
+              vinl1m - ldo13m
+              vinl2m - ldo15m
+              vinl3m - ldo1m, ldo5m, ldo7m
+              vinl4m - ldo3m, ldo8m
+              vinl5m - ldo16m
+              vinl6m - ldo17m
+              vinl7m - ldo6m, ldo11m, ldo24m, ldo28m
+              vinl8m - ldo12m
+              vinl9m - ldo2m, ldo4m
+              vinl10m - ldo9m, ldo14m, ldo18m, 19m, ldo20m, ldo25m
+              vinl11m - ldo23m, ldo31m
+              vinl12m - ldo29m
+              vinl13m - ldo30m
+              vinl14m - ldo21m
+              vinl15m - ldo10m, ldo22m, ldo26m, ldo27m
+
       oneOf:
         - required: [interrupts]
         - required: [interrupts-extended]

-- 
2.49.0.1204.g71687c7c1d-goog

