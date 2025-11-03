Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F241E31D73F
	for <linux-samsung-soc@vger.kernel.org>; Mon,  3 Nov 2025 19:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762197290; cv=none; b=ZgiN0kARBw3kgq1ROdAlIyqRDt5f8uLkHXRNIjnhFDLeToaiBov+88yULzBltB1wmPMT/wYWG1LN9L+CMBhXDTTh4wVnTedvEeY8lzm5aoCXGd7N3aJkNA8lohPf2NmQmZd2+Lydw0m6XH6NTJ0qNcRmX0sj2z9FZUuBI/QjRtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762197290; c=relaxed/simple;
	bh=9sAYfR8Q8tXsUci19b2cN9NhG0oDMU3Ts7x6dco4kts=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TvAV2kxms9fI4vOpmjSmZ+HsJ4BF4DsBggOz8Sbq92byfcD9RxuqvoRugpsWfP3GIG/eDJIpDg+CVUA+s7n0kG/rlMf4YhjFpfvmnHdWfhZ8yQ5lc21G1r61xy5/dfrg++2p9xwS+hUP88CRjKfwsCxgq4UWCn9GvZmRK7ufBJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xTSzM+oh; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xTSzM+oh"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b7200568b13so55948966b.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 03 Nov 2025 11:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762197286; x=1762802086; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XdqXlFzErV3w1gdAJhq9NKzHgWAXrtoJ/uLRhjCa4XA=;
        b=xTSzM+ohMEYLjVTErqnIh7FvLpoFU6entX9fKnuGIB3QKjQDIPeD/FOH2LJaiH0ZaV
         BCux4aahXTLnOCBQt/93ERoC/s9Zk0VP9aGOGmDVlGXABkVnG7XXCC++EIeefrqwucIf
         TXB/E9eMqslKThkgftdm9PpZXt3Zq+5KyWabpY8+8ymEIubaYqGm/i9R09EHe2KAkHsf
         ga7foCJjjKxh5PST+Xs9Qydb6ltes6pUTZXEXUuDV01rxxhmLlRmvWxmUwxJQmEXAje+
         rRtN5ULJfrfZVA0rjt2mYnhTTlIqNvvk/+ZL3bFiPK2YQlBTNWTm0DX+if3ePi9fBMHW
         yDVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762197286; x=1762802086;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XdqXlFzErV3w1gdAJhq9NKzHgWAXrtoJ/uLRhjCa4XA=;
        b=IJexeYSDD10CWx5Pz2suXDggZo9dOtZWxYb/0nU9g9hL8d2ZVj3hBSQG2ftT6keGvQ
         fQstK/OfZ3Z95srs5nIEYIPWQhHEMh4aztJ52JgwyNeqUSA8TX7mn0bnQa2WzTnfN6r4
         gJU6IiqiNIZ3/BijpdzIx+Y98BEUOpj4tIhLlJ7AO5H/pIUQ7Z49eWZpdiH9eY0uHMcN
         GFNe2vLbIUMumSQP0vE3us+4wIoC2COoW6dTDSCjvvFdl8TYo7w+VaYvu6S3BmgYEgD+
         uj1fEEBtfeC6HfNKXZ9U+x5ymwytkdzdnpgw1u8lPJYaTaqJHY56HVKY1etXT5vNI8AU
         ZBrQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5YoOufP1cijbvWpnSPD/3UN6BLu1DMKbrJY40t+zsST+LlI4DzaWPDzCOGopqZ9V5ExNIMSeLNDxFN1ZSv6jxtA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwRlRr+sF5fi0uDDOMtJD3268JIHAQ/+UwkEqEiZYsOcgRJWFue
	LiJ5Q+WJ5Eh13XIMsFXR37qJSUdA1+KqYJ2KDQagqX2/B7IGAyx1JdZnRkKt03c/1b0=
X-Gm-Gg: ASbGnctm+UrBczsG2vBrGirz2bBsMjVXHPPsmkGofoNXPV06zgkX/jOgk1mqidwOnvL
	yeaO2+FSuIHI3PcFjjIusi7ftvA0dKvj6ZWDIeYI3prp/Re0PYH5Zv2KfcnqT4j7U3m/DMYfOqC
	YF/4nslOjccQEPVG3im7S6oPR5/etZydnV0O3jpwY6l35N/ACab7LXRajDBVyBjMyE5ntQaLH6O
	5q9FD9PFzAbaKSocKIAF4NEDygv3DDZ5DZAftrNHzixZc9wl2EGf9KhY7BxnJe/T94fr45RflJT
	A79ACxVHG/j4cuWkylMrZMRxBWU3fx3Waq8RYeEZZ6uKkJILQtCTrXT+gbNxFW0Iius2Y7pBnkT
	ys0GA1qPRawuPDEe5Rz0vzuokG9KoJey5UjVSwZmiAsVBqpu3ZwPcXrklQC3eCLp+VdyREfs8cv
	RXeOB5sEyS747Vhn6/93uxPHHjebBt7x1yAHZ01kQQz+p+ShosPGk7VnbmjB0YvdZviTfy0B4=
