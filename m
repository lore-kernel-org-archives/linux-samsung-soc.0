Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86DC30E0D3
	for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Jan 2026 16:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769616659; cv=none; b=JFFsOlShpQP83AhsJhAJstXt5TTOfEi/Tz2VRQaU+APrYuRyvB12S6e+C6bLMRRhsX0rT2Bd+1rp+07iUJCsbPRM4aLLZ2TcAlP2OeR4QXstpJlDEGuN0SzBdFQ4lwn2yJ1Yt4HaTYormk34zvyxq26hhFm8ozGBYFHsWwANLow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769616659; c=relaxed/simple;
	bh=nWdbadZb9pkjwxX80QRMaZ4rSW9P2s4Vs9D1Jbg0i6w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dRqKkp3q44fYyKzgvBm3iZ4d9XFbpwYE3lclhQJFQsxUSW2lvnMwIYzWbISbKcYBKPx39PlpU1Zw/aXSesopV+jwrz9HOSgyxWJwoinVxyZ8x7fY8ElO8odmtMngjfQn75VEcUCwrEYGgduMkxV4JeT+Qhd4Jd+EsTzXprMjHRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gozXOmlR; arc=none smtp.client-ip=209.85.218.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gozXOmlR"
Received: by mail-ej1-f66.google.com with SMTP id a640c23a62f3a-b79f8f7ea43so1265983466b.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Jan 2026 08:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769616655; x=1770221455; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wdKVOkYHieKbKrsTLXtUc+V5Iw2Y7K5R7/tW5O3XgDo=;
        b=gozXOmlR4xVEnVrXqvfNihE1DtNZa0F91k18eeMERqf1kaLoYuCa7iJ8eIH7foHFJr
         JzG/QIVdRys10C+iNrn1yvqd9s3c7uBA+SgV1cWfwynNser0ABaMJW6MTZ0Q2jodBwF1
         wS6/8IsgDx4Mzlqhhzm8NoA44tLoRDoPrTdKUuSiHfcwtA3p3yjROMJpAviGLpqAbn2/
         M2M+xqmMVfr/N7fxf7o0QsdKGqwjqvGwAOp1w9cVL+8dvn1g+/T8khOulEgpb3b3s7ls
         EXTUxxuS3Gcp3NEB/A+cSWt3jgazSC8LA8hznHYlOn/gLR5WbQKeIVyuR4s3LrL2FDnS
         B7og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769616655; x=1770221455;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wdKVOkYHieKbKrsTLXtUc+V5Iw2Y7K5R7/tW5O3XgDo=;
        b=PC/a/y/LvXtgWxo0RlE9RGvJDpvrNA2DtNpWWXyGBg61i5RBgwhgk/g5sXZJ6xX9Ln
         UMY/1dhPEaO71iBOzgNHjUFsLX1SEA5U/oSh7AjKdervlenj5n9RWe1eH8tzGTGcb4O9
         eJ9iNn+hxHDkD130vRftfBtA1Yz7aiDrCOTNDyshlq5AbfQvI2qQFrboI9NWzQN2ygBr
         ZZ+QX9wVO76sVh3CHXeyiJjlK+VgxWho0dkGLvm0nbveU9DKpofXh0LolVyxwLtcUMlk
         xg/au6MREimAyxuLgjBp3pfkZ07JcZH4SSiHk/HPmRSfkFxecSRLKDdd+JEykOO6S+iP
         7KfA==
X-Forwarded-Encrypted: i=1; AJvYcCVBE1FnAlOaxup7c2QL/vriYGFYigFePt6sYsj7qW3LWif9EOx6CseeJjufNyxkjlicN+s8mCm0iKHL2ZOUvC//Vg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEQO6VKC4S1ThPqtsSig/aMnXsEdMwPeDA50g8qJnpCz+w5+GZ
	gsEFQt9jXzuyrQY4jsglJDJcplbZwmPJrpzJJ/xiUAFqlfxKEnYOWqatfRKUxFLYFyA=
X-Gm-Gg: AZuq6aJk9OCXgqU31UFySJHdMtgq2dhKG/uuzWrqvWYCvYvV1JN9fqI0/l201FNJVkE
	863slaPgf15QK3WYNwCNi8MqGd+OooMGQh3c7pdrGT9FbWNZJXdcRFKeTf1w/5qimlr7w/5eIex
	ji6rkH0h5FY7Xft3+eYrhzvvs1e/+wbGBpLTSHZqChkdmdx9LoEfUAPTYuvJjFrwgMYDoXZRSfG
	/SsM7pzT0hll/SCHrF9dJDIzArCKixDLI9l4xx9eiM3uK+++/9hR2dtX0IylSlrCtD2gNIoOwid
	YaH7uVkc7xHq6u15RpiL2osHn9OjsLeZsYOdZEOXrNmVab57+1sra0R9txO1zQa82Qea3bA7G0T
	zUrC1FWPTnRw+aUNKxxSQIZGRP3+LyGsVJdlnQfO/gBfNniFNAGQ7k8n/g1ERcNJ3Bb1Arntm70
	rbHxv6zkeKtoR0MmfqMAXbMdiQ9G1zEKDYFB9mPp+VM5d8DUDoJEMMDjbrb7IJAkHeuf5M6tH68
	htH1Q==
