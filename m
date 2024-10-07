Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797D41D7E3D;
	Mon,  7 Oct 2024 14:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728312614; cv=none; b=BAKZXn9tJZE7EWdQmnUlSt/TnJ5OlhLRjKH9ijzvs2hhrANqYLBazDI82lCPJKzp2YqzKXnUbPWtdm3xkqqmJ8HQvyUeteP1wzsER/0tGPLPSYAy1faWcZTm4/ajzFIPp+zKiTM4mEsSYt6zH+HrWOoPfO2D1B/KR9IAejonqgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728312614; c=relaxed/simple;
	bh=xaOvS2+nFbFXgLVWGRgfJSXilelrhfer00Wh/eYX/Zw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L2gK0hrNAK/+Wf3N3U/Nx0L0KpLp5eB6U4oBexElvC6FOzVR60wsNqFgvCibXYbblMLb/9iJPYIwp2Oj5mgs/ORTgWB3umSGvlXw9eAr9Rm+Vh/O0uBzUy7W5qcsJaFDaY35vm2rCX8VQxb4uz8qMUnUvQ/dLl+EARqzCYcFspU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j/ck+pfl; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j/ck+pfl"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2fac49b17ebso34417231fa.0;
        Mon, 07 Oct 2024 07:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728312610; x=1728917410; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bKqa5VofnGcmBjBaWkd+jJmfVqq2+bq+aGP5sPNNSbg=;
        b=j/ck+pflRsMcXI8GS+wTgkp4zsY8GNt/K0Ibx2XOMu7rpDBsEbmQWIxRiiQ1DLdwgv
         hXFhGh1lXHKMItOxEuYakSkZAz5tIfGDQwD0MFU4PG5qQLgNDC0jZqwnrfM/WLTjG+d9
         0/E4mK2j+baMFqGVVLoEjUOxL6RAh4xxPE4N0uh/MC5qFo5xxK6yyJ0XS5MeDPN4l/0P
         J0ZHlKb8lBIiQmmFH9esdkidhIfCY/9zHflIVEiHUxhhtknjCyVpyDP7B/loOq+Z5ea+
         AFCcDvJApHZrJKYIL2Eq3I0MZYkI6dpRIStUuKlNZ1anjQDdqzsHvlJ3WtVdTmJo0jlv
         sohQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728312610; x=1728917410;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bKqa5VofnGcmBjBaWkd+jJmfVqq2+bq+aGP5sPNNSbg=;
        b=RMm6ktB0IqYZyv3NTS15IzpAWPp+KPm+Q7wRuilg3QDWlUx00JicTiAptUfSynKIsm
         sVVFfS4pv012JPkzLEjs9CcgA59ZkAlP0fTgHp7YuhOq3kmyP2rUPYeYT+7m1s1R9Jk3
         rRbez5rK5zsY4ijdiQNujd2SITF42jV8DQAsffWvrpvemsQZ3RIGkM8I62JYPW40AhIT
         ZyOVAnCaeGoDtqOR6MYpnuzOgi5dZa0S8iv75xi1JXtVP1gYCankGMqzzLbLPKmQI1vR
         dBfFbTJIQRUGUiYMkLQ3k6W6Do+KFhmlY/bWj/nshV4XDhyneL92FWPpfWqhFjkTZpYy
         PspA==
X-Forwarded-Encrypted: i=1; AJvYcCVX2Fe72RdSWMNYQ0q+XSqImy4I3mCl2pHjKmj+oNt5YH5DyeuF5V7Ig86Fd8rXyLemJvbna1hOHaQsqROsRIMEOi8=@vger.kernel.org, AJvYcCVqR6j2v+whsoDbbCDg3j/zb7S/olo2UPfiK4Vl+Fe5lkN6cWEt9lVuJUs3fTzkQ5mnB8+vZ65APvv9@vger.kernel.org
X-Gm-Message-State: AOJu0YzXRbRY9tWea94LqqVcJQGit/Biv/K7T6bfk7WOGtzyxhGacbiL
	7mvkjc+Vkpl2Z4twxM6+HFAF9t+Ng4NQXDGJs4dehcVgnCni/38o
X-Google-Smtp-Source: AGHT+IFJ9n5L/hLCUECObP7MCrTMBXkI/9LWg/yjwQjx4XP4KcNdnAxkRYHDYTXN+wbc+8aKrGlzyQ==
X-Received: by 2002:a2e:bc1a:0:b0:2fa:e4d0:eb61 with SMTP id 38308e7fff4ca-2faf3d74dbcmr63548711fa.32.1728312610316;
        Mon, 07 Oct 2024 07:50:10 -0700 (PDT)
