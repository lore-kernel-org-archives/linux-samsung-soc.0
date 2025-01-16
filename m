Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC4C3BBC5
	for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Jan 2025 14:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737036064; cv=none; b=uKXuQh3x7ChRjBj1WABhd/snVtYjKXHGnNC4bBlzp53LC6XC8rJIak8aXfI3p87Tq/ctzZMetpgkqFMwUzSpzs4nghA4CH07qKHcv5IszAHOR4r7+2pDBUg9P6F1xxmauFWmM0ncuEwlOUnn6QkFLDgtvvqNodwu5Jf+SEpoiIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737036064; c=relaxed/simple;
	bh=RVUbs2WR3PHq/FjGa280/jrnw/yUQ7RV9eVzPoYZlyo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PbuVyAIBCMO0hXUGbSPS9CDvMxxkTt6F2psveT2a+synsyaZqEO1i+CObCHqVsSpla9KXStdfzHoa9aaBlsPlc30erHwptzKc9x6BHeQ4s6ZawCfPdffjAtIdCSkacWFBRcc0Q0qSIqRuPc1KHBd/vfzSYMMCoERZKg30BKO/HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RkgHGp2+; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RkgHGp2+"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-385de9f789cso758753f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Jan 2025 06:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737036060; x=1737640860; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xntQcSlXFoGkTWBw240rIz1TyOhM7eOdWY/eEvFx0ZM=;
        b=RkgHGp2+kKNJuDtz2NSvf/0mtLvoY+KtfE1JPFgr0cTH32GL9sfxCZ9OjM95wBQiHE
         xNEbBC+Fxxk3yqdsUYWIAz9auIP9so2F95mwblvqxTmznv4SGALG0otCNtVo+WycH7IE
         zvcDPMnz/7f7bbc43uw6OKHN0kR/h2aPZt4Mk677Z5Xb4TVvSmRYQqN2Y7QeNiO+nuFY
         V3nCeOLkqYVnENTKAuAMKlMWIX8aFRli5qPuYipdr1zCKmtzPDiOrv+pTLsuSaQHI5xT
         cnFW1s4qQSt9R3yupJJC7TIQuk6DBDHEyFsLULVF9N0IQ5GCQ06ZmPw2gjhlaCbaKxq7
         paCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737036060; x=1737640860;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xntQcSlXFoGkTWBw240rIz1TyOhM7eOdWY/eEvFx0ZM=;
        b=IO+YBkgP+J0Y+nuAvEEHX3r3PNpEy0K82l+NIJM6o8wRzUzACQ8o7SbjTwuam8uLLi
         fF27PQZzRgXYiOXXLCVycfsxRf67ECsy5EhGNnwLRHuDnnL8im5FIVccOytZuOe9yAX/
         jfse3vsfx7oxYuN6ztgYkNdqvXqyV3zBSqa5zl3WpcrI0MZZLgU9VDbEhkRQCW/FJLTd
         TLhJhyd9BwR2oi50oBpXAUzCky6aYF7aLLFh6DIN6GtWiOe5ch8X4sODsTMJHPr5C1fx
         KGMlFz7OPR8E1dEb80RKWujHFBz/EJmD4W10a6YLJ0J6cenAJe8c+h+RuIL6zIf1upo8
         cNtg==
X-Forwarded-Encrypted: i=1; AJvYcCVHLcTpYyRvMVSpZXCDb+fF5ParregklweY05764t0pH+9pNcwS+S3HOCVhhFviDLi2dD4Cd7NaSeueUnAyt+HYVA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQNxOmeDpmL8XSo9S+i8iQONlSQvuyT7V8e7TUUtt420NbYnYj
	5IQy2pNVc4XI7kVMzofi/z6ycrFFvMQD7wrmvjHHGLWujZFHGjDYQRuKwOnLbgc=
X-Gm-Gg: ASbGncsysilSEYVhr2/zSvEVyQw4J50UL0neMXFesxBHXYujQdrKwSPCjQJMLkHzz38
	E4IJPE5v9v8zJLNqPgUZbvzPuGITNg/P6PYSv6tBzHmafmIGQcygvzBr5Yqas2xt1M3H5LQSql7
	RngTFi5d8QPO56KCG8h1xSgmOgAncL5MWXvEgec7d9mOnElhg3FHaS3cZUzBxgm2Jx6WF7ffc6R
	RaYIB6EpCoXloWQszvHq3fRP2/4b7yz3ItmtNuTcZu4Sbq1IJPnvy3WuGI5XPruHsDptxr3VhmM
	sjNyq9p/xC6qs2NgoAObRclZamzfkfRJZywS
X-Google-Smtp-Source: AGHT+IH2SRtN9CpGsM4C0gXP+NC1NsKyk8FPQPBWXyMNGGxLW/xtgSq5XKpAgQPM584oCI/o9tArVA==
X-Received: by 2002:a05:6000:178a:b0:385:e35e:9da8 with SMTP id ffacd0b85a97d-38a872de3f3mr28972194f8f.18.1737036060360;
        Thu, 16 Jan 2025 06:01:00 -0800 (PST)
Received: from ta2.c.googlers.com (169.178.77.34.bc.googleusercontent.com. [34.77.178.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4c1f2esm20608846f8f.98.2025.01.16.06.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 06:00:59 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Thu, 16 Jan 2025 14:00:49 +0000
Subject: [PATCH v6 3/3] MAINTAINERS: add entry for the Samsung Exynos ACPM
 mailbox protocol
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250116-gs101-acpm-v6-3-e3a2e1a3007c@linaro.org>
References: <20250116-gs101-acpm-v6-0-e3a2e1a3007c@linaro.org>
In-Reply-To: <20250116-gs101-acpm-v6-0-e3a2e1a3007c@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737036057; l=1248;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=RVUbs2WR3PHq/FjGa280/jrnw/yUQ7RV9eVzPoYZlyo=;
 b=/dukyhHyfsKWdjtkSkZop2IDZ3HvxK1tioPonZJyQLtUs4LUPlSzEJbp/JpVvOWr0Q9XMbs+2
 q9v7KT5kMo4AE1OKZJtJac4vvHgcL/rGRjdCtp1ocQPAwA4xGxkwdmg
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Add entry for the Samsung Exynos ACPM mailbox protocol.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a87ddad78e26..076b6c1677c5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3020,6 +3020,7 @@ F:	drivers/*/*s3c24*
 F:	drivers/*/*s3c64xx*
 F:	drivers/*/*s5pv210*
 F:	drivers/clocksource/samsung_pwm_timer.c
+F:	drivers/firmware/samsung/
 F:	drivers/memory/samsung/
 F:	drivers/pwm/pwm-samsung.c
 F:	drivers/soc/samsung/
@@ -20712,6 +20713,15 @@ F:	arch/arm64/boot/dts/exynos/exynos850*
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
 SAMSUNG EXYNOS PSEUDO RANDOM NUMBER GENERATOR (RNG) DRIVER
 M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-crypto@vger.kernel.org

-- 
2.48.0.rc2.279.g1de40edade-goog

