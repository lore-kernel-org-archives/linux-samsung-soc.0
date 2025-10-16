Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10D23570BE
	for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Oct 2025 15:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760630333; cv=none; b=WVYUWNwq7+51gN2vHRXid2499uTZ/v/83WxqLv621fZBTWCsV3NEGJNXFdNGS39/eYsjAp3uB02ywnZ9X1y2F9A4AjPKBZENyHQX9UEiDiH+eHSmXYMMTTTrG9xH+tEeOPMAXSRhtXLgQiToRe/R79vnSkAjFvZeK8Rk1yvKIFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760630333; c=relaxed/simple;
	bh=wjOKCcfNVyYH/LNtGu2O1tFUuSoILDand+0vO7/BXUw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=blkpa7KK7i5Ez1qgEt4F+ubiW1wOZwK2LqdZgRHVf1ET7dUJGgIWR7i6BTEX8hTmAXL0LR9tY9Mtag5MPtoCDhdLxq9VyQs2R7wk5fh0Edqwd+tsdmT4kWqP7MnHmi4VhRuz3zzkHH9ig8sBU6pIcPJgHNA8KiHtDo2c4Y/V8WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KyoXlhe5; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KyoXlhe5"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b40f11a1027so171469066b.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Oct 2025 08:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760630329; x=1761235129; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mFbyyNjgnPle57Vb/hgplgnkdL2H4IawW/m15NrLQlQ=;
        b=KyoXlhe54A7Osr6g5jLUwsQXEWnWVHUNuq6Pdhn7wFb3RdqmFkkeB6PCpBGOSrKcK6
         2eZ95/pvP78szTIp+MNef8rNHFwFjydfBppbffaEG3RKLjZ/mJcnvyjV4z3IpMKx0Muz
         iXp5RywyEe0k5llljh02eWswdFc485E/LXFdCOcDH+os//n1lfrO3wPSLo/68P1NBPVs
         fbpQR7HfwECuL1+B5ldHfCLAwb1gNPd2+1ZGv+tcnzxZjDqQ6cEQ7DkVqmRklXv4hB3J
         R8/U4wzclNdNtPfXSC3K2Hs6sTcynQ8UpW7OdMCzzgEhC3qV5JVLolw35fKgKD/q/g5j
         k2kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760630329; x=1761235129;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mFbyyNjgnPle57Vb/hgplgnkdL2H4IawW/m15NrLQlQ=;
        b=G2BFD1RGe1W25D2uJyr5kHj/oh2E4bWgP2dZlAqXUvdJ17kjk8lBJ1TVDwtikdGSPQ
         yQt9817nyD/7HeefzWuXByY+kTiI7Z5+arWp0hMRmNLeV7/Y80G/CCR1TTBy7irk2PQA
         gMYgV0OLZ7DNlnPEpAIn2+zo/tApkFdBb8LzWDASBZN+NNx83Xv+7aln1F+PlpgSVIk2
         V+HyjsWTUFwsfFdNij+7pZIhEbRXnuOF6XjXhRjwEgMrbKvV7B2bzSFJjhd5vpPHPYCM
         pgveJfbGMh/AGTgGcHG3wh9sy8SDzNm4ubTAOKJW6bxzKx33AeK5Cp4S53qbytkqXvYC
         T4FQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhbSvC6PTP4ZAMm59HiMnZgNIKvjMDY1f8BV6SgIgA0iIy2x32TwrdpWUuh5StuMgy3OE8eitK6Yys0EPJ4e7lgg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxiOoHVYUeeB979fFzDN7ZSYd+R/2z4YkB7jkcJq1x64UQceZmA
	HSM4Lw9aiajFWqHNitv8mbiAy7QDdEE+u/ii6xDf55LK58zd3WPoSoE+w1kuPAu67Xw=
