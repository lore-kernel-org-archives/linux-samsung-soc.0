Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B3C1DDA09
	for <linux-samsung-soc@vger.kernel.org>; Sun, 14 Sep 2025 13:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757854980; cv=none; b=vAKbereJ122OJgS6piuKT55WYrQDVw6H7AoD0wUK4Co1o3OYxw88/NV5WmJwqzIZ9SPr9fRkgbD5XFwbJk/uSJmNWifIUZDyzCfPCqeDx8zJkxWfo+uOqmgxyRMGzc3GV/iYyfPcSTp0thlUGft8lZrOhntRluT4pcEha3wYzQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757854980; c=relaxed/simple;
	bh=a4ZBBjK/WU5GHiCatrh9aDbJ8ucH3NgYg6flBlGjFPY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FBD+SX/bL4RSpYmczvZzUpfrxE1sBqOtA8h8DLRFic2+WpVZl6d7IpEBzIA14CAelmxaEGl6Pjxzp1AuOKFRRyYvk7HpSPlrC7RTJDKhPImhl5zzjxqBGDXb8viGUijgQOcRkHS7G+h3laPnnQHaCnPxCNijj+lvS2dg4BPKJdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cGs7srcd; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cGs7srcd"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45b9c35bc0aso29442955e9.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 14 Sep 2025 06:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757854977; x=1758459777; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3oAhxTMJPNeQLUIHyuzOPHBbaUvEyaoQkiLHIc86Fe0=;
        b=cGs7srcdtQ6wCPD4+7kb6IYdX5KyDNosbjU94EEGYvgQysJ2wybFsH76Ee0ea5LNW8
         IQFe/POp38LpLewFomSOEExRLv40KjfNiZ9dCYkj/k69y1LXAFDRdbd6LtRMz4M3wCB9
         wQyGhwmoHbYj0qG9shQTTv+UNLqfsJg3FUEoywTeIsCl2lL564zyytHJl9uKNED/Oulv
         0F27YihE/fTj1KepIM7E2JzNHeJyAQC1bA8C7zZJN6osv/2Fc+/KnRcp27XhACNIJRAP
         qENzmE+XwwaIivWGxKWY8A+baGdupTMVQiiIRbJamB1gD+9/aXQ5AXsc6ormQUm35CeY
         qztw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757854977; x=1758459777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3oAhxTMJPNeQLUIHyuzOPHBbaUvEyaoQkiLHIc86Fe0=;
        b=FfgBspHT+qoJecY53XPTQzdiqU1qiw5DIyEeppBqvN3hK26ap5fAPD2KoUjOiZquW6
         uOzEJewQz5cj9flSlTVvPHzPJHUGgWX2Iei0EtD/kjeDF1uxZb5KD51xSrKb9rmdhti/
         YQNJOhyDjvjIK5B50SuORekqawp1beAWpYib6OOsWb7IG9C1vHSEGUB/8ByGwnFc5PCY
         JHECebIecF0ufAxngkr2fjQMPKnxc/sAN7E66ibFVSprJEF7rH+A4zmQ2eao9c+zylpW
         eLBTyGUbNvkso76WZ7GN17bJgEEBUnlLmxsgAYWx1QRlz0ZxbJl8GtvwNJcXFJ5aFYXw
         FZCQ==
X-Gm-Message-State: AOJu0YxkhfLlrd+uKFlqmduqDaCygbw0lPvgC2S2QoWHBczjsO7I4ms2
	CJLLRgPO3/FWuRc/5BlO3aYaCU5Bw9DdZ9OfCAkbdCS48+TER+A/hEitYQhngw==
