Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E9231DDB9
	for <linux-samsung-soc@vger.kernel.org>; Mon,  3 Nov 2025 19:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762197291; cv=none; b=HigjyeKzdGiXzuvkr9kLzrVoAFSYoDw5JYHg7AJ+iY0GH1f0+i1oaCZ1PyH679V6vz6OSv9CUZXyzP+Lvv0ELGG8FgslDb+MGmfDNmqy4PGJhBN6EDZ9M9GNOjnLFaDCQPB4pzaJ0FosdYda7H/KPPf9v2kOCWa7fNthTJdzKuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762197291; c=relaxed/simple;
	bh=c/xrRD600w1Dsyuw4U+hAJBnYZyF9dXpxSSF3rQ6G0s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ry+NaPE85j36AOnuYGPk5kR+DBup6ZOpfGZq5vO3cpHcIPJpse/m7nuOrPtB9hcqaMWCNotqC1wSATwnHQW0FWsBvlkpdWNGdrdsfKQCpudR5Qsz4bJJM41Ltv3pwU3TJj4CC5nhHP0NPJnCCwamm1mGJZjwGtWIp7QSPzboTDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iMq5PpOZ; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iMq5PpOZ"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-63c0c9a408aso6959980a12.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 03 Nov 2025 11:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762197287; x=1762802087; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hpU3+dPMBGal6bIAhOfb10JFhOSohjDVXIH9FUT9R/s=;
        b=iMq5PpOZ5+33YJBuGg/lCjGFjd2KBqHC8X8O30/DXTnVzOQAH8gMpqY3Y+/1SKqZ1c
         lgKvQlb1/vG8k0CCTEYe4yKpIqqi5AFcbJJJE+NT3qKzThrL13/AEbRo0lsn68FfAviI
         JqrIbfe7ui8P0DJskMBnz5BSgpQKq2SihqDx35Gn0g3FDFPTgVEwOm1ud8N4Csl7WSG/
         5ILFp+wiZab9JaR0Q3hS9j62em3eAzXELHHkdS9HLWeRSfRHb1yt8mh9tI4Rb3Y7Dxv6
         KPsxFvLe6TOiVwfNh576nr4+8T+1REQqETVNLiRxiIdkKoUFJ2D7vdwRN5jPxUnCAFU+
         vDlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762197287; x=1762802087;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hpU3+dPMBGal6bIAhOfb10JFhOSohjDVXIH9FUT9R/s=;
        b=ROxVTPFOKG5Nf79uN+azPMmiLmr4TqzISAS+77WjnPadkox9wvzLikprNBuX4XLvHQ
         y5K7M+RXe7JfhIb4PjXUbxCXOseF5yTiyfm9vgktYZ+1Kl4FyRqmUUGgaYXv1jxjSBtX
         qOa411QbKu6Sub9FtrQ2LcGRPRnTL21Ompugc7F5UuIEdWxyqYN1xVvlcS9oBgvjTj2T
         +XKRjl7UnDmbHGTwTa3yK4I3Pf4ZUZq1SM6l5dJ6MFPNlpPYUP2mq9sSTHvY/X0aFR9T
         NfyHPYScmUrmsd+j3uoqiMbDW+AWc16HMCCEGE0e1VBp7vd4NQyQxE8sRN0sUDSWdyOe
         dapQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuccTqSuNRWoqjBztmtrLXLZaFXz65DhnuJRV+KlV3SVwAOgZ72y9Wwb+XKruEWKrYoZtZtLa7iyjYJTX6hSUiJw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDy02BARYyE6oy5s2Rye35WpPD4U+5NLSP1C+qBz/nD8aw1x9s
	QJgccrPSVc3Yb2mY7czaV+tkpQDeVjOxQtRLwzDySqQAhuzU9U/Wr4Y5l2Rta6z4X2Q=
