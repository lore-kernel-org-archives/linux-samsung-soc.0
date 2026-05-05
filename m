Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC9E44A71C
	for <linux-samsung-soc@vger.kernel.org>; Tue,  5 May 2026 13:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777986844; cv=none; b=ZNU+X/tMRHLHXRmctnzwvlxYE7PnuoEv1+9sZzNQ/kv6K1nzxhoXiculeBmAAvvaIw/4HMRpnAAVbbF9WYeAXaIHYskPsr8AlIeML7FBaKFdPwUcfKUZlv9z+af6E0rd1GsQTk6kf/L9l1dQh9lVcK8FW6DXVJaGijh7e1KxMw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777986844; c=relaxed/simple;
	bh=TrETAIBRtr5BpleipM5VXU32aMTdlU394IStlNmAoNo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NUYx+O6E232yuZASyiXFWg5PTBbD+PWXjHCDJn/V+3IGY1SnKCbi77eMTXoNIe+3vgcV4Wv8oxGS92TbHRPVCVGfCLS0lwMUl1jiL+oGW6OsI2J1+K/zkwSxUwDZLfz9WqBUnUispNTaPbizk7bcM2p2xsaVnb5RrYm1VRR2AIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dfevylt5; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dfevylt5"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso42910045e9.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 May 2026 06:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777986838; x=1778591638; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Mo2IeU/AaXoLyUW0cqRpgQJYVfBlAhtHpp2oMUPg6A=;
        b=dfevylt5xDKB6pM9jMRSj1DLj/nuuwVFmfzfOHeOwGo37vPQyU7H6LgPiHKfnqWFsr
         /6hbMPH0GGGptvfGGbBCJyu1ThmoU5UFOz9wT4pi26dx6OsiHAA1CRuKsS+yAH6GHXLM
         rFAecZC1xcBUgm8rtL0eHIB0TK+/9wopYTWMiXRpg1Nih+L7mFnOp30og4BWPM3h+R2i
         dd4nYXWRfz6iG2QTAHUrJ6OG1q6IHpN1oFegqLX1s61rYMwkfD2dOyYm15P/wOUfUlyV
         P8w5Z+QmFOe9O5f5LHYJhhDCmpn7lYm4pPLW/iRIZtVylFQ/KTskyO2OdYEbxe/AkToc
         C3/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777986838; x=1778591638;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+Mo2IeU/AaXoLyUW0cqRpgQJYVfBlAhtHpp2oMUPg6A=;
        b=ZTbcnwM3Z4x5jutUW+50cEPi8AbX0zl4FTTqH/5mOyrpQo8+g9SmAFsL+8WMmJEAWU
         3VFcBt9dffQXCrYkXib43apG+lRkbb7EIMYI1SBgxL3IMeaIudae6iiqID9gGXG9uSlg
         kwUWxngM3V6PG9srNR1tidpWVv8o5CCtDc6nLgq75tl/18g4vCW22viGW45jsCQsQ/yq
         xJp1wFBSIWMML9WV+AV1o0HMIr6n2Vfh1KWGeEn1k0DFc6BPkbOZ0ppGWq2HhJ6SMs2/
         mhxw4UsthYHhHY/n4fx4WWVQSLA8CDkGekLYhQP3fKByagFABRPfB0+8kivLe1PIJmfF
         Zx1A==
X-Forwarded-Encrypted: i=1; AFNElJ9Zg1gVOLHjDRpFzNUVGhVQFGSV//y8E8QY97zAX8dDoXZQP3ASw1OwcDNlxC5ecO/vcitA6MbfItOvEejml/RskA==@vger.kernel.org
X-Gm-Message-State: AOJu0YymtYyoZNAKKEF18nppY7lBFwDDc9FelnV4C9jEaF/QXgp6Tw2b
	lnWI5WFhrtjyvvkFuzI5fOOeqoYhXpdQlmjOg8LquuLOOK7QuCkThKpwb8ekeTLQrNs=
