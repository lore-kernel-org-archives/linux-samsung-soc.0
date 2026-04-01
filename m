Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573B33806B0
	for <linux-samsung-soc@vger.kernel.org>; Wed,  1 Apr 2026 04:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775019122; cv=none; b=mMC1Uz/GqxEsvJ4ggyVE5+Y+3bMBgWEyKzCsPNQXOwqutd44K9RgCqjBOPunA2lA9nB1DUpZdYdHQUWoibKqWLqgUB3wyMXfAjhwFdzYQYTDohW7IzaLCyZk9JfW34aCj5a85Q8xXg1eW2ul7UZptRipJgZ9ZgeKRfGELs1ce8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775019122; c=relaxed/simple;
	bh=Rvye+ruoXWbdfAJxvkI5cdNATvl1ZuuLfhE1+CBMdn8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rbuv5KgYHWvpXsFxohVN8l6iJUONZpQr7M2BPy881Y9uYHF36qEGDkpTv+AYOrKEDlRWHjFyLaHeT6J/tyMs2lkG6zazea3N6nj8TBSIw2qezFvvETs0E65saZqLomkF+KuPhwh+Hcj3dXdhV8lsJiO6MAYNUWuNBXIG5hHXSVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EygzwRG9; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EygzwRG9"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-486fba7ce4cso64272515e9.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 31 Mar 2026 21:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775019120; x=1775623920; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H/kgDWAlaVKVnE11W8S3H0mE7bshX2fubcylJ0A4KM8=;
        b=EygzwRG9pWO4aiSXCbMuL0/L9n4zxW+XUZn7bSve/M7SkI0xgbDqeZWhXgXCjYFFGw
         jXnWeICVt3Hkd2SUIc2qFjz3wVk/34NG153fnifP+7zx+JQT2Ug+nS3s+0LLKmcy5Ded
         CBh698S+NKbhJe4t5xYWZLiN///x4gBubHdiHlixygUqU7GLOKnVVUAFcuFTXM/fvqI2
         qXDu4+ZYP7T+CyKEyZEh+XfKXstT+AwBosKjemOo/5HtuoXe/+jRDVGDSKN3MVFaHtes
         7+DE4kmBYELSsL+bOJ5NbRF8p4JfecAXFjLHlxT/2GAjsdDRpclZoKwMzhKtiLQ8Nrsd
         cm5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775019120; x=1775623920;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=H/kgDWAlaVKVnE11W8S3H0mE7bshX2fubcylJ0A4KM8=;
        b=kdPiJ/Unj+qQ5Rjb0BPSPGmOOy/eT/uXfIP57H1p3okiB340ASa/lK4YhajYkCiUtg
         l6S3izRL4hQ6dnj59WTKpFJVV94AqdiwPMdOZ9IxANMFs5C/p7v7MZjD+sSjNoAk7Rpb
         w/HYdmyZgIvKIK/c0Ut4JuX5xmtj2I2C3UIxW7f5r5PfZcXGfaFmWDx/zsT+loyFrcws
         OFS7RYffO3RyvO+bmWHzViJoasBavTUmZwHvaD47Y+Xiju6Wnqu9mlzTl6IapdT21qFN
         aFGjHRjBdI0fNinFtXanYV1Y+YbP9OT5JWk/5/UGGh8z+2Iyfaz4LB//BEPICue1Ix7P
         eb7g==
X-Forwarded-Encrypted: i=1; AJvYcCW7v7OGrUp22yQLE4kcmrBOInVMAs3LOZnce/Vq6FhR9KHDAP//LiZTS/78XzxL7MDe6SEFIXWfu4z7irIDkV3tAA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOMK1fIAB8S36foA6ILXkMR3gXscpjiqQDKON6jR4WTS+qyW9h
	jgywNgFt4mZ6t5PBn5Csyek/qGJwQXshI1gKTWMobBAyhT+ny3k5Ck596wxXs4oX5Og=
X-Gm-Gg: ATEYQzyOHo+TcAHaIPprounD4eACuj/A7bcUJHlNsLbZmPW0qohIoQuPvrDjTJmeWZW
	gMaMSjziXcC2o9C4XtMmlmwWno08Lp3hdwbR2LfIAYYiRBPt/jqOvzwncDM25QTMRrf3O/nIiK7
	OewM0YtfnV7eVmDvSjrxYYqIs3lUxq4nDRhwDOc1yD5+M2DE20V3D9/UR6sqPRoHdHn61m4wkTb
	mYd0SZyRXLUM87lUPGrs6zkhVYXtsO0dDwJ5Cg3DnCJTqQOT2cIUBL/KfAc5g5s3/E6B6kciebu
	17r6ufq0bXPhvT7G/obUZHQke99fUBMpFUrKx8MK+RYwj5xLU8MRp7xLpxwC3ezSMnI3LmxP1QY
	bAvc3AD6ZYSO9KQZP8haGzBkzW+O9CXTG8UVsgi4ZWoKEdw51hRar9Vc3tDOhx1MryqjWkqyCjj
	bU8Uk3/cE9nSMh4d+OpMWdIdeXchT8W946TkE/tn8y9YDFPN4Umk8f++2isKL2jd/JQOMJQEby7
	pCUvIRNaXiL7IwOtD34ZnbT9kg=
X-Received: by 2002:a05:6000:2889:b0:43c:ffee:ee94 with SMTP id ffacd0b85a97d-43d1506343amr3731299f8f.11.1775019119695;
        Tue, 31 Mar 2026 21:51:59 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf2463dc2sm32986442f8f.23.2026.03.31.21.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 21:51:59 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 01 Apr 2026 05:51:56 +0100
Subject: [PATCH v2 3/7] dt-bindings: soc: samsung: exynos-pmu: deprecate
 google,pmu-intr-gen-syscon
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-exynos850-cpuhotplug-v2-3-c5a760a3e259@linaro.org>
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

The generic property samsung,pmu-intr-gen-syscon should be used
by default for Samsung Exynos PMU hardware blocks. Update binding
document to add deprecated flag for google,pmu-intr-gen-syscon
property.
While at this, also add dependency to not allow usage of both
above mentioned properties in the same time.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index 92acdfd5d44e..1ff1a8729989 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -119,6 +119,7 @@ properties:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
       Phandle to PMU interrupt generation interface.
+    deprecated: true
 
 required:
   - compatible
@@ -207,6 +208,11 @@ allOf:
       properties:
         samsung,pmu-intr-gen-syscon: false
 
+dependencies:
+  google,pmu-intr-gen-syscon:
+    not:
+      required: ['samsung,pmu-intr-gen-syscon']
+
 examples:
   - |
     #include <dt-bindings/clock/exynos5250.h>

-- 
2.51.0

