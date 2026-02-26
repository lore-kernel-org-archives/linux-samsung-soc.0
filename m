Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592EF38944E
	for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Feb 2026 15:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772120835; cv=none; b=tY23WgJxhOMO+siZMD2m9QUxgyPZVPod0FG05+dNs/6GgriyW5KIgpb/6Bg4kRHZZTqE+6rLMcNeXNXP9j0II5Yi5uwwzrKC3IPJ41si1nBQZhNTp5fWbEidiZ04ENHQJK4m1UxpM89zWTRCpm/OZSPEm/6wOVuT13SB/PQ2hjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772120835; c=relaxed/simple;
	bh=HWWmjQddmaVsOt9MZKc6MD0VJXEzBstUHcR79v1nw/M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eXcptQ8GHHLpovFzLmnjqssWUSBfYIceGkGWF65RINYL3hCvMjenBbw1/R2y1TKG67UBGw8DT9WzwGi82IQcYtKNMAJXHOFYDy0nxrmnpMKwOLHWCo0Oaxgb/Tndtnxff0Uy/mSh89STVMjZD5WQHfsS83np4wy09WM8C9jDdkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lBNiHEfO; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lBNiHEfO"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4806bf39419so15928905e9.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Feb 2026 07:47:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772120831; x=1772725631; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lOCnZA6+FMHJsj1uVopQCToE7k28a5gpta1dDefWpi4=;
        b=lBNiHEfO0+Lo4uUuI0MWxGRy9B+E9t8Hl9MJ5j1YnAxu5uoXZuo0L50oRYmPnVlFN1
         n1+iOVsuXO4I3HdSDXb7J0YynxnoEBq6lmRkxCiXDI9mFWu+NMP39gYCJmnR58iuZHEH
         TaOPyTUQkL6dYSn2+gzVkJujIR8K5e6x1WWV+emBLlJRqI5Z7oSco5Zzmi4kNLbLtrmp
         Qt0hF4gpdG/cfGIKIGzPwtfvd79XOX+5e04JBDC1tjRMp1IELgc8nkm2ZLLnrGNGTmcD
         Ge8NDDJdQvKb6Bs6V6QrdapFuBS0+P/95AhvlnxOeXqE6mZlwQzpAl3um00DfFEd0ALh
         1MyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772120831; x=1772725631;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lOCnZA6+FMHJsj1uVopQCToE7k28a5gpta1dDefWpi4=;
        b=WY6dr4z/7iGVgTopJkOVABDGcqtlAIS1Dp6Vyo51BLcNDwRIEX4fjSHt43Ka5nr8fo
         qbwmX02eDPNoNSYxnfwhAArvZ+FJXNbHKZei5NpP6Can+ER/VkfCiIkY0c+jpO1xySLN
         /grKR+epmrlAxnl7Z7zBs3LHB/4QVDirZcOOuE7AytjxfoOro4cEWUmc16HKZZ5fsEws
         3q4gSg4iXTKw1JUEcLOUj71yaxH2g+TryVbC95Kddpa0BiNJ2Ifcxl6d7EEBHNr4jTb5
         H6WTnOGp3nBzwklLcUl0kq3mjlRJI4i4iNElZWr5QI5cEASHMW97zz/s/WW6aPfBCnV8
         X42w==
X-Forwarded-Encrypted: i=1; AJvYcCU8C9Cyu8QiqHtSEX9w1wTNmZTVYl+HmKmXfZr4Cou7XCg2hqeO0urxNoKJq+jyPbTJv7T62jxZSLL7gHBF+8MtNA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzAW+5K8Mu/JX1Lbr+yVxsNh9iI2HM/h2B+tzpFnqJ9BG8AZEf4
	N92uLJVcshELo7FNM8neEJPzFOH0OiYne1rZYzarbIRhTF4kLVkhCQmZO+VvyoZM1zs=
X-Gm-Gg: ATEYQzyUzF3SzRdPf1DfOVISt0/ETlk1ELGX8MdJlDc6RLTNuHoOipGVCD6claB11Ev
	fYvSqyQY9VafbWEg91n1zieS30q6QHzBoKH6SxOIbMOKg0z2yvJWv6ToxqH1SUgjjVAWm3TMche
	VAflC20P3NcmX2WOSRG2KWUfKY20A0CultUJirUpilXK900i3KHDzm2WS2aqWFJcrJN60Hkc9+G
	q/qmaGH0C7aaT13p86nX+F+zGpAO0jH85AWNRNy1WOwvFqD9kIkmZP0oNkHjj9qfS38LmqMkVUp
	a6SS1EQ4noQH0/4uJ6NBUpgCp6Am3JVd82FWDbqp0R88CHCDZutmbro2oySmNzmWIljsONUsDe5
	XxFVdfpCZAxgMTAYkJgoobBLYkGeA/ixCTJg7koqdRX5rCovntrh8vH61l48VUZ9WAHVDTKrsZ3
	sFOR9z0fAbgzzm7J8Cyy5ySbxH8Ao0iG3MSYsKI2R9j9Q0Sy83G/ZQ5vk7761bsMZVUen4Ek0Xg
	ISpa9mKengLZ9k=
X-Received: by 2002:a05:600c:46cf:b0:481:a662:b3f3 with SMTP id 5b1f17b1804b1-483c33ccbe8mr69194215e9.7.1772120830721;
        Thu, 26 Feb 2026 07:47:10 -0800 (PST)
Received: from [127.0.1.1] ([94.4.193.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b4410bsm56007365e9.6.2026.02.26.07.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 07:47:10 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 26 Feb 2026 15:47:07 +0000
Subject: [PATCH RFC 1/8] dt-bindings: soc: move and rename
 google,gs101-pmu-intr-gen schema under soc/samsung/
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-exynos850-cpuhotplug-v1-1-71d7c4063382@linaro.org>
References: <20260226-exynos850-cpuhotplug-v1-0-71d7c4063382@linaro.org>
In-Reply-To: <20260226-exynos850-cpuhotplug-v1-0-71d7c4063382@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.3

The GS101 PMU interrupts generation block is actually a standard Samsung
Exynos IP block found in older SoCs like the Exynos 850 and others and
not exclusive to Google SoCs. Thus, renaming to
samsung,exynos850-pmu-intr-gen, moving the schema file to soc/samsung
directory to reflect its origin, since Exynos850 predates GS101 SoCs,
and preparing for adding Exynos850 description.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 .../samsung,exynos850-pmu-intr-gen.yaml}                              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos850-pmu-intr-gen.yaml
similarity index 80%
rename from Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
rename to Documentation/devicetree/bindings/soc/samsung/samsung,exynos850-pmu-intr-gen.yaml
index 2be022ca6a7d..f9b40f3fd165 100644
--- a/Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos850-pmu-intr-gen.yaml
@@ -1,10 +1,10 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/soc/google/google,gs101-pmu-intr-gen.yaml#
+$id: http://devicetree.org/schemas/soc/samsung/samsung,exynos850-pmu-intr-gen.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Google Power Management Unit (PMU) Interrupt Generation
+title: Samsung Power Management Unit (PMU) Interrupt Generation
 
 description: |
   PMU interrupt generator for handshaking between PMU through interrupts.

-- 
2.51.0

