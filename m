Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4E232B98D
	for <linux-samsung-soc@vger.kernel.org>; Mon,  5 Jan 2026 09:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767603710; cv=none; b=XAxlr+OOeNnjpK0ShVpmUVW+R2DuCdZrzIe93cf4HF5BV2RCi86tVQz/gn65D/CdAiJsrNUt1BOTYVPeAQViS5OQJIafzUvU9JRv+DcbwUMWnIoGuqYuIvk4j9RrCDABVlgsmDcuJOujfetu5R+QJTlwiaJ69abZLdJJ8Vv1hxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767603710; c=relaxed/simple;
	bh=hNm58sAFzxOO0mLfaUIDAAaiwFh3P1PTvPP9/eE7na0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JhsqYkaMKjyGVrHQiJuaM/rfHGJjKGRKyl/Mrv9x0UDd2OjpluHWioUQnw09uKBBLgz+QmeQ9l1ogPRW1q6zcrb0AI69tEzg+lalJUumL9pYpCcDUtJOGtZZqYJBRMf7reDdYElgiiZ+d7F0e3XAtoNUT9KIypoQ9cQn8So+pKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CU6sNGfP; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CU6sNGfP"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-64b9dfc146fso3121513a12.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 05 Jan 2026 01:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767603704; x=1768208504; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ijeoVSxEaKK4ZCy9A7Kh1hnl7BcwzYQpACu/LfWJKFI=;
        b=CU6sNGfPjRjGtCFF9PNwXdGiJjWjT0BEeTGyJQx3i8W+4tOFoBf5xmvKu7Hfhj+Yj7
         DA3KNvyL48ydRIKq4+PoHY6pTcj1Iv6JB6+672Dq/QQqHcT2thCWTBuGx26FPtlRA1md
         1cMBRbIEiICPI0zZrZh9Q+9vyxwp+sdXXlZdhxKlGCJ7wzSkjv01waaqRrTYHhW3sTSC
         Vb1JGdGPyc+PVanfFdYGoWXPoOVIoUUmH3KDabfonKLI2NNqHDd4P4pclu3JWCl1MRNI
         HimNfQVdsy1totQqOH59EMNQwpBv36Ar70exFlWiYs/KclBmBs3FqLLAEeUT92b9E7pM
         6A0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767603704; x=1768208504;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ijeoVSxEaKK4ZCy9A7Kh1hnl7BcwzYQpACu/LfWJKFI=;
        b=Tys6m9j1AFbZwMJJUVBh3mfeebSR2sfxcJJT/AJqK5+shRPRrgAsP0pzLIdy1JPX+d
         1Ryh2X2zkooBJZ1bicdPbHG9+cKyvlP9FeqMxhDpa2HesbYnxnJTyh5Y+SweMxQC2gem
         nDGM0oorgZLGuTVUQ1UHag0/E7s71ifFqaF2QDYxtJ7T84Sc1+bmOUCAffuBrqSolG9k
         ElZ2IajXY2rKXrnOBHJqOBODLAlZZ67qJoLUIESEcb1tl4EQKLmGVbEW+8sKLOmaEYL0
         iZHi3IldkHloSLPFY6iiavFnyTIwjHZ446wmjLPjAHvGDIW9oUYZGZzlNTlaOUWT9OF4
         OwFA==
X-Forwarded-Encrypted: i=1; AJvYcCVxt3rhQM4XFwYufR/SQ+hsPd/HmDEnWQYxQqy/Q6KWX/ZNCayBxYEijBj6gQSII52RmS4JgbIsA4MpLKIaQp2dFg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzeUHLBfxBrlbyV9j4t0I5qTxp1HrETvh4g8FBAnRx9zEDKEsj6
	l12k8JlnkmPQayIrCZez127lmB1kMFx+9ClYyAsMsxPWiv8qoqdLbFwluo//5FuW0mo=
X-Gm-Gg: AY/fxX5j9Gz9zSVyuD3OQiW3N9KqPFH5FSJrnaOJ4XO6vBeFaEJ9JULsnj+LskFMr71
	ESGhPsrq3P3ZwqouM3p4/kyPEp9k2+q84F6cXDqVIxsyd5xB92oE8wjgtbh8rs6y4MBks+GoOXx
	fVdNpWxU3+WkSVKOlm2gpjj4oMSPto8+8/vAno2MRmE4DhbKcfG/staOrL1rLejlQdGFj/y9A76
	Az2QaUqQ+FT5OT9XJKFWMU5xJDYAc/bKl3oijKMLVWPdVx9yNzh562W3tFDoO1z7VRka9xv5yRt
	mzLN4RBBliywTyvc2aiA5rD2nJjH1DHXs+ROmUSNU1Hf3lIGqrebdS7a/HgSR7lYC9MSvwfV+KC
	E9MadENnlq23x5JV6cAX9AVIBQvFQtUuK9T71Tq0QLf404OrGsgv1esvMSib4mwvVBMCoY5cP1C
	WChUmQm/yI+tiB0ravIWgAV1ZTMABgoaXYXCSHsxDEloDelF17hHkMC4t9bVnzgXpxljStFtm9C
	fZURZLCnq3nPR3K
