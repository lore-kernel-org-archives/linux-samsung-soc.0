Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E299831A576
	for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Apr 2026 14:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776953953; cv=none; b=pD4+ynNWcRpz3uEa7KR+tLpuiZRvRgxFZROSO6bhPbhlQGkN4sVmSi5R2h+ywzAHLQmbiUHFsNvviqVAOLufYXMjG6sVG7xMNTOTs6WrCMGSuR33qbd8ilIow/K3PL1iqLZD8qFKGOVJECcM1JMjyT+qnYinbf/7oZs+9H4Kkg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776953953; c=relaxed/simple;
	bh=TrETAIBRtr5BpleipM5VXU32aMTdlU394IStlNmAoNo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d9CJ3YPtkUEuBb/thLpQ2XkcWiGQP8VF0DijyRAjXnFmdG5f62Elb0zzAK2x1zLFPsQXSHQ9HEIaZTh3eajOwivasSiXviktYlH3knFJdxBOpZATdcXy749zcK/0Jp8kaGmsVYcZsi60YFluGwRAK3Akrfuwj2fNHWaJORtppsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FFV+Cyub; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FFV+Cyub"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43d76dd4ee8so6133247f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Apr 2026 07:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776953950; x=1777558750; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Mo2IeU/AaXoLyUW0cqRpgQJYVfBlAhtHpp2oMUPg6A=;
        b=FFV+CyubYP+ozgfBvbMITPj1BNmOhuRHMeOV+xU4zoI/IkpWUZT9xswbaCcw3MIeee
         Cjpkh6MnDR+GxtCiR9+Mc2Im5ZG8FqAWQmH4L5T5DsltpFLM8VuMIkjj66tfad3SJQX2
         BKeHpz8Ffq2upp4H6X2OiTe1cMJbWBRw3CCH95DnUoMz7EGd9HIy7HcuWU4JckfrJllW
         6L0lozPR0YmqUZPqHczg3BKizdsLrCfA0cJN1qZcugKm0vJodhYGTciBAhlyRVxHACkJ
         YnfF197s0p7OPzdtU3uPV82JB0gu9hhWLx54VhhUc+NjzxjnuvodRtQXcZ6e+6W/r7dL
         9Pfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776953950; x=1777558750;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+Mo2IeU/AaXoLyUW0cqRpgQJYVfBlAhtHpp2oMUPg6A=;
        b=NFzxrbVdRbAsklIWC9unuEORKirJTEVMdC8VbpT3QMZSDeC6zKIuBB+XBhwojDDgb+
         RfsUIQ0rP5xKXj6gFQG5fv6DM2tt2HwA8gwE/7EcXyhit2n/cIn83NCaKdaOYZMp7/Jf
         INrOi8gFct0xUyGAwHr5HNO3S5yQ8gLkHD9Mfm1XYQTbLSszxRmysTBbwuXV8tEG5URl
         93S1U2jvg9W80vIG37Ugk3v4/qaL9+zgFyfW52fmAM1Zg1efUAjfyDuj4mEBgvnC62lm
         LqGABC6HdtieDfEGoWm5MDtiK8xjxy+p8gO/uHqoMG3673v8Z4eyuXTCrYlA3lBKefYa
         gt7Q==
X-Forwarded-Encrypted: i=1; AFNElJ/Iq0biMjHSelgiZLaGFV7PbAIay8+TttK2gpFm+i5M23dCTUJjwHlIYSvygvkmrGDKYBiCUq2jXdlE4LYoVuHyrw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw742VkG8cmQH/YaVi0U1CQnnyNa/TJzIC13ijuoCBtWmIe9QCb
	vloo+NtVeZ+J7UPBBEOf7r18Xvh8bKMU5L67KTtvkPERWofYUICjnHmTN3TcWh8INf8=
X-Gm-Gg: AeBDieuhFsdwSwU3lIsGZOWFhMpsQjmMAPSdpI15iUu0sW0+aDHzQ9mmKxytFROBGXy
	POxU8urmPr8X6WySVvAFWHffNbdvqQTQBElH8+DheqRMFGWOV1DNRgDcXm0WPtFExKRnoSvFiCh
	xx1bhijU7yB8RQY5KZS047+zeLcr9PuDznji7eAZhXfQ7M6LPEDUxppbjQ2m3QY9JR5ySoYb9H+
	4pZ0+kpdKywg0PfTdq9zmbRiGbgFhb73aTZDLI+9CaiLk6/U613RzzcdGAyKjfNVJpuDa2vpHbM
	3iVc8CFJosWFKKELSyakYaG8WI+nHUpvu4EVt5m/3e3VaUEgJyXOEDWsOkh7ebsVvH6OxxokTA9
	eI7h+xX6lJIMhdvMwVQUcucjlIHH61EMOqEDNWeL4oWm6WEuQ/8aDQV+6MNJa0gFXMPbVJn2yBb
	qImJ+wQsCF09uzbfmMZlj1XtIjwRQ4wML+7XdtfzIkmDbkYRIcAnhMsEJR4YKuprqT0GEnuInkx
	h2/HNNvh8qvNWP58w==
X-Received: by 2002:a5d:4ed2:0:b0:43f:ea25:20ff with SMTP id ffacd0b85a97d-43fea252120mr26389443f8f.29.1776953950228;
        Thu, 23 Apr 2026 07:19:10 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e4d525sm51107483f8f.31.2026.04.23.07.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 07:19:09 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Thu, 23 Apr 2026 14:19:08 +0000
Subject: [PATCH 4/4] firmware: samsung: acpm: Fix dummy stubs to return
 ERR_PTR
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-acpm-fixes-sashiko-reports-v1-4-2217b790925e@linaro.org>
References: <20260423-acpm-fixes-sashiko-reports-v1-0-2217b790925e@linaro.org>
In-Reply-To: <20260423-acpm-fixes-sashiko-reports-v1-0-2217b790925e@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, jyescas@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776953946; l=1843;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=TrETAIBRtr5BpleipM5VXU32aMTdlU394IStlNmAoNo=;
 b=i79vicUFzY3Onqf5OYj/Gpp1I7cWGIKf2Gu04oPG78VdXvKe/mM1tWjxIiGpqqhWXVO7u+3NR
 a963qJxKznSA4ZndiD2phqglKzLbYatsVVbBB1pq3M36X6MzqSjxJ6G
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

