Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262BE30C60D
	for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Jan 2026 16:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769616657; cv=none; b=oY/LS2R0VL4sDL8A6dfMisD6IeZ+TVx4iMCitMR5tlUle7loNkPjBgBBHfnUQ0sSmSmYyFWlNrUm+436nBQkUToIzFu+Nd2OogeU7X7fXLzJ7bdVZg8uNe+k1Hau91+37icUHNE/J4Noz+zoHdj6tvysEHcmR/wYx4I48l5yxbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769616657; c=relaxed/simple;
	bh=M1WMc4bY0aH9sS6wRakI3vA4XiZlzBJdIzFnhwIKKcI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bg/zsbtwzDu5t6+RBWk4clC+BZT7r/5rS3HFdDCZzRwYaZUA1P0/U0w54E5wlj80iVzEkW0erR1tkGPIoNA1S0w8hqv3TgCfsrI7mYk1H5PyjzL5RytqP65FuaFrzY4Og85mjgFUn0ocrWLKgnQqKCeu5sw/jwp19tg8u4btnOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QCGdE3fl; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QCGdE3fl"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b8871718b05so917262966b.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Jan 2026 08:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769616654; x=1770221454; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gll/OtNLbOWiVZ7Gkg5CJPf2dV1v2rLa1U/xCUl6ltg=;
        b=QCGdE3flOmY5lA7z/CGTDgaVRgJJhCgvFzPhY+UUOLyluMevadnWBPAthao6Ob6fzt
         fM0ofd/t/u4DuJYNdu7J2CHa1tTjwksp0c6qr0bMC04JCUnZFdB/Ha8XsbeH722Dbgr8
         q8IuQtbHDDFTtYw9/4idzi3KOJeX6vpW+xGSgZbthE6D19rCJq6nHy8w9eyXcR5Gu1Qw
         8Zn/vDkz7t25RHFJAIL4JBlAE1ZZZq8UVlPJAV5yjrQT47ruwHEKE4v063h/eMKsaFoZ
         MoktD3oI0Lcw6pOrErNIba9U/Nj/sjQPzgJsgMkmhzwq7ca2uA1XOrEIsrEKjpwdPYQn
         Ugxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769616654; x=1770221454;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gll/OtNLbOWiVZ7Gkg5CJPf2dV1v2rLa1U/xCUl6ltg=;
        b=wqInW/CmgPGNinJo4LVlJYSKo5pYZnW80VZuSCUc0lbHm3LztxQLDRBhK0NaPQnEi6
         6S/R24D5z0xpIZ4oz8khGGAGeI9e9Qs16Fx2ht7h/IqQFyvFFmWzeU5bue5ckhxwUp/b
         18MPhw9v1y0+A+rjO8BMgoNthSB3/iCNAtvpr3eWD6uV0YMh1CYfGv0DU82N3hIlCJMm
         6eDBWe7/7tXebo7rOQAF8uUcqx97idlTmPQyE33zqgaLUrwBCgCqnvXMCXl/55hr6+16
         ZD9chbGEhVSBv85YeSKHqyojmlhVv+CZ3QZRVchs9/x+diq9Zd5wRoICBMhmmZ4kKuPT
         0QpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoakk6j0SsM/46nO95lIJeznr1KCzfKYA1SZh7MhKpM42N8ivTYZgjn33D3QO/ASD5ifdS1OSvmDZ8ZzxgWmPGjg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVeEyvSuOfLqg6EJ1XxZqnLON1W08UnESFsTyHA79vWI05NVyO
	MyZNcmA2oKvRZUyHVKdNKQ+HpsnVgxeiZi2h8Cg6l62dYqu/WudV46P3Z24SNsigCqc=
X-Gm-Gg: AZuq6aK/TE6aAm7Oq9KsWRy3HuP7gsc/sKdgmLh/PHFVbn9+9829YcOjaCsoAS8rFes
	mDNzLKxd5VYaOPoJxKBwnVU/pqDbFpe73HKJe6Mgaxs09FyTh/nkg3KzOTdkURS52eX5zQxhmuh
	CMbQ9UOT63nigh+iN7oqyFVPHAibEY7TkNCKug/CXufrPOXbetBKcBa3sh2ohysgrHKXZ+xeY3P
	4Tu6Eg9i7lmIzDvx9HQusrKWletoSKkGVlAX+d6U7h9o5+GK2JyIqo8Ppau/PNpKRkPVXn5UNij
	wusx9dYntpn1U46Ht3i4G1+tNHDLjU1oVD5LvabB5+ZIN/2K4PDq1nSHsfOMed/ZkJ3xWmZ6km3
	fNTozrRx1b+txBNRZVNaLizOUe6jAp0opPMKdaJxMiDj09nyMdD9YSrzVslXRdnNIfX32M+QV0k
	FHtoyzYB7aT1rfjG/KXilJVjV3jsl259+8VWjDYAjhRRZXfSzX0FIvRB65Vy5xCZzsV2DXpLe6b
	oKbaA==
X-Received: by 2002:a17:907:c28:b0:b72:70ad:b8f0 with SMTP id a640c23a62f3a-b8dab423008mr381662866b.36.1769616654219;
        Wed, 28 Jan 2026 08:10:54 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf1c021fsm148553366b.49.2026.01.28.08.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 08:10:53 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 28 Jan 2026 16:10:51 +0000
Subject: [PATCH v4 02/10] dt-bindings: power: samsung: add google,gs101-pd
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260128-gs101-pd-v4-2-cbe7bd5a4060@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

Add support for the Google gs101 version of the Exynos power domains. A
new compatible is needed because register fields have changed and
because power domain operations involve interfacing with the TrustZone
protection control on newer Exynos SoCs.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v4:
- add new vendor property samsung,dtzpc
- drop previous tags due to that
---
 .../devicetree/bindings/power/pd-samsung.yaml      | 29 +++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/power/pd-samsung.yaml b/Documentation/devicetree/bindings/power/pd-samsung.yaml
index 9c2c51133457112ca0098c043e123f0a02fa1291..4ba555e11b30e6a9aaed457bcb57765bf5b481e3 100644
--- a/Documentation/devicetree/bindings/power/pd-samsung.yaml
+++ b/Documentation/devicetree/bindings/power/pd-samsung.yaml
@@ -13,12 +13,10 @@ description: |+
   Exynos processors include support for multiple power domains which are used
   to gate power to one or more peripherals on the processor.
 
-allOf:
-  - $ref: power-domain.yaml#
-
 properties:
   compatible:
     enum:
+      - google,gs101-pd
       - samsung,exynos4210-pd
       - samsung,exynos5433-pd
 
@@ -44,11 +42,28 @@ properties:
   power-domains:
     maxItems: 1
 
+  samsung,dtzpc:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Distributed TrustZone Protection Control (DTZPC) node.
+
 required:
   - compatible
   - "#power-domain-cells"
   - reg
 
+allOf:
+  - $ref: power-domain.yaml#
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              const: google,gs101-pd
+    then:
+      properties:
+        samsung,dtzpc: false
+
 unevaluatedProperties: false
 
 examples:
@@ -66,3 +81,11 @@ examples:
         #power-domain-cells = <0>;
         label = "MFC";
     };
+
+    power-domain@2080 {
+        compatible = "google,gs101-pd";
+        reg = <0x2080 0x80>;
+        #power-domain-cells = <0>;
+        label = "hsi0";
+        samsung,dtzpc = <&dtzpc_hsi0>;
+    };

-- 
2.52.0.457.g6b5491de43-goog

