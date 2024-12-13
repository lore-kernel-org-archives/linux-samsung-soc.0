Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E992B1F03EE
	for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Dec 2024 16:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734108322; cv=none; b=IBxyc3tpOd8bYSrqNyYbcF7vw6i0ZQYBVRWyepofrVwrWjDOCuEnZu7fpcS6a8EBBU0O19GRcqzuoLSVbULbz00CQNxdpd2oz3QtZj/LCQBIR6E7ACwLoSFh/uf+QOKcPqGEtGvcud4FfhqNX8mbEI4mOS95ozeWDdLuB5YiiMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734108322; c=relaxed/simple;
	bh=o8gcbchdk+NEFXIHiXqU7JXHFaPHjD7Nwegm7SL02NE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oozsoyodrQnQR++6Fe5SKhJxGfNT8JosmAGMP+Ew4MKpUMTWh45cE5rzmwZdcj+cA9IpNJNTp2VBMonKR5DUHJTs3B4ydW58TiBBDwCb9dPFoV2dPSDA3OD01JN5JArYk4KBkdq0bHJhrjIge8PvmSsn8CLtptcA7iOP/iszzM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HDBkvfta; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HDBkvfta"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43618283dedso18741245e9.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Dec 2024 08:45:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734108318; x=1734713118; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZiXtRse753j+DxWe1l5vCc1FuT3NFlbx5vgI3bsEGjg=;
        b=HDBkvftawV7r1++1inBkHQngNmw096FrIg/n6J8ozpriBmghxSFmUp0N0/ZmBh54R3
         9A8eaBoi5NVZvlhN2patBM/+8+GLhVwrtJvED8FPbYSsNSNqlaW76JeHj+hkR8ejSwqQ
         w/NBRhzzA4GVhZxWaB72GtNsAsQyNeZLf+INpmiRLDNrdtDm5BbG7DODK2iSXcmySBDW
         yCnbiUmONTjSsymPz7pQCPXLtJXpy0ziCVVNe4tsyqragtKrTR2vlDZe1ADR82fgZenD
         p8UH9/9dg0F0Gs8OQ9EMMwcf75+KzfcTI1t7d/tRaFZmxPl3cWksc15hUPcVTtFitN+w
         eoIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734108318; x=1734713118;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZiXtRse753j+DxWe1l5vCc1FuT3NFlbx5vgI3bsEGjg=;
        b=kaTHi8ATozKA11w9rxXiAyMB4rUiAw/4MBy6schuU4ldOY2ScwamE8D0VHyO3ddZAl
         dp77bad/vPXGSHekP1LOitMZ9MKdgRqCNIWNTuWfDgcwpl4sglOMOcGYzqre3KFD6Xsg
         oowpTnSB7qsF9UgE0nwYPJaH548xtQkNA/VGHYdjf1ci0bnEAHfghTwxOcPB7ou0l27Q
         qT2xwIp5dY65sR2ROagqMRMVhwFLR0l6Ubcds4vlSXHV4/658JmgEO26dd/5Cz9d7bAO
         PO2i1sETw4gDcvexTRKvl3Myos+hbJZadQUebNxgYRIgqrdIcoYE+sFgPKHYjVcXE+jq
         k6KA==
X-Forwarded-Encrypted: i=1; AJvYcCXa5Qo6dy/ffXeYM0vkF3hb4OEn1LANwFAMaJHODWpXuukpMopfJyDjtiKFEJt1zKUEcAiwWgafla2YLd57V8E0UA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz23LXgM4ADJxlyI8FIYJDgPb+cAHk0xQqondzmYsNdWg/mIlb
	+rFpngTypt0XDzO+zUUCFdRTWqUGFQSxOsRxWTDDLv/ukjDlTKjjgpoXQ7OYxhI=
X-Gm-Gg: ASbGncsqFqAnlBJDpqtuH7WUIkiSjTIWhGlAuXP/6Qj8cHB5bY/nsl+QFmeohGk+/um
	+O4kliZ0/sBeUlFzadH0TfXwiqrZm/CRhf41qvJRL6761dIqz9HuzXh8wJWzPkpne2z4WXtbvN+
	ux6sNaPKiIK0sO1X3Df93qgiJFL6aaNsqJorJSdPl1kFzqMdvUJcGV1C1Vw9ntnZvPipGUYJXWY
	fipeh1wvUvLq8NakFzgBm0u3ILtfbY1ysua6KXfol171pWXuBbtTnZaa/omeXbpyPZzp29+pzgw
	8iBE6smcsQ==