X-Received: by 2002:a17:906:2083:b0:b8d:c595:828 with SMTP id a640c23a62f3a-b8dc59517edmr136595666b.14.1769616654759;
        Wed, 28 Jan 2026 08:10:54 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf1c021fsm148553366b.49.2026.01.28.08.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 08:10:54 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 28 Jan 2026 16:10:52 +0000
Subject: [PATCH v4 03/10] dt-bindings: soc: samsung: exynos-pmu: move
 gs101-pmu into separate binding
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260128-gs101-pd-v4-3-cbe7bd5a4060@linaro.org>
References: <20260128-gs101-pd-v4-0-cbe7bd5a4060@linaro.org>
In-Reply-To: <20260128-gs101-pd-v4-0-cbe7bd5a4060@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Juan Yescas <jyescas@google.com>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>
X-Mailer: b4 0.14.2

The gs101-pmu binding is going to acquire various additional (pattern)
properties that don't apply to other PMUs supported by this binding.

To enable this, move google,gs101-pmu into a separate binding.

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
v4:
- update since 'syscon' was removed from gs101-pmu compatibles
- update since 'select:' was removed from google,gs101-pmu.yaml

v3:
- use additionalProperties, not unevaluatedProperties
- fix path in $id (Rob)
- drop comment around 'select' (Rob)
---
 .../bindings/soc/google/google,gs101-pmu.yaml      | 56 ++++++++++++++++++++++
 .../bindings/soc/samsung/exynos-pmu.yaml           | 20 --------
 MAINTAINERS                                        |  1 +
 3 files changed, 57 insertions(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yaml b/Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..a06bd8ec3c20faf0b364d3d3ef1763502c2b09cf
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/google/google,gs101-pmu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Google GS101 Power Management Unit (PMU)
+
+maintainers:
+  - André Draszik <andre.draszik@linaro.org>
+
+properties:
+  compatible:
+    const: google,gs101-pmu
+
+  reg:
+    maxItems: 1
+
+  reboot-mode:
+    $ref: /schemas/power/reset/syscon-reboot-mode.yaml
+    type: object
+    description:
+      Reboot mode to alter bootloader behavior for the next boot
+
+  syscon-poweroff:
+    $ref: /schemas/power/reset/syscon-poweroff.yaml#
+    type: object
+    description:
+      Node for power off method
+
+  syscon-reboot:
+    $ref: /schemas/power/reset/syscon-reboot.yaml#
+    type: object
+    description:
+      Node for reboot method
+
+  google,pmu-intr-gen-syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to PMU interrupt generation interface.
+
+required:
+  - compatible
+  - reg
+  - google,pmu-intr-gen-syscon
+
+additionalProperties: false
+
+examples:
+  - |
+    system-controller@17460000 {
+        compatible = "google,gs101-pmu";
+        reg = <0x17460000 0x10000>;
+
+        google,pmu-intr-gen-syscon = <&pmu_intr_gen>;
+    };
diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index 76ce7e98c10f3738e7de5579904260dd906507c9..09368dbb6de6898e2988c398b2506f2c2b4e73bc 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -12,8 +12,6 @@ maintainers:
 properties:
   compatible:
     oneOf:
-      - enum:
-          - google,gs101-pmu
       - items:
           - enum:
               - samsung,exynos3250-pmu
@@ -110,11 +108,6 @@ properties:
     description:
       Node for reboot method
 
-  google,pmu-intr-gen-syscon:
-    $ref: /schemas/types.yaml#/definitions/phandle
-    description:
-      Phandle to PMU interrupt generation interface.
-
 required:
   - compatible
   - reg
@@ -176,19 +169,6 @@ allOf:
       properties:
         dp-phy: false
 
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - google,gs101-pmu
-    then:
-      required:
-        - google,pmu-intr-gen-syscon
-    else:
-      properties:
-        google,pmu-intr-gen-syscon: false
-
 examples:
   - |
     #include <dt-bindings/clock/exynos5250.h>
diff --git a/MAINTAINERS b/MAINTAINERS
index 98b2ef47c809ac0232e6941c9483b19d7c798bb4..79a58769e9cb33d9bd6190c74d55461e77965af5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10834,6 +10834,7 @@ C:	irc://irc.oftc.net/pixel6-kernel-dev
 F:	Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
 F:	Documentation/devicetree/bindings/phy/google,lga-usb-phy.yaml
 F:	Documentation/devicetree/bindings/soc/google/google,gs101-dtzpc.yaml
+F:	Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yaml
 F:	Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
 F:	Documentation/devicetree/bindings/usb/google,lga-dwc3.yaml
 F:	arch/arm64/boot/dts/exynos/google/

-- 
2.52.0.457.g6b5491de43-goog

