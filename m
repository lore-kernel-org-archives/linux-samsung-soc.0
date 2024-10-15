Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07591AB6D4
	for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Oct 2024 06:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728975539; cv=none; b=aBltJ8nUHGu5BffmpkFNxVHsvmqr7HQDVOd2xcw9IO9NoqmWnh7tSXVDIgAHl4WAHpTpJy6M5eVbP84ngX5AUupOW0g0z3f0k2SYMtGRc9wCI+qT3WJd44neiuh/RQlE8nFMfadNmahRam8uL8HnGckpdQneg2DbJxhGxuGYB5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728975539; c=relaxed/simple;
	bh=HHRjomsRYsJDwBzUt/stxykgtORGhKkWesiG8s2sUzQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I2LP8IEO29TuRDAeSghx0tv+OIfwVi/c7SXCIJ+XyYz2Pv3QaTFX5cXoKKcuPlqs00Rck2ny6BQFL9ijF40whbEi5aHHFI6S2DDouWcGRFKRImfKFQ5B/CbNprDwtoD9uy5a7ObH+MoGLEOJMimzaIyE0Q0lVtHTpSklv0of6Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PCFsuZzK; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PCFsuZzK"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43115367693so6023085e9.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Oct 2024 23:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728975534; x=1729580334; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3Rg9CafE1YGkVl9KvHL3hkpJVC1sI0hUFkBUJZbx7bE=;
        b=PCFsuZzKQAR9kOL6ni8Kn0H9p+6MTkmTF4D+Fp053Ojk/c0Du5nfr2xqGqiYwee+kB
         YOcC8WBKZQSMVX3hgMZL8vriWYVmNTdRp9piSGURLmPXoiZJB3E9HgQazfgc0g9AkYyz
         uPBDLHOtBgeWZFKvjP/tQ0+vTT987www5QA5+vPUq8BmE1O/uQwKOya/G9v7wQ5hmsfH
         7DYnA4kvWqz33GL9wvZi9wNEZH8i30eD4weWbViSxizGIPrKorkf+sywal49bRhzm5Gu
         crES1KWqZAqLsIUQFAQ1r/s0pJg2zcLNiBi+XqO3y4aG8vJMfIysFr0BXiU62JaFCPbv
         DkHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728975534; x=1729580334;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Rg9CafE1YGkVl9KvHL3hkpJVC1sI0hUFkBUJZbx7bE=;
        b=gUkXPXGpfJFNhKjcMIxy4+n3IfJ8i+TAptkg9g34Z8zp5n9WcmPdfYDNs8O6vCjTjA
         fR9nBhNolja1qIORgxfQbWEazapqGXnq8yYx21N/Yixjiv5B7DwR5jCFgRJSxZXpiqnZ
         B3MaseMhyL0JDMrWd5jd3tD8tQc8at7syUPvzHlH0KI5IlCmZCOE50WAWi3wf8DQIepf
         T4BGOB64Svoek33IeIkKgPCT76AvC6aKUMjwluTFb9U4Amx9wF5vxLJDctNvGsUDnst4
         0tZ4owdIpVUi5xxbA4ERZEcfS3Z8HV9ON1/9xi+F7r1Qd0RwoOkGrEW6ltX2JBWiHZQq
         JLNg==
X-Forwarded-Encrypted: i=1; AJvYcCXq00e1D3jFHnJ4ECkNVaZ6WZur5mWcwADXAV0PvS8gKwDeERL0n3fk+l1hHYlndy18PvJHPiKJJb6WZYakAKE+vQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRFr8s5GWzg6LInWykZ03XKIIR62HFhtyhy+DBEzNxNQwHIRbB
	pMZqYUAzEbOd6CzFxIHgjMvP0mudgZ318Yvq5761FbJv5HarqnTADDJUkI9/gJY=
X-Google-Smtp-Source: AGHT+IGbPMxgc3DOJjQs7sGqlYcjADDsKE8cdCECGo3sJ7ddzUzXMkKiJhT5InhJZ4au28jZv0tx4A==
X-Received: by 2002:a05:600c:5122:b0:42c:b63d:df3 with SMTP id 5b1f17b1804b1-4311ddff73dmr55330175e9.0.1728975534141;
        Mon, 14 Oct 2024 23:58:54 -0700 (PDT)
Received: from krzk-bin.. ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4313f6c5d22sm8461645e9.40.2024.10.14.23.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 23:58:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	Jaewon Kim <jaewon02.kim@samsung.com>,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	stable@vger.kernel.org,
	Igor Belwon <igor.belwon@mentallysanemainliners.org>
Subject: [PATCH 1/2] dt-bindings: pinctrl: samsung: Fix interrupt constraint for variants with fallbacks
Date: Tue, 15 Oct 2024 08:58:47 +0200
Message-ID: <20241015065848.29429-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 904140fa4553 ("dt-bindings: pinctrl: samsung: use Exynos7
fallbacks for newer wake-up controllers") added
samsung,exynos7-wakeup-eint fallback to some compatibles, so the
intention in the if:then: conditions was to handle the cases:

1. Single Exynos7 compatible or Exynos5433+Exynos7 or
   Exynos7885+Exynos7: only one interrupt

2. Exynos850+Exynos7: no interrupts

This was not implemented properly however and if:then: block matches
only single Exynos5433 or Exynos7885 compatibles, which do not exist in
DTS anymore, so basically is a no-op and no enforcement on number of
interrupts is made by the binding.

Fix the if:then: condition so interrupts in the Exynos5433 and
Exynos7885 wake-up pin controller will be properly constrained.

Fixes: 904140fa4553 ("dt-bindings: pinctrl: samsung: use Exynos7 fallbacks for newer wake-up controllers")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
 .../samsung,pinctrl-wakeup-interrupt.yaml     | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
index 91516fedc872..49cb2b1a3d28 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
@@ -92,14 +92,17 @@ allOf:
   - if:
       properties:
         compatible:
-          # Match without "contains", to skip newer variants which are still
-          # compatible with samsung,exynos7-wakeup-eint
-          enum:
-            - samsung,s5pv210-wakeup-eint
-            - samsung,exynos4210-wakeup-eint
-            - samsung,exynos5433-wakeup-eint
-            - samsung,exynos7-wakeup-eint
-            - samsung,exynos7885-wakeup-eint
+          oneOf:
+            # Match without "contains", to skip newer variants which are still
+            # compatible with samsung,exynos7-wakeup-eint
+            - enum:
+                - samsung,exynos4210-wakeup-eint
+                - samsung,exynos7-wakeup-eint
+                - samsung,s5pv210-wakeup-eint
+            - contains:
+                enum:
+                  - samsung,exynos5433-wakeup-eint
+                  - samsung,exynos7885-wakeup-eint
     then:
       properties:
         interrupts:
-- 
2.43.0

