Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E7E3358D2
	for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Nov 2025 19:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762802946; cv=none; b=Pupa0kPcgXITTde3GmC6pcAeAguPaBoPf+ayak04MZc3YcuWof2UL1YiA+CEQWyFf8daSvb5lPbZz26jxE/i47ZwdufK56RrYgrOsHXUfYOVcrsxXTG5yOg1NmESVsZC1rGpuo9fEcgOicJuag/5NGGuMtIm6TYAnxEyfA2rhJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762802946; c=relaxed/simple;
	bh=Iturht1z4J5VCGdq2uxO5/JtdngohPB50fNeYkz5Be0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CsVMNLW3Bd31oFQLvNTh6PSRSaLu4T46n/GC69UvHQo7MdsyUNAHAIDIp+ZnAVqY1QXbygFz3fAv4HsZmIO4QjC0FPV0Pk4FvI+7xdpQNVnS/HjWspBCGu1f+/h/uUVmtMuHJduz2u8BMo0wq+rL5ni4Cn5FyO/B7ngvrWnPgPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eWMTJ0/5; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eWMTJ0/5"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b71397df721so373582366b.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Nov 2025 11:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762802941; x=1763407741; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oiI3ga5iXjBfQ+EAlf6AmxG+ll0vZYfLdFbrUr44oag=;
        b=eWMTJ0/5Ca0GJDdsn07ueToLpR20SHOJzaJTplfJk85PWylIg32IDyuLoojY78WUaA
         pgCNB0Gliqi24AArTOC/MDyxavVPrpLFZGqfF46qAlV11Fyhbnpe11KvU1DpWpEfnoIW
         GwnI62Siup1ZPA44gM9JtgJLGA7RGJHW7Mp/gHO6nJCEbcoWz35kNY2/4H85Vp5R+XSP
         OBhGZNIt3PH0ph5ud8VFk4r8gH+MNo1S8abjP4s8+OGU/lIfVo+CQn72SHTytOW1T+Lp
         Sw6u9Rj02JvfXYp//aNvslxXN5xCfQ1EjPcmZ2vrRDQi1CCU4+ghpKMRj6GLR0KQPDBo
         YaXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762802941; x=1763407741;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oiI3ga5iXjBfQ+EAlf6AmxG+ll0vZYfLdFbrUr44oag=;
        b=bYJX6cq4qbRdFUKVWflAqDzeF1tl5/KOV8wN8suM9PygoXZa9ie4uqoqNPxwOHdkit
         3uHOQuRMhiKu6OiwpNHhUJNN4H/bAeOQ1paGChj/vO32JilQ8UE6tijVibdJl8PmXgDP
         viNcW0iwm+FA73exA6VkjxoipKRiykjqgmz19b/ZJV9CBoQf5BGOO56pCDcuPWssqRhh
         odi/fzmxZ74ctRtLgyAZCiJqk0C+jZjx/OVt7vB8ghUgF+kg1CV514eI/bD2HR7KU3CT
         RgW6z9P4rmxYT7/PoxpPQHILsQBmzZRl7Gwzc44WQKuKEOhhKLO7j295PQ12DVBM84F2
         IdeA==
X-Forwarded-Encrypted: i=1; AJvYcCVvcl5JC63mrLbM+DASSmIAe/z1aAPwErCxglbVIr7g509d/EFK7bN+RlGXSceHpEMpVvpI/TBlmA1isX0fMUNqMg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzE/hOGAfkFUG+hKyvV+PqgriCOuFnIn7wqZDfKH0cxT5yDpmxc
	xREqyTvxx7Vfr7l8oBtBL7JBmppx50fUdybEGzhhCeLk4EkE2WIE71357OlBVA0J+ok=
X-Gm-Gg: ASbGncuzECaf4323cn1fNMm0/ub6mUB6ac3GdPdkIXeeQMPhlbw8uSQ7xM+NMmMFv4t
	QzIx3+M90+0IJra/9jmGv3BumDVFRrIj0oRO2TJmAy07wfZlK53gDznWpw/ZgN/NRqvmOFVZZ0y
	96GwWdr/i0m1qbIEuGdewu+F0+C0CqOb2AUIE/mkJYRgUPwrWigfxs93k1SOCMMuqGIOm+J4X2D
	7mi5gPnPF54rlBbqKaqLbr+ZVe/EGFiAR/QD2efkVR+lpAjD1w+VzteSabbuHRpQS4Lhl2QzvhC
	mmM5YznyR8C0wHCEtf9ciR9Bm60yWXNTGluRbzr8U/KmSwY+V80jwRIRxrmwkK1VSApILv6P42L
	IE5HT6YTQeBnlIMYNazebZDx1eCPi3ro6QBtlIMBg/eE0s6lNn3HMv6zaV3Ytt246MiK83IxZ6p
	9B3M87yZ4N1JjfnViKR5dKeWY7SJ+hkpS71jr5wC7f8g4ccUFFL3DE7EjqVlmCiG73B8elQbI=