X-Gm-Gg: ASbGncuRRYWbzpB8maSVR9pSnaDLV4I6bvl1T+sLgpNJfRW9Y7WO0yYZNfjylvcEyJN
	xFRdMM3N8jxLD1XuR7JcJehaRS4HXYsw7yF5tNtqC70sGIg6Q2/9Cz79WXD16E5A0DC0KtxdvIY
	9/aLP4eKqCkJENsr64fJ7s2KXsL+6uDjX6LacPmlIGUjWGn4nM4LpU9Unn/BiSgk7sD5/nuU51P
	qryhQeAzvy1JjuiP4vNOSGBrqESTD6MLQg3pKOF6BNE4NofQBYTw/H+bErGQT0LEsGYXsoxqFFj
	wBKCFNb/ZCk5tFt8JiQhAF0Qxjrk7NaIEGMU+mLCaJ07L/wxqCFwG6BKGmbYrMVF0aqDhs6Gp7U
	qP/5vg7oz1HfhEWZ+pWppAS1YH3Pkkfk9p7rVEcSoAl1Gol+HcT6kNYyrkmaxcmU6kKcnmkP2LV
	4sRMA3jAR6fqzMwQzWeCshEb1rtnpDJo/XWc1eup7M6fnWMteY7P2Kph8g6gSRIXjO9kbKt8x0y
	HElMA6iTg==
X-Google-Smtp-Source: AGHT+IGKx04tsYPLBvcqXY7Ecx3PC4XIi2xWV2nuoXlJTghX703VWRsq3RlhzHc4VON/CJmYFIqs2A==
X-Received: by 2002:a17:906:c10b:b0:b6d:8e29:8f67 with SMTP id a640c23a62f3a-b70701ae016mr1456556066b.26.1762197286776;
        Mon, 03 Nov 2025 11:14:46 -0800 (PST)
Received: from puffmais2.c.googlers.com (254.48.34.34.bc.googleusercontent.com. [34.34.48.254])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b70b9f29c8asm466765066b.8.2025.11.03.11.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 11:14:46 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 03 Nov 2025 19:14:46 +0000
Subject: [PATCH v3 07/20] dt-bindings: firmware: google,gs101-acpm-ipc:
 update PMIC examples
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251103-s2mpg1x-regulators-v3-7-b8b96b79e058@linaro.org>
References: <20251103-s2mpg1x-regulators-v3-0-b8b96b79e058@linaro.org>
In-Reply-To: <20251103-s2mpg1x-regulators-v3-0-b8b96b79e058@linaro.org>
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

In a typical system using the Samsung S2MPG10 PMIC, an S2MPG11 is used
as a sub-PMIC.

The interface for both is the ACPM firmware protocol, so update the
example here to describe the connection for both.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 .../bindings/firmware/google,gs101-acpm-ipc.yaml   | 40 ++++++++++++++++++++--
 1 file changed, 37 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
index 4a1e3e3c0505aad6669cadf9b7b58aa4c7f284cb..c25e155926e5f44bd74f195cdbff3672c7499f8e 100644
--- a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
+++ b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
@@ -45,6 +45,15 @@ properties:
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
@@ -62,7 +71,9 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/gpio/gpio.h>
     #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/regulator/samsung,s2mpg10-regulator.h>
 
     power-management {
         compatible = "google,gs101-acpm-ipc";
@@ -74,12 +85,20 @@ examples:
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
+                    regulator-name = "vdd_dmic";
+                    regulator-min-microvolt = <700000>;
+                    regulator-max-microvolt = <1300000>;
+                    samsung,ext-control = <S2MPG10_EXTCTRL_LDO20M_EN>;
                 };
 
                 // ...
@@ -88,8 +107,23 @@ examples:
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
+                    enable-gpios = <&gpp0 1 GPIO_ACTIVE_HIGH>;
+                    samsung,ext-control = <S2MPG11_EXTCTRL_UFS_EN>;
                 };
             };
         };

-- 
2.51.2.997.g839fc31de9-goog

