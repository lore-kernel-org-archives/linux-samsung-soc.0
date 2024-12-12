Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72A5223E9C
	for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Dec 2024 15:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734018245; cv=none; b=sogXu12K4FZJCEEil/qSx+Y1a54yAfo1PfsynaJAIyG7YvgSmJammAVIZz0RC4RoFk7vk1e2hXEGrAtUxr34YNPLe2aca3gZWA4ok/5C6dY6HInTj3IqW3MBNQjIJconKV/OwZgcQ5E/wQM4zo4UoWcyP5rv2Uqthn6fq5JQi1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734018245; c=relaxed/simple;
	bh=8mV9HZFeUbw3Rtv6RCuQBzzPvwJEiDZDgZep1nTSp4k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y/8kec5YLwjBBaHiHf0fw3LvVE8lQF9g1GlAgdnZyMpRouaOP4u9gRy/jVwN3KBUer9pe8bM3mw03gLQekO9rJW/BxY8KW5LAK2UehvzONnH4iJTwwTFuEinONLKwEbbeu8jreTvg+9GJsdPdUWZhpGY2ho1Y/NnAbVruozAWuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KzKjtM/v; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KzKjtM/v"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-436202dd730so5555795e9.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Dec 2024 07:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734018242; x=1734623042; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7jmpxBMmEPk/hDGZYt5vcaNwz+hoDqezVHu8V6ZILUc=;
        b=KzKjtM/vAxUhC/ipD/OXH+pEBuTLz15oWR50i/f8J3Gvc3RMiO1PV+3NBMwtKyXcRm
         gKKCfSSLNH/H2+vQxB39h6EDkKNDTE3Af4j+twoqFH5hBrKaKnou8bnhyDreezltbemT
         ge6SYujkqjzZqayzu6yeW9R9Q5T7RhJhplQT4ucEMnn0fi9eARa3Qpa9aNmQEH70BEqU
         inFfZavxD5ajisWpAO4R/UniJk+e/aNLRrdAPnCati1sC4K8AJzhz+J/hAlD3t+vHK5b
         17B4Hu/R/D5oCpcX7cZ2dlg9OfZ1O38kw9Sm/eYUqelYzuIlWuIlN4kZVF/OAnfCrLt3
         dL2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734018242; x=1734623042;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7jmpxBMmEPk/hDGZYt5vcaNwz+hoDqezVHu8V6ZILUc=;
        b=REONd0VjG8qTCu7tZw5juQXnZOt1T2NUoaH7/72mqALTxzAZa9tjiIiJtgCnLJtIeo
         h2kipcLfyoRDZ3R/kj2PiPH9ce8fwwKlHFA8+R8wuYg+KO855k+8Yc/fksp/5Lfmp9E6
         01dx4MX+hSmsU1HIKKcr+KN/BZY/gkEd4MMsUan/Pd7702OlEdhodOWhXvQlJAdpWgCa
         yP82Wy00QSkcX1Qm3YFTS+QSN14fsbxUbVrMNKPcmaBAWDghKsskSfHyZHjQOjkfFiuI
         ordV95gyuO9PAATbQAalVver8rk3YGKlyo3q9OauWmu++CJuxuaZwtXuv4di6EpbFRN0
         8QQA==
X-Forwarded-Encrypted: i=1; AJvYcCUgi/opS9u08XOeEjpuReVryH0A0aE0c6FMbimzel1UxjcTkurqqXsG8DfFJAQVif9S2uuwoCZ6rFwHA0iOjHSAIw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhMXl1s0qdCRZFXqKi2m6mVoAdHDOeyPLdz6k2unHAxFW5vUmQ
	Gkj51r8vZB7I8uqmwBBXMbQjHEe4PqjzIeXo/2JM/KsLPRQoSpvJShwuwpvmy0Q=
