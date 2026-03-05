Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF602C026F
	for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Mar 2026 06:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772691120; cv=none; b=thmWbgVw87YO2ENCV/At2MVQUyiJYL9yyQc2PhX7G9DzsfoPc7hHYpfvNn8D4NuTOLS797pdk2VwffpKhN8BcCWmH1CNxeXuB+Kds4Rs319hvyXYqrLyF4XUGLGdSqISFtnGP8tf2BsGNLbCV0+jS5zFkP1br+Vo3TKhYE+1Q0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772691120; c=relaxed/simple;
	bh=tJrLoF1/TtxkwElfBX3P0k+hH3QFKNVAem9XW3Pf0N0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WF7LLDjfjw18hh+QYo2Eq3GF3iQbKfsuIjpvLKW7Rc3KhW/ZyeQNT9LBzrwuyP0EvxPBXjsENBKZRR2y69CFtwE4A+zj6A25XC5TEVO4YmVF9tNI1dxA2vympp92pEaf7FKfU80/OeHOrqP/oBmVoMX9Ij4KJ/hRp+W3ybicfX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zbHwmyTb; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zbHwmyTb"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b7cf4a975d2so932732366b.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 Mar 2026 22:11:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772691117; x=1773295917; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZQtOQFVrniTIH/jIOVZYrUmJOb+M7nuCmtE/30pbV54=;
        b=zbHwmyTbDIJGeCa3KvuWsUDVZMahmgye5OBC2/axSu668t7/ZbhSpFiO4y2MCbLVy4
         yHjV3weD0hw47Z+oZkb85jTHyS8fY4j8EM0EaFwbybpSSHzlXvP/hrFUfSCBrx38MHcL
         iiiBqnlID46aCGFBlv+KLUPLsTGp0WnyRutJHU6AXOxnz0tOR6wyPzVM9U+q6YGIjwif
         3l1a8vW/UzLRJ1KD1ZXF8K5yYkPmTmVvmL3nP82BJ93CTW2ZE2+gKbzjFgzJ8D3+Ibw4
         S4weKwr+buVdiKrATaiGFFBvoDFt9bUiy3aoJDSMlMOgnse27sQohnWFGPLS4Qkxwp2K
         7czg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772691117; x=1773295917;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZQtOQFVrniTIH/jIOVZYrUmJOb+M7nuCmtE/30pbV54=;
        b=HKMUhpCNlNyu48UdjheoRGf3yWlml0YCFsHbnQzh2+n2NxrsMI6/vxU+xC2yTG6p6D
         EYyPtewnsxNMR2WSl0fO/42tSE+rHVNkk4JNzvygBpt0vDa3oRydrzmsc2lOt2kHys0I
         ctbi0FdjO9KSdjDnR7E/mi86dzcPGRvrMx1z4S9O9zDDjDDGZabT+VSSsazhles7Jvxo
         U22DRV1jhV6PMjYkZO09/gIKlvQWYdzWCGVQHbK0i5c6rGAmalk7jYz10NOulya2XUY2
         rmvSdTEyEB1SLrCFZrMuB23pQNMGpebcJBW5liXJdQEPmgRxPpEOwUYumiZjcfNrTEvS
         dNiw==
X-Forwarded-Encrypted: i=1; AJvYcCWR52ewWH1ptpbmQhFDTuiHgo6//RQj1sys7m1ynmhQMgiFqC6VE6mg9XHL890WN4sg6OBF5db4p11M/VMr2W+mzw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQJ4tX6NF+GO0vOtvfe38LhpVkbc9Jz/W+5E0P25TdBg+M5adP
	cIBcy7Ub4INbYcvLb3zHRs5frnNu0FfDc//QZ228rx6JTVXCVDP/DjtO/lwRFBEYuUk=