X-Google-Smtp-Source: AGHT+IE8n/Fu/jQSAKbIUh2ys1Az7EC4ri6lI+KFhpXoGcrZlyKkPWAmWirhfo8QdIeblvQe0+kGzQ==
X-Received: by 2002:a17:907:3d09:b0:b83:1341:b656 with SMTP id a640c23a62f3a-b83e275e093mr711608466b.22.1767603704037;
        Mon, 05 Jan 2026 01:01:44 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f0ecb9sm5384010466b.56.2026.01.05.01.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 01:01:43 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 05 Jan 2026 09:01:43 +0000
Subject: [PATCH v6 07/20] dt-bindings: firmware: google,gs101-acpm-ipc: add
 S2MPG11 secondary PMIC
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260105-s2mpg1x-regulators-v6-7-80f4b6d1bf9d@linaro.org>
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

In a typical system using the Samsung S2MPG10 PMIC, an S2MPG11 is used
as a sub-PMIC.

The interface for both is the ACPM firmware protocol, so update the
binding to allow the relevant node and update the example here to
describe the connection for both PMICs.

Since we have two PMICs here, but can not use the 'reg' property (as
the addressing is based on software, i.e. the ACPM firmware), the node
names reflect that with their respective suffix. The existing 'pmic'
therefore becomes deprecated in favour of 'pmic-1'.

While at it, update the example.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
v4:
- Krzysztof:
  - update commit message / subject
  - pmic -> pmic-1, pmic2 -> pmic-2
---
 .../bindings/firmware/google,gs101-acpm-ipc.yaml   | 50 +++++++++++++++++++++-
 1 file changed, 48 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
index 4a1e3e3c0505aad6669cadf9b7b58aa4c7f284cb..e68f9c3ca5e2619bacc0c8d843ec4984c0947fd8 100644
--- a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
+++ b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
@@ -37,6 +37,7 @@ properties:
     maxItems: 1
 
   pmic:
+    deprecated: true
     description: Child node describing the main PMIC.
     type: object
     additionalProperties: true
@@ -45,6 +46,24 @@ properties:
       compatible:
         const: samsung,s2mpg10-pmic
 
+  pmic-1:
+    description: Child node describing the main PMIC.
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: samsung,s2mpg10-pmic
+
+  pmic-2:
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
@@ -62,7 +81,9 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/gpio/gpio.h>
     #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/regulator/samsung,s2mpg10-regulator.h>
 
     power-management {
         compatible = "google,gs101-acpm-ipc";
@@ -70,10 +91,12 @@ examples:
         mboxes = <&ap2apm_mailbox>;
         shmem = <&apm_sram>;
 
-        pmic {
+        pmic-1 {
             compatible = "samsung,s2mpg10-pmic";
             interrupts-extended = <&gpa0 6 IRQ_TYPE_LEVEL_LOW>;
 
+            vinl3m-supply = <&buck8m>;
+
             regulators {
                 ldo1m {
                     regulator-name = "vdd_ldo1";
@@ -82,7 +105,13 @@ examples:
                     regulator-always-on;
                 };
 
-                // ...
+                ldo20m {
+                    regulator-name = "vdd_dmics";
+                    regulator-min-microvolt = <700000>;
+                    regulator-max-microvolt = <1300000>;
+                    regulator-always-on;
+                    samsung,ext-control = <S2MPG10_EXTCTRL_LDO20M_EN2>;
+                };
 
                 buck8m {
                     regulator-name = "vdd_mif";
@@ -93,4 +122,21 @@ examples:
                 };
             };
         };
+
+        pmic-2 {
+            compatible = "samsung,s2mpg11-pmic";
+            interrupts-extended = <&gpa0 7 IRQ_TYPE_LEVEL_LOW>;
+
+            vinl1s-supply = <&buck8m>;
+            vinl2s-supply = <&buck6s>;
+
+            regulators {
+                buckd {
+                    regulator-name = "vcc_ufs";
+                    regulator-ramp-delay = <6250>;
+                    enable-gpios = <&gpp0 1 GPIO_ACTIVE_HIGH>;
+                    samsung,ext-control = <S2MPG11_EXTCTRL_UFS_EN>;
+                };
+            };
+        };
     };

-- 
2.52.0.351.gbe84eed79e-goog