X-Gm-Gg: ASbGncs1ozWFXk70/Niy5rcuzKNtLfw4IfKV3vQiV35Y2ltG//7AhAu8O4jV5Fl3+Tk
	/bDx+0xkFpUMMJhDXFrTgKaBIp7UeTpydXoDOOrYQZjqZha2wZBrwnhSVuBlr4Z25+kWnU5GB8k
	bqO/JRcCszQDa+TBlI7gNv1NWxDTuDK3yCe5yUjWdGCabhJq7rVcb/zqHEVgYpVCvV7bTFw+ihm
	4k/EBTZ16c6kN2veq+BLS8E7zWClgGlgB9EEK4k+4uLHuJp1ByUeQU2Th2lWT04Y2nds1ARLgom
	s+Dw3V3Ei6e61oXaZzaJ6GUS9M+Jars5UC59UFh5sNIJHefvjmXugflAiT6T9LpQrS+KxyO327Z
	FxFeYu1EzaCg2/klLPBzroaWKzzEsahnAIhvb7ne15EAcFGco3oZt1SMD15MUBax6jd7C2GXayS
	ibKXuBWtay6sfIxLPqnaaZyGmzXTbPYzhU3ldI/OCoBsgRRefAOprY6xZyE/80ZXe7GglgHC0=
X-Google-Smtp-Source: AGHT+IED/FvFffti0T0jCYr1x6YRSUGnajOXW2cxPyV/0xQA94FV6cSMBe/igTzVHYhYkjAYJA2B3w==
X-Received: by 2002:a17:906:ef05:b0:b41:e675:95cd with SMTP id a640c23a62f3a-b6472d5bb90mr52421266b.13.1760630324239;
        Thu, 16 Oct 2025 08:58:44 -0700 (PDT)
Received: from puffmais2.c.googlers.com (254.48.34.34.bc.googleusercontent.com. [34.34.48.254])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5ccccb4811sm549021666b.56.2025.10.16.08.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 08:58:43 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 16 Oct 2025 16:58:35 +0100
Subject: [PATCH v3 02/10] dt-bindings: soc: samsung: exynos-pmu: move
 gs101-pmu into separate binding
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251016-gs101-pd-v3-2-7b30797396e7@linaro.org>
References: <20251016-gs101-pd-v3-0-7b30797396e7@linaro.org>
In-Reply-To: <20251016-gs101-pd-v3-0-7b30797396e7@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

The gs101-pmu binding is going to acquire various additional (pattern)
properties that don't apply to other PMUs supported by this binding.

To enable this, move google,gs101-pmu into a separate binding.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v3:
- use additionalProperties, not unevaluatedProperties
- fix path in $id (Rob)
- drop comment around 'select' (Rob)
---
 .../bindings/soc/google/google,gs101-pmu.yaml      | 66 ++++++++++++++++++++++
 .../bindings/soc/samsung/exynos-pmu.yaml           | 20 -------
 MAINTAINERS                                        |  1 +
 3 files changed, 67 insertions(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yaml b/Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..f7119e7a39a3fe0a0a23d1faa251d356f83ba501
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yaml
@@ -0,0 +1,66 @@
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
+select:
+  properties:
+    compatible:
+      contains:
+        const: google,gs101-pmu
+  required:
+    - compatible
+
+properties:
+  compatible:
+    items:
+      - const: google,gs101-pmu
+      - const: syscon
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
+        compatible = "google,gs101-pmu", "syscon";
+        reg = <0x17460000 0x10000>;
+
+        google,pmu-intr-gen-syscon = <&pmu_intr_gen>;
+    };
diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index f0fb24156da9b8980dcfd5339ae75f12a71cf6d6..83f18a92fa1c4de75a90f00475cf17d5f0b652e4 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -15,7 +15,6 @@ select:
     compatible:
       contains:
         enum:
-          - google,gs101-pmu
           - samsung,exynos3250-pmu
           - samsung,exynos4210-pmu
           - samsung,exynos4212-pmu
@@ -36,7 +35,6 @@ properties:
     oneOf:
       - items:
           - enum:
-              - google,gs101-pmu
               - samsung,exynos3250-pmu
               - samsung,exynos4210-pmu
               - samsung,exynos4212-pmu
@@ -129,11 +127,6 @@ properties:
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
@@ -194,19 +187,6 @@ allOf:
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
index 8cb7a124f6e81372060c38ac2b3c9a11505ae004..22573869586eacdac0d0a075d4a691849272442e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10597,6 +10597,7 @@ S:	Maintained
 P:	Documentation/process/maintainer-soc-clean-dts.rst
 C:	irc://irc.oftc.net/pixel6-kernel-dev
 F:	Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
+F:	Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yaml
 F:	Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
 F:	arch/arm64/boot/dts/exynos/google/
 F:	drivers/clk/samsung/clk-gs101.c

-- 
2.51.0.788.g6d19910ace-goog