X-Google-Smtp-Source: AGHT+IHclgdtV1uDsfGuUcwPrRCIxl9xPHteVOU4tXngK3Zyx/wOSbVCBZtl6qbOcWI1F2xiRNExRA==
X-Received: by 2002:a17:907:3d10:b0:b55:c30d:c9fc with SMTP id a640c23a62f3a-b70700ad6cbmr1282704366b.11.1762197285873;
        Mon, 03 Nov 2025 11:14:45 -0800 (PST)
Received: from puffmais2.c.googlers.com (254.48.34.34.bc.googleusercontent.com. [34.34.48.254])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b70b9f29c8asm466765066b.8.2025.11.03.11.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 11:14:45 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 03 Nov 2025 19:14:44 +0000
Subject: [PATCH v3 05/20] dt-bindings: mfd: samsung,s2mpg10: Link
 s2mpg10-pmic to its regulators
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251103-s2mpg1x-regulators-v3-5-b8b96b79e058@linaro.org>
References: <20251103-s2mpg1x-regulators-v3-0-b8b96b79e058@linaro.org>
In-Reply-To: <20251103-s2mpg1x-regulators-v3-0-b8b96b79e058@linaro.org>
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

Update the regulators node to link to the correct and expected
samsung,s2mpg10-pmic regulators binding, in order to describe the
regulators available on this PMIC.

Additionally, describe the supply inputs of the regulator rails, with
the supply names matching the datasheet.

Note 1: S2MPG10 is typically used as the main-PMIC together with an
S2MPG11 PMIC in a main/sub configuration, hence the datasheet and the
binding both suffix the supplies with an 'm'.

Note 2: The changes are done within an allOf: / if: match, because the
intention is to add the S2MPG11 PMIC to this binding as well, and doing
it this way avoids additional churn in those follow-up patches.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v3:
- move to new samsung,s2mpg10.yaml file
- move all patternProperties to top-level
---
 .../devicetree/bindings/mfd/samsung,s2mpg10.yaml   | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/samsung,s2mpg10.yaml b/Documentation/devicetree/bindings/mfd/samsung,s2mpg10.yaml
index 841b7c8ab556bc6a3d4cc8d5a0c811814d4176be..dc06333a4050af69297ac3cae0628a0fffc3fcc9 100644
--- a/Documentation/devicetree/bindings/mfd/samsung,s2mpg10.yaml
+++ b/Documentation/devicetree/bindings/mfd/samsung,s2mpg10.yaml
@@ -38,9 +38,46 @@ properties:
 
   wakeup-source: true
 
+patternProperties:
+  "^vinb([1-9]|10)m-supply$":
+    description:
+      Phandle to the power supply for each buck rail of this PMIC. There is a
+      1:1 mapping of supply to rail, e.g. vinb1m-supply supplies buck1m.
+
+  "^vinl([1-9]|1[0-5])m-supply$":
+    description: |
+      Phandle to the power supply for one or multiple LDO rails of this PMIC.
+      The mapping of supply to rail(s) is as follows:
+        vinl1m - ldo13m
+        vinl2m - ldo15m
+        vinl3m - ldo1m, ldo5m, ldo7m
+        vinl4m - ldo3m, ldo8m
+        vinl5m - ldo16m
+        vinl6m - ldo17m
+        vinl7m - ldo6m, ldo11m, ldo24m, ldo28m
+        vinl8m - ldo12m
+        vinl9m - ldo2m, ldo4m
+        vinl10m - ldo9m, ldo14m, ldo18m, 19m, ldo20m, ldo25m
+        vinl11m - ldo23m, ldo31m
+        vinl12m - ldo29m
+        vinl13m - ldo30m
+        vinl14m - ldo21m
+        vinl15m - ldo10m, ldo22m, ldo26m, ldo27m
+
 required:
   - compatible
   - interrupts
   - regulators
 
 additionalProperties: false
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,s2mpg10-pmic
+    then:
+      properties:
+        regulators:
+          $ref: /schemas/regulator/samsung,s2mpg10-regulator.yaml

-- 
2.51.2.997.g839fc31de9-goog

