Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14954218BE
	for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Jan 2026 15:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769096633; cv=none; b=ATWLSar+x/bvkScd5hdZE74WKbZ2/Bf1b997Zc0pKTLVyTuHJHICUpKrZTus1S+pBA7JIGfulQuzSoTY4d/iYEmqJ0YofFHQskmruGbE06xiNhf2Q7EdWKCVNzuCn1p8Vc16CHRSsUWBDvmw4dco7WeMBM65976/k4FMJfb6Pto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769096633; c=relaxed/simple;
	bh=Bnqejdaa4hI/3mIGtB3IlQTGMv1yS7F4oLEOhXH3rRk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HBhLU8w6ezq6b0Jt3fFzGVqe9yVN6lPWLPXuPfm0KpGxuaJeBBg82n1lf+i3G0z8JvIDpiCMMQt80cvEbCrWX4CaGNCj+CaKiuY9IU2Lg/r52iVtt3j60ft+XkGEQsfsjQZCJy2tL98CqVm5tmK9g3CHEnOI3BTMPRsNXM+PBPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HdOd9E/p; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HdOd9E/p"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-65378ba2ff7so1749691a12.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Jan 2026 07:43:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769096620; x=1769701420; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qODehQYebDqLL7EwCAh2DU2WeYX+gdQf3MnpwlxtGlw=;
        b=HdOd9E/pCSyg0dubV/wmVSvRQtr2CwTMubYBhisE6Ok+jZ9Ftr/hMT1qc0Qei2vV2J
         kUMBuxbfbLJGXM9bcmcMr1PpUGUpixQs0dMUxXB8WeI62DF49BrMCZZyv8YmLF4SnCzM
         6bvhgQaM1ye1lM8vKXWee8FR162RYr+5xj1EG+7qTyL5juAhl1OeSrn9koG4PE2OJRTG
         Bb58U+Bg3gnFQdUmoQLb7IzRhr2MVBz6H2ze+ABT3gHLX2Cf0vZXBNYepCS8Ij55tCh/
         eKdRr0fj7Doa0TZxEhOlqY2lsO8Gqg90wuWqhFxOQORetYOYwNEdnLSFvwLCffGv4pRH
         zUpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769096620; x=1769701420;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qODehQYebDqLL7EwCAh2DU2WeYX+gdQf3MnpwlxtGlw=;
        b=RRuCYOq+FaiYutFKWyMniItFxQd9s4LDvMPvYlh6Q2tFjzjJdRgSY5GIWSZ5S7gQdB
         byFZFk3kIiKwQC5KvoVFJUuP3EurEy8R1Eg91V5Ek0EPwiwwAYQAil4SF1z+BZosXLhd
         9f+rZArJnsKzcxcIJYunPXepZRlWfJI4RwwYo8bp0d0/L7wOvKrbQv1O7Osd7voXVqLx
         hSqJmq0qHcDZAFXOTkKPd1sSPbYKrsVwFLww1mm59Cj6MD19tiwgJ9KhoCy8J9APZe5a
         GwvuUgD9ESKNQXqbDsxvlLvi1hV8NdzqNUxlvGvQQcVDAQiQw1LY0a9+8bOVVXc7JlQq
         a6yg==
X-Forwarded-Encrypted: i=1; AJvYcCWqGM3hvEreiSIB/XydyzbX2MO92ZhKyu1lhrLJIBcrMGLvyqXvegIrdUxFccCdM3r1eC8Aq1XvJtQe0YZmlguGSg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+KetdnXWPohT9lo2t6av2uAcWV2mj27RX00G7MftmuISxSnWc
	+ZJD/0e2lOuqTOOUkFjKXx318+oDB9YVFJtotUBT/FaCYKd4JhKf0x5L8ILRqT0Qkxs=
X-Gm-Gg: AZuq6aK7ajNydHwsbXW5TC015f9CEau3t3tzv2ypf+IkmFVwqC8dGyj7oB3HBZnSzIP
	esDwqs3LpgF3/QfuJANv0/rU6W5DeSKaMdedQ6uGV7mTJXxySUjMRfqRS2Hv7nxysxEcAA297Vg
	GmWdS0aDj6+xOKOw49h8D/x8N2lzem2cVaWJJgkl47rW3gcxDaeebni/5btJvLIR2jIvrKT2KSu
	25Cw/iG6TM52EoGykPiTtJToHV95o8IXRMWgQy27QmozqBEFvssfYsVIzBjXlgb+NCk7d900L3j
	53N6bgjWvINITv/ixnVM9dA+LDQLS0UnLCI3x2t+1Q/qWP8TKCqhmN1qVDMd/NmojODN99mv8gW
	mZh+gFo4dYd+ZPuk5qZRFS65423ihOLGdIrr2wpdahagpNhzuuulLlPvMyqHpsz3rwDmH5V6rk/
	n1YEGR/b0xJwIRy7N7biBA1r9PdaFrKlQzTn+vx8HRgYWdJmBu+zs1OS9fj3/WF7x8fIE9rIZC2
	lXs1A==
X-Received: by 2002:a05:6402:268f:b0:658:1274:382c with SMTP id 4fb4d7f45d1cf-65848770a7cmr40127a12.15.1769096620351;
        Thu, 22 Jan 2026 07:43:40 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-654535c49f4sm16334363a12.31.2026.01.22.07.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 07:43:40 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 22 Jan 2026 15:43:34 +0000
Subject: [PATCH v7 07/20] dt-bindings: firmware: google,gs101-acpm-ipc: add
 S2MPG11 secondary PMIC
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260122-s2mpg1x-regulators-v7-7-3b1f9831fffd@linaro.org>
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
2.52.0.457.g6b5491de43-goog