X-Gm-Gg: ASbGncvuHvYNLN7PAhQOu0Ft3Sg+WFsaqEfRuP/pvDmdeIBBvr8i/vCb6X1vfRjHLOq
	RCcUQDK3NRwki6oaMON+5QOBC7XjGlL8sYIawQu2g5xzvy/UtT7ttyCOzy4l5OvILuzkf5zrhOg
	0/jMpwGHKuIKo83ISvWal5M05ULvswoYeTESLVHxTC+LnaBAPr9mdhmRKX4Q0FoYiRGoAuw6GgV
	rg/R7AKIEbc0AUOIE2Q1JXoxe+CKk587b/FEf5LGFYBJuVxqyhS/Q1zPTPm1q2c3FPZdxyzBnJ9
	TZgXJ4YyQJlcZNoRlkqBIk+sZo9/Y8bpMnlPdP9dQTVW7morEnm9s1x2JD8AO8DKH7xVqDc7Oii
	DpKDfMSCeVgjsufSpIAzn4HSNuaBVCD8STsrIGjGaZnSn+tL/QNSKY3jziAiq92YgHqrO825vGg
	==
X-Google-Smtp-Source: AGHT+IFH0J7++zpYZUA+Z1NkSGmTdds/qaGaHNjbECc3qbgcVLSHKSOo9xfYKAK2+jJQWK3yvOFXag==
X-Received: by 2002:a05:600c:b51:b0:45b:86ee:415f with SMTP id 5b1f17b1804b1-45f211ccceamr67997095e9.6.1757854977246;
        Sun, 14 Sep 2025 06:02:57 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e0187f0a7sm77060965e9.3.2025.09.14.06.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 06:02:56 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] dt-bindings: regulator: document max77838 pmic
Date: Sun, 14 Sep 2025 16:02:29 +0300
Message-ID: <20250914130230.2622030-2-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250914130230.2622030-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250914130230.2622030-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The max77838 is a pmic, containing a BUCK regulator and 4 LDOs. It's
primarily used in the Samsung Galaxy S7 lineup and is accessed over I2C.
Document it.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 .../bindings/regulator/maxim,max77838.yaml    | 68 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/maxim,max77838.yaml

diff --git a/Documentation/devicetree/bindings/regulator/maxim,max77838.yaml b/Documentation/devicetree/bindings/regulator/maxim,max77838.yaml
new file mode 100644
index 000000000..bed36af54
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/maxim,max77838.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/maxim,max77838.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Maxim Integrated MAX77838 PMIC
+
+maintainers:
+  - Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
+
+properties:
+  $nodename:
+    pattern: "pmic@[0-9a-f]{1,2}"
+  compatible:
+    enum:
+      - maxim,max77838
+
+  reg:
+    maxItems: 1
+
+  regulators:
+    type: object
+    $ref: regulator.yaml#
+    description: |
+      list of regulators provided by this controller, must be named
+      after their hardware counterparts ldo[1-4] and buck
+
+    properties:
+      buck:
+        type: object
+        $ref: regulator.yaml#
+        unevaluatedProperties: false
+
+    patternProperties:
+      "^ldo([1-4])$":
+        type: object
+        $ref: regulator.yaml#
+        unevaluatedProperties: false
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - regulators
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        pmic@60 {
+            compatible = "maxim,max77838";
+            reg = <0x60>;
+
+            regulators {
+                ldo2 {
+                    regulator-min-microvolt = <1800000>;
+                    regulator-max-microvolt = <1800000>;
+                };
+            };
+       };
+     };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index fed6cd812..a4916a178 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15061,6 +15061,12 @@ F:	Documentation/devicetree/bindings/*/*max77802.yaml
 F:	drivers/regulator/max77802-regulator.c
 F:	include/dt-bindings/*/*max77802.h
 
+MAXIM MAX77838 PMIC REGULATOR DEVICE DRIVER
+M:	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
+L:	linux-kernel@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/regulator/maxim,max77838.yaml
+
 MAXIM MAX77976 BATTERY CHARGER
 M:	Luca Ceresoli <luca@lucaceresoli.net>
 S:	Supported
-- 
2.43.0