Received: from [127.0.1.1] (nat6-minsk-pool-46-53-210-75.telecom.by. [46.53.210.75])
        by smtp.googlemail.com with ESMTPSA id 38308e7fff4ca-2faf9ac43efsm8253791fa.45.2024.10.07.07.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 07:50:09 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Mon, 07 Oct 2024 17:49:59 +0300
Subject: [PATCH v6 1/3] dt-bindings: mfd: add samsung,s2dos05
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241007-starqltechn_integration_upstream-v6-1-264309aa66de@gmail.com>
References: <20241007-starqltechn_integration_upstream-v6-0-264309aa66de@gmail.com>
In-Reply-To: <20241007-starqltechn_integration_upstream-v6-0-264309aa66de@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728312606; l=4538;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=xaOvS2+nFbFXgLVWGRgfJSXilelrhfer00Wh/eYX/Zw=;
 b=OPPE07j0Vdd6AbbC7QwIPKaGBRLk1axz4cCK3c8k4QMlytP4sSCb2hZs2AbsWVfygyMM7H1Nj
 zvJiLcp/DqtA9DePD6RfvjAp71yDfNBa5VGxOwklpUlL4gCVT4UJE9d
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

Add samsung,s2dos05 MFD module binding.

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
Changes in v4:
- split long(>80) lines
- fix indentation
- merge with regulators binding
- drop pmic suffix
- drop unused labels in example
- correct description

Changes in v5:
- simplify regulator-name in examples
- remove index from single buck regulator
- fix example indentation
- replace example hex numbers to decimal
---
 Documentation/devicetree/bindings/mfd/samsung,s2dos05.yaml | 99 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 MAINTAINERS                                                |  2 +-
 2 files changed, 100 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/samsung,s2dos05.yaml b/Documentation/devicetree/bindings/mfd/samsung,s2dos05.yaml
new file mode 100644
index 000000000000..b85285720c16
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/samsung,s2dos05.yaml
@@ -0,0 +1,99 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/samsung,s2dos05.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S2DOS05 Power Management IC
+
+maintainers:
+  - Dzmitry Sankouski <dsankouski@gmail.com>
+
+description:
+  This is a device tree bindings for S2DOS family of Power Management IC (PMIC).
+
+  The S2DOS05 is a companion power management IC for the panel and touchscreen
+  in smart phones. Provides voltage regulators and
+  ADC for power/current measurements.
+
+  Regulator section has 4 LDO and 1 BUCK regulators and also
+  provides ELVDD, ELVSS, AVDD lines.
+
+properties:
+  compatible:
+    const: samsung,s2dos05
+
+  reg:
+    maxItems: 1
+
+  regulators:
+    patternProperties:
+      "^buck|ldo[1-4]$":
+        type: object
+        $ref: /schemas/regulator/regulator.yaml#
+        unevaluatedProperties: false
+
+        required:
+          - regulator-name
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
+            compatible = "samsung,s2dos05";
+            reg = <0x60>;
+
+            regulators {
+                ldo1 {
+                    regulator-active-discharge = <1>;
+                    regulator-min-microvolt = <1500000>;
+                    regulator-max-microvolt = <2000000>;
+                    regulator-name = "ldo1";
+                };
+
+                ldo2 {
+                    regulator-active-discharge = <1>;
+                    regulator-boot-on;
+                    regulator-min-microvolt = <1800000>;
+                    regulator-max-microvolt = <1800000>;
+                    regulator-name = "ldo2";
+                };
+
+                ldo3 {
+                    regulator-active-discharge = <1>;
+                    regulator-boot-on;
+                    regulator-min-microvolt = <3000000>;
+                    regulator-max-microvolt = <3000000>;
+                    regulator-name = "ldo3";
+                };
+
+                ldo4 {
+                    regulator-active-discharge = <1>;
+                    regulator-min-microvolt = <2700000>;
+                    regulator-max-microvolt = <3775000>;
+                    regulator-name = "ldo4";
+                };
+
+                buck {
+                    regulator-active-discharge = <1>;
+                    regulator-min-microvolt = <850000>;
+                    regulator-max-microvolt = <2100000>;
+                    regulator-name = "buck";
+                };
+            };
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 84086d47db69..ae6564d98caa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20475,7 +20475,7 @@ L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained
 B:	mailto:linux-samsung-soc@vger.kernel.org
 F:	Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml
-F:	Documentation/devicetree/bindings/mfd/samsung,s2m*.yaml
+F:	Documentation/devicetree/bindings/mfd/samsung,s2*.yaml
 F:	Documentation/devicetree/bindings/mfd/samsung,s5m*.yaml
 F:	Documentation/devicetree/bindings/regulator/samsung,s2m*.yaml
 F:	Documentation/devicetree/bindings/regulator/samsung,s5m*.yaml

-- 
2.39.2