X-Google-Smtp-Source: AGHT+IHMusIGLU03fNsfdJtUUbDSIW3BGC4hBoJ45/tEDTDinhOCVakoQvnZg/iQ1d4Ttnda5vuCZw==
X-Received: by 2002:a17:907:3f11:b0:b72:ddc4:2a7b with SMTP id a640c23a62f3a-b72e0562e47mr980105066b.63.1762802941064;
        Mon, 10 Nov 2025 11:29:01 -0800 (PST)
Received: from puffmais2.c.googlers.com (254.48.34.34.bc.googleusercontent.com. [34.34.48.254])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf97d16esm1168178166b.35.2025.11.10.11.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 11:29:00 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 10 Nov 2025 19:28:46 +0000
Subject: [PATCH v4 03/20] regulator: dt-bindings: add s2mpg11-pmic
 regulators
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251110-s2mpg1x-regulators-v4-3-94c9e726d4ba@linaro.org>
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

The S2MPG11 PMIC is a Power Management IC for mobile applications with
buck converters, various LDOs, power meters, NTC thermistor inputs, and
additional GPIO interfaces. It typically complements an S2MPG10 PMIC in
a main/sub configuration as the sub-PMIC.

S2MPG11 has 12 buck, 1 buck-boost, and 15 LDO rails. Several of these
can either be controlled via software (register writes) or via external
signals, in particular by:
    * one out of several input pins connected to a main processor's:
        *  GPIO pins
        * other pins that are e.g. firmware- or power-domain-controlled
          without explicit driver intervention
    * a combination of input pins and register writes.

Control via input pins allows PMIC rails to be controlled by firmware,
e.g. during standby/suspend, or as part of power domain handling where
otherwise that would not be possible. Additionally toggling a pin is
faster than register writes, and it also allows the PMIC to ensure that
any necessary timing requirements between rails are respected
automatically if multiple rails are to be enabled or disabled quasi
simultaneously.

While external control via input pins appears to exist on other
versions of this PMIC, there is more flexibility in this version, in
particular there is a selection of input pins to choose from for each
rail (which must therefore be configured accordingly if in use),
whereas other versions don't have this flexibility.

Add documentation related to the regulator (buck & ldo) parts like
devicetree definitions, regulator naming patterns, and additional
properties.

Since S2MPG11 is typically used as the sub-PMIC together with an
S2MPG10 as the main-PMIC, the datasheet and the binding both suffix the
rails with an 's'.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
Note: checkpatch suggests to update MAINTAINERS, but the new file is
covered already due to using a wildcard.

v4:
- Krzysztof:
  - move additionalProperties to after allOf
  - use $defs, not definitions
- update samsung,ext-control: description

v3:
- mention NTC thermistor inputs in commit message
- drop PCTRLSEL values that can be described using standard properties
  (Krzysztof), drop useless ones, rename the remaining ones
- drop maxItems:1 where not needed (Krzysztof)
- samsung,ext-control-gpios -> enable-gpios (Krzysztof)
- drop buckboost from 'allOf' limitation - not needed as it has its own
  specific description

