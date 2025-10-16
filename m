Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98EDE3570B5
	for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Oct 2025 15:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760630333; cv=none; b=RQMiIsYfE6mCIgBG3NgtBBv9JCG0S9MZnYZtIzi7satzUDz3PBL162ybY5BCcNF6HBT91rFvuZvP+01mv5Q1kWjgc/7LAgNuQcCQ67y2BGZzH9TmKTx5jl1CBbC47Ht8z6Lg+NHeFQh987U4G5HLiV71KXNdp+0wsgfiQHGMXAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760630333; c=relaxed/simple;
	bh=yje7DjsIFhOq220Z+6NhYIgkw1TYq5z3ouqumPOvySU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B3T5+XbBJ5GNtcSM2Q2fSOdmMafT7Oc5U/tB9ZvkYHHgzFrXUg+vEf0rL8lWdXbFHtjYltlx+mD+i56kllmQdZOlZgt532fQJlM5iDwxtU4v7YJ2REJvZW7oMXz/UQKcJe20SuUMhwnAPH+yV6AJAl7ppznmMBtl2gJSvZ1Y0i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j3Bvuzdn; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j3Bvuzdn"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-63bdfd73e6eso4042994a12.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Oct 2025 08:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760630329; x=1761235129; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aAQW91aNDUliYu6xIPIKkGd7wbQwulcJzXF5XdkzCOM=;
        b=j3BvuzdnvqWPDd8yiA4m+Xl8pwsEGv7TBxTlF8kTdCz4eJ2JKAVlTP64L6Zpn5GVG3
         H1fCqEkntxCHhxifXISG3cOgr2g0MMARG7XB71EhAlyvWoy+vcJL8Y8qXYGs3tPciBt0
         YX4xu1aPailT2yBtOWvsedv+WtNkXuS0yDGUgk2EMVCUOMVG1qgf0zdvIsaVVGO2qJoH
         7lNOYNNkU4ArugsujC95C6R8fxUMWJKu/WXXQIYgs2ephTgYu6jpUGsUsiJyNG8TdoWs
         5jLW3L+zig18HP827ZUirg1aCtr8VEuGJ++oFKzuKQDK0/XQRXaa60eNkoZyCu0OLJ0A
         4GGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760630329; x=1761235129;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aAQW91aNDUliYu6xIPIKkGd7wbQwulcJzXF5XdkzCOM=;
        b=TQ5sx7zR48Hh8TrOsQt3PCIOgEQ6Q9RcylcQtICM3tnNaB1qDGzwUbHG+imrI2/UAe
         YE2qd+F4FBAzMeD8iMPhzlC2tDyuyJU6K/518CLwe5cBiDwxSV7rffNij4zIQxQjsMTc
         qmcrzF250Tr/+MY17ovyEuaPwL8AXCPdtkO7espEi/UITVG5F3k1y/osUqhQ9QvUkE2z
         BByuc/hR7GHgrnDYl7/tQrI8UAAjIUZrD2xo3PItkqNo/VoCjwFJ5HQ5BGUpIu5D22Jd
         E1/Tua99hYLbOGevF2ze8rNVSv+m9jOr85VQgV7q+FA1OpTncbhjHDN+judzjCuCumbt
         bq1A==
X-Forwarded-Encrypted: i=1; AJvYcCU/Fyg9hEuW23///vuaJrATJaoh1L30mCoaCqblR4T7Ss/cm3ePUyuTx/SO+sHxlcMEEkmbKYZo2vXIPeyjrbA9oQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl+AeWsBxYVrdsE3RiN/erTTG/L2awS2WJm6Lre9IIfn6FtFNN
	CognJl6NNSvk4cJVV4no6NChT9hhCNZXNMjXKN4rFqgdnLigPi5GcJXsrMAeIhj+XPM=
X-Gm-Gg: ASbGncvcLpbb9Y+Gn7QKnguqrUgnwT1/LQ3+RBmhehV4q5ihJepEqvabeCku19Da72V
	0+afJudX+i0Q73JYBYCWqRK+QwOM8TgASQTWjFz3GtkLBkM1MdhpFgxfIv2iBiY5Uu468EWX+Yo
	wUPbKYn0CIp4aOjCUd4P7YHb2BnTipxJQjakJ/LVLm+94Q8zJf48jBt3xM9HwuDl2Pq69MuTMY4
	Cq1h6UmI4hwNZVlELy0ov526to97VoB0xphFqXwsoo1WVfLWRNKdqxcnNjOCMnGN7HFLoSc3jHp
	ak5YmB3gg3bXt8ypHs701u+v6C9mjeagRU0Wxcq5ujNXaiv7dvezk92ardzCADLSMbwo96yxK5T
	rl0mNrXZxKm0/Pc++284DDegYXM7DORR5soTkMqpZiVmVR79Rd6xaqGj/x/Co6C4NOP2silHCHN
	sbkDfliZVr6HhN2DMLzLk0cPeOu7sZi0KWOSloVWcKustHfVahVbuQnRS4hdbP5/4cwx1k7JI=
X-Google-Smtp-Source: AGHT+IFwFoVlzrd3EzfRgwjFNULDxybArmFxvRw3PQFLU4BEOlEa5CBeY9fanhhp1MvTHV/cP8fhDg==
X-Received: by 2002:a17:907:3992:b0:b40:c49b:709 with SMTP id a640c23a62f3a-b605249d84dmr571454166b.8.1760630324759;
        Thu, 16 Oct 2025 08:58:44 -0700 (PDT)
Received: from puffmais2.c.googlers.com (254.48.34.34.bc.googleusercontent.com. [34.34.48.254])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5ccccb4811sm549021666b.56.2025.10.16.08.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 08:58:44 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 16 Oct 2025 16:58:36 +0100
Subject: [PATCH v3 03/10] dt-bindings: soc: samsung: gs101-pmu: allow power
 domains as children
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251016-gs101-pd-v3-3-7b30797396e7@linaro.org>
References: <20251016-gs101-pd-v3-0-7b30797396e7@linaro.org>
In-Reply-To: <20251016-gs101-pd-v3-0-7b30797396e7@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>
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

Rob said in
https://lore.kernel.org/all/20251010141357.GA219719-robh@kernel.org/
that this is a known limitation in json-schema.
---
 .../bindings/soc/google/google,gs101-pmu.yaml      | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yaml b/Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yaml
index f7119e7a39a3fe0a0a23d1faa251d356f83ba501..a24390f6d2a54afe1aa84935e03f719a62f4fc8e 100644
--- a/Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yaml
@@ -26,6 +26,14 @@ properties:
   reg:
     maxItems: 1
 
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 1
+
+  ranges: true
+
   reboot-mode:
     $ref: /schemas/power/reset/syscon-reboot-mode.yaml
     type: object
@@ -49,9 +57,23 @@ properties:
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
@@ -61,6 +83,24 @@ examples:
     system-controller@17460000 {
         compatible = "google,gs101-pmu", "syscon";
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
2.51.0.788.g6d19910ace-goog

