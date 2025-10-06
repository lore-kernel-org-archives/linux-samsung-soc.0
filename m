Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AEB42DD5E2
	for <linux-samsung-soc@vger.kernel.org>; Mon,  6 Oct 2025 16:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759769013; cv=none; b=lMw0wpeWW8OvZmEkTNEazxsj/kA9I2fbFUajzNCaYyeYdeMlQTQtParIP7vl0IG5lmeva/+gpOIar8K4X3okWl4OwRxEOZEicoelqdKGbnayj2FzkO25Th/p8oR331mJtu/C8EEPArQsjFRdBKnWhzrVJrRlQFtZsoQ1h/JF0Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759769013; c=relaxed/simple;
	bh=wLNu+/DsN5vQuzcNh6XEOEj8a//dvPEfokNHLsVRk/k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GbhNwAuQOkjm/iybmoc/TpG+tK4E1IYqph3P9reE44wzxlLMS+aPwfZ90cFxDYG7mFoYCThHuxtknDUl4Q8PEFdpzXZYJ7KxouKau0wgRJat5fTUUBSfzIz7l7tmYCA5FtPDrxdFy2qW1N7kHtQU108ADCMAZswX8taiFvRfBJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eORaqWC6; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eORaqWC6"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b3b3a6f4dd4so960693666b.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Oct 2025 09:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759769009; x=1760373809; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cRXbXMcdQaybVyL41swV860lNNbaXOzw6nia42KxTE0=;
        b=eORaqWC6L/7zu+5Qkr2CnVg9Hjc39/nT5r4jLMYGoKL4VpzOAMWtZoEQJZf2CJOUbj
         OMXv725KUHuNDI8da4Gze4W1KAoYgE9sqldwLxJg6RGtSf7SHqRy7hZPAsCeKFFo8gpb
         Qwp5JQ+cUIZxAiqWLovkrs7n8Zj3ZvKQrl5s1QtOiXyblh7KQLOMA/fe6dLpjuSuppGh
         6Zi2y7xcEQ3RVy0cmaiE0HSHHnyvo/OqBSA3X8xDTVgFfRrl3Dkx+xUrU1kZ4Yl8tNWe
         y6VCC6kTYteCtjfP6rawCuv2o+JbsP0NdazrbS8/72UUZO08+irLYKeld6OtBQfg+6BA
         10hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759769009; x=1760373809;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cRXbXMcdQaybVyL41swV860lNNbaXOzw6nia42KxTE0=;
        b=Nm0ladthB654eNfbuOx30jVCjOpFFkTUQZCFT90MYYvrRdG2KKML7eppnEodQilNJ9
         EiWEAuuUOQseA0kGCBw7kb8GOVJlDRgldgDBFmH3f+dVVbgZVwXy5TpCoYAgGBy/rkf7
         RtkQZv73hcT6t11+MJ6j43EyXWVgYwoVkvgxv+QvV8+EmRG7J8ewf+Zk3pxYia0qof+c
         v34Id6zCi5vG+PyO9dBB2IsL14bSSTwycv5rdDTMrhM8dAmUlPRB4TBp4+aHFg8xsA/z
         wnevJ+l14C8k4OLuqJZ0iiBillAXRiRmkob2LYh9jqzP7bhtGknKq+prbgonnpk/whQj
         E0Hw==
X-Forwarded-Encrypted: i=1; AJvYcCWK1HqYQ9bksIvAd6bi3TTCQfEzlHhGECrCYd6usS/+ZWkAff7ljkL/xvUqFGB2c/NpJvdvNx5GC8sVBAJ8t5tEDg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJw4i72CzuWG3wEyjkV/GQnHL95TpQHZy/eOBGaI4FfCiPIDtY
	eZZfo7YbQDMANgEGmTTubWnLoLmgJNyUtT/m8KbacF6oEIbQ+uljPbuxL4McvXP2WmI=
