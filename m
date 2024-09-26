Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8EA61AC441;
	Thu, 26 Sep 2024 09:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727344074; cv=none; b=R3xSatgZrteB6SeKyQPPfhwhI7LOE+Ex57terIziQzFmU+a7ozRLSGOBFMPGiMdWKuu6vOIhsdHr2o/+3Kw2glqkxcLChbY6rUoOXnYXRiaMQZpPqeNtn0o8X0C29Gv2e9yqu06wemRGnYREFvOpHeoR/tNCeDWtPq5HZWON5eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727344074; c=relaxed/simple;
	bh=fgn53cgjo7oCyIWaru75fu5gGxwR1HUplPMF2u7z1c0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m/MYrZhNNEcyiHRZxS4qF70jduKrBVmAQzDFcYE/vhVIMpxfImgcIRx61z6OGDc6q1bxCLxvgbbYWxQwKj5yfxigWcuOJwe2qGU7DpNVw1ryEk+CVszI0j53TviYjiIw7F0b9iTTBi+zf7ceNxhSPlAXTcYyL+2AkY0yW5dzkIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I9xzEa6J; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I9xzEa6J"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53654e2ed93so1007304e87.0;
        Thu, 26 Sep 2024 02:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727344071; x=1727948871; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lsTYuGlxrhKxiHfQk8/AidAyypQojxBx32/1wunnGHw=;
        b=I9xzEa6JuSMRfHrmRXGO1Xth6X+fHf8mOKo2rAXDFlVfjq0rYGIEUCzPe0zDAT3NH1
         839e2MpGmpK8OqfsdZUUG3OJUFcL+6viJjIKi6JRhfuXLkPjtSumRaYLSHnZEBGG9qPm
         nq7qOcAEVO7CCWrhADO10gidtfqrX5/q2MVf8xQctTpRpsPKSdvZvxheOVVVwlAmLcMl
         QiwOnuSyjnaY/X0NSJDG7jwngxph9CxtvFBC2ySzG5G7Lcm8dp2GMUsIl8wiLEVkAt3t
         NBrUao1/KZbI1BMYrsZN3+xhIhUBTHuoPEYdn4e7iLBnxYetsRQWB8aknOKpQ0e/li0L
         qEZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727344071; x=1727948871;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lsTYuGlxrhKxiHfQk8/AidAyypQojxBx32/1wunnGHw=;
        b=LFcWUPWnYgzAjOEHHqzNdHhO9jH0/KR2iMdfUijsNCiDG3I2trQKs7AvJrI49RrV/W
         v7DdS480aa51+SxETkT3D0FLbmd/g9gPQaKB7uJdoWBnwf0lH2lUoGnzSss4FzsJ2NBX
         dNtvgiT4ncek4TQCV3GKFSo0Wb2x06kGOrcajBNe1NcgEBkDsKxohmVrIxw3y1w0iSeJ
         jzSdQLlxUO9JIB1yGsh5QapapLgJr7d0SGaSKYBpZdblsRy0b5iZGXKrDyhlDmWFajKx
         znZ/JCMo+NyZ8kVjqm/ovq4OxIjSkbNhl6kNafjVA1TtuUYp+Zqd0wAv/7TUQ2iqfZBe
         mdmg==
X-Forwarded-Encrypted: i=1; AJvYcCV8wJNWngxhKhCGV9aitJbmnMLXpgfz9gjftZ+CTmcTYmPRe/XgO8OhP+pq87PEy9GDT7xwRRAuNxc2oncHFQCr6/A=@vger.kernel.org, AJvYcCWeNXmIhLxIwFVC85aTCUR6upSIdQNWDwP1S33Z8qQnnInWsPEUSBswrocFSB57ib1UaRYyXAgJhitA@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6oHYfgaXZvCrsD3JUalPthh7757wk5TylIYp1EY5vkGZKK+/s
	KjtILf8QpJJDJTZ62eu6kmTjIZgwx1FBF4ZURvLLxRcnG/2CrO4v
X-Google-Smtp-Source: AGHT+IFCLTGyAs9CivJacP027VtGlWbk3TGkau2AsoGtLu3wYDxxmyEFsE4tqWQiDDXt2yKy5+22Gw==
X-Received: by 2002:ac2:568c:0:b0:536:9ef0:d854 with SMTP id 2adb3069b0e04-53877530b7emr3455906e87.32.1727344070389;
        Thu, 26 Sep 2024 02:47:50 -0700 (PDT)
Received: from [127.0.1.1] (mm-20-1-84-93.mgts.dynamic.pppoe.byfly.by. [93.84.1.20])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-537a8648a60sm750311e87.199.2024.09.26.02.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 02:47:49 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Thu, 26 Sep 2024 12:47:30 +0300
Subject: [PATCH v5 1/3] dt-bindings: mfd: add samsung,s2dos05
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240617-starqltechn_integration_upstream-v5-1-ea1109029ba5@gmail.com>
References: <20240617-starqltechn_integration_upstream-v5-0-ea1109029ba5@gmail.com>
In-Reply-To: <20240617-starqltechn_integration_upstream-v5-0-ea1109029ba5@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727344064; l=4482;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=fgn53cgjo7oCyIWaru75fu5gGxwR1HUplPMF2u7z1c0=;
 b=E67BzRTMx000M4UGeqkGFg5iUysW87cYybYD0JSzIpKkOy619SQHZPbx6QkzWi7vTpdya+psp
 OQac6af13+dCNzoezIpN73Up8oq0vQa6+Yrp3MCXYhpKneRRDjQzhUd
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

Add samsung,s2dos05 MFD module binding.

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
 Documentation/devicetree/bindings/mfd/samsung,s2dos05.yaml | 99 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
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
index 5e467ba71e3b..6a6c769a341a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20468,7 +20468,7 @@ L:	linux-samsung-soc@vger.kernel.org
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

