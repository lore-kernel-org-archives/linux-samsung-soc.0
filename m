Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406B018D64B
	for <linux-samsung-soc@vger.kernel.org>; Sun, 16 Feb 2025 11:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739706104; cv=none; b=j9+HbLN9Slg4dzBwP7OZ88WIScBeoW3HwJ7bXNAahzN4c9LCk984yw2KqYWPuC9Q+hmJBJ9RHcF0Ta+AccHZ0sexpxCloJVQHAWI6D1hUP8X/+dD/aobC1+JdeAY0tQdVDen4DcVLZ/L6S0i0/LZwJLa5tj2fHwroHEiB6wPAHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739706104; c=relaxed/simple;
	bh=s3nfQuXv8pD77XaplmLRXJWK6Y8/FRbwq9nK0WlmdOA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rphIe9X+uLCqV1uIp3yO6Pq8IXGq6t2NcIgpJc8Kq2eTOuCxJfVDk3UgGpzIjlUjhBKQB0GmvK50y9xHTYhPyZdyRdozPhjocsi+ASUnxxff6hfE3x4K1Ft+5+ho6XJxSEpKjFVf/QLL5oOSxuD87GQUYA11Q5wWBVZq/LwQn6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JM9lYGzr; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JM9lYGzr"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ab7e08f56a0so55894966b.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 16 Feb 2025 03:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739706099; x=1740310899; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z+YOIFY1QqnkQull6bw6UkU5fZ1LXxRkH++QD8PUiro=;
        b=JM9lYGzrwEVJZZNvLvVvyJx/KA4Vl8Ja6+E3Qlyh6/mCCvtqwAJ3oVBe8E/B6E/jJY
         dlf6x5VQ0v7nvk3ysGeRF4gpDGqOMGfGj8Kn7biRJMJFVF+rvW0YFcMTpBOdYfjwEkeJ
         J60TQctZsB/G5pgp7TWO+FW81QnXBS9tqFACtCwi53yqVFhguvgjXcVc/OJeuaq+YlhH
         c0HaSWjNfGP4x+APAV4ZXefTiWoYVIm++oNah/WTmmClQUoOqDkJMMRsk3q8c68asuQ8
         bsjMAKjzpgTiZ52NJ6JX4itd7s6kp83VwbWREOIZQ49NBghf2EvTT5smRH+yTIXzoy5d
         jZfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739706099; x=1740310899;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z+YOIFY1QqnkQull6bw6UkU5fZ1LXxRkH++QD8PUiro=;
        b=Z7wiIZQBMOS9sAne71FMpVj9M5UvQsIFpKdk1ejBhaPR3BQHVy7VMFQr5iibLLWj6K
         odXZABqJvTEqq24TvHDeJOlkFjtelKVVjHh8xCKaxL4WLD31MXOFXixegCgsS3Kq35Xk
         qE8a2aO42NRG6bNzpsNVzqDfKTtxnx5pSV8oSQF4Cyh9u96Nr9U4qNKOKRWLM7nUDBdh
         w+bgSWmmuuNbN1tZ2Lu93/F49d9jgU426n9YXkNmcEvUYEaWI2OtU54UCXLRT+eJLVRk
         FqfirYdcQDzhckiISD6d0kOs68r2u7ZkUb6uWQQUqBzeHdXC3P6PgZnjFoKN1xVdmBvu
         wmig==
X-Forwarded-Encrypted: i=1; AJvYcCV57Zfkj9byzFeiTH4lJzzfdksgfDm4VAPhowOxhi3yxpSF8kyb0wiIXYds7fhqdHDhZo6C9Z1X2hUsDozz2eSdJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwByozsK6P4S5rn7PeyqfPwEveYTobvjCovyWA9K/ERE2aYLzL0
	S1khGJ/wavk9/iE7HLwNSmwU9FOgbK++x54MMOIn00dREOEdcpxAWDgQ6hxyEiQ=
X-Gm-Gg: ASbGnctIma1sgNOVtFyAR+0mWyBI1ZUyzKHltkc8o/mWCtCdyr9iToJmzpacXO+oLen
	g0SMVMt7uOURem16RzZbMnFe95Ots0XpbLp3WZa0lykAtOqKt19+ii7vZ//nHcYz3tEunP4uh/B
	xqO4D92BU70XUq+yGczI05ElHPM5wIrK9jb2BXeuU1yG2C9pZ+btxBRHDxm75Gzk82OppcZwypP
	La9xWtKsvhe9dlGEHLt+tTPZKMBuFrIEZDHaGBcoE0LDbHsx/oCQvNKuPzadzHXxgPnr+VtZCPr
	bTlrCBqX1yBgasx4MGxRVO/a3dz0vw==