X-Gm-Gg: ASbGncsrcwgLxjQpl6lR62HkXGx0P715nyb+6mWZZkXGJE+ZZqzobBZl800RYKm5qLU
	atjdiX5uYkFh736lAifM2cMh8B8AkMfopjpgZGpbZhB1MM5B/iuYQbXJ17Jmy4M/NSR+iT5XJiQ
	d+oEIfZYjpHTdFJAru6y/qaXl8H4CXgQ9k4NXLeQIZieIu/O48GWYLYpOE8klTVSULijdaOoFwQ
	2jTGgcwJf2O4tX5cmKYZJd7RTDrkO9Tg1soJ6q6DbVUc3v6H+xydxlBJ0RycPKUnp9p1K4s/uFr
	yasIogB3V9bMfIorzKRIEEGR1r9EywVTtw5Z4O+dvjovSsxZi6s7Yg+wbPXxn7Bem5RQRcLrkxv
	8cPvUhHyjdD9KjCgSy3nCGxetl2GAHfM8pyhyOKsTq+uUY4BcTZdtDPxme7hdEVU5MDOF+DtaUE
	w9IVmSBdORH/URn2M7oR80a3CZN5jbMEPdraxPur3f0DNGAHpAT68=
X-Google-Smtp-Source: AGHT+IFevyytLGxXOVyUvp2iRJsBS5AIBa1K8SbZl4T99bvaj+wJPujm9cyg6wpDoYz18ydBH9OBMQ==
X-Received: by 2002:a17:906:c108:b0:b45:66f6:6a17 with SMTP id a640c23a62f3a-b49c429cf5emr1502398466b.45.1759769009323;
        Mon, 06 Oct 2025 09:43:29 -0700 (PDT)
Received: from puffmais2.c.googlers.com (224.138.204.35.bc.googleusercontent.com. [35.204.138.224])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b48652aa01esm1193841866b.2.2025.10.06.09.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 09:43:28 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 06 Oct 2025 17:43:28 +0100
Subject: [PATCH 02/10] dt-bindings: soc: samsung: exynos-pmu: allow power
 domains as child on g101
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251006-gs101-pd-v1-2-f0cb0c01ea7b@linaro.org>
References: <20251006-gs101-pd-v1-0-f0cb0c01ea7b@linaro.org>
In-Reply-To: <20251006-gs101-pd-v1-0-f0cb0c01ea7b@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

The power domains are a property of / implemented in the PMU. As such,
they should be modelled as child nodes of the PMU.

Update the example while at it.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
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
---
 .../bindings/soc/samsung/exynos-pmu.yaml           | 53 +++++++++++++++++++++-
 1 file changed, 52 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index f0fb24156da9b8980dcfd5339ae75f12a71cf6d6..c2db1cbb969a9a6fea5208dc2990f2144fa480e6 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -93,6 +93,14 @@ properties:
     minItems: 1
     maxItems: 32
 
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 1
+
+  ranges: true
+
   dp-phy:
     $ref: /schemas/phy/samsung,dp-video-phy.yaml
     unevaluatedProperties: false
@@ -138,7 +146,7 @@ required:
   - compatible
   - reg
 
-additionalProperties: false
+unevaluatedProperties: false
 
 allOf:
   - if:
@@ -201,10 +209,27 @@ allOf:
             enum:
               - google,gs101-pmu
     then:
+      patternProperties:
+        "^power-domain@[0-9a-f]+$":
+          type: object
+          description: Child node describing one power domain within the PMU
+
+          additionalProperties: true
+
+          properties:
+            compatible:
+              const: google,gs101-pd
+
       required:
+        - '#address-cells'
+        - '#size-cells'
+        - ranges
         - google,pmu-intr-gen-syscon
     else:
       properties:
+        '#address-cells': false
+        '#size-cells': false
+        ranges: false
         google,pmu-intr-gen-syscon: false
 
 examples:
@@ -231,3 +256,29 @@ examples:
             #phy-cells = <1>;
         };
     };
+
+  - |
+    system-controller@17460000 {
+        compatible = "google,gs101-pmu", "syscon";
+        reg = <0x17460000 0x10000>;
+        ranges;
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        google,pmu-intr-gen-syscon = <&pmu_intr_gen>;
+
+        pd_g3d: power-domain@1e00 {
+            compatible = "google,gs101-pd";
+            reg = <0x1e00 0x80>;
+            #power-domain-cells = <0>;
+            label = "g3d";
+        };
+
+        power-domain@2000 {
+            compatible = "google,gs101-pd";
+            reg = <0x2000 0x80>;
+            #power-domain-cells = <0>;
+            power-domains = <&pd_g3d>;
+            label = "embedded_g3d";
+        };
+    };

-- 
2.51.0.618.g983fd99d29-goog

