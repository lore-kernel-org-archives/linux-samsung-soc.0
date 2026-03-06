Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0DB37BE69
	for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Mar 2026 10:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772793002; cv=none; b=VkZoQH3zOkIc1RsLI6qZAfMVANQhnBu9MEWQdBC0237QY2I7c14IANeJxAQGrmm+DqL5ISHtG2hbrxcBv00mP8AxaNhRy2YWRDTHIu1imxDRPVCJKEGJ03f5f3IbIdlF0Fkyk3jUlmtsdu+2ZAFErPQiPqCrN3DMQnsfv8SxtLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772793002; c=relaxed/simple;
	bh=gEkS+KNCFb0DbKDNC52RYY6aT/xJwnLizD3yMfs/RpA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GzAkE8ojRKOj0qkFH8M14KaUvoBMyNyt52ik1znNahv6mmaXk33PRrs88AXYifYiImjUcnUhV15eHI0qo3Qf345XxZAEAOo83fCL2w4j0ZVLBH+Dc91CADziAak1YvTbxv7WSP2Lk6LDLONSyQlqdP/JXXxsWQgLTIstHszfacU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zacejEse; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zacejEse"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b9423d62cbbso105118266b.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Mar 2026 02:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772792997; x=1773397797; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bsgk7ZObqyZr/3jbiTlB5XfU/jafWS+xFJNQ3TVojOs=;
        b=zacejEsez5XKEYwcdnSN9M0+cmTz6cSMr7jO6/iSt2Kgn9c/XkERN7efuDnd9s6pDc
         u/isEHYn/csrdC1Kwk+ay3cdQYcR65wQ+3FcfHAcfHAe3cBjLFPHl8XsMfx0NKjTTLzd
         YH4wgeDWqkVFDsajhkJ7dCvZ3z4T/2rj3p3+AVbEkDA7cdvSvHMD7uQzqjVHKj1bpcK9
         QH5LAQU3ut/pmEKjIh8u51nooHLgQIar3vAk6TzYj2yHTBqBz7VlP9Je5Folxo6FX5Qk
         EP7jOLyBKCj6URoR7os9exnsqdy2UQxYiWr2QiYpWipsAPSQqox4g3FixM5nxlcnIdKz
         xFNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772792997; x=1773397797;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bsgk7ZObqyZr/3jbiTlB5XfU/jafWS+xFJNQ3TVojOs=;
        b=crVXTwMDh6DNKUD3xQJLla6MQjMhLHoWRZpVEkHlV/Hyw6Hsu688HF6s7H72zEXqL2
         W00zit0132gdWZvA7D6Vxa4yoeMv1X2FO+DDUHBw+/ddgyzgyJfSlpJXG7yUj0Sf1Y6s
         ALycWxLgdEJqTuUPu21fZm3HWqqExHTtUmDDQUnaBnVpHNhUIZ9rv0voSbg2kOvNF2+A
         83hn+KeceQMjZSxsiSsAl2aAeRAChVxey4G7MQHarL77TaUHj0BKq8VrSgnAFm31nNwM
         BNodyGZ3uEqxXlD6lkSkCa0PpxW2IK++1Olwd5/8VAQ0G/4C0wK0jWmhwedgzkDqgSiz
         uWcA==
X-Forwarded-Encrypted: i=1; AJvYcCU0wFc3180nCC8bk4I3KOYIxLZActzrmnfihUxFvp4dD+Uokks14BPNozKuD0VqqCKoDv8DOS5ca3780HER9sVdxw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6iwUSPQxJi20pZ3P3aL8tyT9bn4x1XZ9CnLw7NXgr9Z4S83lg
	llxFY+ZVGEa0o3qjLQk3qUg6cEqVGZGYZI6iCxDqEdQ5UGbrMxfYFO+xD7g+IusCnfN0/vRyD7p
	Idnr2Qakjew==
X-Gm-Gg: ATEYQzwsTcTCobeaV538qSCbolthXocUo3Pb9ErrZYpHOBArFb7kBcAEP2ss288tTBG
	9twTPQwbI7lzrneU/z//f8+yHqfnuBKwHC65rTD7AST9Zqjo5TjQ9f5QMn4FpabVr5gX8TJknU+
	3YOoVTKSw7GwilHTF37fOAeI7WpXea92yGDbFJL5VQShYqq3Tzj2TRe8vzxdGwXeTo238iqr4cc
	FM5WfP2LQh2x82FDc8mNzPnCQIErdHLlH1LMQe7gXhX036InDvOqVHFNxd5tO1miWRUhV1I3PX1
	Jh9LMKgwiUf6yv071YMky1rkBZSdZILnwmitFtqXIX7sjRPTyv0t8bSfFz1I9EltDWyA9PBa5F0
	h6QLedhtcr9tPUWdoEibEmw788nUtSj1XAbxRXfqg9v8bIKGRh0GkVDoHg54eryVfB+r66K+Cvr
	xJvrZwGaJ+6d9tdRVhTEHcpiXStml5mLpRUNP01+v934We4uwMh8Y5l+rfC5jvhPoauO6zalyrm
	nBMp/tzyfEF/zWvIDqYblWbvA==
X-Received: by 2002:a17:907:8690:b0:b8f:c684:db28 with SMTP id a640c23a62f3a-b942d06f624mr92068866b.12.1772792997027;
        Fri, 06 Mar 2026 02:29:57 -0800 (PST)
Received: from puffmais2.c.googlers.com (221.210.91.34.bc.googleusercontent.com. [34.91.210.221])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b942ef8c95csm42907266b.21.2026.03.06.02.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 02:29:56 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 06 Mar 2026 10:29:55 +0000
Subject: [PATCH v7 04/10] dt-bindings: soc: google: gs101-pmu: allow power
 domains as children
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260306-gs101-pd-v7-4-03f7c7965ba5@linaro.org>
References: <20260306-gs101-pd-v7-0-03f7c7965ba5@linaro.org>
In-Reply-To: <20260306-gs101-pd-v7-0-03f7c7965ba5@linaro.org>
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

The power domains are a property of / implemented in the PMU. As such,
they should be modelled as child nodes of the PMU.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
v7:
- really be consistent with quoting (Krzysztof)
- drop invalid tested-by tag (Krzysztof)

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
index a06bd8ec3c20..dfe6f87e5949 100644
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
+  - "#address-cells"
+  - "#size-cells"
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

