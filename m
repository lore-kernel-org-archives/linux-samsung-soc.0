Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBEDF399358
	for <linux-samsung-soc@vger.kernel.org>; Mon,  4 May 2026 10:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777889752; cv=none; b=mBsWtvpW8xBYDS0aPdYKK5VGswBVBnSWXu/qcEVwhQXo82EY7ybhnPC6nt52ekjzqczdeKb+mGAG9yTBtasabKoBctycNKFnKbCIJvogR9IsUUh3bkS3iWPdqYsL0SEY4g6b0G4PKs8JnczaZUCortcjuGWCV1lJXvJnFIJVlyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777889752; c=relaxed/simple;
	bh=TrETAIBRtr5BpleipM5VXU32aMTdlU394IStlNmAoNo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e+RoMFI2UKFEmT/6RvWdAiUyDCh+Urk2qrGsxlU/kwbfHyKJ20d8IuCgv3qNJUjbKS7GjKAMD5VCj+x7alMBs1wvwz6Fk2sX3auk4bNJTsMU9KOJJ+S6v/KJLKnlICNMCNmMTvmN3EUwMS4xH8+7CIy5EyZjBcraVgpbMsbjjnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OjTEUlfN; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OjTEUlfN"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-44ce78ab5feso1203898f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 04 May 2026 03:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777889749; x=1778494549; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Mo2IeU/AaXoLyUW0cqRpgQJYVfBlAhtHpp2oMUPg6A=;
        b=OjTEUlfNxGC41758zh+ueT+RSYTzbRLcr2f7rdcA1FddffBQvJRzuQ5VeCum4DQH+o
         JfDAy5iqZ83wZjf0gaRLLSH+cXD/GD6+l5eOvph3ezunkwPTXxJ7Md6bxacUGJUmbrN6
         BA2yTigkoxFbC0J0gdp7MTZCcnnK+Ufn47OGUWvx6NiiBAnADEpvHf14GMHQio6DzGL/
         PiZuIDNmzMx10SAp5ijYGeEX3QBLdxAqw6maGgp89LmJtm9OJZYhfVNBvn2sOHGr7Akf
         WhmnPNXWgcB+o5OKPzEDEnzLK1ejw9rHoY+mF4xG6R077lnDuApsDXs+S8jHCdrixypn
         WQyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777889749; x=1778494549;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+Mo2IeU/AaXoLyUW0cqRpgQJYVfBlAhtHpp2oMUPg6A=;
        b=V4vbIg7LIu84PgGvuo5Rx/ikIcKvUJlZnSre8y5IW2RhOLSpe22O/TWF3AE5AUNARd
         oma7xOcEy0TeML2jLOGv8H0RjTWbX83YqiO6okEVPgNrvWom2KnqmqsCrxLONILVk17c
         7u0nXnbIcFLqS/wKgs6wHFOtKsKdVtM322amcISaR2QPAe1rncyZ6/GrlZ805l8posUG
         0OQKMdrYcEyGcbYJpRBzJ+7XB40o9QmW0fz4spxbO2GwYFaICKvvwysWawCLXx5FSOjr
         rxrEou4MOkEbQ9S+a4rpxPa4fBXdmOTZlMBejEeYxbh7NCdqOMEpTSsTqMPwL2BWHQ+b
         qfAw==
X-Forwarded-Encrypted: i=1; AFNElJ9iALnMSQP+UY45nL1ugsV2pGCTo5u1ZOfyzARpQXQk+lYtAbviQGvT0KPkmjq8B1C80kl22IoaIYPzra7bJdXAgg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxwq24zbw8Wyd0f9MWr0cWUFZKBUNWoQE+81sE1bZwJronwy/YZ
	D8H/dgeWDJAJE5Qzx65iSPbdHXjRm5PuOy/TYJXW5llnUemyfXyrjtuX6SsuuorhdOY=
X-Gm-Gg: AeBDieu00xb+3omgTaueY3n7z9meOdav2unrzz6Fu+W06OVjfdcbp54KE3zAi3x4k0Z
	K4eEuniODUW3vemCiyF5mWONh3bhCkLzLE19EUS+GugI502zPTt8TwCO2RRsRmz30f8C1pGeTy0
	zhnAV29XMa/kKKLFhnqtJDw+zQgPp5vg0OCsmzmiHkEq7bdrO7fEyOZu8uXDfk0b4ogKVdf+o3h
	WAEAj7grcKnq91T3VlD+ZLnjl8HuP8K5F9Jg8sF9j91YO2WO/xuDhFPK6IbAClbzpRqmtPUhrCC
	SLwtgO5sRdardt6TytBDCVUQhRnFUD7gA7xQxE9t3ecX9h2rM/9VxKs/IogWUG06X64B4k8b0fi
	GKCV7u2y2XIOHht2r9mAGbacAQk4whGoKKh9mpAmZwS2VahQsbPCAkhVzHD9/+WaP7VY8uiRQZa
	R310n0EFOrVlENK9j+56UmUQR7e0ruSzlwFYjOhApSfNcUOgjmEADUA9jNvMs9rGyFMFogPytK4
	xgRB2EdDe95sHjyKg==
X-Received: by 2002:a05:6000:2dc6:b0:43f:e99a:ff91 with SMTP id ffacd0b85a97d-44bb4538036mr13545221f8f.4.1777889749199;
        Mon, 04 May 2026 03:15:49 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a9879ef89sm28545366f8f.30.2026.05.04.03.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 03:15:48 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 04 May 2026 10:15:46 +0000
Subject: [PATCH v4 3/7] firmware: samsung: acpm: Fix dummy stubs to return
 ERR_PTR
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-acpm-fixes-sashiko-reports-v4-3-529246be6b2b@linaro.org>
References: <20260504-acpm-fixes-sashiko-reports-v4-0-529246be6b2b@linaro.org>
In-Reply-To: <20260504-acpm-fixes-sashiko-reports-v4-0-529246be6b2b@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, jyescas@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777889746; l=1843;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=TrETAIBRtr5BpleipM5VXU32aMTdlU394IStlNmAoNo=;
 b=pwo0xPZ+j2nUIqRUV0W+GmOAiRSFJ9hB1ibEiJnHUOT5RynjZS2zWHluR75Uagx6xq6iMWjKr
 7H6qLWZki7ADMzuDAAtTu0ijPIK7z7dJq5AyuHmxz7AJ+lK1nM6C8kp
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

