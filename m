Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AFCD28980A
	for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Jun 2025 15:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749222199; cv=none; b=aNBa05QgmgZsxiVzF45FnKKCb3hbNeyeQW2GEE8XcQBxLtwciOS59PJd7CeEAOxcVE0aqxA5xCkAmg3A8C3zFeBA1McMxRDRjzLmOQAvYt4mDdB5Py0vTUsSAsFWICwJpdLwr61gpcji/od11PS/shSTskYLJQU3yFXBZkGsRwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749222199; c=relaxed/simple;
	bh=m6C+4e8MF9g9uyaiWWf0DHMTRnXGKt+eaez/jyh0Jb8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T3mNRr4IKjSneFtpczc4lw2be4bt3ZrEWNiGlt7RrWksZ+nGSfaJvco6P73vDmeIl5/nQkzIuQogtCwR9bqQ0a1938WvNUQyE/SzGFGKtbj9mJm4yYfW/7aLyVWwMo8NZS1Z1ucSmNJild8UX0DT5oVBW/jIQlUcY+Gzt//2iK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ec1L5vsC; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ec1L5vsC"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-60727e46168so3758733a12.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Jun 2025 08:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749222195; x=1749826995; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KcdkpDlPLd/iSFNV2Kj6M/PjoKJqD05ckr9tkCHHeGY=;
        b=ec1L5vsC4FwYLCU6CodPUPMVj9fbeo7x+WlOFJiS9TpWpW8isRG/iNqRobRNxLaWHu
         BcjW2WEAWxhzlKTLOjrx2BgsO2c2zXf4hW+iIt/es7ijylZSFKEzJlnuSPFVqYYt0EFX
         XP1JEPaRxp/J0Vx4BPyRl2JEbb+Ml5dr2aH1RclyW3/Zt6wRQcAfIgpsM0lABvyjHEps
         /RxDZeLhnJMCKbg38CSAfSEiMQRGqBSZK9elGB2Osd+VItvqLi8/SwK2CvwuePm7W5Ni
         K2BLMOXgtJgQHGd+nvkSlyEvsYcJ6HAN+N/rw6u5GktiWud69jKAgZpkhTf6e+jQQ7O4
         qiwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749222195; x=1749826995;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KcdkpDlPLd/iSFNV2Kj6M/PjoKJqD05ckr9tkCHHeGY=;
        b=S8rM0N92pOzwHeLybd8+VTY81SutQ19CmXOJo1oe46x2Z+BUoiK6CYj/1aYPMfK8d9
         kywW1GbuJ+KZCsATxz0cIMG1f8PQpE3gUNNCP+HJ7n/EUldTKxF3WJxoA20+eZWTTVvH
         373wPDChEfA9AY7oFzxIeGdxgwnmPc6FA2QDbIaeSZYdlA5zAEZCbtaDngs9gXWiSvTH
         eGsZaUog+Zsy1mSgeRklNM1MuV/pTVV8+a6ERqsZeyGm2HKLJndz/KrBKXxgXwEhvyQz
         fb4uC5fpDTMtkj+AKuHQFcW9pDhMDWgUzPl78lgdlcBNPRrCV7GafTgSlmZ5ETXvqk0Z
         HQUQ==
X-Forwarded-Encrypted: i=1; AJvYcCX28cRqBv/P49LWFTo2gSL0bMaNiLgaefpVdtHxJWyhWe1Svx9tf05+LrbozykZzDiByh84Y3AcPG3wM33lLj38XQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyuA1uYVIS2U2sgE76llzLggUfZ9EiyJJhnWAL/07IPizMdObOf
	ZF+LPyMzVRRzA81bH+G8w4m/YPSkoTVV+nr9XsdEpOkZkEa9Z1D26z+aRpyWoiokJ/M=
X-Gm-Gg: ASbGncsxBVhEWATn3S40g9BoBWr6m9KIyFJoce1Ijbe9//hEmqw/NM6lP3Q9u6QPP1b
	hqY1GSY3ZmmWsx5o0i/NvksUgatvNRvDtwYnj5SFpomj3pIT0Ec1Ci/n/IpOibPuHjzjlU6t5Bn
	LO5SwPp3bAJIZjFw/OPRZPzQGBCh2F3EkTsvKzRkfUVm58cp89DoQlf6hJo8ifquMaASXkX0Ads
	iaITZP2HmtOS30TcdZQ63A6iM+5Ku1vmioRRc/IcEhUNVM8tqA3ih/ueLc6rEmHpcwSumctVngS
	2Xglz97Qts+STxZZLhGWc8H78x6zT/5UaweZYJWCcfKdy8wazhtesLMmnPoO1llnKPYuoR+8VDs
	AXXec+z1Q6tNzNQCYBmQVkUlj6snkDnE5sfs=
X-Google-Smtp-Source: AGHT+IGi995dmBrb/2Bf+v4TOAYVLEzAcRx6/H11eC1SAEVv/9wy2tgK9WC20nkFydysTHvJuQz9Ug==
X-Received: by 2002:a17:907:7295:b0:ad2:2dc9:e3d3 with SMTP id a640c23a62f3a-ade1ab32464mr349066166b.57.1749222194843;
        Fri, 06 Jun 2025 08:03:14 -0700 (PDT)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc38cf2sm127735066b.121.2025.06.06.08.03.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 08:03:14 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 06 Jun 2025 16:03:02 +0100
Subject: [PATCH v2 06/17] dt-bindings: firmware: google,gs101-acpm-ipc:
 update PMIC examples
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250606-s2mpg1x-regulators-v2-6-b03feffd2621@linaro.org>
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
2.50.0.rc0.604.gd4ff7b7c86-goog