X-Gm-Gg: ASbGncvrfan0gV9jLTkgkFXjL6sVRqEwnc6h2Qa61FobMIB2K6tbo+Mzc1VDCMUQpu2
	d8calKzLVeLKOO6kE3Qpuecsbu1R159qYpM7UQ+W15Es92c6feuOLHatP7QxTfKDkIEjzlQhQAA
	32NhXJTekLL5l+YCeHsLrNZBq+bYuKVfhMlVmUNdRL0hi7nsOOSWT2UqHOQOY+fcHGdPzQot1Jq
	o/WF9mm7DGw7XvfGFNgkVF08U1QUDmHgirmlXN1N/WyuPDEE+Db+Jz52ZKnkSI4wSt4ZJXJjgxf
	6L0xPh90XBLcv31RfU0vgJkNxNwGoe+OPw==
X-Google-Smtp-Source: AGHT+IHcg+gCbENXrOnWdym/CCFPs4XNPvTW5TwhNoQhFdCZwrQBeC1rscXUkfAVw1V8vMafB1xEDw==
X-Received: by 2002:a05:600c:3d1b:b0:433:c76d:d57e with SMTP id 5b1f17b1804b1-436228236bfmr33478765e9.5.1734018241710;
        Thu, 12 Dec 2024 07:44:01 -0800 (PST)
Received: from ta2.c.googlers.com (32.134.38.34.bc.googleusercontent.com. [34.38.134.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43625553208sm19992375e9.9.2024.12.12.07.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 07:44:01 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Thu, 12 Dec 2024 15:43:47 +0000
Subject: [PATCH v4 3/3] MAINTAINERS: add entry for Samsung Exynos mailbox
 driver
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-acpm-v4-upstream-mbox-v4-3-02f8de92cfaf@linaro.org>
References: <20241212-acpm-v4-upstream-mbox-v4-0-02f8de92cfaf@linaro.org>
In-Reply-To: <20241212-acpm-v4-upstream-mbox-v4-0-02f8de92cfaf@linaro.org>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 andre.draszik@linaro.org, peter.griffin@linaro.org, kernel-team@android.com, 
 willmcvicker@google.com, daniel.lezcano@linaro.org, 
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734018238; l=1216;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=8mV9HZFeUbw3Rtv6RCuQBzzPvwJEiDZDgZep1nTSp4k=;
 b=yeuoS/sNPk65uWseJnVuPuzWQtD58gzxjfTW1Kw/0dd1iXCyllusrv6nI04K9dKfxAk86WG2E
 olThScAHX1mBffXV+8E8qd53mstn3yY00cjPYRoq6hqenWh0IjLvpyL
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Add entry for the Samsung Exynos mailbox driver.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 17daa9ee9384..b3b472771476 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3023,6 +3023,7 @@ F:	drivers/*/*s3c24*
 F:	drivers/*/*s3c64xx*
 F:	drivers/*/*s5pv210*
 F:	drivers/clocksource/samsung_pwm_timer.c
+F:	drivers/mailbox/exynos-mailbox.c
 F:	drivers/memory/samsung/
 F:	drivers/pwm/pwm-samsung.c
 F:	drivers/soc/samsung/
@@ -20715,6 +20716,15 @@ F:	arch/arm64/boot/dts/exynos/exynos850*
 F:	drivers/clk/samsung/clk-exynos850.c
 F:	include/dt-bindings/clock/exynos850.h
 
+SAMSUNG EXYNOS MAILBOX DRIVER
+M:	Tudor Ambarus <tudor.ambarus@linaro.org>
+L:	linux-kernel@vger.kernel.org
+L:	linux-samsung-soc@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml
+F:	drivers/mailbox/exynos-mailbox.c
+F:	include/dt-bindings/mailbox/google,gs101.h
+
 SAMSUNG EXYNOS PSEUDO RANDOM NUMBER GENERATOR (RNG) DRIVER
 M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-crypto@vger.kernel.org

-- 
2.47.0.338.g60cca15819-goog