v2:
- fix commit message typos: s2mp1 -> s2mpg1
- mention GPIOs in commit message
---
 .../regulator/samsung,s2mpg11-regulator.yaml       | 136 +++++++++++++++++++++
 .../regulator/samsung,s2mpg10-regulator.h          |  14 +++
 2 files changed, 150 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/samsung,s2mpg11-regulator.yaml b/Documentation/devicetree/bindings/regulator/samsung,s2mpg11-regulator.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..119386325d1b5b6b0fe35c1f17d86e3671fe0fc4
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/samsung,s2mpg11-regulator.yaml
@@ -0,0 +1,136 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/samsung,s2mpg11-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S2MPG11 Power Management IC regulators
+
+maintainers:
+  - André Draszik <andre.draszik@linaro.org>
+
+description: |
+  This is part of the device tree bindings for the S2MG11 Power Management IC
+  (PMIC).
+
+  The S2MPG11 PMIC provides 12 buck, 1 buck-boost, and 15 LDO regulators.
+
+  See also Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml for
+  additional information and example.
+
+properties:
+  buckboost:
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    description:
+      Properties for the buck-boost regulator.
+
+    properties:
+      regulator-ramp-delay: false
+
+patternProperties:
+  # 12 bucks
+  "^buck(([1-9]|10)s|[ad])$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    description:
+      Properties for a single buck regulator.
+
+    allOf:
+      - $ref: "#/$defs/s2mpg11-ext-control"
+
+    properties:
+      regulator-ramp-delay:
+        enum: [6250, 12500, 25000]
+        default: 6250
+
+  # 11 standard LDOs
+  "^ldo([3-79]|1[01245])s$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    description:
+      Properties for a single LDO regulator.
+
+    properties:
+      regulator-ramp-delay: false
+
+  # 2 LDOs with possible external control
+  "^ldo(8|13)s$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    description:
+      Properties for single LDO regulator.
+
+    allOf:
+      - $ref: "#/$defs/s2mpg11-ext-control"
+
+    properties:
+      regulator-ramp-delay: false
+
+  # 2 LDOs with ramp support and possible external control
+  "^ldo[12]s$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    description:
+      Properties for a single LDO regulator.
+
+    allOf:
+      - $ref: "#/$defs/s2mpg11-ext-control"
+
+    properties:
+      regulator-ramp-delay:
+        enum: [6250, 12500]
+        default: 6250
+
+$defs:
+  s2mpg11-ext-control:
+    properties:
+      samsung,ext-control:
+        description: |
+          These rails can be controlled via one of several possible external
+          (hardware) signals. If so, this property configures the signal the PMIC
+          should monitor. The following values generally corresponding to the
+          respective on-chip pin are valid:
+            - 0 # S2MPG11_EXTCTRL_PWREN - PWREN pin
+            - 1 # S2MPG11_EXTCTRL_PWREN_MIF - PWREN_MIF pin
+            - 2 # S2MPG11_EXTCTRL_AP_ACTIVE_N - ~AP_ACTIVE_N pin
+            - 3 # S2MPG11_EXTCTRL_G3D_EN - G3D_EN pin
+            - 4 # S2MPG11_EXTCTRL_G3D_EN2 - G3D_EN & ~AP_ACTIVE_N pins
+            - 5 # S2MPG11_EXTCTRL_AOC_VDD - AOC_VDD pin
+            - 6 # S2MPG11_EXTCTRL_AOC_RET - AOC_RET pin
+            - 7 # S2MPG11_EXTCTRL_UFS_EN - UFS_EN pin
+            - 8 # S2MPG11_EXTCTRL_LDO13S_EN - VLDO13S_EN pin
+
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 8
+
+      enable-gpios:
+        description:
+          For rails where external control is done via a GPIO, this optional
+          property describes the GPIO line used.
+
+    dependentRequired:
+      enable-gpios: [ "samsung,ext-control" ]
+
+allOf:
+  # Bucks 4, 6, 7 and 10 can not be controlled externally - above definition
+  # allows it and we deny it here. This approach reduces repetition.
+  - if:
+      anyOf:
+        - required: [buck4s]
+        - required: [buck6s]
+        - required: [buck7s]
+        - required: [buck10s]
+    then:
+      patternProperties:
+        "^buck([467]|10)s$":
+          properties:
+            samsung,ext-control: false
+
+additionalProperties: false
diff --git a/include/dt-bindings/regulator/samsung,s2mpg10-regulator.h b/include/dt-bindings/regulator/samsung,s2mpg10-regulator.h
index 4a6bf13442f50bb1c475728722eaebd0ec3dcbfa..d9c16bba4d85809df99c2887b8dc61ea1bea5ad1 100644
--- a/include/dt-bindings/regulator/samsung,s2mpg10-regulator.h
+++ b/include/dt-bindings/regulator/samsung,s2mpg10-regulator.h
@@ -20,6 +20,10 @@
  *
  * ldo20m supports external control, but using a different set of control
  * signals.
+ *
+ * S2MPG11 regulators supporting these are:
+ * - buck1s .. buck3s buck5s buck8s buck9s bucka buckd
+ * - ldo1s ldo2s ldo8s ldo13s
  */
 #define S2MPG10_EXTCTRL_PWREN       0 /* PWREN pin */
 #define S2MPG10_EXTCTRL_PWREN_MIF   1 /* PWREN_MIF pin */
@@ -36,4 +40,14 @@
 #define S2MPG10_EXTCTRL_LDO20M_EN2  11 /* VLDO20M_EN & LDO20M_SFR */
 #define S2MPG10_EXTCTRL_LDO20M_EN   12 /* VLDO20M_EN pin */
 
+#define S2MPG11_EXTCTRL_PWREN       0 /* PWREN pin */
+#define S2MPG11_EXTCTRL_PWREN_MIF   1 /* PWREN_MIF pin */
+#define S2MPG11_EXTCTRL_AP_ACTIVE_N 2 /* ~AP_ACTIVE_N pin */
+#define S2MPG11_EXTCTRL_G3D_EN      3 /* G3D_EN pin */
+#define S2MPG11_EXTCTRL_G3D_EN2     4 /* G3D_EN & ~AP_ACTIVE_N pins */
+#define S2MPG11_EXTCTRL_AOC_VDD     5 /* AOC_VDD pin */
+#define S2MPG11_EXTCTRL_AOC_RET     6 /* AOC_RET pin */
+#define S2MPG11_EXTCTRL_UFS_EN      7 /* UFS_EN pin */
+#define S2MPG11_EXTCTRL_LDO13S_EN   8 /* VLDO13S_EN pin */
+
 #endif /* _DT_BINDINGS_REGULATOR_SAMSUNG_S2MPG10_H */

-- 
2.51.2.1041.gc1ab5b90ca-goog

