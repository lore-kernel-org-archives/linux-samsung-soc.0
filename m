Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F2C334372
	for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Feb 2026 21:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770327756; cv=none; b=sFx0Ze9Y2mEsr73AnKNgZDquwK3JXjW61m8vn116vo7KnREsyDNefWyy2i5w/B0AHVropIls0BOyOxP/UHaOPX95PMTvSaW5++UaXZwVMveNh7EurVNSZusSPp6z7lHiIylGwKlbIUvyS5ljANncahOMfWqCAU4kkcVakTS0vnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770327756; c=relaxed/simple;
	bh=eaNC1+5x3wuB6gQAu1fISBSlg5hm+mSHrOAzbV0/Wwc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=obFUASGd255m3hJIhjdtHuxC63d4x3WYDBcy38SIuOH7TT3vU2lfXS3uOQaNsaPXelM/3efsVmtRIaoaFoHpJvyifgIVJoMr/M3zAO9HfqPLBvUcF5HER8yHMv0r9m/Ufowhe6TZMfzUfaRP2bNxx/Zn3L7H7vFMgmqOTzaBiXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vqzo0BS3; arc=none smtp.client-ip=209.85.218.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vqzo0BS3"
Received: by mail-ej1-f65.google.com with SMTP id a640c23a62f3a-b8845cb5862so204175766b.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Feb 2026 13:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770327754; x=1770932554; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nvcy5crOR/n7O0iVn83ybwQmabvZYx05b4AZ55A+3Wo=;
        b=vqzo0BS3CzKMThvUwGReI1soh6GVu7a89Izs9KiVr6CEwSEjwD1nUL9wHmoBOtgfEc
         qKxHZTYPk6Z//WZXcXIX4QVDrMlauMW+KK5CGLNcAuPhojEsG16Mgd1+KoZj0vTMx2tU
         xEqdvd7+uZMguZqk8Tqm372s0z18sdveHIKnUXVS7iXO5UqSaYU/u3xW6B5VfAy8aPbb
         20owbKilnQaJlzFABr9EtoskqUeGc+31Eigob6QRK3UI0ojLbUCjck9UkFMCE66FdyMj
         Q6Omj83koxEJZSv265d6HRcP0jwaiBQIrX1iX79h7bIyX9w838WoIVFScKoQjbgyafms
         Ep3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770327754; x=1770932554;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nvcy5crOR/n7O0iVn83ybwQmabvZYx05b4AZ55A+3Wo=;
        b=RgE4jcdtX/r85mn6d0E+oddO5LE2/p2JBugg+0JGgogKydIk3Oa4nxX4/QLLF6X73X
         woFEg9ly6iHVZmVgKRnVB9MGuHuX43z5IkRUIYhv4H2+34uJH93P7FArM1r+3pVdzDtD
         wjsy2yy4PiHqORvnswDcO0br9ovpSQqdf4I2lNxaPV2HWPRYFh0T7kf+FytSM171IU0L
         jKGsGBtI6oNpVdBIQn8sVV7tM01lKHcrIX45mSFkptSee+08YlEbeoRbxRoMjoOk8eD+
         LYtsCKtjsyi7JcaIxk8SmlnaYIjriNTu+vYds8tQBkrAvotg7kY6/ugrndCOSxrn4RIi
         psLw==
X-Forwarded-Encrypted: i=1; AJvYcCXKtOjLznj/dZ0qRXnC/EoHRWIht1Ua0J3uZE8S1U6S5nlJLUWEq+W/fdYhP8U/+PMDe7PSkkaFRMgVnlbOkd6+Xw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6MGWeRj7WKeniriV4tqyYkT5RJLwYHzVfXGziUpBUVNbdBIaB
	c3ld5u8FrYr6bxj5cFpmmwc76DizokeJtWxXPOMVrKZE7RqIZ9PEeBK5/ZOFP1mOoDU=
X-Gm-Gg: AZuq6aKCRi1efu1A0oYC8L40utLpZA6ggiEVykibmyZd9ubbi6qHGbl74QbF88xB8Wy
	8Zh87biHAjRr80f837Yt7uepmH6DQDpqz+nFmRatexGktf7PdnHk9POYy5jHQ2wxqAMkqL6D7r3
	+KPkBQ0Ded/MkpefAq9t3qxmlRVM4X0UruMcOV+4fTxY9mVaQGTRSmXtHAyQoOIwdxF3ykq7b05
	bQBWUr7TtAC1z2d9oGu+vXxVRlVui28mrH0BOYB68Mywe4v4ZN1xIznGqPYBgdjhtHiT1DLWeRR
	sDPub8cSQZqowhPit3EixKh2nCAsCKowxaLCBrquHPoNAXm0Wnv2R02z98xB/t7f4kqWIU8RFQ/
	LoOSZ2ck99Q7sfNHseo7cd2dEzYEdtsB/PvrdtEFA17ShYKrx2c24fq5lee5mtHXOp52H6CQXr1
	t+rulXyvUbD9O4koZEroE466h9pmxMy7RkIf6mHJWf0A0QfaOKpzQvLMCQVd6nqTbPR94Kx96/5
	XR9mQ==
X-Received: by 2002:a17:907:d8d:b0:b88:6dd4:9ca0 with SMTP id a640c23a62f3a-b8edf49d98cmr21661166b.64.1770327754366;
        Thu, 05 Feb 2026 13:42:34 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8eda7a0074sm21859966b.18.2026.02.05.13.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 13:42:34 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 05 Feb 2026 21:42:32 +0000
Subject: [PATCH v5 04/10] dt-bindings: soc: google: gs101-pmu: allow power
 domains as children
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260205-gs101-pd-v5-4-ede49cdb57a6@linaro.org>
References: <20260205-gs101-pd-v5-0-ede49cdb57a6@linaro.org>
In-Reply-To: <20260205-gs101-pd-v5-0-ede49cdb57a6@linaro.org>
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
2.53.0.rc2.204.g2597b5adb4-goog