X-Google-Smtp-Source: AGHT+IETyJSvR8KA8pphR1pBfr5KTpzF4NmNkeh7zYSJzCimMSajiU46jqPt2jw1d/p/w6ZGTou/bw==
X-Received: by 2002:a05:600c:1d86:b0:435:330d:de86 with SMTP id 5b1f17b1804b1-4362a98a563mr32579905e9.0.1734108317815;
        Fri, 13 Dec 2024 08:45:17 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([145.224.66.83])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43625550523sm53900665e9.7.2024.12.13.08.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 08:45:17 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 13 Dec 2024 16:44:38 +0000
Subject: [PATCH 1/4] dt-bindings: soc: samsung: exynos-pmu: gs101: add
 pmu-intr-gen reg region
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241213-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v1-1-c72978f63713@linaro.org>
References: <20241213-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v1-0-c72978f63713@linaro.org>
In-Reply-To: <20241213-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v1-0-c72978f63713@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Lee Jones <lee@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 tudor.ambarus@linaro.org, andre.draszik@linaro.org, willmcvicker@google.com, 
 kernel-team@android.com, Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1571;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=o8gcbchdk+NEFXIHiXqU7JXHFaPHjD7Nwegm7SL02NE=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBnXGSZluJfObTMSPxr05UelRIQWthOmoBtn2uyW
 PFgIFrAApqJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCZ1xkmQAKCRDO6LjWAjRy
 una2D/9ZUhnENnkW7zC4mxp8Vfkdy2PN4PE1leFf6JLDKZSIi/C5o5bed2t5p3af9nupwWd2zbX
 peM58sEtA9ZUAqP/1YmiJadFo6sfuhtOypo2wYYzUjE8HGMfxKIuTg5nyd9D18H+K0e/NOmC7z3
 4gXcz52PlvDSsyAzxNtNdLgWLxSYiRRz9bltIjIePks1DMvTs96xR90k60cSLQWMRZxWxiczhFz
 pau6fIRsTGS+6c7e96EyW5mzt3F9+HP0s5jGpGt8HvnfuAmVgNaWSS7sXM5pRGxl92yL4dJK3VN
 NFnDPSGlozXblKBJVE6TxYlVUFoZnuOvMSEmL+k8up/Q+cE6JFHEwGlYoWghHLT0FNNEgT0SQzo
 u7j2psGxS3tUrrReg16UlSZNmSwWUgeeGjjvEZetP1bYE4cAGyC9ahPfnDJy83i90fYQ4kpE0F5
 g3xcS+JgbFWGZSKW7YfoTfztDRs4V43smbO+NsuqMX2p1JuENDC8J4vnZBuk2aKGcdLR66tjqJE
 vNrzh2qAynTwCuDTYpR0ilARhUboWOrzH/QFABBXe/EAsLHSWFEX04W9sj7OU9n1clJJhjo2AN0
 R1m5zqd47YsjZziMZYDcdvozt7t0nEMDeuUTUuLU91/3XAaZzVXhx3yCv1JuWwfrH/jVy7D9zZk
 f8dW7IgVRHpeT4Q==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

gs101 also requires access to the pmu interrupt generation register region.
Update the exynos-pmu bindings documentation to reflect this.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../bindings/soc/samsung/exynos-pmu.yaml           | 29 +++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index 6cdfe7e059a3..5ac4864e4cde 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -73,7 +73,11 @@ properties:
           - const: syscon
 
   reg:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
+
+  reg-names:
+    maxItems: 2
 
   '#clock-cells':
     const: 1
@@ -186,6 +190,29 @@ allOf:
       properties:
         dp-phy: false
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - google,gs101-pmu
+    then:
+      properties:
+        reg:
+          items:
+            - description: PMU register region
+            - description: PMU Interrupt Generation register region
+        reg-names:
+          items:
+            - const: pmu
+            - const: pmu-intr-gen
+    else:
+      properties:
+        reg:
+          maxItems: 1
+        reg-name:
+          maxItems: 1
+
 examples:
   - |
     #include <dt-bindings/clock/exynos5250.h>

-- 
2.47.1.613.gc27f4b7a9f-goog

