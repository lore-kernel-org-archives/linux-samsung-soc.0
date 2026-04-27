Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFDD322C73
	for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Apr 2026 15:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777302261; cv=none; b=j7aMqOs8WNJwQFwU/k6bjwz93U4CCb55xIsfoP1DfMoHpDBP7n2Rja3Xm7aCaWkL1R7D0uDsad4bu2PRfrbPUQGZuo1SOt864kHB4u95UDUaxqXn5TKc+qQeEL8aAgfWvo4V0+RKuFqlMrLAOT1RVLIvAtpCvX/jBGy+pF9DtAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777302261; c=relaxed/simple;
	bh=fB8OyE4pYKQPjuNbbE1A8QI3wwuWeF5JuYv3jd8eSZs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mlBIYjFy6LEbv7EA5C2KyVLTXW6N6ReI0oF+ZOkul5Gos6lJest5q2U4SwZvXJUkMNm2mWdpA/QWYx0Mo+TS1C72PFUg5qFaefMyfFOO88kHneMXOKNEBkuIVa8KuoBCOtf7wNjbCC0S9mPU01VlxMVaIoAM9gKLJqAlex8zsIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Spm2aVO0; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Spm2aVO0"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso88309935e9.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Apr 2026 08:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777302254; x=1777907054; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xfcec3d2oELkX+F8ksbnLWsp1V1TC87fqGSb/6ZmXtE=;
        b=Spm2aVO030DFbZfIBBjTfW9dTfGYYkBVvMXcfrua38eHHeD08I806NNtJ6VT7sa1rq
         6ICnc13qxKK4qEVLnBoDSN0gc549EsxOzukIoy7dymRKGLZEfHdqP4v0vcitYjg7XPQN
         UIFLru9emAhXcjh7NvFMPJvEyHagxYfqeo6IA1XliHUnqDCYebn3gi1oieXs7BtrGT8F
         RMy7LQsTAviXWweDJU3weaMCcIlIBzyIWm6bY9lWpAaOXG2Q55n2ntbWacNbJ1IYdF5H
         RVIm6O0k4pp4lZOK8PR3H8siwyL54OTTYuQNNWScgDGws/bYI49CkcaW0OJrpk9NIFXW
         1J6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777302254; x=1777907054;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Xfcec3d2oELkX+F8ksbnLWsp1V1TC87fqGSb/6ZmXtE=;
        b=crJZrRjuK6KzcawemUMPG4lTlbrCHG4+4sRymCsR3uqQGSmszd+ng/K+AG2DqdvlIZ
         6OWDWmN+BuM2i3zLO3Y/Y01iAJWFCEEGE3M8FTmUcRlEl9+yzYa3+iMvXWQYGf/NgEgW
         3VVEa22snR63DXZhkobboWOM8WBMakxI/OymNWsCd+m2at+XgRiHAhoo2VEOq04xTzy3
         OKaeKFYLZxJLhdKS/dt4cwUBgc1cyGcDYlj1xMHC7hljwI7c/bTMkh/H3MH83sOOETUG
         2iwciGN38FlWqFkfld78MqBz8InyzMXUTMn5ktOrq7bmpim3BGdeSmnvyZ+I2tLSYTTm
         eFMA==
X-Forwarded-Encrypted: i=1; AFNElJ9SICvTxx+f4knWa+3X29+iyaYPEAQZDsO+cCRzbaRKOSb6rO+TZyQmSTH7XiW94eOxE5+ed7mTv8AY/OpNY7Zy2A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj7nOuTbQEsQKqNIqmNjrmnZYtGMZKuewQm4cgQA3KdN0ALk+2
	IN6ZvJKbp/ScacxM4Qngo7i34n3Y8Dr6unS/6iuSSeJTQeOotwHdqID5fdVOVai3D/Y=
X-Gm-Gg: AeBDietS6C38vUeOpf7AgqTHaVFit0B0YHpOWsCOh3L8Q3Lvv4p4mkerdkI2LwXr24A
	qlXCnaDiuRk1vPq6iydS9UjeG8uihgAQh33H0xbBBkj1IX6vtFvahQbE8Fy2hm9/Q0nynw48UU4
	G0wr3DdjOhqj+GZoZNwH/eK5YLLrFfNVgqv7omOsU+piSfJNzlbQ+ziCWJ3g85W6jjJiQtoW/bd
	HDqnyizpq5/UpHy+vuvDwhQdpYrpjnyh5ov8WFJGeK0URJ9Qmzw6Lvh4UueVh1SYIHc0xEHVfO/
	0A2kwU96L9I9tIdyp4Mcwq/YRqtfOaxvNY5AgUa1Ao7fQfb5xJt3AD3DGJdUjHvQeXV5PuKD11R
	FB+Tuxu7CtVPIvMbHuTmh5FrUpcJQAyHjKbLU07CrBYsge00iFoCQw3j7ZQ3QpzX2qhkqb+Zonh
	oHp46k/SbjRmkDn8Rfjka4cz8QOLsRtqTwcYUFlbdP+kfpkGzrkEMvbpsyOpvHK6Xf3XPGqwMNN
	L2JdBKNstVOyIe2Tg==
X-Received: by 2002:a05:600c:888b:b0:488:c40b:c8bf with SMTP id 5b1f17b1804b1-488fb73d234mr527219795e9.2.1777302254188;
        Mon, 27 Apr 2026 08:04:14 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48919f54572sm235370215e9.26.2026.04.27.08.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 08:04:13 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 27 Apr 2026 15:04:08 +0000
Subject: [PATCH v2 3/6] firmware: samsung: acpm: Fix dummy stubs to return
 ERR_PTR
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-acpm-fixes-sashiko-reports-v2-3-1ff8de94a997@linaro.org>
References: <20260427-acpm-fixes-sashiko-reports-v2-0-1ff8de94a997@linaro.org>
In-Reply-To: <20260427-acpm-fixes-sashiko-reports-v2-0-1ff8de94a997@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, jyescas@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777302249; l=1847;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=fB8OyE4pYKQPjuNbbE1A8QI3wwuWeF5JuYv3jd8eSZs=;
 b=KohU9VKCfVuIuMOhYROvJR+HIea1m6feyQAHQ9e2Mpn0g4X2Wbh/yKKVyVJF9PPGgjh7Ab6d8
 EfSIXn22EfOCWktI5TyxXcMHyE/XyGEbK9k3ED3GJnlMfiiN9DlvX6v
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
2.54.0.rc2.544.gc7ae2d5bb8-goog

