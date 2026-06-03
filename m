Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72DAB480DD9
	for <linux-samsung-soc@vger.kernel.org>; Wed,  3 Jun 2026 13:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780491626; cv=none; b=HQQLUBiLdRTuXQlDow1mEOZj99pNDZNdlq5CjaokUEX0qACuPO2Va8Y7c5ZpUm8cvXlo4od7ZxfAE5Et4JEq7l1os+r1O8ScJEG4+xPEvZo+F2zSTEoiKqkGNXG5oAVsZSI/jP48bB9UCmWto3j2qVIP7DEwGjUo4K3Jc/qwnek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780491626; c=relaxed/simple;
	bh=APjGOr4rSujMx24P1jDIzhjkfbHKcFK80a9vPvVqD0g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CVh5lf6uHzFOTrh9nVAkQitw/PO0at8FedUpy/p8kiSOEyDqN4Fo2v9lV5JGWL/8fGj8yvaW64po1mSn+zFkRqdbsQ4GuX0zt/tt32rwGlbOXs689gLmql5wFK2YFBjt71pEfjjuMuWHITxMrYe36r81h4b5vSpqSivFN0KzFHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H60+FdSI; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H60+FdSI"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490b09e4cccso17378735e9.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 03 Jun 2026 06:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780491622; x=1781096422; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b9xxE0a97UY7UPF7zz4jpUqke1DXutWR5PtyvwLwWtU=;
        b=H60+FdSIK0d3TQlXZqVLUkCtY/lctO0prfhYmP1S8D56KoexvFUQ6TKkoHr1o6uobv
         yECXpi74UwlsqROZbEacxQhfzQwScY8w5fiWTvPfV/N157MKzYsVsqExV6yFU/cbU4xY
         P6vhnrXVtLLBwJrrObutvjy2IYNcbWCXafLBpYrsDt+8tLetgVOL94dE2OZgr9ChJeMC
         UD4awGN1HEyKo6T7kVyjZCOEccZW+CahRv43up+sZWOkpw1B3MWFvEeJ4eos3x3blkai
         4bsk2fq+nEPIilwRowP1meKxZkqrCr4eY5DLLXewDRmmUukz69mUhKmJ0JSrfGf1DWjh
         PWaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780491622; x=1781096422;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b9xxE0a97UY7UPF7zz4jpUqke1DXutWR5PtyvwLwWtU=;
        b=kfUpeP5HgPA+COZ5Bx5yL8n+JC1+Rci8oVj4iE84qzcRhVnHTZOhjsB0OTct+S61yr
         WDAGEhEONWxGOBQ0akvnwkhAWAixuyMX7lgg4s7IIECD/5/izVDhT7XaCL2fJAa8Tmo8
         79yuH2ie/cTBGJu9nUBGdMdz5HUS66+dMHA64egNEB0V+CVd2mmqJVUKSRx1ljRq6Gqq
         ipg6eZfDTcNyNO3+puNEd2UsyR7vHJqlKv4uCzo7D1GPi/CTprusRkBx9/9RwTJQ+u2H
         3cdPMZlJdTEYQqgMCYp4aQUsXKmX132sDWLV4Tpch2jgssqjk8zzD1JqqL/+lMA1i09Q
         Ut6Q==
X-Forwarded-Encrypted: i=1; AFNElJ9RT/dI6HjzbDjV8ppMrsE3xt4caL+N3EodQ1Y7tLcHzbrBpw7jS7wgfradiGsc9RqHmccpOu8x/XM+1TaZdjG7YA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEBzHu9h0tTeIOlllPFBhC3Lm/Yhpn4+QIfe2vPhZkhf6ZBL2L
	uqHzHEonaVPdkUcHnkU/J/5s08+IUnXPXTGer7E2DIXiL8GD9NCQzPYh/XUcu03s/unlVe3DT1W
	HTMY+MWc=
X-Gm-Gg: Acq92OEEXyCe8wCw5XviPWKsQ5B0FKS1Sy5e9HoIvrM18YX2qx1vukgBnus72uMghS+
	34I7Vrtpr2aIH8J+33AnCT7to4ZuJHQb+NoW7rnYKFtZfdVOtkl2wL+Rwpr2wMyprxP8dB0q1FR
	IgBUAiIZNN8Eqe84RgOL3Vk0rF9uidbnoRY7KLngmdR7Duu1XwA8p7p0z9hwx9ZlW/mFc2/e6qM
	c9bc2Un2gTjPcHv7Z96C91S9BCvztD2ldiwg2udT9y+qTXcUpmXgRDeYAEFY3qrC5gbQbg9APpe
	zA80I5+XVILF21oczokE2xX8X4JmHA5zJ0Y/6AhB0lmwfd/tw7CB6L/AJ7p8od1H2cspXE/XvFc
	Qi5negjofKKa61FH3qXG5B3EzHyAYNmT9Y9Tyy91mkHwbgxbeTX+RSvffoZ20fLuyj2YrZPGP5B
	IV7o2rJ1iijt+GsX4P/NK4tQD8URGyNRE759LiExZg0vPvOzF7CSnEDijJCKdveFenHNJIu0UmW
	GrSbyQnbSM/9yQ=
X-Received: by 2002:a05:600c:c174:b0:490:b2a6:8c2b with SMTP id 5b1f17b1804b1-490b5eb82b2mr55987505e9.10.1780491621605;
        Wed, 03 Jun 2026 06:00:21 -0700 (PDT)
Received: from ta2.c.googlers.com (213.53.77.34.bc.googleusercontent.com. [34.77.53.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e88fdesm149179045e9.14.2026.06.03.06.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 06:00:21 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 03 Jun 2026 13:00:20 +0000
Subject: [PATCH v8 5/5] arm64: defconfig: enable Exynos ACPM thermal
 support
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-acpm-tmu-v8-5-0f1810a356e6@linaro.org>
References: <20260603-acpm-tmu-v8-0-0f1810a356e6@linaro.org>
In-Reply-To: <20260603-acpm-tmu-v8-0-0f1810a356e6@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780491617; l=795;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=APjGOr4rSujMx24P1jDIzhjkfbHKcFK80a9vPvVqD0g=;
 b=gCX5AtDDJC3f+OxPmw3TNwWEn5IdXUI49obuY03uhwbjrXH3wrFPl2PrGLvyeK9L/I5KQ6xVA
 Fe+1lxEnh5cAHVbF9vZx+6xjJo7WU3pRmhyDsfkcxOP/ZiYgCxjet3d
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
2.54.0.1013.g208068f2d8-goog

