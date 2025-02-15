Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615D51A239B
	for <linux-samsung-soc@vger.kernel.org>; Sat, 15 Feb 2025 09:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739612489; cv=none; b=j4/mw5SDwjjV+R71oNQqmP1Yh5o1ZThiPbKnENzDRTlvczZEy5pIeCAX5lGdYRruyoGXZikpXJVJcO2LbDJQsa0JkUXxfM9MrGa/dxy+z6qDZshknivhfAYYShAHe/eJkeoSbrUK0ZnjExOBCM9Bvdmbs8Mn4mgyZNFsL+Be4Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739612489; c=relaxed/simple;
	bh=vbjMydOojPbZwEg4Yl/004JI6Zw+1S1y0lku0U/6zp8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bPfzMfd+6Gujzub4Y8o0s4bywdtR+ZZNO6vhqFPnLWC573lS/KLrOOV1T2XkMAA+gro18kxhenpgyyINHk78lSQir20qrJ1RACXYM3JdXntkrm5D7SjD6DeFAtpBd+eK0euStzdk1mp16dRp606vJZt3YEazI7qo3cr02LDNxb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rRqhU7iJ; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rRqhU7iJ"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4396444e4dfso1355135e9.3
        for <linux-samsung-soc@vger.kernel.org>; Sat, 15 Feb 2025 01:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739612486; x=1740217286; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5SxoWr2vFLkloiiVYCn5S11j3T2lrQAUOXkKWdINmvg=;
        b=rRqhU7iJvsUgnJHIEbAhhABg+yOqeNB3JGQf8zjRr0cI8CLsfcAkGB+eiLRY3THhlB
         eNk37upV9IFLwlZ5PKwjcPL5/b33toNLJmZiAbPLLVkH9MvdlhsbTmgGOH3TKXfgNKHX
         rkPSXWCoHxtOU7eB1LGeOgNLa/RXcjRtCJx2dQMvZSgG4bL6SZ3BEisaBlfl4BSVyeHx
         vULRa+eGOwwLGorJggNM/KzzEGtoPHhtxohojQ5VyCMg1TJkvwrYNVeAESy7QtV8iylL
         1RzA1pymMd1V3mv+El0oxTcAtiHUL6OUUxGmiNgH/mDezI1fj/x+fcVH/ILf8dlhCrP5
         QGCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739612486; x=1740217286;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5SxoWr2vFLkloiiVYCn5S11j3T2lrQAUOXkKWdINmvg=;
        b=KUQsW/a16w/vK/yVJmP4bylwUSF/x6ei2a2tWVrZzZc/vAAaMg4heiv4uIuF+kiFBP
         R5z2Q/j72nLn3WvywESAkj+gyH9kP3MbFa7kIfv9BaD+U9JsktBN7rOhoAsSdhSq66fh
         xEIgNfENlnMfc/8rSHIF8Q5wfgvaGU9rqrYipXUxA+nq9Ychid2QZ/SqcFDso19QpjtI
         o6BOywOdzpY3kMaS+dJSJHtXYueStFE/7pjl4PTtyjrauDu7hZTY2N0aXJMK2zUiaG09
         ttm7bMHVRMKwotO+OOmLJ0T26CZw9RsUDVNrafltcW3c7+u3v+AOsIbbxa/+vaNysbWI
         2vJA==
X-Forwarded-Encrypted: i=1; AJvYcCVz63yDszqU51cRIvQuY+mTesJvE0gerwwGpLLnbZQ1S+ln0/G4da34eRrDy5j+FVMRLHudUQ9ZCKAJt3ReINYPrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6FdZ2SpmoeSrDVKTccr8xZBbc6ooX5ov5d+oS4Nx6FXnDsv0C
	1UVywcOXGqpvQfS1BKtarKekyzG4tHiIUvXdIMPeEER5amsD8JJbKpIlB++qeAU=
X-Gm-Gg: ASbGncvpbj3TfYW7qsnD+2UXDwxuAlYDzSmHxR06+SZ4++9Kw1Pu57alCDHxysSKVLh
	XRllMx2re+snDfxzPheLtbN4NWUuwziHTYLgkCHshYIgDzQ/mCVYP8K+aQOihKMWDrnY5etcJ+E
	uOGm9rtuKeCwGA1Blp+GaCowTWjnEeVN+aNk2bWFhy3u3OpAt2WGWTeylXuB+4E9ahzadv7hIUu
	p8kBzks2EvB2+BHTLeHRZJINP+qMkGggHKdur2nCDOXLddPk+vK2YHtkVXMfz+X83TIg0owbxnf
	BEM+d/e3b8DDiiJddtBb7cE9eyWW7g==
X-Google-Smtp-Source: AGHT+IF2PoXxZGft4S7bEaK90H7os4Iev7h+v97AgdpzM5GZ1g5ZH5opiwmuf7Drdh8bXm5uHZBgtA==
X-Received: by 2002:a05:600c:3ba5:b0:439:6538:c979 with SMTP id 5b1f17b1804b1-4396e781fa7mr9169255e9.3.1739612485654;
        Sat, 15 Feb 2025 01:41:25 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a1b8471sm97985345e9.37.2025.02.15.01.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 01:41:24 -0800 (PST)
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
Subject: [PATCH] phy: exynos5-usbdrd: Fix broken USB on Exynos5422 (TYPEC dependency)
Date: Sat, 15 Feb 2025 10:41:22 +0100
Message-ID: <20250215094122.60535-1-krzysztof.kozlowski@linaro.org>
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
Incorrectly added dependency on CONFIG_TYPEC caused this driver to be
missing for exynos_defconfig and as result Exynos5422-based boards like
Hardkernel Odroid HC1 failed to probe USB.

Drop incorrect dependency and rely on module to be reachable by the
compiler.

Reported-by: Krzysztof Kozlowski <krzk@kernel.org>
Closes: https://krzk.eu/#/builders/21/builds/6139
Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Closes: https://lore.kernel.org/all/3c0b77e6-357d-453e-8b63-4757c3231bde@samsung.com/
Fixes: 09dc674295a3 ("phy: exynos5-usbdrd: subscribe to orientation notifier if required")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Patch for issue in linux-next
---
 drivers/phy/samsung/Kconfig              | 1 -
 drivers/phy/samsung/phy-exynos5-usbdrd.c | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/phy/samsung/Kconfig b/drivers/phy/samsung/Kconfig
index 7fba571c0e2b..e2330b0894d6 100644
--- a/drivers/phy/samsung/Kconfig
+++ b/drivers/phy/samsung/Kconfig
@@ -81,7 +81,6 @@ config PHY_EXYNOS5_USBDRD
 	tristate "Exynos5 SoC series USB DRD PHY driver"
 	depends on (ARCH_EXYNOS && OF) || COMPILE_TEST
 	depends on HAS_IOMEM
-	depends on TYPEC || (TYPEC=n && COMPILE_TEST)
 	depends on USB_DWC3_EXYNOS
 	select GENERIC_PHY
 	select MFD_SYSCON
diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index ff2436f11d68..e8a9fef22107 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -1456,7 +1456,7 @@ static int exynos5_usbdrd_setup_notifiers(struct exynos5_usbdrd_phy *phy_drd)
 {
 	int ret;
 
-	if (!IS_ENABLED(CONFIG_TYPEC))
+	if (!IS_REACHABLE(CONFIG_TYPEC))
 		return 0;
 
 	if (device_property_present(phy_drd->dev, "orientation-switch")) {
-- 
2.43.0