X-Gm-Gg: AeBDiet5Rw1vrt6TH84PuVxIijfF2U0JfhZJrhkXoylfH6lH785dYQQOnRs2O8Xldij
	v1xZa8LnNN7+CLrZ2uahMQ2wLmTCq7k/t1D2uyVrVml4/FiRL/cqZ386iq7p5pqZrwTjbUwqqGd
	ipYdIfvs/wlj/hPRtTbNCei306I7eCP78d78IIBff/QpRnSiEVxnJ5sa5oPzAqIMt8YNnDPG8VA
	DDWX41LNuORZKHcLTn2+XT1GwdYI1XqlNmqg/zuEkVQmAo12010aoiVHeOZ/LtCtjXR5FUBHsyD
	3UslTuQApUZEf+QasYC4CEwRWWMs8iG/OkmoVzR24O6B6Bm6r4tomqkZTOsItI3PlL1A6IlKDoP
	kJfyTHJmXeIYVy2/xQCh/tfgrhEFfKqM6WkMuJhHaSn+2YtOsAj2K612YKCp26XeSYbz7NWT1G5
	ns/j5az8yzyfPHrBRiSKqh2Sg6ME1X3s3o/gTZ/WOXyhv/jcx3NobcUyukv0JbHgUA9YlWKOvHl
	u4jytJh/zQoU2HpD6tFUSBd/Bc/
X-Received: by 2002:a05:600c:c0c2:b0:48a:76a3:2b9b with SMTP id 5b1f17b1804b1-48a9865ea56mr172953595e9.17.1777986832975;
        Tue, 05 May 2026 06:13:52 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eb72a17sm366599525e9.6.2026.05.05.06.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 06:13:52 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Tue, 05 May 2026 13:13:00 +0000
Subject: [PATCH v5 3/7] firmware: samsung: acpm: Fix dummy stubs to return
 ERR_PTR
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-acpm-fixes-sashiko-reports-v5-3-43b5ee7f1674@linaro.org>
References: <20260505-acpm-fixes-sashiko-reports-v5-0-43b5ee7f1674@linaro.org>
In-Reply-To: <20260505-acpm-fixes-sashiko-reports-v5-0-43b5ee7f1674@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, jyescas@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777986831; l=1843;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=TrETAIBRtr5BpleipM5VXU32aMTdlU394IStlNmAoNo=;
 b=okAA+Mks+tiZ1s4Jc4QBMMHkSt6NGOv/LwbI22GhCddZCxVtABSB/BDAqOsUu9MonRPBBkxDN
 jHgz8DkXtR2AxY0TqFa7j6ljCUuvR6o7fs+Un23tC7Mas+3rVYEJtuK
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Sashiko identified a potential NULL pointer dereference [1].

The dummy stub implementation for devm_acpm_get_by_node() returns NULL
when CONFIG_EXYNOS_ACPM_PROTOCOL is disabled.

However, the active implementation of this function returns an ERR_PTR
on failure, and the consumer driver checks the return value using
IS_ERR(). Because IS_ERR(NULL) evaluates to false, returning NULL from
the stub tricks consumer drivers into treating the NULL return as a
valid handle. Subsequent attempts to access handle->ops result in a
fatal NULL pointer dereference.

Fix this by returning ERR_PTR(-ENODEV) in the disabled configuration
to correctly propagate the disabled state and match the API contract.

Cc: stable@vger.kernel.org
Fixes: 6837c006d4e7 ("firmware: exynos-acpm: add empty method to allow compile test")
Closes: https://sashiko.dev/#/patchset/20260420-acpm-tmu-v3-0-3dc8e93f0b26%40linaro.org [1]
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 include/linux/firmware/samsung/exynos-acpm-protocol.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/firmware/samsung/exynos-acpm-protocol.h b/include/linux/firmware/samsung/exynos-acpm-protocol.h
index 13f17dc4443b..d4db2796a6fb 100644
--- a/include/linux/firmware/samsung/exynos-acpm-protocol.h
+++ b/include/linux/firmware/samsung/exynos-acpm-protocol.h
@@ -8,6 +8,7 @@
 #ifndef __EXYNOS_ACPM_PROTOCOL_H
 #define __EXYNOS_ACPM_PROTOCOL_H
 
+#include <linux/err.h>
 #include <linux/types.h>
 
 struct acpm_handle;
@@ -57,7 +58,7 @@ struct acpm_handle *devm_acpm_get_by_node(struct device *dev,
 static inline struct acpm_handle *devm_acpm_get_by_node(struct device *dev,
 							struct device_node *np)
 {
-	return NULL;
+	return ERR_PTR(-ENODEV);
 }
 #endif
 

-- 
2.54.0.545.g6539524ca2-goog

