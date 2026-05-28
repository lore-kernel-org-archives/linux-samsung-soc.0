Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759453E51DF
	for <linux-samsung-soc@vger.kernel.org>; Thu, 28 May 2026 11:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779968189; cv=none; b=VjEHzuQRpkM/7xxmaV3lrKWwOntJERZv4mU3ttDPqJ3J/XjO4LHhFattVGjPy+dqC88yGkAms4HvtwxFqnmNq1cur2NKDgNA4T6y252YuO7Lw5kwi2gMEJT8SNh/89R4z4KPcAquZ94bkKUKjGevksnBhMYlkKc5V2D0b4Q1BJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779968189; c=relaxed/simple;
	bh=Aobvj69DN8F6w0+Jb0r9TFQ6oCGfBu7fy/EjQhPy1lI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oj43omDJVEw2OaVgYlhRY56QPF7NVS8qFWdIcb8nhMFOHgbOU5vuDQVCfy5H2/9GaUPgFI6j7L2PerV1zJtKVvTIXpMr3h/lYiEy4mPk8T9tox+CM2PCRuaoonAlW9Aqa8tzmwMFcrNHQXe+h0VP7k8Ab8rqeJ+VeQE2FhUn9lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JS80tqNZ; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JS80tqNZ"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so133292165e9.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 28 May 2026 04:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779968183; x=1780572983; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wpUOS+9fsWY0UqlgRlGBSremc/v/5gxyA5J8k3968CI=;
        b=JS80tqNZjTwx+lUJcz3qQiVMLsMc6hrU6LFf9NvYdWVr8mxXyg3rHxnIcJNkOg7OEO
         creHdT/CzuN+IbwOun69wCtQvMuJtT9BEj3Dzc0533ZsFZCSgMLGsvyVJvroiy1EFXFJ
         5AgxNjKVnKnBv6Y3ocT7vso1iCyrGue6okSRqIuFNkUtHDLzpdTcCSndrG/Xa8eW/mO3
         lM/h8kbs5PalzV6AZ1m9ZjADEOuflA2xeZsO54iISgBUxv9XYb5U7wlpYOFU4eh1ugCS
         aw1hm0EXiaImxpkSd2x3KytsgicKWobpSSek9RO+bBQOlZyYksEiKfjT4cOsDvtBxJAr
         3tVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779968183; x=1780572983;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wpUOS+9fsWY0UqlgRlGBSremc/v/5gxyA5J8k3968CI=;
        b=mMjQQevUcKeYk8eaCxCl6EivzXhcxLsjloF975hbo9zj4UoigfQhLlcBwuRlJ3iQX+
         driEPbmPjJKk8woCMQW6Bcc5puaKShj5CqIB0qZseAuLco3U8yjxLogwxbnKiZ1Mo/1z
         0RNKxsL+8mGT9tEQXbToTYKtqwfatgIxDJTP4ISNJ4K+7CIxWpg+BMibacvlSQWMl2oo
         m3cGMxwGIXSV3hrUwRX2gIPMiK576xY+LJeHDKdBSD8nQJtzV/Ufn4l8d08+ccyMY7ul
         V5TgKeQ0JZ2QrP3bHhrrI+Z5hLieIkXIjFGxeEFnsAUT5fm+XWJOv9lJBf3CqCdtTeKf
         pq0A==
X-Forwarded-Encrypted: i=1; AFNElJ9xaCmheabjo1pAPoLHhbNEISiqJCfC73bEEspkUtq3VKoP+U8zvvZvdvaGcpfKM4PeJEkxjc0fhfzF57bOabGpzw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSOwG1swEGu9yjJIxcBEB5oLhDphbBUciOdvvARkdeOzSPVZQK
	mtwoTZpA1WmBPwBK+DsZAxp304OIrqEV2SDo8dSJ+tQzmvVuAXSpa4yPVMxV3jbUwkY=
X-Gm-Gg: Acq92OErbeAlfYEH2wHG+isfvI61sUc5II17dEwU3fR5uLtRZX28gAP7OAdavf3ESqV
	1LU78I/krPJQitGEfREod/hVU6IeQlXH5n2vq9XM7pwaV1FUptIXYGOLtFleOmfXhrcOaY0SFVi
	ISbiiYcAPoydWqqaaHwPOni7h9u1ZueWtW3xp8RYZqMtEeApNaoJRe1BvelYwufJbP4Cxqd5q3Q
	ZWtJ2l/rAQWBXurdkBblaMb/shY3SnEe7tF3W2kX/sPmTufoFVnORSvTvPVf/s7UICCTA2Qyq4z
	aaGvHsIE3s2ZSIZPlTxmSt+lYJdXQQEX1qIK4+9kSB1w43njfTtTifp5gr8wPXwyNvRUpcr+/++
	8H13kVq8mu8y6i4xN7YJtF7j9ZK2rmSqZSKt9guho+g7twUIvgAy3dGCULbFKq8+qXOJthRquYU
	viyjQ4UMPo0+RfuhfrSqGwt6/wx3H3nLwHLZ5YxQk8JFQTtXNpwB6Nvgm4RKOfWfpjvnYrUgBz/
	p1u/xCuFzozuy/eqMnWPt4oTbFm
X-Received: by 2002:a05:600c:8484:b0:48a:906b:14ca with SMTP id 5b1f17b1804b1-490426cd8c4mr466725355e9.20.1779968183364;
        Thu, 28 May 2026 04:36:23 -0700 (PDT)
Received: from ta2.c.googlers.com (231.141.38.34.bc.googleusercontent.com. [34.38.141.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49092a902bfsm60385715e9.12.2026.05.28.04.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 04:36:23 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Thu, 28 May 2026 11:36:18 +0000
Subject: [PATCH v6 5/5] arm64: defconfig: enable Exynos ACPM thermal
 support
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260528-acpm-tmu-v6-5-b4d7ce57594b@linaro.org>
References: <20260528-acpm-tmu-v6-0-b4d7ce57594b@linaro.org>
In-Reply-To: <20260528-acpm-tmu-v6-0-b4d7ce57594b@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: jyescas@google.com, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-hardening@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779968180; l=794;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=Aobvj69DN8F6w0+Jb0r9TFQ6oCGfBu7fy/EjQhPy1lI=;
 b=IrVw2lxVCkAd6zW/JJPCyuIUKwWUWmwU9qRVAfB/8ZYIYZEo8nd4c6wq7R9RZmeF123hMczZw
 7EaqfiU+KYjBsr+EB35bTx2qZFhGyzz8N0BhvF5UIvxX1zl1H7Zm7/j
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Enable the Exynos ACPM thermal driver (CONFIG_EXYNOS_ACPM_THERMAL)
to allow temperature monitoring and thermal management on Samsung
Exynos SoCs (like Google GS101), used on pixel phones.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index d905a0777f93..3fe76a4c2633 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -793,6 +793,7 @@ CONFIG_BCM2711_THERMAL=m
 CONFIG_BCM2835_THERMAL=m
 CONFIG_BRCMSTB_THERMAL=m
 CONFIG_EXYNOS_THERMAL=y
+CONFIG_EXYNOS_ACPM_THERMAL=m
 CONFIG_TEGRA_SOCTHERM=m
 CONFIG_TEGRA_BPMP_THERMAL=m
 CONFIG_GENERIC_ADC_THERMAL=m

-- 
2.54.0.794.g4f17f83d09-goog