X-Gm-Gg: ATEYQzyNwOcr1Q+LcXX6lp1Utzvy2yV96jwLoum7ZzyjaAb68f826INVB8tAvm3mOKm
	goWO74hRWo36hG/Litu89pYSLI4rpZjhlRCc/1cMKiYG4vD4bu1qFfxS3W+00JLdy+jwiAvHPfO
	KX3EWIQ3mNsJd3+KVFRBOk9IegDoxfs9lD2NBG0c3OEfQmqgp30n5/RijqjszWEGe+CyD8iEOJK
	zbM8gI0X4KBWNeu2K4DiBSJoWGuLEZt1UlLFEuTjmccZI3TjVFuSVlKrg5nEF53iTDQgXPiRCTm
	O9RxwfVwEifV6D/bmK3wd3udZZrJBWY1SO7szf372yF5CEhsMaepvg1BvvopPs1s5nQHrDS+j+s
	KYIjky6REa5fRp3XNhQBBuYFO48rTJr23nz/Flyqs1mPrQwCNcwdz1o/sZcjt6ivYqXncq/lyEq
	DroSixdj0x/SEBiKvA1Uz/mxRgIUPHn8jZd++ojkA8EYoD0EOGpVGwaHyaNmbInG/0zvxWBBioP
	uetNZT16CzK964=
X-Received: by 2002:a17:907:c11:b0:b87:fad:442f with SMTP id a640c23a62f3a-b93f1467ffbmr287511466b.42.1772691117024;
        Wed, 04 Mar 2026 22:11:57 -0800 (PST)
Received: from puffmais2.c.googlers.com (221.210.91.34.bc.googleusercontent.com. [34.91.210.221])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935aec3243sm849355966b.53.2026.03.04.22.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 22:11:56 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 05 Mar 2026 06:11:53 +0000
Subject: [PATCH v6 04/10] dt-bindings: soc: google: gs101-pmu: allow power
 domains as children
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260305-gs101-pd-v6-4-8cb953c1a723@linaro.org>
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

The power domains are a property of / implemented in the PMU. As such,
they should be modelled as child nodes of the PMU.

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
v4:
- consistent quoting using " (Krzysztof)
- add samsung,dtzpc to example

Note:
Because the properties added are 'required', this commit breaks DT
validation of the existing DT for Pixel 6, but a) that's simply because
the DT is incomplete and b) a DT update will be posted once the binding
is accepted.
It is not possible to write the binding such that it supports old
(incomplete) DTs in addition to the full version, but as per above
it's not required to keep supporting old DTs.
---
 .../bindings/soc/google/google,gs101-pmu.yaml      | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yaml b/Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yaml
index a06bd8ec3c20..c1ee9575092a 100644
--- a/Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yaml
@@ -16,6 +16,14 @@ properties:
   reg:
     maxItems: 1
 
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  ranges: true
+
   reboot-mode:
     $ref: /schemas/power/reset/syscon-reboot-mode.yaml
     type: object
@@ -39,9 +47,23 @@ properties:
     description:
       Phandle to PMU interrupt generation interface.
 
+patternProperties:
+  "^power-domain@[0-9a-f]+$":
+    type: object
+    description: Child node describing one power domain within the PMU
+
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: google,gs101-pd
+
 required:
   - compatible
   - reg
+  - '#address-cells'
+  - '#size-cells'
+  - ranges
   - google,pmu-intr-gen-syscon
 
 additionalProperties: false
@@ -51,6 +73,25 @@ examples:
     system-controller@17460000 {
         compatible = "google,gs101-pmu";
         reg = <0x17460000 0x10000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
 
         google,pmu-intr-gen-syscon = <&pmu_intr_gen>;
+
+        pd_g3d: power-domain@1e00 {
+            compatible = "google,gs101-pd";
+            reg = <0x1e00 0x80>;
+            #power-domain-cells = <0>;
+            label = "g3d";
+            samsung,dtzpc = <&pd_g3d>;
+        };
+
+        power-domain@2000 {
+            compatible = "google,gs101-pd";
+            reg = <0x2000 0x80>;
+            #power-domain-cells = <0>;
+            power-domains = <&pd_g3d>;
+            label = "embedded_g3d";
+        };
     };

-- 
2.53.0.473.g4a7958ca14-goog

