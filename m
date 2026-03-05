Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D92829A32D
	for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Mar 2026 06:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772691117; cv=none; b=PJzcYCU6J/rS63MXlhsziMfdl7Rpvu7LJJ220Fc9mykUIWXLhMKyF1d8oWSgREY3iid3JWUKwZW6KxrXpbHK5OIq1T4Jt7K68eTE/SjQNtaD+YyViyS7F2EWqclAMoMNJ8w8bYf63nOzxrTJI/7EgxtuOOVDwyqNIMgPOz6tAxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772691117; c=relaxed/simple;
	bh=iALQKe1s8XYCZQRBPu9whaNUYAS1mnLDVYkgTcpyPr8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cqfZbw902df01v1XvXdoVI90ZX8VheJgXBWBfOgZaAMlTgV53jfMM1A/oRVaSLHK5p5FufjuxvL3tGOD0uN6w0raS0dneuAlQDflPn23G9TBHjeMfySWYWWajwmlGimPYyjpVMD/WZ1NlDRp6xgMDArrsMQXFEX1IvaqFwCQFmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V61lqGK9; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V61lqGK9"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-65fac0b51baso7293206a12.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 Mar 2026 22:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772691115; x=1773295915; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3FUcP5CBZJQtkRrAcWORzv320QMtIf9elaWuqQIxzig=;
        b=V61lqGK9WTWnm29tSJDXxDUta9HQFJN1mC4P88K541f4zwmN/huESi8fzi7oiuSftM
         uQvQncjvWZzd/U7odh3wc3Zt4vZsIyb0dkHhkkCt141K5aQJBNgmBjErmXJtjwPn3ioE
         /mkQc2o0Kj5mMP82UyEC6XESEYlNkQSV38rlAkzztSrTrCUi0cCpJb5wDMEZvaaMwA1S
         qCjsfq5RD46hmlajAcmW3VijtPvrZCFAqqHiBx1ilQ0N0StHsQqGIuTypTjKA7mcZzYA
         jjYnBbX/oR7/iPL61eI9DtZloQdEQ4dd/aNFN7/HUunsp7FX2fmAl0UJcePvNN+bvTrj
         WFkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772691115; x=1773295915;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3FUcP5CBZJQtkRrAcWORzv320QMtIf9elaWuqQIxzig=;
        b=m5gbrYbFcuALuE5iJfrXo9DVBNhoXNG6I9f8fGvzRTPtlu8EC1hQOLbWfK/hYaz+o6
         TlUTRKiMbwmUgmzPms90XquUY3XsVwKzFOfYaDN/gLh6t6su0lEkQhFHbiTRhugJAJb4
         MRBj/9ZFLvaq9zMzURLMoynC/AVjJSz+Q8+cfeeRgTkLcJFChB0/vgw8Emcv4GsF/VW6
         /sg/34Yy1ad2vitcczABTUQBN0Q920MwN5lpAEyTlXONjVK+sF7+GrLKP8AVuhM/iSzu
         b4n4Y/XysQhWZVRpevC/EpD1Qf/6EB88YdTidEOhiZ8cvMdcaKTQDnRHFI1UpAQ3VLnF
         RtEg==
X-Forwarded-Encrypted: i=1; AJvYcCV1P/ngm2vVp/ChJ5Kuc/1k3cfY0DXu4e1PWlGzEYpIpJCqHqL6kbs9xFS+tTS+RvpV09Ws8Cnv+DOLMgZ4kg9Jew==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2p9JK4++qFjczmpXvRGFuXj1TLz7C/9PUj5J6W5yhSRLmwuxE
	u+IdxLGm77OW2ZSHITZFzL0wXBolf0qCcFqK8Hr4mXzOTHUWGvd82sJBcrLk/iBDoCQ=
X-Gm-Gg: ATEYQzysVOKwPrii22WLUqp8YbQVbbhIvU/7gNHFXXmTJUl0AhK/MNAr2yzEXrF66vz
	UxfQiT3MJEQCQEuYS3XB6ONwnU3KMT+E9AzKNpZtEND27GJJDYmtJBxxEo2tonf619sa5m/riAV
	/zG2E9+/o5650qSLhUmHwiuFKrbG4mYt4wC2fjyoyUJqOtys1QMbMZ4K+pLYmkme0mJ8YdJFz06
	aQZ4JpQZehuaF+BHoEcOeAQTyVLFSYdo2vhKJKDUS9N1SsEeTwb60yp3gEBc6pyxcC3UAedJLzR
	6nFYYfaR3HZoT3q9u/1kVb9TZepZChTNOXG9avBBAa7c++riJmvSj6vHZKI6ZkKLfD1dLEBWqqS
	zIAPNg0Q6dOXMUTaJ7P1kWGG5b+4fPScbDdwPOKna+8oFELPfB0FUfK1AB2sf0lQeIoUCDdWuT7
	7PhaQ+8n3gD8kCoajuOw5XeNHfdq8PaxQBM+uW2ZNQ8SMa8IShC+zvQdkIDQMb6ij3SmJVGZkcJ
	jtH8/chTvmoM8k=
X-Received: by 2002:a17:907:7f93:b0:b93:5a2b:bcda with SMTP id a640c23a62f3a-b9409ef2b9cmr62071366b.29.1772691114572;
        Wed, 04 Mar 2026 22:11:54 -0800 (PST)
Received: from puffmais2.c.googlers.com (221.210.91.34.bc.googleusercontent.com. [34.91.210.221])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935aec3243sm849355966b.53.2026.03.04.22.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 22:11:53 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 05 Mar 2026 06:11:51 +0000
Subject: [PATCH v6 02/10] dt-bindings: power: samsung: add google,gs101-pd
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260305-gs101-pd-v6-2-8cb953c1a723@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.3

Add support for the Google gs101 version of the Exynos power domains. A
new compatible is needed because register fields have changed and
because power domain operations involve interfacing with the TrustZone
protection control on newer Exynos SoCs.

Power domains can also have a power supply linked to them, so add
optional support for that, too. It is believed that all (existing)
platforms could benefit from this, hence it's not being limited to
gs101-pd.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v5:
- add domain-supply and update commit message

v4:
- add new vendor property samsung,dtzpc
- drop previous tags due to that
---
 .../devicetree/bindings/power/pd-samsung.yaml      | 33 ++++++++++++++++++++--
 1 file changed, 30 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/power/pd-samsung.yaml b/Documentation/devicetree/bindings/power/pd-samsung.yaml
index 9c2c51133457..3f1a2dc17862 100644
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
 
@@ -33,6 +31,9 @@ properties:
     deprecated: true
     maxItems: 1
 
+  domain-supply:
+    description: domain regulator supply.
+
   label:
     description:
       Human readable string with domain name. Will be visible in userspace
@@ -44,11 +45,28 @@ properties:
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
@@ -66,3 +84,12 @@ examples:
         #power-domain-cells = <0>;
         label = "MFC";
     };
+
+    power-domain@2080 {
+        compatible = "google,gs101-pd";
+        reg = <0x2080 0x80>;
+        #power-domain-cells = <0>;
+        label = "hsi0";
+        domain-supply = <&ldo7m>;
+        samsung,dtzpc = <&dtzpc_hsi0>;
+    };

-- 
2.53.0.473.g4a7958ca14-goog

