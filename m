Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9603559E6
	for <linux-samsung-soc@vger.kernel.org>; Mon,  6 Apr 2026 13:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775483814; cv=none; b=hqSci6zRDuazeqmCREO5Dqyf2Rv2sbARd2ygMf6N5R4iMw055k0iXhFZHQQPfwaFtv/SWbpUVFaIPDmALMFv9Gr5JRBzbDwQBlucXYgSYXTGnZH0TPcewAd+GtmOiduycaiQwpOlS5f0wTUAvExCmkCuvXAAgGOa3k3GkxWedig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775483814; c=relaxed/simple;
	bh=hSrL++7BFKBB2qjBSL6tIqon+XilxF4IH2+bdS1/RC0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WjEBcmyjm9ciObaQ/5CkMnoEBDQJxxRPcAg7gh4GTtN/Ppzlh1CrSXk+nOlBkBcD8cH3F2FJ1qKx6kUIVmsHG92KF9b4jG+xzJnr3iR45uyr+YLKZ2KWpuGbx5YXQg3WQ/SDCUHnwa29iowO55LfiOmEtRqLyDzBUQF5dxTIwbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=lvkasz.us; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=lvkasz.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f67.google.com with SMTP id a640c23a62f3a-b9c04152730so602955066b.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Apr 2026 06:56:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775483811; x=1776088611;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OQtUgZBlTwv+xDoaiKb2N7gT+/y7cOGsVK3GMzZHFqc=;
        b=MOOiCn4nFHQPFXPhpmxDuhVjGSz0F2u2xOlidKXlK+CG/v/ts043xjcJLzFnn0iI9f
         +u6ZA3lnQm5vF3mqXu7Ma5jvo6Pk1LIpDblf3OYqAhdEBUKAAo8TJPhp7rFdKfl4LUGd
         F+MiSjaQaVCEmy7Tzsu2LiCOO6zozVoNAMbFT+Wuhx8WxQWhJ0CG/CndwGnOnRy40+G5
         zKasdxnR86xu/N72WTnuG8QhMub6b2gfnvDyBmC0OlHDS/Yba/bjlzs/Cm1B9VpWGV84
         ZJIWlfdnBtd3RuFPRER+iruDciAuMgO+3ldHFzjk2K8goW0Sr90PPulpVyu/wcLAwEGA
         R8bw==
X-Forwarded-Encrypted: i=1; AJvYcCXNade6bd4O3V46+PocWeHDI5L2C720oCzSy7liezQneonUu98L5U8wWcZ9bE19+ReV3vBMFg50uDtSgd58egHzHg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi9gTlGSyPoLJ5X7t9ZcvpS4oP0XdOOnaLOB+81J1pGN/2tFhL
	E7GyQYJ0A+zFepzbd3LcsElIuVrZMLtojrbF6oWeQMj5Y0JsGSjEfjbl
X-Gm-Gg: AeBDievssIgDowPrCXe1RcEHDsvO3e9uxmMnUwb6kLIqU5+qa6wikcFKA8nEgOmjykG
	LqMhsxswTeK47LOnWvL6jWt6oENlGYfGpIOv30gRc6foTcAhkczp3t9GLuzOSECCWK86I+W4V00
	4S0nuDMuOKzLFHR/BiFI8ypZOOd+TCgOXIo8pEly+nBtNia1eLa1TDO6/xGEUyQm3iuSOLjMr7p
	4R4fcgpTMxh2CAiD70RtN0o8+26BcvQxnWW2iwvINPgwYDgC/sE0FsaM/s7fEAy5vNZ0u+lsQqd
	Y9yywpb67dEGu28GR3GZe0kS1KvdR7Ls1sGN0S96VCto68+z2p+KtMPwNQoufugERd8HYwcZnpa
	rw60FAMQImLl8iniug89mOJZtOwbjIHuik/OEyDCxTiTCHW4OPjUxqY7Ad/gDjYBNXERKARTJYS
	4Q5KAnFAY+nbR10dWAfZIhxRshDwGDB1WjGZ5sMMVGaX5iNYg07ZAXChDMSsz/oQ==
X-Received: by 2002:a17:907:2d9f:b0:b9c:b3b5:bbf0 with SMTP id a640c23a62f3a-b9cb3b5bc8fmr276106266b.6.1775483810728;
        Mon, 06 Apr 2026 06:56:50 -0700 (PDT)
