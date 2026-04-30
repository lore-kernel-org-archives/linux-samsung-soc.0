Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8967A287257
	for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Apr 2026 01:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777514221; cv=none; b=X1lLurFS0nAlGB5bXcwe0vi27sdYsuJbbmh9Y6e/z5QH93uuxsZw3YiIDkXGA3HxFvD3lPCjovOtlR7rmUMro3DiRLAiqIIWHmAwN+3IrHw72DxgHl9LAVOtQlYLiQjvqr7udgb3Qb+ou+8yXKSXeRSrTQOUH6wjd1EDbp9H3cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777514221; c=relaxed/simple;
	bh=AZshoggdy3zuO7uepA6tlCKjsxngbTlPbeDHx2gxaXQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A3b7YaHjZ3mKqmz3JEJg4HGXW0AylraVabjupM6D/TEs1fJHltX+DP61l2I2eOzvU6+xlYXsR+M/L048dTTJwiiWexXMTtnRgY1tTiHRYM5mdlrMr8gO9VTTnIb/ROA84/shsaxCWeyhDeobV/SG+EFF3CG8WVhQqYLfgMuixTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tmLcXreL; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tmLcXreL"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-44261378651so953789f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Apr 2026 18:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777514218; x=1778119018; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EYgTJ4k5gmQwMKcZEcvg88X5/usv5yCN60/fnybmGoU=;
        b=tmLcXreLSvG4ldoVOjGWfd6yaEy51tNzlZbgU7o17GywjqbninHPE4XzHFlyyDRjiq
         kufARGXGlck1MuQ/Rwt2TF9vO1YQRJcaenRLCjbk0DV2Of4UK168qabCEhkz7ppJfK9H
         VgbokmnZWVVhQIRBBXWNg4AqP6yjU9jVj9FxqEh+XhKDBDXtJpXHHkCx+Io08g4fm/MU
         qLp71LKLDkDKX0BZdj7Qq8xdJwKDP9RbOfyjffrZfD81BIOcjBLwb9/ShTlexjOnroCG
         qxVjjasZ6FcxbkwecuRAwkott49nD/URxyF6P/TlfM7eMlJRQnDT2o70qUwo6cp1fiFg
         zeFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777514218; x=1778119018;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EYgTJ4k5gmQwMKcZEcvg88X5/usv5yCN60/fnybmGoU=;
        b=pxIJAK3rbl9KkiQH/Gsiu3tuz3v6rEs/jW76hGY5tlw+/GMgfbkIyG1gFckX+YAHjS
         P6rCdqrD8iiyQ+T9g572Z5wmLB7V0g+2yUWtHGjUXTU58PbNdpp7ZNWzimCPe/8PRvWp
         HzMIG+7XqtMpZkhPfVUxyev16Yt8SmaMRj13I9+44CRnM2TmGduaBIamDb36YIWkEW+S
         DZktF/JjLObXy6zLD7mK3EKQhSpCGgj4epJdxcb0dSa34/47mh94qtGuoHF4PeIuHdqN
         xhvRx7WA29bHYQBXbnZYKNx1p+PbX7AMSFZOUNQhMM8JjZwtVNxZ3yDEPCBi5K4Fln27
         9DTQ==
X-Forwarded-Encrypted: i=1; AFNElJ82nHVDPnLJGyts6rHGyUFUqosl1gMnB+RC/DqRMj7UCCVd1z6j121WlZe7rwOiO4VyOQ6iGHRmRCtsFdcs1WJ6pA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwrKIvh9nGN+gmUzpQBbCUdLVidlvls66Ebycg2GBegUFnMfEIG
	WlilVye1Y1wAuWmtf/7Ybld6tLyJj25FQ3vKRN3NJN76oLtHy692rbOYy5iuWsGaOn4=
X-Gm-Gg: AeBDietDFg/IatyzTf0MM4J9ijMvaXoxMoTfc0IrXXmsFIa+KCsd/auJPkX1qfFRsMv
	TmnZrdb5g/9wpidIiTFuHeE8mLKQqGsLV3XqBs3ThNHCmeD13Vah+g9y6plr28/ynkMl4qfChX+
	ckR5eaonhq4mpaaw4Q6ILf7C4LhZCajc5kDif1WZhOQING0TnR3chqNZrwvcXw517cikioXPMSw
	2NLfETcSJdV19M38YrIxkEEfHOVW6ezvPczlAEpRCCBNhAGJgFPYMq8JDlXWDKLFqXJPgtvteyo
	2nx1MgnHvFlk7NFdceKdDR4CZDBFAffImJxCWRpeem8ls+p2w1ITx475JMRpnidJH/QLP7VjAQe
	jPE4B9yuiYbmPYCFP79IvN9j048aUSjLlWiSJJdzqb0fJ5dMfeCMQOV95VQtZuYVak9Q5S4ms8R
	NIP8pAQMJ5ceZH330IF4ViQAE2dAQsjt7wM0jwnl2bwb312nRLCHEHIUu0AV6oplwQUMjvDVUd/
	XL7vwSntfK5Y67Ge71ZMoNmsmM=
X-Received: by 2002:a05:6000:15d8:b0:448:6b5f:ce9b with SMTP id ffacd0b85a97d-4495025ddfbmr548070f8f.19.1777514217658;
        Wed, 29 Apr 2026 18:56:57 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b76e5bf2sm9915013f8f.27.2026.04.29.18.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 18:56:56 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 30 Apr 2026 02:56:52 +0100
Subject: [PATCH v3 2/6] dt-bindings: soc: samsung: exynos-pmu: Require
 pmu-intr-gen-syscon for Exynos850
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-exynos850-cpuhotplug-v3-2-fd6251d02a17@linaro.org>
References: <20260430-exynos850-cpuhotplug-v3-0-fd6251d02a17@linaro.org>
In-Reply-To: <20260430-exynos850-cpuhotplug-v3-0-fd6251d02a17@linaro.org>
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

Update the Exynos PMU schema to mandate the 'google,pmu-intr-gen-syscon'
property for the 'samsung,exynos850-pmu' compatible so the driver can
obtain the necessary syscon regmap.

The Exynos850 PMU relies on a separate system controller block to handle
interrupts generation, similar to the hardware design of the GS101
SoC. To ensure the hardware is correctly described, this syscon phandle
must be explicitly provided.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index 76ce7e98c10f..6550c3736a3b 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -182,6 +182,7 @@ allOf:
           contains:
             enum:
               - google,gs101-pmu
+              - samsung,exynos850-pmu
     then:
       required:
         - google,pmu-intr-gen-syscon

-- 
2.51.0

