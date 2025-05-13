Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64849221282
	for <linux-samsung-soc@vger.kernel.org>; Tue, 13 May 2025 10:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747131487; cv=none; b=dSsnkOPw3dSpuXJ9AuEXca49HZEsnrRHAhl07actpj1T5zzLOavs6kayCpSnaNK68euhJIjUay6by3EXRNSO3RbI/IRBPw/yredJzySVQK43hxZfna6DI7eYCSChWdwefVkUPSSyhRZUwEh1rfguWolQTDq4bKErqNLOA+Wi4jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747131487; c=relaxed/simple;
	bh=+2q8Agc8OAUp6ljVH2smijkPt4WizUEwcy8s1vXQJ20=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tCY8bmc7OJwqY0AvhB2H++3RLoGkAqvFH96ioEO8vfwOfZio8Ttl2ulwhd6TCW7V61EMWYXTtFywM3uMcwJjK7YiokwuPsImydU7xIPkHKoLfaczWh/HpvHjTA1hXD6EjanGFjvcgXusDZSJJvX5I/mkUhKeqw1lts+cvvkgv9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hvngAvHZ; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hvngAvHZ"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a0b77ea855so736043f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 13 May 2025 03:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747131483; x=1747736283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GpW/hDUMz7zX4tvSsgRzaXUuXymLo1IwYeqOqY+OOaY=;
        b=hvngAvHZN5WQlPgbX0ezxnYSOavz4yIEBzt1lkt50yRPJrn8zaehjS2rfSpk1zTQ+h
         utK3maQQ0ncICCxbLHdJmRCt7pTmSNrhhRON2SuU+quDzIaZbI73OaPIJDkCGt8uV94p
         dnqDCoI4Rcc+i6tt3V3zWQaDDy5QbFoJPuf5vMzqC8Y5RvP/rsX84N0rY4sxJfdVBsRA
         bIQJffHZXK6XsIfZ7DBK0LPTrkQ6aK2MfrZOYrwgrvPyXOt5QrfuOpLJcpcC2vc1hfaC
         Z3AgqTWA6OxS+bbWFvblpehyZS31ywEzbrCG9orju/aHFyIZSfyCyOdG2lIcr2jIYAja
         KD1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747131483; x=1747736283;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GpW/hDUMz7zX4tvSsgRzaXUuXymLo1IwYeqOqY+OOaY=;
        b=Bbm/WW2ezBXerdXEipXeBKX79G9/mkU9yglxwrqzj19rtstaUPqIBd3pd+0EcvtpmD
         C3rxesn7EINl5zW9pEfnvpXiEHE005g05yUBm1xmnD74+VzfQWB/BqFs+bIwltMSlwWT
         /R8rjHlBL6/ktkLyGOJRX3GeOzALXQ2xHDUADMr/VWjn6/6RUE36/71zctgpDJL18mtD
         gWUGqwj03yVTmLjWHVONXePvVDrxF+kwmz6qCvFV84mg7y7xa5YCLRMCR5ThVhJ9m5dU
         nr+PpxhO4rkXBq58SsRh8xiT9NOneDuBoWST2fu1dtWkth6vyGdLpMmEcKX96aVub6gg
         FSWA==
X-Forwarded-Encrypted: i=1; AJvYcCVh1rfjWULiecCGGjOPxH30IjFIXOiX1IYCtpcJYnmx+ny00WGQIe+vJzQy8AxAkyFMggxsfg+AS0XUa9eclPVqXw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJUFVw9hzlGz8NSa0w8PWVL6w03o/rMbewhb1ssNrKEeQhrKxF
	g6Wa+NiFGEpvEjZAmTtDK59O59TmWx//39qqO0IIRxF7sJuEyAxohSv9otx2TaE=
X-Gm-Gg: ASbGncvcBy6mZ66tu6jX82/VGj68CDJZERrHrcSp9UJ2cCiUKlzVvUaw++WT/RSu8F8
	cJSiWNBvBqlnJbkC05BnpL0xtZCpIIzqky8oIqszlqSuj/KkKN5lIcxI68WWSoBPgboaO4B7N1Q
	gShHE/fNllJTqp1O9G1O2GQSdkafV7Iap5gY6Km5ofyOiEFOxnY7UCjcSwiBsYoUhzFzHi8VEay
	0pxzETruQGu5mHLpj1Did1nUnbqPwdseb0Tx6YBlUkeFtG12+hhmBZ+rGh7Kavjl4bIlOnB26U+
	CwKATypPXfB7uNkLcvd53vx6c5qjoi8TNLqX3cTcstP8RwgWlWvHCTR/b/YvbBI3WdTP0MZNUZ5
	5jchaXoZSf5he2Gg4nHgraOmyFIOHaVuzKzInxxU=
