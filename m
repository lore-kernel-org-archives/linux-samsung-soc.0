Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C646324291A
	for <linux-samsung-soc@vger.kernel.org>; Thu,  3 Apr 2025 08:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743670745; cv=none; b=WHssKmIembqPrRsb1oP2ie4EfR+UpAwmj7HodgLG8u3gWNJBsCcnMPeCaLF8i7zXPXoOyiaqUKYrLtVrYoo5V+EcosyzDmdBMmHR6DPrC6b3UmuO8qAjkwWKZ/l0CuGyK4ZkSNkZkBofR0DQpHCnOdgtPcX4t8quURGXmJ8NOKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743670745; c=relaxed/simple;
	bh=8eAYSNpHmOf5cN1usNebO301BYKlN5Z6Sv3SjOw/R9E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ah8Pp2KjAbJNdPM/j+Jewp4eMcufpb/Tu0w18vnbozTLGTsWuHjSY/4685vsi1nRHS0g0eHwkEVOQ10kDZSk7HITMAV61ub6rjR5rbKFjws/pDBx9KM0uUf2nqTn5edr0fZFakbOBFDI1057Wqgpd8qh/aRR/R0QcyJ1pbHTzRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W7PYcnuA; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W7PYcnuA"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5e5c7d6b96fso1228180a12.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 03 Apr 2025 01:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670741; x=1744275541; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TTxYh5RL8tOeSvhD/5hLspaDOdxe6ZuNdEjOA1UzBwY=;
        b=W7PYcnuAlZQsbDxO0WOqI7YMtU0x8oDPCpmXjmjbqbAxjaxT7e2cWS3ocQLK/69Zp2
         MfEGGmraQpTaXxhhqsUryIAoWqTpsJ7JR7uxKSVH4GHJhnvUljs0zkPEFJWWpTZ+2cpf
         Fir41nqzNOigBPyxHZmeURSIL4iKpB8xoEgIqu53zcx76rCnubxtLdpjo8Px7X9OdPY7
         YS/at1xd1qDdYbztZK4f7mn1a/GA4r/RAEGOwmcJcHuFSwBfjQ1R9Ois8he+EBB741H9
         p3smz0KM5lpjtvgJEcz6Ot3Tl+lNg6+FSM7OYIdnIk3AekBugU9aZOyz0MD5QruyHMML
         1N4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670741; x=1744275541;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TTxYh5RL8tOeSvhD/5hLspaDOdxe6ZuNdEjOA1UzBwY=;
        b=D6w2HxWdXui/Mw3pto2xyWMV3RruY1O1gfQ4giLjPe11mAk0vnJ6qYj/JkfD57f6Oo
         36Rg1639SJT1IAMjsveM533WuQpXeMthLXCSktDaI5rEV2Swyz4WUaxtEhFaRiYh4iX+
         mIbKu6Nvx4bDzHqD8HfxW0WVSXVfcXMYOZZFQ9VkTbMILbrnpSGX2pFbsiZz/PBp1bPM
         UtKCg2BZTL1cLd1EuNpRQtIIV0feuTmH30jbTCyyPYFdsFFxOXfUAWXqQldd3o8x15L7
         KzqOBUwajBgQMFwZsm3J7NVvogWnFmiCynINirabnFwNcN4xcgvroatAT7h85RRk4TdU
         PREg==
X-Forwarded-Encrypted: i=1; AJvYcCUzvgIVb34mvdr7KSjCoBETpsUsyF9grWWeg/InQJ2jWWkpoo9XkBO77zVeuUSAEsnWPLZQ5pmGsYdYeJ8xKWgLyQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4xoyRDGMAxNf1EQnpEU5KqX9QgbdWiZayT1YDnpIIPKUOJ5Xx
	8VUrXgosdiPv6SpdfkY+mMnIYDPAhNqIPtQGzqlvtKH7lIfx0F0bnEZEdUfHpzQ=
X-Gm-Gg: ASbGncvUKm91DrK0lyoR8O6OHefINOwX3184yN4MAFTHBzL+ShsKY1hD0mW7KDrv4Ah
	+JzYk8O6V9Qzwp/y0jSQlMH8wSnsEEdoAsj0sZtmp/EeJQHoz2fvNqeKvoJIHqEd9b9dyg0j2qG
	0T9QSj3KDcleItzAoZ2SeeM67dEK8tqXM1jJwtxYegnyKzeoHoLf7iF+uYm+pwnFPgWT3/P1BQQ
	fja2sj+zwB7Qy2EkVUu+ZjP+luphw8SsugB/le1js4hWL4FK7vNyDl2+Cc9Cl1xm63jQhogyIYz
	EryGmaSDMEQiGei4nQkqbMonK6TLs0oU0kQzal5EIfYwsFZGH+m85+oAPA50RTZ6meRyKXIboBs
	q5PLBW4PUaqAiXR8k4w3xoGQSXuCI
X-Google-Smtp-Source: AGHT+IGqS+cHosPp545QR90MaWlJ7FylDhKCGqpl/xjJ8Dzzg8KkweIQ6IAoK4HbqAdErYyQhuV36w==
X-Received: by 2002:a05:6402:3229:b0:5ee:486:ea34 with SMTP id 4fb4d7f45d1cf-5ee0486ebc0mr15642777a12.34.1743670740725;
        Thu, 03 Apr 2025 01:59:00 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:59:00 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 03 Apr 2025 09:58:55 +0100
Subject: [PATCH v3 03/32] dt-bindings: firmware: google,gs101-acpm-ipc: add
 PMIC child node
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-s2mpg10-v3-3-b542b3505e68@linaro.org>
References: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
In-Reply-To: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

The PMIC is supposed to be a child of ACPM, add it here to describe the
connection.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v3:
- drop '$ref' and 'unevaluatedProperties' from pmic subnode, use
  'additionalProperties' instead (Krzysztof)
- add some regulators to examples since s2mpg10 requires them as of v3
---
 .../bindings/firmware/google,gs101-acpm-ipc.yaml   | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
index 2cdad1bbae73bb1795eccf47e1a58e270acd022c..9785aac3b5f34955bbfe2718eec48581d050954f 100644
--- a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
+++ b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
@@ -27,6 +27,15 @@ properties:
   mboxes:
     maxItems: 1
 
+  pmic:
+    description: Child node describing the main PMIC.
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: samsung,s2mpg10-pmic
+
   shmem:
     description:
       List of phandle pointing to the shared memory (SHM) area. The memory
@@ -43,8 +52,34 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
     power-management {
         compatible = "google,gs101-acpm-ipc";
         mboxes = <&ap2apm_mailbox>;
         shmem = <&apm_sram>;
+
+        pmic {
+            compatible = "samsung,s2mpg10-pmic";
+            interrupts-extended = <&gpa0 6 IRQ_TYPE_LEVEL_LOW>;
+
+            regulators {
+                LDO1 {
+                    regulator-name = "vdd_ldo1";
+                    regulator-min-microvolt = <700000>;
+                    regulator-max-microvolt = <1300000>;
+                    regulator-always-on;
+                };
+
+                // ...
+
+                BUCK1 {
+                    regulator-name = "vdd_mif";
+                    regulator-min-microvolt = <450000>;
+                    regulator-max-microvolt = <1300000>;
+                    regulator-always-on;
+                    regulator-boot-on;
+                };
+            };
+        };
     };

-- 
2.49.0.472.ge94155a9ec-goog

