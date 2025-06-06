Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39BBF13B58D
	for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Jun 2025 15:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749222199; cv=none; b=s9ujX0gBSfH8LJZf0Fc9CcszuihxtWl9Li3SJdURPCAaio6cHsU7s6EYMHmMFvSnjumqEoUva563Bj0p+sRsxzIuswnBF/rQD8nWGEHXg9DnP5GhNigR5kaxwKH0cNGV0YTMmGddWR0kLNKlI8EJCpyfSBaTqcSMdK8rQiaTiVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749222199; c=relaxed/simple;
	bh=s3mSTfiKouX/DXZqGMbD6vxo0PP5K4YwGopbgIII0PU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QmE7apSHx31x0rJ4eQ7aVh2yWf5HY0uIhexou9gvhQd9I8vs3jzb3kzqSS38RGzl6D2UnsNyDQW2U1jnkkaDJgsP0Fo3j4gSzn/RuG7oTjZTuBCZVteWJBflzpvR6mhTBkVcs9/D4ndk26tpl85c8lgrCeN+1VPjJMof03bk8ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qCc9zrTZ; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qCc9zrTZ"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6077d0b9bbeso1121498a12.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Jun 2025 08:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749222194; x=1749826994; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hw33Rl+thTuvgJB34fURNPMx+D4YtoSUdiE6dWyoZ50=;
        b=qCc9zrTZUy+jC1tXAdLtxAeJ4gW1DtYGWMzEaslr52+d6b3AmYMSWKceoPajTCLIny
         D5dbExTZ2doxdE7gfrpkPSWe6hP/aKceQvYKcKseeDmjI2Yuv/tKAuCgAKmUXjpw8p8N
         oAJFMaNPOZwHF5vXL65RAs+gV5YtcxrPH3SwluArm+jbY6+gHKGS+1gNwCrL7XQq0sEt
         nFC+Ty/1/yfrSiCbWTdKhy2VS3R2dE1d5fD0LeevpOV9cp97+LJyzTPvYf5epoNVi/oK
         JEryjrUYKq1iurHJetyHkTfWHwGzwxjqKIWyv4RrC0ZSdfQ8sIDfWn2WVBhECokn15IJ
         gUdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749222194; x=1749826994;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hw33Rl+thTuvgJB34fURNPMx+D4YtoSUdiE6dWyoZ50=;
        b=wbU/S7o25ozWfoQ4XorpHN2j02J541neF1wU1LsGUbD8TDA1GuIpIGsW3mSH+vTG6g
         mknaPsgmY/OuY3fktQswwWxkXHzaiB4TGc/aXBjNGpFlOV3ZvSkYi6tu4PbMYBCQpg5V
         C75vw0A6G7Q/9W80b+wnyjoCNP8ul4xfLCsQmHvAKBmA/H7b5GBnea5p1zAyE7l3QOR4
         IcSy+xDW84e2iX4rESXDpoYYAVze+BmT0uul2o5l9tIhec/G/XDDJTBlbrHRXZMVJyeB
         KbBy/OxGlTkwOQoK1l7tMtgSXLfwa8AZInSylrGIQOibYFhorvsopAWgezS3bJTF2Y42
         W5yg==
X-Forwarded-Encrypted: i=1; AJvYcCUfegJHn1s5T8zbMoRe5Jav4RiYbDR2wyrBnBlvn87nYTBEAra3l88e86S1tb0QYej5ZS3CYQV3jIjsNVUI+tsyDA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJueGIwdo4Dxtyagqx3wgIHzjDyExRPIt/IAN/oBc8DoeY+DJ/
	XLUkEueuxTgtln36pAM1NGLTsPj2xNx0yWpoZsv4FKB0FJgYD8wiukmlOgXuhlnnOUw=
X-Gm-Gg: ASbGncu0D1iefM0r/29/yiprE/4x8dDaeXecwh3nLJYWdhiHufpJ/I7d/sQReN2fFEa
	RfXJepvjzd+NdFdZbma3/lCVemgzPxvS2jYAx6xz6C3z76pGvvfZTbaq6B8zOyXxDpuHUcq5peG
	y6LhvVeDFNdgqIcIkaWoW8jPTAr5Eo455+dSSc/1pS0p9unsDSH/Jy3ckJwsEqcDmalyrNOh904
	5hbdEoEnjCe6p26fprSlk5+GnSKfm+5ifc/bkyWwHILjPfXdufjpwCq5L2AXiEzNLWmSJ8D9/mR
	S5r0t6z3CBsk6csNdoI0A4aiAfgxf7m93l0nzbzpDL0f4k1nmPDerwO8f4CJD2Upap0gy82gR3h
	5jSdDIfYtJl2cKcpFTZ5KkWAR+mW6iN0H/MTWti5SNx3CYg==
X-Google-Smtp-Source: AGHT+IHbWi8jsL6tIHBW7of/W9kUs+W2SnVGPOjs734Ix0yZ3GKT9YaBdqKy5cjONZI5b7CnH58irQ==
X-Received: by 2002:a17:907:5c1:b0:ad8:8efe:31fb with SMTP id a640c23a62f3a-ade1abc5eb0mr323702866b.54.1749222194282;
        Fri, 06 Jun 2025 08:03:14 -0700 (PDT)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc38cf2sm127735066b.121.2025.06.06.08.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 08:03:13 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 06 Jun 2025 16:03:01 +0100
Subject: [PATCH v2 05/17] dt-bindings: mfd: samsung,s2mps11: add
 s2mpg11-pmic
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250606-s2mpg1x-regulators-v2-5-b03feffd2621@linaro.org>
References: <20250606-s2mpg1x-regulators-v2-0-b03feffd2621@linaro.org>
In-Reply-To: <20250606-s2mpg1x-regulators-v2-0-b03feffd2621@linaro.org>
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
converters, various LDOs, power meters, and additional GPIO interfaces
and typically complements an S2MPG10 PMIC in a main/sub configuration
as the sub-PMIC.

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
v2:
- add | to vinb*-supply description for better formatting to mark as
  literal style
- mention GPIOs in commit message
---
 .../devicetree/bindings/mfd/samsung,s2mps11.yaml   | 70 ++++++++++++++++++----
 1 file changed, 58 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml b/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
index 0b834a02368f7867a2d093cbb3a9f374bb2acf41..a6a10d23a480b460c66be2df5bfdef5ea3024ce1 100644
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
+          description: |
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
2.50.0.rc0.604.gd4ff7b7c86-goog

