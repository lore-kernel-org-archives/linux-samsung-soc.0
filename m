Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7234202F9F
	for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Mar 2025 16:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741970407; cv=none; b=uZbvBcHJ46/UX3sbwAr4d1tqhjGk23llJZEVIyKaMIMX38Mm7G59idgg9q7bGQHzHVBaVJBZcZORKK3oWQVxljnYn15FHRMKZ3f9G/ypSYDVGDYu8N6uIn2FMezm8JXL1mMPg16x6frmIYaeWLGTt1+WUzn/sSLLEHXPE09ais0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741970407; c=relaxed/simple;
	bh=EMglvuwJCM4I+POaB0pzqrwXSchddeRXR/kp58h7CKE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WA4F5Z9gWSAkmRGLniqI2qD9RPa03DOfEf/qA4J/QFGOnNtlaSIIks2pW2F4CNs90pp1vllA4c03bQdZcz13tg0igV0Zm3A2R+iNrQlcR5193kDqh3UvfE98t3PRx2i3mVRr1m8BiBlk2FUGhgqPGrosD20RKcC/A5GdLPZHVoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NJ5jXlQZ; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NJ5jXlQZ"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5e686d39ba2so4594074a12.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Mar 2025 09:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741970404; x=1742575204; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5EHw6xE0g+7qki2CSo1YJpVOxoekKA/7CSCBUCVC664=;
        b=NJ5jXlQZ/hwOScFX95HnPdPZdRXXVjjSgVkMwG7ssFH1eqkLQIRUbgc0nMuS87m1oS
         g3Cn4lBDh2LPa7M1joLd+XqeCyi9QalVuRvyg0l58HoDf4mdZM4uoqc2iyAWaxyDlQ8F
         dvaKx1yAYkI+l5RfCToIcZPH+PrqXT5JGxYyVOivCrts7R/bHe7PT95ddKaN2YuuyeBC
         tLU+yP+1Mbb2x1E2W4G3i23n5j8Sk8+vGjF7GtQ4owmeEX9VUHnmnOuoNe5yH9OvO4rI
         J4ZGpHxj6oXg0M3oMhorFGLDbLHMUABpDllL3fCFdsDT7rXvk1pOIOTIy88iD8ddGL55
         Te8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741970404; x=1742575204;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5EHw6xE0g+7qki2CSo1YJpVOxoekKA/7CSCBUCVC664=;
        b=QurQEF4WqYPb5pRPv5xcGVIEF2Xwy1tV5vecKzw4l7shS+RPGXCLC4p/9T1Lov3Gc7
         3uCg6ljYHuKdcbBNVBByTimpoJVTt4jw0Y/c8O2BmsRSf5Ht9vETsNWqVDiMhRfHlsyb
         G88Xnzt0gLVijDzxeTvRmMuubJAQUw02LjWA4BgmRt8jASOV2GXNrodCdL9czQYDztP4
         AD6DNdQYN4Vgn9QUwCezJlvC42hVv8p+hNVjCpbTBmUEWDoS2auZCUu/7/Y08wrm1WRJ
         BSK0hVHrUvicGAbRNP8z2fHrZk1azSsLfXdoPVc3YWd7iWv3FuW2KU5NcRh0QeF8+U5L
         ntzA==
X-Forwarded-Encrypted: i=1; AJvYcCWZnASt28H1to7i7gSclxs+KIn9pZZwcxr6mqyfhMPAWKbwE5Nes6m3AVq/lOZkQOqH+qs/P+au4zPUNabZPm/N8A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFk/ZQoEdHPA8eKyD9weBL1QOCK4IpHDZ/YYZM5xTsul1lyqTa
	1VwW8FWIUWd7kP9i8c6XJHAx7FNPvUefekQ2h7xHL0F5fVEgb/eXHi0zt68xL2M=
X-Gm-Gg: ASbGncsrPnOPaHHjikN58Ldb3N/RrBzVJstTMeuh/OoaD02nkDPll3hj6bL4bG+uO3W
	V+GBqjHBugX/UOBwcZrdNnpFcxgjvtc1bgl5CM0AeMyb+wVQ+fanYpJQJQWyUo4AIZG5Z45KL3P
	G9+kXvjIHrNUNJDrP8IO8Asg1Rmo7/F9ZjXZVCM1bt7WwKBWsqGFuX2xMQTOPBEOll9S/4GAeXQ
	Y7SLOAhX2LoJC1JfPmjERSpHy0XynJlgbN8W5CLmrpydG7lYOxgSnqMhgCWWfsmAM5jZRb5zZmI
	an334wHVszdc5kGQRqVIbBPlIIJYhXhqu5xbT5UZ3ET9g4fYRpHkqi345/9HgCCzFN40OzS0Zyl
	6tZKU39LRYaj7655GZ27UJrDdb+n70wIBMohRQvs=
X-Google-Smtp-Source: AGHT+IFm72MRO+sabSmFs08xZRpk0IIZks2PIM2q02CRV+JCE7zgfN2FDEwb9GyApg/KaKdRxs7krQ==
X-Received: by 2002:a05:6402:3550:b0:5e7:aeb9:d0cc with SMTP id 4fb4d7f45d1cf-5e89e6afc19mr3874499a12.3.1741970403936;
        Fri, 14 Mar 2025 09:40:03 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e816968cd8sm2115727a12.18.2025.03.14.09.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 09:40:03 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 14 Mar 2025 16:40:02 +0000
Subject: [PATCH 2/3] firmware: exynos-acpm: silence EPROBE_DEFER error on
 boot
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250314-acpm-fixes-v1-2-ab03ca8e723f@linaro.org>
References: <20250314-acpm-fixes-v1-0-ab03ca8e723f@linaro.org>
In-Reply-To: <20250314-acpm-fixes-v1-0-ab03ca8e723f@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

This driver emits error messages when client drivers are trying to get
an interface handle to this driver here before this driver has
completed _probe().

Given this driver returns -EPROBE_DEFER in that case, this is not an
error and shouldn't be emitted to the log, so just remove them.

Fixes: a88927b534ba ("firmware: add Exynos ACPM protocol driver")
Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
issue is in linux-next only afaics at this stage, as driver is not
merged into Linus' tree yet
---
 drivers/firmware/samsung/exynos-acpm.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index a85b2dbdd9f0d7b1f327f54a0a283e4f32587a98..48f1e3cacaa709ae703115169df138b659ddae44 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -690,14 +690,11 @@ static const struct acpm_handle *acpm_get_by_phandle(struct device *dev,
 
 	acpm = platform_get_drvdata(pdev);
 	if (!acpm) {
-		dev_err(dev, "Cannot get drvdata from %s\n",
-			dev_name(&pdev->dev));
 		platform_device_put(pdev);
 		return ERR_PTR(-EPROBE_DEFER);
 	}
 
 	if (!try_module_get(pdev->dev.driver->owner)) {
-		dev_err(dev, "Cannot get module reference.\n");
 		platform_device_put(pdev);
 		return ERR_PTR(-EPROBE_DEFER);
 	}

-- 
2.49.0.rc1.451.g8f38331e32-goog

