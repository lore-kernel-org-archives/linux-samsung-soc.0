Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A315E32ABF3
	for <linux-samsung-soc@vger.kernel.org>; Mon,  5 Jan 2026 09:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767603709; cv=none; b=P5Sf6BUmfsFNSywd8z0RdQIPqy4ebZVdgqr701LpJXOb0YhDeYiEEC5llp3jlHmhCHtfRaVoID/RSj5cI3vDM6QbuojoZgNOZHk4aBbvf7x5Xoz97VFwPF1OPmZxMl9tNVJ2drAicL/oy33ODxrxbwaU83vcHlvFdY+rd2hcEgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767603709; c=relaxed/simple;
	bh=Q0CedTDoxzAYvTyoSGG2JCu7m4Qn+Y6GBjY/RZepsts=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BAzFZGwjQGDG4mpVpuPbclfJEqEqHKevU9VgUj/PwVGAb1ydQyDjPXE7Cr+e6XhhLLITrjE4pqRBfsxjUE9H7Ls/Ma8sJTepywvC/Pbm/+hWgGkM5BLH49uTabmBOuskTLbVzNsFPG77mdqZdvLodIgLKjBFIf2XJTy/CpOs1RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=opISU850; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="opISU850"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b713c7096f9so2188333766b.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 05 Jan 2026 01:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767603704; x=1768208504; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PoAySoFSuOUGBXwBkj/tqOj8zEikF0/rK/x+6MrVKns=;
        b=opISU850YUodLgeVDLcq+/W6D4Bass69j8cPRTVzdGfVYpr5UcloVNja5sB/IzZVC3
         UDkLntkbJlwxoiilyfXtJkAaDKC7+qFKRzd8wUqA5uDsC130ojI0AoPB/TV1d6fHBIkf
         xLoF013+ZJt1qRTgYOdq/tGrnBR+3eg+oED67uFsu566+HiUBaFUrI8mwU4/ynYXMzhu
         OK9MLvXZV2rJ15ara2e9Q4x8dYQXvzy6GBJTHQE2P6AxV+G2A6bf2fUUlsxbltm02/4c
         8Hbudx7L9MXa1XRKtkFXQZ8PwVchzhPsrLtdCrrlZVT4hInejSKp3WieI5NQH8Be2u+S
         ybHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767603704; x=1768208504;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PoAySoFSuOUGBXwBkj/tqOj8zEikF0/rK/x+6MrVKns=;
        b=Lc9gUKbcR4JfMWcmBC3lbNmz+W6+xmJeJpCJlDrmzjVuHY999G+gKwZ3QvM21ZyItb
         +mDpcIL5xVZLqda9dMfPlAp7mi1BiOEdrc4iw4Gxdl4E2rPTvNYgTmKYdxWxTAzfTuBY
         Wemob6agLeYVi7K4QnAYujW7BVGhdmpr050NhkpydKt6WnfOTuoRkd3ZvSvXJGWx82CC
         xj3k3VOt2OaIxfus2VY0LKFtA+pRhuCMp9VNq6KL6p4RzgCe97b6KSZz8j8In1ZQmW4M
         dMHqewrshLCzl4PUF3iQ6iBFcLxtRmOWOknlzu19t5mc5c+u2xdIZjeqF0hW+M9jrw/c
         nWqA==
X-Forwarded-Encrypted: i=1; AJvYcCVfSm1/IACUc3/2RBOnjIFTeBh9LATAoDq9bvNDXw5hKoJ5nUuWaYN3Xd58ULEKPud2KccjH9OO367X31MnkGIsCw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwdJBU/hcKg5xUaA9eoTvMfvZO9jFbHGayFw1B1H3nbPtrkX9RF
	bU5bERroJdoa26MAmjsHPPOKRfTf7sfncLJmz6CQNdos2Cu463f/zX3tuOJfEXZXzRk=
X-Gm-Gg: AY/fxX77zH1PrNftQ4Oi/VYQR+hjTz9n7I+0J+NCputzB+avXJwoxDvid6fjZ0sCbZH
	GoBbWcqQIM1d0tk3Z9NVeJUU1bVUqCGv0BfbizChZQSCi5U+k4KNtYq7pDP4OuY4yiczW9V5six
	yNsMT69QKeJdGpRUJXxEepG57WZDpk4gdoPYMuAg7UItQOC8xv1gT7tB5rRDXhtnwrWe1GwaMQ1
	BP+p0SqYYAkwatxQQQsxYeiS6astg1x5x3W8xGFrb3x/uJiTa2ZVkz1QX3J6opfNj0bcyTYRC5h
	6FDwiLkevw+eRfH2517ibxW5b6hho+7jhSbxIg81b6ZIgi3dow6E90TDwVBLRZviw2akfvBZFOi
	rOtNiaagacmMFMWIf234uz/TM593E5ZTHNWynHGfRHQnAu+uMXb01ndDZZgVz7lybDIavwCr+19
	9RrLaGcNIOG0Ur1/rXmmTVlrPbThE1krgxY5mESYixZl6QlHKboY2HvGER6UUnj2ZNtxSEyhXtx
	YsfJw==
