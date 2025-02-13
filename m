Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368AA23F417
	for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Feb 2025 13:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739451922; cv=none; b=g7AYh9QXFjWfwc2B+aT60b5HolbU5jBmewhB3G0F5hONK/QnhB70Kw5Kj6PUbrWHADuUA74AZAL//fVXPcqt6gp5957O63T7NE++FqybvkiyKN8hYjPTkNuxIky6pwdziNNQkkP2lGmfSJ3OBjOGZOT1/tB8UypPHAQa6dmn9fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739451922; c=relaxed/simple;
	bh=mxio+qKZ0oCarMDdKVLWSkQ5r9o/ZU/FWiQSXWeFPIk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MPBOhQKyaA10RMDbl+iiJqm0J/gHmnHpVECmvJhE1iqdJDO3++kmWz7hwvYRHOUOB061Wms7b/iAAFPLfHvK4XOm4LVt42MTxXIbcu8EOde/GTCuMrXY4rjRciPgiCix09uzBLL3r9w7LR/4pWu0r+1PnpR/T/2n6kJ3xMhMknk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HQDEeelf; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HQDEeelf"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43963935585so5105525e9.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Feb 2025 05:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739451918; x=1740056718; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zHOUQzUPyOdT3w4jRKuGIg3i9ApsudVpLcIIKx7XFPI=;
        b=HQDEeelf+j/E4ptkdMLkkstJuvqV1DKHDRsXonj6R2YCHoao753LThTulU4siSq00i
         dCd2C/TRnMyIq8PVbnArynpw2gnQUHmLwtGfFRx4uqcKSlzYJfZXyLMRoTe88ksOokT6
         h4/5R1FRWmMuyUB2K7hGuuu8hNxTfKq99BEKnsduDEt2k+WlHNQ0DmEZ1gGWg/L+UrAV
         cvbYy4Mf6fRS6flVjZb+VwAdOq+9k5iLfsMTuoDsb+51SsY1okdOs/6OoJlWdW4n1SRk
         InoIrhk3iecG/u/2hOsJVsAp8jA+b85D3ftwvUYQ5TsCydwRmYQOeLXDUc7muogzdV//
         WelA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739451918; x=1740056718;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zHOUQzUPyOdT3w4jRKuGIg3i9ApsudVpLcIIKx7XFPI=;
        b=hKe20Rvr8gfAU+YqmJ+O/4X89YJ+UdqUtNuDnUdFxShrBFBjoMGbiqtkm5uQqK5tSM
         WCFDIwhQWphfQSdbv3wVQ0IuyNTd7wUgNG6E1PIorhOObEvXZT0PaTxZQiK0YL4cKtwt
         +jsmMbU0ATHIuBoH84nWXLuTpwjngskJdkw4oPkrRqdwOPGjMWstW7ewxzLG8PqnmJw9
         8O05L8qhT0ECXHyVt7GoG9XD16yoqAF4XjO3sH0PTqT5LgzU6zRIpb726UuCGf/4keab
         Q3XvLGEsaskKmmWS/j/JQ/2lU42I3izwstfAxg7/acru0/68tFqMVLdKIwxz/+dVp6Zz
         KO4w==
X-Forwarded-Encrypted: i=1; AJvYcCX8E1iY/7tTq8ZnYaEQyF0AIfI3SpglUU/cMqBexQoOQpEwmLp7jGyw4kC4c4YbQLmnFpVKgf7z8WjrAiqzKxuwRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0AsvCgjVDWVbwf+RNn4iLyFXnuUz2RTQpI5d/f1BOFYp9hT8R
	zacq0Ookqwb4XEy3sr7Rd9rkL8LPE6PFE+efYJUrZQf63npXfv3XD/jEfXp4kx4=
