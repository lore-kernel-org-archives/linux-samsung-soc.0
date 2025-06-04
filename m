Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E16B19CC11
	for <linux-samsung-soc@vger.kernel.org>; Wed,  4 Jun 2025 15:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749050752; cv=none; b=E5L2dCqJy3sRJc3cFpur0qk//An1UbL5oF3KRYsx1/lc2HFC0Ui08raXLSk369nP4LbxXuvSxzBQUcCJoZ5uXPT2Dniqc49Kwavb3MzIYmg0gz4AztA7jU+XZafCj47lpopY79RfchBcpxHCL5P0geqvGzlHzNEzmJGJH6NMM3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749050752; c=relaxed/simple;
	bh=j0GuHj7/ZWHalZNJJKYALf4n+0SGhUawk93aep6mVzU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O8osbyIIyHh3hUT+d15ldMMVZZWXdQXnSgFcWIcQmt0oxCboTRK0k7Ytzod5tH8lJ471B9umQMLDPGl72B0evvCq3nM8w/Qf1XmQV+EJtlCeM5bJ8P+I66aGovEYE4ikA3iy+fi0D8FhcgyRiyea+VOzmNsen2cMvlvhRAn4X/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TOxSmiuu; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TOxSmiuu"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-60702d77c60so1282654a12.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 Jun 2025 08:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749050748; x=1749655548; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0u44+fUCPUbXjNG3Yeye3uYWIaUqk694d8ypWgEWxmc=;
        b=TOxSmiuuOIVEo/F08dulkHvZzIp0ij1IJ0DnYwF7gj1HIoaTBeVKZ/FnmNKC7HDoTs
         OB1QQTuA8lHSpE+ARFwqX/mGp7NeoRjpzM+96CY+n5CSZsRdTHGihy6XxLWrRaCCfz1e
         TsbVg9iDGHvfn8NhfyfxYNG/RH4oQa0vneZEqhP2EMRoAxBVIi/+uecvq951VvbUM6iL
         fpNC7D/d+RfghTH9MJ9ZmEywlS9YNDJsPgzkE6/u2HJLOUEuWA41t2hRrBamcTO7kCeH
         mhSxTsmKnchlDVD0eE9H2RWyeXR7bv0et5X7QvNwP0Q8IkzlCk8ymanrSGUw/p/gwr1M
         ZxoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749050748; x=1749655548;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0u44+fUCPUbXjNG3Yeye3uYWIaUqk694d8ypWgEWxmc=;
        b=CK4fah2e9NjXSurEHZRaP2qHPwFJ0pmkcum5F2dmvLrOlu9vErQ+llfO2ve/0O+6sc
         xkM2QHoa8+qdDsES/NCXvW5x6nLc0aXRRm8346VyWPiNX06PAVlBZsj8pT98MDbGof0B
         x6nlzODw0nSHpJif8iQBJNjwf/SBJx0UGPFbGIdS5cLmzR292QOyFRW3Bcf707wk66z5
         TZfPVLZUluCNW3pcu0/Zh1QdRuXehswJrB22/pMkUJ2nKMom9UvTLgshgggvApISpg8e
         pXl7WsdRyP9/NinI2aMLD6lVW6+kxRO3CI8R0wK2vXe6mVK04W9hBobUuttc9M5LcAcS
         vHTA==
X-Forwarded-Encrypted: i=1; AJvYcCXk7fqULiH3LB3D5FYsaS4HBwQ1rvTTJ+SwiaQ56fUJ3gJPPLf5LDWdlC7ytIKFBokpGXyQ4lqNt6lQGOVYY0ifEA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5T3h8sZbqHNHByz4IikVGeZwn6K4zLwjK/Fzw0VgeQawh4S7a
	jDTCUrx2BQAJUONI+V1Q6jpx4UOrqb9vn8yYhs1A5F9F9iGxqn5R82P+B7ezjUXCJIQ=