Received: from aorus.localdomain (5.185.72.109.ipv4.public.orange.pl. [5.185.72.109])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cac0e1asm472921266b.27.2026.04.06.06.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 06:56:50 -0700 (PDT)
From: =?UTF-8?q?=C5=81ukasz=20Lebiedzi=C5=84ski?= <kernel@lvkasz.us>
To: vkoul@kernel.org
Cc: neil.armstrong@linaro.org,
	krzk@kernel.org,
	alim.akhtar@samsung.com,
	andre.draszik@linaro.org,
	pritam.sutar@samsung.com,
	kauschluss@disroot.org,
	johan@kernel.org,
	ivo.ivanov.ivanov1@gmail.com,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?utf-8?q?=C5=81ukasz=20Lebiedzi=C5=84ski?= <kernel@lvkasz.us>,
	stable@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2] phy: exynos5-usbdrd: fix USB 2.0 HS PHY tuning values for Exynos7870
Date: Mon,  6 Apr 2026 15:56:27 +0200
Message-ID: <20260406135627.234835-1-kernel@lvkasz.us>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

The existing PHYPARAM0 tuning values for Exynos7870 are incorrect,
causing the USB 2.0 PHY to fail high-speed negotiation and fall back
to full-speed (12Mbps) operation.

Fix TXVREFTUNE (transmitter voltage reference) from 14 to 3,
TXRESTUNE (transmitter impedance) from 3 to 2, and SQRXTUNE
(squelch threshold) from 6 to 5. Also explicitly set
TXPREEMPPULSETUNE to 0, which was previously missing from the
tuning table despite being included in the register mask.

All values are derived from the vendor kernel for the Samsung
Galaxy A6 (SM-A600FN), as no public hardware documentation is
available for the Exynos7870 USB DRD PHY. With these corrections,
the PHY successfully negotiates high-speed (480Mbps) operation.

Fixes: 588d5d20ca8d ("phy: exynos5-usbdrd: add exynos7870 USBDRD support")
Cc: stable@vger.kernel.org
Tested-by: Kaustabh Chakraborty <kauschluss@disroot.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Łukasz Lebiedziński <kernel@lvkasz.us>
---
 drivers/phy/samsung/phy-exynos5-usbdrd.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index 5a181cb4597e..8711a3b62c8e 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -1958,13 +1958,14 @@ const struct exynos5_usbdrd_phy_tuning exynos7870_tunes_utmi_postinit[] = {
 			      PHYPARAM0_TXPREEMPAMPTUNE | PHYPARAM0_TXHSXVTUNE |
 			      PHYPARAM0_TXFSLSTUNE | PHYPARAM0_SQRXTUNE |
 			      PHYPARAM0_OTGTUNE | PHYPARAM0_COMPDISTUNE),
-			     (FIELD_PREP_CONST(PHYPARAM0_TXVREFTUNE, 14) |
+			     (FIELD_PREP_CONST(PHYPARAM0_TXVREFTUNE, 3) |
 			      FIELD_PREP_CONST(PHYPARAM0_TXRISETUNE, 1) |
-			      FIELD_PREP_CONST(PHYPARAM0_TXRESTUNE, 3) |
+			      FIELD_PREP_CONST(PHYPARAM0_TXRESTUNE, 2) |
+			      FIELD_PREP_CONST(PHYPARAM0_TXPREEMPPULSETUNE, 0) |
 			      FIELD_PREP_CONST(PHYPARAM0_TXPREEMPAMPTUNE, 0) |
 			      FIELD_PREP_CONST(PHYPARAM0_TXHSXVTUNE, 0) |
 			      FIELD_PREP_CONST(PHYPARAM0_TXFSLSTUNE, 3) |
-			      FIELD_PREP_CONST(PHYPARAM0_SQRXTUNE, 6) |
+			      FIELD_PREP_CONST(PHYPARAM0_SQRXTUNE, 5) |
 			      FIELD_PREP_CONST(PHYPARAM0_OTGTUNE, 2) |
 			      FIELD_PREP_CONST(PHYPARAM0_COMPDISTUNE, 3))),
 	PHY_TUNING_ENTRY_LAST
-- 
2.53.0

