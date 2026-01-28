Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00B530F52A
	for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Jan 2026 16:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769616659; cv=none; b=ZXcVkk2H9nQK1Z0SkCE628A1+NnfDpHiQcNd7XVSLWObyd80v7zvdE4Nn7OUqaiY5xrLhvDa1YSJOVpSmIh3Rff9L3ZiOb7F4f6xQVO7OVnPGnXlrmpPxjWAKDIW5PqdN6WS1beNeyv4D3JMQtuykpAo/z48BlL5GL1x9m24QfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769616659; c=relaxed/simple;
	bh=wjPITGHpFGOjs4GBxlDoptuom/l/Q78c7MNS9UVGVac=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=An9df4X7gUKsVbuh58AtcP3s+B5JUSlhNSgb7/GfAxfvHN6MTx3PcWhWZXzKRskFXgdB9CEOelUMUAZsX/s+mWG5LLrC4XjLGY+r8fGp8SW5Smib0hdmB+Ig3J16nakRdChhztHHfUH2RT1ENlCiqWQqn3+Y/4cSlSSwNFyvTwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=z4piCGdm; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z4piCGdm"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b87003e998bso181796366b.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Jan 2026 08:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769616655; x=1770221455; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CYVOKvbh+cV5QpKAWjih0XGIXXiGAQB69mHgAD7pq/8=;
        b=z4piCGdm8kMXQje7iWnuiESnv1MNEkLN6vKf/Z6CJxP2q1h/ziIPp1b93mvG0sxwYh
         CXUhtJwMKVFOlOO7ZiMfWRZjQT734pAiquV1jK52NyFGP2gsSKScX5FSp0K0JrgFYkmD
         w0VHaD2cCvPzKD4J7Essgt+UcHKbirud69CRSIUeUoP4Z0qiYK8ZD8HaPDcaDq3laa4h
         TGDZZP0kw7b/DPf432YoxfKFE7lUE4/kQn9mFgjdaV3UQ34sT4shPlpjUgBMfMl5Etzk
         KnBKYZiz9wHdH4idzKJZiS9/uwlPOSWUvWDtk0frKy8NFg41IaedeKXeKXGQPYxueHnQ
         rr5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769616655; x=1770221455;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CYVOKvbh+cV5QpKAWjih0XGIXXiGAQB69mHgAD7pq/8=;
        b=Rrh2NbmQGDvLSrlHpLCcl+Si8nuMiEvGC6/aJa360KPkGax/kQePa8CCLKrh+HKDnu
         dj44lHh9fbNgsGjGZSTlKknDett0SmshIEND8NGMT/n4Q+XaGLQlKbAdt5wZfqcVXgKw
         tUxevaL6zv9Muu9qcIeElGaKi9xbaokfBchB4AKB+ujdymTa1bTBjEsReHMMNVwQEUy9
         veKPjS+jswcwdLHJ+SLeL3N0HReBw1yekn0MRz3wJttI0eQz5TEzWss8AT+PjvgYeoSc
         0xoV/qP0Mlfwe1wq7brguSBwvHeIRAm8+JNG8P3Cl0av6EH0AWWJeNyKJbv3ukDEljfW
         ovXA==
X-Forwarded-Encrypted: i=1; AJvYcCUARA2gGc4l4EVtYi98wq3+SL5J55ZxWByb2EmLDDxP44Z2kzRmIge3uTnY3W3LeeoL+nOtt1tkpnCmFHwX1ejCCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOUykhuGfUb4XV91hBcz5EHZ0Aqjw4XQsU14JbBE4tZkRmGHnM
	VkKmp/iC2VAFxnv9X+mIbH9fpKqoLH2PvhCpyEluhl+rykkvhLkaR6jDwDz7LZzkW2E=
X-Gm-Gg: AZuq6aIkOQVIcMlBfBFZwnkx7vETLfjkKnCfr2CbxfFL8a6QF2zNLgPxgq05zXbM1e7
	xSG+vbTAE8cxbjKedcUh/U4Lyy5yBZL/HigzIck5RkL2U3t9Si2TX46U5VoNNe1pQk6eVigH3v0
	V/xUlR8jYsKHOp45fFXKxTuXsdoeZPpYId+Rw/uUFn2t8bzkY7goHQHbQb/aAOy4iSJ14W++pPl
	h0CXA5q079BwgX2lzJxeM4I/ih0EvTBly+yedrZqqzXmGatPnzLRquZW46+McHQ6DenLOx+ytJk
	gW1Z1piU5h01B5mLhUGA8sZK6ed/wDwjB8wIeoWbkW/qxhTZpsQp71stm802psVaR9tZbpjpUQf
	l3gfZz1pBDkJCnrDHeMZCiwvP2uV8MPqndqCKPJljRWlAjOmcZPfktK9lVw3cyZCh8QjTlJdQ/6
	Iu2ysBE/Sx5m4sYfnAw3PBjp/fPK709S9uwIfXuas/ClVtgVUzxq1oUTKd6E6UsnnuVWzmQUf/b
	tZ5Y3jpjwmnFZxB
X-Received: by 2002:a17:907:3f21:b0:b88:20c0:d37f with SMTP id a640c23a62f3a-b8dac9aacf6mr387798666b.9.1769616655313;
        Wed, 28 Jan 2026 08:10:55 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf1c021fsm148553366b.49.2026.01.28.08.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 08:10:55 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 28 Jan 2026 16:10:53 +0000
Subject: [PATCH v4 04/10] dt-bindings: soc: google: gs101-pmu: allow power
 domains as children
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260128-gs101-pd-v4-4-cbe7bd5a4060@linaro.org>
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

The power domains are a property of / implemented in the PMU. As such,
they should be modelled as child nodes of the PMU.

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
v4:
- consistent quoting using " (Krzysztof)
- add samsung,dtzpc to example

Note: Ideally, the newly added properties (ranges, etc.) should only be
'required' if "^power-domain@[0-9a-f]+$" exists as a patternProperty,
as they're needed only in that case. As-is, this patch now causes
warnings for existing DTs as they don't specify the new properties (and
they shouldn't need to). Only if DTs are updated to include
power-domains, such an update should also add the new properties.

I've not been able to come up with the correct schema syntax to achieve
that. dependencies, dependentRequired, and dependentSchemas don't seem
to support patterns. Similarly,
  - if:
      required:
        - ...
    then:
      required:
        - ...

doesn't allow patterns in the 'if' block (or I didn't get the syntax
right).

Rob said in
https://lore.kernel.org/all/20251010141357.GA219719-robh@kernel.org/
that this is a known limitation in json-schema.
---
 .../bindings/soc/google/google,gs101-pmu.yaml      | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yaml b/Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yaml
index a06bd8ec3c20faf0b364d3d3ef1763502c2b09cf..c1ee9575092a3ab17873d228a88468addb62d838 100644
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
2.52.0.457.g6b5491de43-goog