X-Google-Smtp-Source: AGHT+IGC7GfLml1oeu8oNIX5tls4ha6EZGX1Ok0ynCFcQ9rntDrsSXbTflTn2CbbuY9r3Pnoy6M6hQ==
X-Received: by 2002:a17:907:7248:b0:ab6:6176:9dff with SMTP id a640c23a62f3a-abb7053d8e7mr248373666b.0.1739706099492;
        Sun, 16 Feb 2025 03:41:39 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba533bdc41sm682048066b.162.2025.02.16.03.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 03:41:38 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2] phy: exynos5-usbdrd: Fix broken USB on Exynos5422 (TYPEC dependency)
Date: Sun, 16 Feb 2025 12:41:36 +0100
Message-ID: <20250216114136.245814-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Older Exynos designs, like Exynos5422, do not have USB Type-C and the
USB DRD PHY does not really depend on Type-C for these devices at all.
Incorrectly added optional dependency on CONFIG_TYPEC caused this driver
to be missing for exynos_defconfig and as result Exynos5422-based boards
like Hardkernel Odroid HC1 failed to probe USB.

However ARM64 boards should have CONFIG_TYPEC enabled and in proper
state (e.g. =y when PHY_EXYNOS5_USBDRD is =y) for proper USB support on
Google GS101 boards.

Add itermediate CONFIG_PHY_EXYNOS5_USBDRD_TYPEC symbol to skip TYPEC on
older boards, while still expressing optional dependency.

Reported-by: Krzysztof Kozlowski <krzk@kernel.org>
Closes: https://krzk.eu/#/builders/21/builds/6139
Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Closes: https://lore.kernel.org/all/3c0b77e6-357d-453e-8b63-4757c3231bde@samsung.com/
Fixes: 09dc674295a3 ("phy: exynos5-usbdrd: subscribe to orientation notifier if required")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Patch for issue in linux-next

Changes in v2:
1. Add PHY_EXYNOS5_USBDRD_TYPEC, so arm64 defconfig will have both
   symbols in-sync
---
 drivers/phy/samsung/Kconfig              | 12 +++++++++++-
 drivers/phy/samsung/phy-exynos5-usbdrd.c |  1 +
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/samsung/Kconfig b/drivers/phy/samsung/Kconfig
index 7fba571c0e2b..b20ac6b75993 100644
--- a/drivers/phy/samsung/Kconfig
+++ b/drivers/phy/samsung/Kconfig
@@ -77,12 +77,22 @@ config PHY_S5PV210_USB2
 	  particular SoC is compiled in the driver. In case of S5PV210 two phys
 	  are available - device and host.
 
+# None of ARM32 Samsung boards use Type-C, however newer ARM64 do and
+# PHY_EXYNOS5_USBDRD driver needs TYPEC to be in a matching state to avoid link
+# failures (see optional dependencies in kconfig-language.rst).  Intermediate
+# PHY_EXYNOS5_USBDRD_TYPEC symbol allows to skip TYPEC on ARM32 boards.
+config PHY_EXYNOS5_USBDRD_TYPEC
+	tristate
+	depends on ARCH_EXYNOS
+	depends on ARM || TYPEC || !TYPEC
+	default y
+
 config PHY_EXYNOS5_USBDRD
 	tristate "Exynos5 SoC series USB DRD PHY driver"
 	depends on (ARCH_EXYNOS && OF) || COMPILE_TEST
 	depends on HAS_IOMEM
-	depends on TYPEC || (TYPEC=n && COMPILE_TEST)
 	depends on USB_DWC3_EXYNOS
+	depends on PHY_EXYNOS5_USBDRD_TYPEC
 	select GENERIC_PHY
 	select MFD_SYSCON
 	default y
diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index ff2436f11d68..6d571dff2898 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -1456,6 +1456,7 @@ static int exynos5_usbdrd_setup_notifiers(struct exynos5_usbdrd_phy *phy_drd)
 {
 	int ret;
 
+	/* See CONFIG_PHY_EXYNOS5_USBDRD_TYPEC */
 	if (!IS_ENABLED(CONFIG_TYPEC))
 		return 0;
 
-- 
2.43.0

