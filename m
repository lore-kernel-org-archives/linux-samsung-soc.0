Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2D43E122F
	for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Mar 2026 15:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773847689; cv=none; b=tM5XTcwDUcaH/BjcL0ouAkIVCnP7PfboJ5VkklpNI5U1pvfbTz6kg/10r1zLLqwVrhJbSKsqa4iBWzEKQdGx1bJveBHuZOGjZP2d6LaIAjv94QBbSJl98FY0W9A3T02Cd+rKaHXCaYUO6iG5HWty+IJiidmJqSRUvoLHoSK5EFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773847689; c=relaxed/simple;
	bh=bLUWwsSBeNkjQIGbf7RQhzd8YJKonybEFdSnbDCOcgQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uVWQcTlvN1wZLuH+1zh+Tas5CryCyNf1PLBNXt7OOjT0Yf2o2ALj0RHH1ZJdvuB0FI/99vIQ4NvktUVcsxnbQ0e+Ty7s95FDP2otNSSfNrdJyGWzxBQ+7A78Ol0fjqyAqJQkVFfrVbTApmTX0bYpbiDyb8uG8lE+cXeYX8L8N1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Hffl+d9i; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Hffl+d9i"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b980785a0bfso91571666b.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Mar 2026 08:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773847681; x=1774452481; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=76ew0Aox6hZpcoaCX95kIQMvXTcJq4g+BOpg4Kox4lM=;
        b=Hffl+d9ihou3IuBu/ce6Tbl34d3hl2LZevZGIwlWFa4RzAHdj/VPBI1EyqNgEUQQ5L
         l2GVbJb4V25XpZH/U1ulhSrnbGdxqrfZmq7jXkaUWHBhqKI0G4BVISUkB5BxA7VNIiQi
         q2MJA35E7c7dMzkjZp4CzguyT7kgoPPgJgjmyeQh0VRUm2qpc+A81Ku/TR8x7VcWwXii
         Za9NpWFGVVS3oFx1DOrhSJHD1Ig0O5BYH2TEwthCZyxjibmkle7VR/5MAxdgjEjID4uV
         FBGzT7s2b+xKGJLfWWFNec/da/4MVWDVyr7ns8RAsevNZMUYsAApUxwozbi9yhqUPS3g
         FVBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773847681; x=1774452481;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=76ew0Aox6hZpcoaCX95kIQMvXTcJq4g+BOpg4Kox4lM=;
        b=ovaJYnFYcw9rZ5E6iEobetJAlazqP0cJNLWuTUHtRQ6+yueIA+W/PLcv+z+PHlUoqb
         cazT9l1Hii11gQjN4OwCaPMLL6cn/WcbpLouUL76uuKtHiwEAFTA1bCtbLL7hmJMS6hN
         +GaY6xtPdu0z2sahOqP/003YdotSokjITS2g4dBFC3TumyLK3k3EY/ouNBvCitS0ylPg
         pLIXIY1EgIRjpvTpFi04XatpfuG+XYH5orh7LjoMJJz4v33G7SIPx92G5O1ji8Didmd5
         DBdZ5TllooUbJP4fNKBvm9ljS2j+6zjPh433GdEGjYIDNM5bmYBL3C9RGjJr8N4iTI+5
         kA0A==
X-Forwarded-Encrypted: i=1; AJvYcCWdnNf/jg41FoCrH0a2pTILffY65zy8AVJUtvID8UoYW7a4ieVBAivm9p+bnQsm14yL1AT2Jzukou2HS+T6oVp0uA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJj7b5P4HZI+k5oGsUY4MhLBsTWAV46MgiIo6aK/tevbuUEicV
	rPTURIcxseePRQZuBlMYXgce8Pq/1JYzjnkGepHLUThe3QobyZeSrBCizvjXJjWjlYM=
X-Gm-Gg: ATEYQzzfAkWFPc88+v39lXCe+dwYsGJbCEDkJZqlQE4N7yk9BRGvlH3gDwEh9zuIkSS
	WWnGAUga3AjY68Z2TZVeb0JgygDakszlYsdb1SUIuPRJNol4j2f1xBdVo6AZvfQZOfGXl7BdNKT
	wKxMdyK5tr3w8vzFlM4S9B/DPYZFFHBwloF8NMxmCa/14k+i589xC2V5tr9+0gjfXI4hqcCBygH
	0v02gsDP5xAVdPWhHPEHwH7ruumEp+VBqkFI0KekXedsDyG/NETGzjVMbNVx0dBvT+VipqGpbiP
	ryC0bpsya6x/FgBNTft85G9b7yS5as8IUWjXR7tq9smgXpqDc1dftO3HiioM6IdtB4kWHUlhnMP
	n6SFDooPARmMwy6z6AOCseXA78FOQW1qLfJJn1bIoOYjJ+8pI4qQwbP6T2EOBnetgnPsEEnE+S7
	RVlN/mvfAvUO8ZwDefY3QF8lorZQEQfV3r6i5y5wQqv24jLnuLJKgmLT6Pdc92pRXzlW4lTIVQK
	Hpc2UhDM7j9ojQ=
X-Received: by 2002:a17:907:98e:b0:b97:1d24:bfd1 with SMTP id a640c23a62f3a-b97f47c86fdmr235982266b.13.1773847680401;
        Wed, 18 Mar 2026 08:28:00 -0700 (PDT)
Received: from puffmais2.c.googlers.com (221.210.91.34.bc.googleusercontent.com. [34.91.210.221])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f173a3e3sm226989566b.61.2026.03.18.08.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 08:28:00 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 18 Mar 2026 15:27:48 +0000
Subject: [PATCH v8 03/10] dt-bindings: soc: samsung: exynos-pmu: move
 gs101-pmu into separate binding
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260318-gs101-pd-v8-3-241523460b10@linaro.org>
References: <20260318-gs101-pd-v8-0-241523460b10@linaro.org>
In-Reply-To: <20260318-gs101-pd-v8-0-241523460b10@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.3

The gs101-pmu binding is going to acquire various additional (pattern)
properties that don't apply to other PMUs supported by this binding.

To enable this, move google,gs101-pmu into a separate binding.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
v7:
- drop invalid tested-by tag (Krzysztof)

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
index 000000000000..a06bd8ec3c20
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
index 76ce7e98c10f..09368dbb6de6 100644
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
index e8376343935f..60da52c420d4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10906,6 +10906,7 @@ C:	irc://irc.oftc.net/pixel6-kernel-dev
 F:	Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
 F:	Documentation/devicetree/bindings/phy/google,lga-usb-phy.yaml
 F:	Documentation/devicetree/bindings/soc/google/google,gs101-dtzpc.yaml
+F:	Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yaml
 F:	Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
 F:	Documentation/devicetree/bindings/usb/google,lga-dwc3.yaml
 F:	arch/arm64/boot/dts/exynos/google/

-- 
2.53.0.851.ga537e3e6e9-goog