X-Gm-Gg: ASbGnctwwVsmQhxRdEGpV5N16o1O+rloXd1ve2junSg9AILK/cBaLwLWyy0g6gRYRYU
	6CSm5cFTMgYQMLYR2vqZ1E2cWDmSNvPswVBCBQtDsOwXLI85lXkMedTx9lbS6dfT8isi8XmZ1hd
	innuW9Iv/IRGKxZzvpdu6NP6EyNUF1RwwM5qI9rpzX32exu8TWUpcb9CbSrRuumPv7XZabrtMW4
	V2RX+JjTD00JsQ9AGYFnKJ+8qXmcDnwU0+KWy5bV+kfbNutn+wnHTHAn2GWG+P/q9HtUPMxHhhq
	Nba+AdM8Y3ScL9uiE1zYLiLD0Xw03R3frz+B7UwlMMWd09Y2lt5TdMdFcXOyCM5tEet4BR+akRL
	9WU1ipNxeytIgJpWcdcbaY0CKrY1YDrcV/yY=
X-Google-Smtp-Source: AGHT+IHNAC7ImHn1/O1ztYLzbmZYe73jvmUwIhXjFO7kKauTSDKLz6MSUnHCtZ7LDe45RKA4CdqcaA==
X-Received: by 2002:a05:6402:26cd:b0:606:b6ba:3595 with SMTP id 4fb4d7f45d1cf-606f0fd23d5mr2931176a12.32.1749050748489;
        Wed, 04 Jun 2025 08:25:48 -0700 (PDT)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-606ed984f63sm1051640a12.58.2025.06.04.08.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 08:25:48 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 04 Jun 2025 16:25:45 +0100
Subject: [PATCH 06/17] dt-bindings: firmware: google,gs101-acpm-ipc: update
 PMIC examples
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250604-s2mpg1x-regulators-v1-6-6038740f49ae@linaro.org>
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

In a typical system using the Samsung S2MPG10 PMIC, an S2MPG11 is used
as a sub-PMIC.

The interface for both is the ACPM firmware protocol, so update the
example here to describe the connection for both.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 .../bindings/firmware/google,gs101-acpm-ipc.yaml   | 40 ++++++++++++++++++++--
 1 file changed, 37 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
index 62a3a7dac5bd250a7f216c72f3315cd9632d93e1..408cf84e426b80b6c06e69fda87d0f8bfc61498d 100644
--- a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
+++ b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
@@ -36,6 +36,15 @@ properties:
       compatible:
         const: samsung,s2mpg10-pmic
 
+  pmic2:
+    description: Child node describing the sub PMIC.
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: samsung,s2mpg11-pmic
+
   shmem:
     description:
       List of phandle pointing to the shared memory (SHM) area. The memory
@@ -52,7 +61,9 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/gpio/gpio.h>
     #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/regulator/samsung,s2mpg10-regulator.h>
 
     power-management {
         compatible = "google,gs101-acpm-ipc";
@@ -63,12 +74,20 @@ examples:
             compatible = "samsung,s2mpg10-pmic";
             interrupts-extended = <&gpa0 6 IRQ_TYPE_LEVEL_LOW>;
 
+            vinl3m-supply = <&buck8m>;
+
             regulators {
                 ldo1m {
                     regulator-name = "vdd_ldo1";
                     regulator-min-microvolt = <700000>;
                     regulator-max-microvolt = <1300000>;
-                    regulator-always-on;
+                };
+
+                ldo20m {
+                    regulator-name = "vdd_ldo1";
+                    regulator-min-microvolt = <700000>;
+                    regulator-max-microvolt = <1300000>;
+                    samsung,ext-control = <S2MPG10_PCTRLSEL_LDO20M_EN>;
                 };
 
                 // ...
@@ -77,8 +96,23 @@ examples:
                     regulator-name = "vdd_mif";
                     regulator-min-microvolt = <450000>;
                     regulator-max-microvolt = <1300000>;
-                    regulator-always-on;
-                    regulator-boot-on;
+                    regulator-ramp-delay = <6250>;
+                };
+            };
+        };
+
+        pmic2 {
+            compatible = "samsung,s2mpg11-pmic";
+            interrupts-extended = <&gpa0 7 IRQ_TYPE_LEVEL_LOW>;
+
+            vinl1s-supply = <&buck8m>;
+            vinl2s-supply = <&buck6s>;
+
+            regulators {
+                buckd {
+                    regulator-ramp-delay = <6250>;
+                    samsung,ext-control = <S2MPG11_PCTRLSEL_UFS_EN>;
+                    samsung,ext-control-gpios = <&gpp0 1 GPIO_ACTIVE_HIGH>;
                 };
             };
         };

-- 
2.49.0.1204.g71687c7c1d-goog

