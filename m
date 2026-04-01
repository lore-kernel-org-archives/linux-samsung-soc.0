Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC3E1A683D
	for <linux-samsung-soc@vger.kernel.org>; Wed,  1 Apr 2026 04:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775019121; cv=none; b=rk+7TyqhpQDTKSZMfgpVYHJJTnNe342Ez4ueUFl23JjouFNSV8WS/ukn6fAI8xk6BZqM7GtCe/69ZX0J0fvXf9KQ5SQyw53QDv4Ch5bss+xGp5T0MLYG8Ykl+f8JbXRsURXk9QaebFn6cMoLH4UVLS+G/EcudmRlqo0UsFX6uXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775019121; c=relaxed/simple;
	bh=KI8zS0eSrNW0sDC1Q5BeDySFx6bb4+/qC2XzzBPNrd4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dKEmkombz2buiNmqCzCJQP/etSakDLP5r6ZIb0Oub6aut548hSbaYfdniuAO7DZC8763SzBf5cxjWcUPFF0XgBWmnxjCQRm6watULhBWdqCvnPTPrw04La2EwthPMw8XnGC9mxCayONmGUwJtrUvyI8wrMsHyvJ8gZIX28c6RdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=klbEgAJH; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="klbEgAJH"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43cfa33a983so2044803f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 31 Mar 2026 21:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775019118; x=1775623918; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jbyRS2OprBLXmu9ZROhNbQV7yptB8B7WNK7cYLjfz08=;
        b=klbEgAJH4UtbMrQ3TphNJEGVXnMY2iooyXj71WyZqsQTx0Z/ajbZa72S+goIpud3kc
         eSs/FdWUp8DbsmjDkB20N4T3dCgOObtXKPRNsccSrN5B6/GsBRnINiBeYZA1peCWni5/
         4G0RkdMw8FbBETvJ60z7anj47aOD8hEwY164wqVQnwtjkxfGj9k4Gu5sX0Lk0etFwZCa
         o+A0t8UrrGtt1s9v6HPVfZx5iGLpSgdGcWSJZRGmfmBSyk+2PDx1wzXC4KuvJRvSsGut
         sKF7FrRxftWpJYvSP/adDQsakC/zc0w0hBAS+SOSXeFj5AflykhL9LS+elwBG9p46kJ+
         s/GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775019118; x=1775623918;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jbyRS2OprBLXmu9ZROhNbQV7yptB8B7WNK7cYLjfz08=;
        b=WbB37UHWdaxMVF13dmz26TU/rDamIdfOOv0rLhEc1MHKgLmw/lLJL2K+1F1nyFtpDP
         yIGWoDQVbtQTsUQzInUUuV4S1Wl67TmBtfB6kTsBEJh50jg3Alde9AWAknWoT3so/boZ
         cZJLzqv+hO/63VM6rlBGTsvmL1EindRRuleHp0PhKYaU+7aB55WjALAKi5IDD3hdJM+o
         dWQExwdwXUcLvLPC+7Ug9qMI44AJtCkuD2AoPTBTmLOuS1Zlrlcp4N+WMkV/GwX4Qr7T
         FH3Sjybcv+rvxpn7Z44wBo+jWq5HsmI9AILZGWFbGTR5cRb3zySFXqibqRPY5+IpBpqR
         XpDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUpvOUifnAQsDd8uwFnjx4mEogk7wk/wt6XeDGgNkZhkniCAGZcCOAmk8k9eBEl2d7VFPLgtqmgsfcMKllNxpx/w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwfnD3Y42/Mxj839zhoAt63n7teMOwiTzEf1zi33kTgOcWvRoRK
	5GxFVCOVV/XMh9887h8MNePZ9KQZe7UwVB496b51heQkv/yzCYc4Gkpum9aD5/P5iiY=
X-Gm-Gg: ATEYQzxSWFFJ8mn+FRcnDS0rYjaPoSqTqXj7waheIOdlKKK92UVCZPsLWF549G1oDsH
	RzUDd0ymv/vUsNYJ1ST7FTB7DyqV6grv9TEWLacaSJpJ43U3A234MU/3x6eqWkNcbWaaQsYL1Dd
	CvJ/W18r7TNnzLnRWcOSClMavdLvWoMdkL4w/r/rNd3gK/AigcrnYMDFbDZbYkkddzw2a9Ml3K8
	tCnRuHk96nrPcueZdGlvn7JMw4Z46iaejuhht+fzM0qh8YVBAU683MRnNwuPfAcUbEZmV0Y0EPU
	uSd05KXeiiHW34gtjzKArN18HqBy4k/9udiYMjVthfzrIZk8QCHUxBMQ+wPUhgNU1cjH7B+eUwS
	3NdPNHKbSpNW9i8X3a6X2lUAnsIybhZw6s5+aLANX4/Q5Bjpkl8B8bgviwdjmmM+dj5TNjovtkv
	0GEuHtknIhq6NM07CgD2PRzx0cAC1gkyun0ljj/8Xo8RqX+uw3tukZwchQtC55lQtd929n3OBXE
	CyFhhIY5cZZYatFh3eYvy5QZVU=
X-Received: by 2002:a05:6000:2384:b0:43c:ff58:35d2 with SMTP id ffacd0b85a97d-43d15047d3bmr3946162f8f.2.1775019118574;
        Tue, 31 Mar 2026 21:51:58 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf2463dc2sm32986442f8f.23.2026.03.31.21.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 21:51:58 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 01 Apr 2026 05:51:55 +0100
Subject: [PATCH v2 2/7] dt-bindings: soc: samsung: exynos-pmu: add
 samsung,pmu-intr-gen phandle
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-exynos850-cpuhotplug-v2-2-c5a760a3e259@linaro.org>
References: <20260401-exynos850-cpuhotplug-v2-0-c5a760a3e259@linaro.org>
In-Reply-To: <20260401-exynos850-cpuhotplug-v2-0-c5a760a3e259@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.3

Some Exynos-based SoCs, for instance Exynos850, require access
to the pmu interrupt generation register region which is exposed
as a syscon. Update the exynos-pmu bindings documentation to
reflect this.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 .../devicetree/bindings/soc/samsung/exynos-pmu.yaml    | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index 76ce7e98c10f..92acdfd5d44e 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -110,6 +110,11 @@ properties:
     description:
       Node for reboot method
 
+  samsung,pmu-intr-gen-syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to PMU interrupt generation interface.
+
   google,pmu-intr-gen-syscon:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
@@ -189,6 +194,19 @@ allOf:
       properties:
         google,pmu-intr-gen-syscon: false
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - samsung,exynos850-pmu
+    then:
+      required:
+        - samsung,pmu-intr-gen-syscon
+    else:
+      properties:
+        samsung,pmu-intr-gen-syscon: false
+
 examples:
   - |
     #include <dt-bindings/clock/exynos5250.h>

-- 
2.51.0