X-Gm-Gg: ASbGncsP6W/rZxSn7cN86sVdbotVAvPrVA75wLS4KgxN5mQmos02iu0gGOfBAHjQtsJ
	8xObYK5MteauAtIAVojeXbntnkAeBcRK93kiny7AvSP17xWnS0gLB9rLBePUDOBpH6kv8hIvoD/
	d4wWddus1eu9VBem7CARZS4m+OvlqR6VhxgFdaT2K2U1IkU2HeXC9TT2JXhRh0AiEa1q9BhX5Oz
	M0kAv8FFvdJiy5vx7UjOUwuYJ8109PJwwUjxwvTrDpW3iRazIdQJb232/a4zZX7YcRAjGA9gFrf
	aK3g4rT1Id9hpQtHtnHb2w74DeNg8puQUag9Ajeprby4fKCGUzD8vYLcAFj/1ufkqMnPlJc=
X-Google-Smtp-Source: AGHT+IHgAl/NTXWukWtRPOrcZw6v4KuAstgKfnNDDXq/WjRE7Xg59rRDQuiiCesGIdxFPL7opskBkw==
X-Received: by 2002:a05:600c:3b92:b0:439:44eb:2db0 with SMTP id 5b1f17b1804b1-4395817ab18mr78523335e9.15.1739451918162;
        Thu, 13 Feb 2025 05:05:18 -0800 (PST)
Received: from ta2.c.googlers.com (169.178.77.34.bc.googleusercontent.com. [34.77.178.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43961884251sm17004025e9.31.2025.02.13.05.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 05:05:17 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Thu, 13 Feb 2025 13:05:16 +0000
Subject: [PATCH v9 3/3] MAINTAINERS: add entry for the Samsung Exynos ACPM
 mailbox protocol
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-gs101-acpm-v9-3-8b0281b93c8b@linaro.org>
References: <20250213-gs101-acpm-v9-0-8b0281b93c8b@linaro.org>
In-Reply-To: <20250213-gs101-acpm-v9-0-8b0281b93c8b@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 andre.draszik@linaro.org, kernel-team@android.com, willmcvicker@google.com, 
 peter.griffin@linaro.org, daniel.lezcano@linaro.org, 
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739451915; l=1230;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=mxio+qKZ0oCarMDdKVLWSkQ5r9o/ZU/FWiQSXWeFPIk=;
 b=GiT09Wr16zJYvD7p0ZCHkOHEx8QQPR1xqF7gPsJekwN511IOr3sW5U1/bKSFoCjDMsYO7zMub
 7HYPPkCkvERCkZePKsrvCh1pUdoxfmcR4KxfZzUNiIkht1bVjzHd0Sa
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Add entry for the Samsung Exynos ACPM mailbox protocol.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 896a307fa065..79ac2f3abff0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3070,6 +3070,7 @@ F:	drivers/*/*s3c24*
 F:	drivers/*/*s3c64xx*
 F:	drivers/*/*s5pv210*
 F:	drivers/clocksource/samsung_pwm_timer.c
+F:	drivers/firmware/samsung/
 F:	drivers/mailbox/exynos-mailbox.c
 F:	drivers/memory/samsung/
 F:	drivers/pwm/pwm-samsung.c
@@ -20899,6 +20900,15 @@ F:	arch/arm64/boot/dts/exynos/exynos850*
 F:	drivers/clk/samsung/clk-exynos850.c
 F:	include/dt-bindings/clock/exynos850.h
 
+SAMSUNG EXYNOS ACPM MAILBOX PROTOCOL
+M:	Tudor Ambarus <tudor.ambarus@linaro.org>
+L:	linux-kernel@vger.kernel.org
+L:	linux-samsung-soc@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
+F:	drivers/firmware/samsung/exynos-acpm*
+F:	include/linux/firmware/samsung/exynos-acpm-protocol.h
+
 SAMSUNG EXYNOS MAILBOX DRIVER
 M:	Tudor Ambarus <tudor.ambarus@linaro.org>
 L:	linux-kernel@vger.kernel.org

-- 
2.48.1.502.g6dc24dfdaf-goog

