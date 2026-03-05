Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8049D29BDB1
	for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Mar 2026 06:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772691120; cv=none; b=WtPkKm6nl5GmVr8h/gF1Amna2qxPo9kRAdt4K6UxerCvvzH6yLDbcFbpRnuVASf3CuIXp5gMgsFUbQKE2m+OdNJzNdTu5HS0t54BzeWUThCDEr30GQimqPA7yWQwTS+mSCMkesyJfMSDUvO1eEtBGXuKeh/9lbat7YmCzZG0NfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772691120; c=relaxed/simple;
	bh=EEPuxE3zx9i5YvvEVJqMlxzcsnK6a/x/2q1dl3xwiOA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D3yaC+7syXG9Djykqw28z+uhzvn34CvKZuOOMdFHHfOkX/+CyBHINERG9adO1PJulhSVumdbOeABpT11dwoNZk0kBaFo1DCaYsiZUcGLuEFOvQnas4cUjoBZUMZRnAfTwctpu3QLkuXhzAN4vV4ng01uORdhpLgRAtsgav4JILs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NlTQ75Ul; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NlTQ75Ul"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-65faaa8b807so4648622a12.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 Mar 2026 22:11:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772691116; x=1773295916; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9PU4mxk2r95PV9tPzoHDwPxRIhg7ggXYRoeufjEkbG0=;
        b=NlTQ75UlGei5WYLh93YCkSzx3JNFbYHy+K2HrYBWGuw//8V4J+rFANPgQq1K7wwDII
         5xCCR/iSROj8Fh/jFE/fIjxIUtthspXgfe5SK6JKD/od7aNpxCK8j24yBgL+xBnbtMxF
         xHeTvE74iCZpGqn033t+zI5/zb6WPWJYmxQ1quUU23lItWaFeJCAVRj86tTetybswImg
         Fh1iK1Odq485cBWgwwTR/UPTO7l4p57joATk6vD2912nN3gsrnKU+EvGCjG14r2xt/oR
         5U5Mwr1rIv2Cl3cT4hAJVvbHVXT3ufh8c5J5aTuf9VhlScw1fnTLgKCIiTOkpGD61YvH
         LOWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772691116; x=1773295916;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9PU4mxk2r95PV9tPzoHDwPxRIhg7ggXYRoeufjEkbG0=;
        b=t6AMxTCiQqtgX3hgWiOnU4fCxz45zM0+P/8P2poNqOPRmH+nRsP0jbhZP+GmhFYJ2C
         hP/UZcmO5FQllWfIr3iQTl8St0OH0DHElvjRcpMQTjipN6myvvGI7fyfEs32VyFW/VsU
         +e9NdMWnnXmATOTSA+8UbwdteXg3IPEJRfchLhlWwUzdNRGc62jVE+c9tIweRYR/MmTO
         27vy4RWys7glRmH734+TcGAEF8+RFRPhfdzPFkH2Kzq18Cx0wnGnXkp7l0FmwyOdBuY1
         qOR5r0CPn9QvtkyEQvlmlK9wcihhjytuEGQweq66YKC/GYKr+OgQCqVHdm7cd7A7Ib6K
         m+7Q==
X-Forwarded-Encrypted: i=1; AJvYcCX6PFm7+Pcz+7VRbTZyr1cviDyhBTg2S1EVVJyFD2iyUs/XEGFJMpme39AoMGbrUnWUFfsyl/hI708y+U1rv65f/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+XZScg/VVee2iDVdejhK5vBuMo+d4QhA/+aIJXTT9W/6BE4TC
	wkfe45a+y+4yWhYm1cC2nB4gyqI3Y4m6zYwQtnkOovyvjrTkPG0XzRjsJAqeGP5PN3E=
X-Gm-Gg: ATEYQzwncEXNY3+pEkvE9pOuKZ805Cl+o4gxspKMoRJlNbXzE5fU7XzzdaMA3qQaR/a
	PuYRAa8IolUzCN6J6RWYRSAJj0biC4YhD1gpQ8jXjNFiJNeGnXNAh73YuBxsOu2hPOq2ylFJP23
	1l2tDsVbHMINa920RrRnM4WYetU3gQCIFeA2FlhHJ0OTdZxTEiACYhEX3BRPxR0OQIwu62pUv9g
	pTVBxQ0BjUVMlFaDPkwt2ah7PefGkeeULKjeo/mOGHDtMjQL/oZ94dv4UdFDCLnl/HdnvwTwvQo
	1oFY+n1zOBLXQucbZvMRHr5NXy91cAdWSlZnZ7LEXOiE0iQky0DxjBfgWzenRrpDicnZN7L6VWx
	hfXxM96nKkIrVbhclDQ3GALpA/BlHuUm3lyvoRwJiNsaDQGpgd6QLTUA5DNA2cRa7m1tvZ4fycu
	otmmQB0jx29VA6qi2inUo2YXmqLQv20Y05zvybkxnkCm9cuG+LS41425YQoW2sy5pHQBmo+iCli
	3WdGanL4OBBV9I=
X-Received: by 2002:a17:907:97c4:b0:b7d:1cbb:5deb with SMTP id a640c23a62f3a-b93f11d67e3mr345346266b.27.1772691115747;
        Wed, 04 Mar 2026 22:11:55 -0800 (PST)
Received: from puffmais2.c.googlers.com (221.210.91.34.bc.googleusercontent.com. [34.91.210.221])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935aec3243sm849355966b.53.2026.03.04.22.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 22:11:54 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 05 Mar 2026 06:11:52 +0000
Subject: [PATCH v6 03/10] dt-bindings: soc: samsung: exynos-pmu: move
 gs101-pmu into separate binding
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260305-gs101-pd-v6-3-8cb953c1a723@linaro.org>
References: <20260305-gs101-pd-v6-0-8cb953c1a723@linaro.org>
In-Reply-To: <20260305-gs101-pd-v6-0-8cb953c1a723@linaro.org>
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
X-Mailer: b4 0.14.3

The gs101-pmu binding is going to acquire various additional (pattern)
properties that don't apply to other PMUs supported by this binding.

To enable this, move google,gs101-pmu into a separate binding.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
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
index 611fa8fb9f8f..6a00d97ccd09 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10884,6 +10884,7 @@ C:	irc://irc.oftc.net/pixel6-kernel-dev
 F:	Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
 F:	Documentation/devicetree/bindings/phy/google,lga-usb-phy.yaml
 F:	Documentation/devicetree/bindings/soc/google/google,gs101-dtzpc.yaml
+F:	Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yaml
 F:	Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
 F:	Documentation/devicetree/bindings/usb/google,lga-dwc3.yaml
 F:	arch/arm64/boot/dts/exynos/google/

-- 
2.53.0.473.g4a7958ca14-goog

