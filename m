Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0AD423178
	for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Jan 2026 15:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769096625; cv=none; b=ERWPc+DaqVXwJiuM9M9N+I4R/z+JTtQUVOyf537xnJPDlmytn9DvZPVFX44ZBAvf8396mfyEfufID7RoHpUXi4MFQItJUu+FPJ7TTYXrGPgekub6WUZxRd4aljruCKfcENraCTSECyzqIFwHWF8XYiiECGWTynk07TjejRRLi8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769096625; c=relaxed/simple;
	bh=Hu7CasII6Pg9XG8xVk/B520NQa20lPkG0k7c7sUpoQ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C5lsXWeov/ns75euCjEMfVugH8+JeWZDIFZCBgBqHq6796Wrh1YWbNfUf/t2oifPCC8IqBqPfbyyL+LE6iQo8nf4N0Zff0p81cw1KJkboGQ4i9gP1TFF44ujUETlJ29bBn//L0GPTy+F3EkHfjj5nEdMoh0jPfWaNejK54U182Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LZZjqpGU; arc=none smtp.client-ip=209.85.208.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LZZjqpGU"
Received: by mail-ed1-f67.google.com with SMTP id 4fb4d7f45d1cf-64b791b5584so1742123a12.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Jan 2026 07:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769096618; x=1769701418; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nH1u7Jw3yCrczk48x55vKelT7EzPUYE5MjIgvNuKolM=;
        b=LZZjqpGUvxLr1a5tYCTwQ2xbMSozF+fXkDsXcNzTXk4DxSOCfkFPc4WI4r1WfXYklS
         wrgkifBF1Ozokv1ap4DE3EkI/e4erJn4HNWmXi2P8+Z7Lrxs09trHBdJQPvV3ZE6Q7Uo
         aDyJVNJ21qAUFFEGocX+lAMZRmPSEuoTI2qXJ+zFtDW+62tRseBmqqK6+PN5kMkrq8KQ
         b3SHHkM5RpflYHmnSWLJo371CndudnQiCbfF7C28HCXtTBqyzTbKW/Qu+F/Jd0cxkqbi
         dNpvw32W828HcdoXgWUlHgsjzC96ERccMtCvQKbyqbpk4giGWTViv8qjbgPKlN0Ki0T/
         aY7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769096618; x=1769701418;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nH1u7Jw3yCrczk48x55vKelT7EzPUYE5MjIgvNuKolM=;
        b=FfnJUB27wuWn/xr+xorxxk+Jlc8lfruzXU/trsrNIFMs7l2q8N4H7VfMywED7XqFv7
         NWuApJEx4e6wsHB4OVJmc/nb339WP1Yd0xTQNfVxtvednYbtVlsgCYkta9442o8ofJ26
         esdOCA7S3gukP6w/ZoW186HemTUy5ujuwPfuxvJ/RvPWqZiHK/VOAE2svLvS0CpF1f5T
         mfTzxA1F4HvLoiIKlwzV0kAsupuM0HfgkWXGDe7FWmbnh9UsjLhjBWilYIxDowe1/iR8
         GNZKzEIEsF/J89X3xz58AE0wEOTAT0hU5FpwkYv74wJozRxBCG8y8/5RQBz/gqWM5La5
         c7gg==
X-Forwarded-Encrypted: i=1; AJvYcCWZeeusFVEHGc7/bSbuYUTuRNbDv/km5KS6Wgm7ZaX63k2HpFM7KfBZ8pxZhtRtYZdf7GYzosOf1bucDLfYZSRaQA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwttMWEjJzw6EKbd6q/x6/4LZkpPPwBNTHHHRYQu123sM/f/z3h
	WZO9bDjlZSRtWcaX2e+5niuCHMS8XVqUK0nkeHUKRbbV6WdMgpC40GE8Hyis4MoDFtY=
X-Gm-Gg: AZuq6aKibYp+zbafRgcWivB/CsCvJU40ReqGnVQHiu3DLpxJDU+0oGsVosdc1G7r1fW
	sJ4Lc91mY/9BZP6wjuE+WFTH+EDUAwnPo41IIdmt4thznXctBwusKYkZPTxMQEZQbVTx1cqga+C
	vakFuvEeumChiGmq0kOI668jsvq/x7GZSXhdARB+ledx499kqCEqmfGXQD35CoJvCuyzTqX7XUz
	KI+DBA9Pe1a5D9Leedsb4AE8XHEv+DbI7XNdj7FP9ISJuaY3Eu4HpCEbstmiVdk67q0JfNt58bC
	KogPIglhxxixBDxcu2lwpIZkGjEiX+foqgXgkE0P+z/CHPir7WqxTquveTjMuryJUfQWgelkz2o
	Q/saQ7NchLDyVLOcSpl+zyVj9XTjCCvf3FsfEgr79a69j5MJr8FcXDK2WyQLy+dDaiyKGF+a1Tm
	ESVPUcOKhehjExu4KqxG060c2jsxEfIYqeq8WQYlk5lLxLv5FPfz/jZDnh44W4RjJpWFBSnU4oe
	NNSUQ==
X-Received: by 2002:a05:6402:51cb:b0:658:1224:3d51 with SMTP id 4fb4d7f45d1cf-658487c99edmr20114a12.32.1769096618033;
        Thu, 22 Jan 2026 07:43:38 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-654535c49f4sm16334363a12.31.2026.01.22.07.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 07:43:36 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 22 Jan 2026 15:43:31 +0000
Subject: [PATCH v7 04/20] dt-bindings: mfd: samsung,s2mps11: Split
 s2mpg10-pmic into separate file
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260122-s2mpg1x-regulators-v7-4-3b1f9831fffd@linaro.org>
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
2.52.0.457.g6b5491de43-goog

