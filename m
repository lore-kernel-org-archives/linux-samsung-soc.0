Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D15335060
	for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Nov 2025 19:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762802948; cv=none; b=CAqrEcJylFKYOdVPT4I5rO5F58fxtcRDV4hVw43pseaFQV4mP9HApypR3uqa2xDerLGuoMNG0L04ruO0cMCxPzpp9o2N4ajbjSNLRrgLyXw1MnAzotCS0qrldK+n8BFuKhVfaXcYM8aHRJopoCk+z2AmmiDAoiITQtEZDwZ+CfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762802948; c=relaxed/simple;
	bh=5LoeQ3netC7v69zsj8B7NfdcCxJO3H35xRsDG/Gv7pI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iuW2ud/ExqtXlm6twnSZpQnR4lpooEt02Pk5GuFJGGhA1TEco2Z3HTAHKuCcWuuml3pRlJvQclsFxl2nmreO7LFyn/utjIhB2BfUjf9ltCWmoGYTSy0hAGQfPFTdPKZ7XlUw6EXvZ6SWFmfXKkhi5gRX+fxzdMBwhg1gbCt1ZBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s841MCKI; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s841MCKI"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-64198771a9bso2360859a12.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Nov 2025 11:29:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762802942; x=1763407742; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IRWk1kscfN6FJwekg6ouD0GTonEVhSc1K4PKrC1kP/k=;
        b=s841MCKIG9codaPFM+Un7VR6TrvUiaIAtWPOymQ3MdmJuaXLFIZLW3HGYJetIDG+eO
         b1R3XtHop/ySXejIn6768DHELmso5mw1q3tqyJhFF6y4cbJYVdwt/9uMkF3lu6sZDPws
         2SJsIn4cFCsWPO2VkUn8dHj7odtamvkH1mMY6Aw0IwzHTUxC8MOfcQlc+wchzwc2Ogpn
         9uRcgM0rAsbe3hzkKgQG48KedcvB8DXppK8eB3kTiXbbD8QiCI8SBT3w1c8E0XHRbiui
         gzD6YdmHZijDL6midV7M7ZpwNNppW+AeuP2EHLOP4IfeTOCZcoIFZWzqff3o6ScpbwOR
         SCEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762802942; x=1763407742;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IRWk1kscfN6FJwekg6ouD0GTonEVhSc1K4PKrC1kP/k=;
        b=YjyrH1UwLL/po1bxsqfNUgH3CpRHc5ws1XZUgRUAoar8MktZnAsIAdUWScmCJELNdF
         f9zO4v22gHRi3fdVb8OZ0FNsMq5+T3L5t72Bl8t/kZXE9uw7kmJVcbuXC2To47YL6kI9
         VCmP6eHjqHiZFPpiN0qXRjMJpvvZ45hcO1QjhMaCv9ef8IbDGf+3lvFe0oI9Ts6Wgqc6
         88szxFuhUxPVDoTwYCZSucYcSHmrOGgtwzLTrKC22eKit/p5wNRquC8/cGrwz1yP1gHs
         +LxZNfrGBwTLXCRZYvib+Hrep+TGAWEqySNGiuMAqtgHo7yuZYDpfIIhefeXDq1vqG2z
         yFmw==
X-Forwarded-Encrypted: i=1; AJvYcCVfuZtdEjFDc382gmpr6uMLeNqkzktBm7D3DkhtqllYQhPHXyQPb6hGxGk/BSSXKFrn/DblpXU6DCsHvuTVOnLz/A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3WNR7y5jsN1DzEsS0Q2J16jYejgeeZcM1kQ56fkWXSP5/XnUo
	PolnFP7CAEhxYkKynus1pZUNbaudUgys0tvWiLAlS0nKJbD4yEgz2hefAACVBJevXKA=
X-Gm-Gg: ASbGncsa+QV+oOkSZrJNG47svdZDpoRZdeMxCqLvUsiECZZcNUte3toTV6AWJDcOmCu
	b8zzCEY/Z1KYOBkals07PahhbB5SgCA0zba6W/GJkQ9vpY6Vmffr900M+W/vw7qrBbb85SiSB1Y
	q7HDgf7+zS54Exlu58BBTZ+D5MWF8vloqMlI4h1EA/V2Vxdvnb52A21MssvEnXjs0MP9WcZK8k2
	0RCPsiPgBmHTgcAbLT3xhs8XQ/UXl0f28AlBk/R6iniPxoraC/2DTDOV9NbVJhB0nCwcvGEB5ob
	6j8WNjnaSrwSrDyjuKuku7itC77oSb/rlCIWG00Rll/pgxCNTbdLtdThjIYCddlQqSDjiwnhuvG
	gy4JiE/AEOokYpV7hi03CY2fSkKa0UbifWXW78lSR9ASVk6QwCbjZWPx9PfVsnUkEw0vco+VDmT
	ZY8N9bRMb2+wc4RidahZaxLjW+kM3v27yhxz+Tt8daqoi1B4OOP7W8LY2i0AMMpQ18SZWiTdQ=
X-Google-Smtp-Source: AGHT+IFMyrQxnmGV9RRdZq2J7DvBjCJJHTfrK8wDJvifJiEy4dLU58hNJxSP3QiQOzPK8F57Z0KQdg==
X-Received: by 2002:a17:906:6a19:b0:b72:9d56:ab52 with SMTP id a640c23a62f3a-b72e02d20c7mr927791866b.8.1762802941539;
        Mon, 10 Nov 2025 11:29:01 -0800 (PST)
Received: from puffmais2.c.googlers.com (254.48.34.34.bc.googleusercontent.com. [34.34.48.254])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf97d16esm1168178166b.35.2025.11.10.11.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 11:29:01 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 10 Nov 2025 19:28:47 +0000
Subject: [PATCH v4 04/20] dt-bindings: mfd: samsung,s2mps11: Split
 s2mpg10-pmic into separate file
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251110-s2mpg1x-regulators-v4-4-94c9e726d4ba@linaro.org>
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

The samsung,s2mpg10-pmic binding is going to acquire various additional
properties. To avoid making the common samsung,s2mps11 binding file too
complicateddue to additional nesting, split s2mpg10 out into its own
file.

As a side-effect, the oneOf for the interrupts is not required anymore,
as the required: node is at the top-level now.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
Note: checkpatch suggests to update MAINTAINERS, but the new file is
covered already due to using a wildcard.

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
2.51.2.1041.gc1ab5b90ca-goog