X-Google-Smtp-Source: AGHT+IExUE1z2q+MGTB1BjX3tNGd6iZlgfApNxaHiNcVQa6gR897h0allbxYsieVlwmVMw+6ixRyLQ==
X-Received: by 2002:a5d:59a8:0:b0:3a0:9dd1:bb59 with SMTP id ffacd0b85a97d-3a1f64a1f8dmr4843504f8f.15.1747131482665;
        Tue, 13 May 2025 03:18:02 -0700 (PDT)
Received: from kuoka.c.hoisthospitality.com (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a2d37fsm15914997f8f.68.2025.05.13.03.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 03:18:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH PULL 5/5] arm64: defconfig: enable ACPM protocol and Exynos mailbox
Date: Tue, 13 May 2025 12:17:54 +0200
Message-ID: <20250513101754.23158-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Reply-To: <20250513101023.21552-5-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1161; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=FwRadgPxJRm5xEAehJ8JywumbY0idjddVQyEPezOekk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoIxxSNRzisqVNsQAPPyyKC0GMYtidRZ+mahC2q
 7a1kCi49W+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaCMcUgAKCRDBN2bmhouD
 1w3qD/9sV5S/8zWHdb9HmJxyJzng+j2RQ2MTrzMvGp10HAMWKOtVz9EDQHAJMQMdafDO+uf0Rcn
 +BEeZ1ux9bk0u+rnA6dUyLWCOj24BWQE1C7RdSLNJkxclO+6Hw9SGS+RXnfOTFibwP9+dVgAyXE
 VVyYEWajD26bKBNBuE3UZjRnT/6J4z6V/tOZtQHJ+13yYFIrHSjLL0btX7NYRXxET4WD4LsgWHe
 374UyWm0OSfJSjFUbcaHZmBAnG2pRtYvt1nCQkkKFsNRnIGEwWWu7PuyUjIXpRX1f0kOwHdy2ve
 wdxqllBxYV+WuXXVdwXxE/bqEmhzRpkYpywjtbdle1n74T2y/xXSbTDrvJUSCcHC9GUl9RRZh4f
 IewbY7pR7uJz1FACllnaVt530k0XgjglyNAddTkdg/dyfCw89dXLU98eFZS1TmJAWv9BJDdkfh2
 rGF1BubmwZZlS0Fsk8W6axywjM6j8Lbnyz5R3kZlUDA/vxOC+oFkuEGljRkELxTDOh2NgoF8grQ
 YCatdNfWkqRROfgpNl4Qd3o4tD7SzQ8rRmy3/l0Ooyl1NtsYotU5osF9iYZd3CFpH1I/nfPz239
 qFYG/WtuE2OOjlNc2Mlk+acCDrCiGU7c6f2OmCM6NXc5N8LZzm03jpLphu5Wn3UQjk7XgqU2ncP zt+WBUBpI6quNpQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

From: Tudor Ambarus <tudor.ambarus@linaro.org>

Enable the Samsung Exynos ACPM protocol and its transport layer, the
Exynos mailbox driver. Samsung Exynos platforms implement ACPM to
provide support for PMIC, clock frequency scaling, clock configuration
and temperature sensors.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Link: https://lore.kernel.org/r/20250207-gs101-acpm-dt-v4-4-230ba8663a2d@linaro.org
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5bb8f09422a2..5c85e5da152f 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -265,6 +265,7 @@ CONFIG_IMX_SCU=y
 CONFIG_QCOM_TZMEM_MODE_SHMBRIDGE=y
 CONFIG_QCOM_QSEECOM=y
 CONFIG_QCOM_QSEECOM_UEFISECAPP=y
+CONFIG_EXYNOS_ACPM_PROTOCOL=m
 CONFIG_GNSS=m
 CONFIG_GNSS_MTK_SERIAL=m
 CONFIG_MTD=y
@@ -1416,6 +1417,7 @@ CONFIG_HWSPINLOCK_QCOM=y
 CONFIG_TEGRA186_TIMER=y
 CONFIG_RENESAS_OSTM=y
 CONFIG_ARM_MHU=y
+CONFIG_EXYNOS_MBOX=m
 CONFIG_IMX_MBOX=y
 CONFIG_OMAP2PLUS_MBOX=m
 CONFIG_PLATFORM_MHU=y
-- 
2.45.2