X-Google-Smtp-Source: AGHT+IHLNZp+Jq1jsa53Bnqvt7GnC4A/Xve6KIieFsmmoiEgzeIhn3tFkD2eHD+IaKS3ZUoDDcDeqA==
X-Received: by 2002:a17:907:5c2:b0:b73:572d:3aff with SMTP id a640c23a62f3a-b80371533ecmr4767140866b.35.1767603702389;
        Mon, 05 Jan 2026 01:01:42 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f0ecb9sm5384010466b.56.2026.01.05.01.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 01:01:42 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 05 Jan 2026 09:01:40 +0000
Subject: [PATCH v6 04/20] dt-bindings: mfd: samsung,s2mps11: Split
 s2mpg10-pmic into separate file
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260105-s2mpg1x-regulators-v6-4-80f4b6d1bf9d@linaro.org>
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

The samsung,s2mpg10-pmic binding is going to acquire various additional
properties. To avoid making the common samsung,s2mps11 binding file too
complicated due to additional nesting, split s2mpg10 out into its own
file.

As a side-effect, the oneOf for the interrupts is not required anymore,
as the required: node is at the top-level now.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
Note: checkpatch suggests to update MAINTAINERS, but the new file is
covered already due to using a wildcard.

v5:
- collect tags
- fix a typo in commit message complicateddue -> complicated due

v4:
- make yaml file name match compatible
- add example (Krzysztof)

v3:
- new patch (Krzysztof)
---
 .../bindings/mfd/samsung,s2mpg10-pmic.yaml         | 69 ++++++++++++++++++++++
 .../devicetree/bindings/mfd/samsung,s2mps11.yaml   | 29 +--------
 2 files changed, 70 insertions(+), 28 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/samsung,s2mpg10-pmic.yaml b/Documentation/devicetree/bindings/mfd/samsung,s2mpg10-pmic.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..6475cd1d2d15e07d953c8b302c90c785835985e5
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/samsung,s2mpg10-pmic.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/samsung,s2mpg10-pmic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S2MPG10 Power Management IC
+
+maintainers:
+  - André Draszik <andre.draszik@linaro.org>
+
+description: |
+  This is part of the device tree bindings for the S2MPG family of Power
+  Management IC (PMIC).
+
+  The Samsung S2MPG10 is a Power Management IC for mobile applications with buck
+  converters, various LDOs, power meters, RTC, clock outputs, and additional
+  GPIO interfaces.
+
+properties:
+  compatible:
+    const: samsung,s2mpg10-pmic
+
+  clocks:
+    $ref: /schemas/clock/samsung,s2mps11.yaml
+    description:
+      Child node describing clock provider.
+
+  interrupts:
+    maxItems: 1
+
+  regulators:
+    type: object
+    description:
+      List of child nodes that specify the regulators.
+
+  system-power-controller: true
+
+  wakeup-source: true
+
+required:
+  - compatible
+  - interrupts
+  - regulators
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    pmic {
+        compatible = "samsung,s2mpg10-pmic";
+        interrupts-extended = <&gpa0 6 IRQ_TYPE_LEVEL_LOW>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&pmic_int>;
+        system-power-controller;
+        wakeup-source;
+
+        clocks {
+            compatible = "samsung,s2mpg10-clk";
+            #clock-cells = <1>;
+            clock-output-names = "rtc32k_ap", "peri32k1", "peri32k2";
+        };
+
+        regulators {
+        };
+    };
diff --git a/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml b/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
index 31d544a9c05cad878d10a0ae9b99631f08eb04a8..ac5d0c149796b6a4034b5d4245bfa8be0433cfab 100644
--- a/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
+++ b/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
@@ -20,7 +20,6 @@ description: |
 properties:
   compatible:
     enum:
-      - samsung,s2mpg10-pmic
       - samsung,s2mps11-pmic
       - samsung,s2mps13-pmic
       - samsung,s2mps14-pmic
@@ -59,42 +58,16 @@ properties:
       reset (setting buck voltages to default values).
     type: boolean
 
-  system-power-controller: true
-
   wakeup-source: true
 
 required:
   - compatible
+  - reg
   - regulators
 
 additionalProperties: false
 
 allOf:
-  - if:
-      properties:
-        compatible:
-          contains:
-            const: samsung,s2mpg10-pmic
-    then:
-      properties:
-        reg: false
-        samsung,s2mps11-acokb-ground: false
-        samsung,s2mps11-wrstbi-ground: false
-
-      # oneOf is required, because dtschema's fixups.py doesn't handle this
-      # nesting here. Its special treatment to allow either interrupt property
-      # when only one is specified in the binding works at the top level only.
-      oneOf:
-        - required: [interrupts]
-        - required: [interrupts-extended]
-
-    else:
-      properties:
-        system-power-controller: false
-
-      required:
-        - reg
-
   - if:
       properties:
         compatible:

-- 
2.52.0.351.gbe84eed79e-goog

