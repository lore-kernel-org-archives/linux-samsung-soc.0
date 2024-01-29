Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782147605A
	for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jan 2024 20:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706561241; cv=none; b=E0t2kq1VEQqMRR94n8H1oihxfrrAllwJw5HLFYoWUQDp6F+dV1D+9Xo92sIAhBKGmexREzHwmLTI+gd4nc3nqnr0k3cDZIZKQ1vPrQScrhl35dVWP+7N74UCttQRcHr0COsyNnDOURJokyn92kHfpEjesa81KLlyAvGsasEjNU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706561241; c=relaxed/simple;
	bh=7k7hKnnnrhWTWJJDT00i8fZWFwgT6RqFr+Xm6kGMOrI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iJuWc5Q6sdE1A1M9ZocJYJMc/FnV+eFy5jalThweCOcdcU0x3ulMgpIv14gIjDPwGZ2h0y/rm5xuzxb31K/35GhsKQQPmuR1sqry1GmJ97E84rkvIMXc6eKswhDHOe6uet8b974y8cSFf7f/AFJQ4xaw7rBuR3fjDyHr/LY+1fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xeCtEjdL; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xeCtEjdL"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-20536d5c5c7so1992116fac.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jan 2024 12:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706561238; x=1707166038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YyrvNP4ULcrxjNJwPQEcYUs2ToeCs6KwOfaZApH/UUY=;
        b=xeCtEjdLVFVxogmMOeoJeuy5cx4ms9eswcKYjSkk2uu06WhaekufPLCIBMNVQLxFps
         XAKCmITAb0DwVdWB/0TRHhmGXsu1hqlw4sHTZVrPRIQQ1I88liW4ilHEEpch7+81ahn/
         FGfq7iZ9+ZZfjh17I2bti0XnXQ0N3ECl8/TcUFCXmy3RYOLHgHC3Pxi/nlhCJNeGamy9
         5710wFdg4SQA7+K2rHGcWxBWJhFOY0N9fbq0W3vpU8vawU0D1T8TC//Q7nF4xyIwZ5zI
         m8fdhDruwZ80G2ESA2fJsMjbtuA0APHKHDDnH5yvw+a4fnTDichunusM6UjYuJ6tWG9W
         g9Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706561238; x=1707166038;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YyrvNP4ULcrxjNJwPQEcYUs2ToeCs6KwOfaZApH/UUY=;
        b=rCw2nfyJdTPYj6mnP+ifcBTRn1W8bRSys3vH0L06zgQSdtfKBeVBuOkocnYrTwRu0N
         0ljIxGsvGPkv8l5CAS/X+6OqeS6O4KKwVS1meTdhf4uyHp7dif/AXdmCDe1pNZzH282y
         d3ubM+jLZp0WQqb9/0EHtqs9qxipwY6nvH3HuD3WdEnJOp3/iflqNatvHqGv4sZ93aWm
         eLMl4zSnqMylQ22nFSIu0+eOHVFxVMtLR0llRnvAZ2WKlKkuKCmDfk+n3cyuadFc4TyC
         8FxTgzZCt8T/xEuIcE2zwclvD4tOQ9/Lnogax1HKq/IX5bLf1MZ/zSI1+RcAnFuV9Jta
         YKIA==
X-Gm-Message-State: AOJu0YyJj6LOjKXSTKUZ6iMXZx2K4UuPwOFucKs9OjrvLtmWvt/buj3/
	BATAx85g8H55buOLtQqTG7eQ0UtlbReC8ARU30MknLTgvRr6UhepeuHK1YNCKbo=
X-Google-Smtp-Source: AGHT+IGMyshQOb9r5+Hu1UEznbyy0E7u4tSsSd0PRljCIUmrug+NtOhjU2fvdJsZNawPD7CLjbQCLg==
X-Received: by 2002:a05:6870:d208:b0:206:8e1b:3948 with SMTP id g8-20020a056870d20800b002068e1b3948mr3831004oac.25.1706561238553;
        Mon, 29 Jan 2024 12:47:18 -0800 (PST)
Received: from localhost ([136.62.192.75])
        by smtp.gmail.com with ESMTPSA id le11-20020a05687c340b00b00214923477c2sm2206195oac.34.2024.01.29.12.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 12:47:18 -0800 (PST)
From: Sam Protsenko <semen.protsenko@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] MAINTAINERS: Add entry for Samsung Exynos850 SoC
Date: Mon, 29 Jan 2024 14:47:17 -0600
Message-Id: <20240129204717.9091-1-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add maintainers entry for the Samsung Exynos850 SoC based platforms.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 939f6dd0ef6a..77c10cc669f8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19281,6 +19281,16 @@ B:	mailto:linux-samsung-soc@vger.kernel.org
 F:	Documentation/devicetree/bindings/sound/samsung*
 F:	sound/soc/samsung/
 
+SAMSUNG EXYNOS850 SoC SUPPORT
+M:	Sam Protsenko <semen.protsenko@linaro.org>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	linux-samsung-soc@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml
+F:	arch/arm64/boot/dts/exynos/exynos850*
+F:	drivers/clk/samsung/clk-exynos850.c
+F:	include/dt-bindings/clock/exynos850.h
+
 SAMSUNG EXYNOS PSEUDO RANDOM NUMBER GENERATOR (RNG) DRIVER
 M:	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
 L:	linux-crypto@vger.kernel.org
-- 
2.39.2

