Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E07528B400
	for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Nov 2025 08:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762762911; cv=none; b=R0nA58w449BglAbahHgVnuitd9fwL0EyFtAgVwE+brQbvs5uU9ofypSpdG5RUbvOMoM4ceWQVsrhpD4fk4V6kGnpU2U98sAuGfSxIzbIcgz+B/ZoWwagFMBKHlWS2ezFtlok465VY6zlsMy3To99OM3OKXMnb7B2uDJIRFWu0Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762762911; c=relaxed/simple;
	bh=NwxevWFirXCgMIF8rnM4leLL0chcbeiMav338a2HCSE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=huljJApj/q2C4x0XiwkC08mLKevGX5Ggsj0Bdhs5uhkt6MTqdlXcBCtw131AVBgAuCJDc6e/8oSPXpkI/xaUcHeR/hBrf/UHOLnr2djRkB2cjohe1eOKRZ/yWa3mmDhoZCaz7hmVpK+i4sX4KgNkfUiHCsIkbDYQ6xHfnDcwIO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Kt6wdjXe; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Kt6wdjXe"
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20251110082147epoutp044245cf39ed92640069060951da825e53~2l4ZbbmdG1247412474epoutp04v
	for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Nov 2025 08:21:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20251110082147epoutp044245cf39ed92640069060951da825e53~2l4ZbbmdG1247412474epoutp04v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1762762907;
	bh=4s/bqx4jxX6d2NosdoV1NuT0mvRhBFYzYp9tL/14k/Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Kt6wdjXeaR6VYdRvIYiM997vudqQVVNfLumLVdEUnnehJBTpJH6dVP/308gMiqxIN
	 tiytWhQlvaPMNw4SBr4o2dcOUNbUvWa54LknrfREGNwjUOiIhM+K+Du8817+U8HYIV
	 ctSJU/kdztWZ+lcfPwJbpNNhuFbHk08N4WRhiWX4=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPS id
	20251110082146epcas2p1af80331ca416bd29a711a672f28ff876~2l4Y9ChpQ0509005090epcas2p1L;
	Mon, 10 Nov 2025 08:21:46 +0000 (GMT)
Received: from epcas2p1.samsung.com (unknown [182.195.38.203]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4d4jLf4NN0z6B9mF; Mon, 10 Nov
	2025 08:21:46 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20251110082145epcas2p1e56790e7aa72d7d3bcad4cc1faae07ef~2l4YA8RlB0509005090epcas2p1J;
	Mon, 10 Nov 2025 08:21:45 +0000 (GMT)
Received: from perf.dsn.sec.samsung.com (unknown [10.229.95.91]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20251110082145epsmtip16f25e069088e7ae725a2a75972de3750~2l4X9Hikw1643416434epsmtip11;
	Mon, 10 Nov 2025 08:21:45 +0000 (GMT)
From: Youngmin Nam <youngmin.nam@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, alim.akhtar@samsung.com,
	linus.walleij@linaro.org, peter.griffin@linaro.org,
	semen.protsenko@linaro.org
Cc: ryu.real@samsung.com, d7271.choe@samsung.com,
	linux-samsung-soc@vger.kernel.org, Youngmin Nam <youngmin.nam@samsung.com>
Subject: [RFT PATCH v1 5/5] pinctrl: samsung: rename gs101_pinctrl_* to
 exynos9_pinctrl_*
Date: Mon, 10 Nov 2025 17:26:49 +0900
Message-Id: <20251110082649.3109858-6-youngmin.nam@samsung.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20251110082649.3109858-1-youngmin.nam@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251110082145epcas2p1e56790e7aa72d7d3bcad4cc1faae07ef
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251110082145epcas2p1e56790e7aa72d7d3bcad4cc1faae07ef
References: <20251110082649.3109858-1-youngmin.nam@samsung.com>
	<CGME20251110082145epcas2p1e56790e7aa72d7d3bcad4cc1faae07ef@epcas2p1.samsung.com>

The suspend/resume helpers named gs101_pinctrl_{suspend,resume} are not
GS101-specific. They implement the generic save/restore sequence used by
Exynos9-style controllers that have EINT filter configuration (eint_fltcon)
to preserve.

Rename them to exynos9_pinctrl_{suspend,resume} and update all users:
  - exynos2200, exynos9810, exynos8895, exynos7885, exynos7870,
    exynosautov9, fsd, and gs101 controller tables
  - prototypes in pinctrl-exynos.h
  - definitions in pinctrl-exynos.c

This aligns naming with the earlier macro/doc cleanups (e.g. using
EXYNOS9_PIN_BANK_* and describing eint_fltcon as Exynos9-specific) and
makes the helpers clearly reusable by other Exynos9-like SoCs.

Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
---
 .../pinctrl/samsung/pinctrl-exynos-arm64.c    | 176 +++++++++---------
 drivers/pinctrl/samsung/pinctrl-exynos.c      |   4 +-
 drivers/pinctrl/samsung/pinctrl-exynos.h      |   4 +-
 3 files changed, 92 insertions(+), 92 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
index ea11543e4e26..ccaa8b6b39a9 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
@@ -195,16 +195,16 @@ static const struct samsung_pin_ctrl exynos2200_pin_ctrl[] = {
 		.nr_banks	= ARRAY_SIZE(exynos2200_pin_banks0),
 		.eint_gpio_init = exynos_eint_gpio_init,
 		.eint_wkup_init = exynos_eint_wkup_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 1 CMGP data */
 		.pin_banks	= exynos2200_pin_banks1,
 		.nr_banks	= ARRAY_SIZE(exynos2200_pin_banks1),
 		.eint_gpio_init = exynos_eint_gpio_init,
 		.eint_wkup_init = exynos_eint_wkup_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 2 HSI1 data */
 		.pin_banks	= exynos2200_pin_banks2,
@@ -214,36 +214,36 @@ static const struct samsung_pin_ctrl exynos2200_pin_ctrl[] = {
 		.pin_banks	= exynos2200_pin_banks3,
 		.nr_banks	= ARRAY_SIZE(exynos2200_pin_banks3),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 4 HSI1UFS data */
 		.pin_banks	= exynos2200_pin_banks4,
 		.nr_banks	= ARRAY_SIZE(exynos2200_pin_banks4),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 5 PERIC0 data */
 		.pin_banks	= exynos2200_pin_banks5,
 		.nr_banks	= ARRAY_SIZE(exynos2200_pin_banks5),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 6 PERIC1 data */
 		.pin_banks	= exynos2200_pin_banks6,
 		.nr_banks	= ARRAY_SIZE(exynos2200_pin_banks6),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 7 PERIC2 data */
 		.pin_banks	= exynos2200_pin_banks7,
 		.nr_banks	= ARRAY_SIZE(exynos2200_pin_banks7),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 8 VTS data */
 		.pin_banks	= exynos2200_pin_banks8,
@@ -710,8 +710,8 @@ static const struct samsung_pin_ctrl exynos7870_pin_ctrl[] __initconst = {
 		.pin_banks	= exynos7870_pin_banks0,
 		.nr_banks	= ARRAY_SIZE(exynos7870_pin_banks0),
 		.eint_wkup_init = exynos_eint_wkup_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 1 DISPAUD data */
 		.pin_banks	= exynos7870_pin_banks1,
@@ -721,43 +721,43 @@ static const struct samsung_pin_ctrl exynos7870_pin_ctrl[] __initconst = {
 		.pin_banks	= exynos7870_pin_banks2,
 		.nr_banks	= ARRAY_SIZE(exynos7870_pin_banks2),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 3 FSYS data */
 		.pin_banks	= exynos7870_pin_banks3,
 		.nr_banks	= ARRAY_SIZE(exynos7870_pin_banks3),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 4 MIF data */
 		.pin_banks	= exynos7870_pin_banks4,
 		.nr_banks	= ARRAY_SIZE(exynos7870_pin_banks4),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 5 NFC data */
 		.pin_banks	= exynos7870_pin_banks5,
 		.nr_banks	= ARRAY_SIZE(exynos7870_pin_banks5),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 6 TOP data */
 		.pin_banks	= exynos7870_pin_banks6,
 		.nr_banks	= ARRAY_SIZE(exynos7870_pin_banks6),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 7 TOUCH data */
 		.pin_banks	= exynos7870_pin_banks7,
 		.nr_banks	= ARRAY_SIZE(exynos7870_pin_banks7),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 	},
 };
 
@@ -819,8 +819,8 @@ static const struct samsung_pin_ctrl exynos7885_pin_ctrl[] __initconst = {
 		.nr_banks	= ARRAY_SIZE(exynos7885_pin_banks0),
 		.eint_gpio_init = exynos_eint_gpio_init,
 		.eint_wkup_init = exynos_eint_wkup_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 1 DISPAUD data */
 		.pin_banks	= exynos7885_pin_banks1,
@@ -830,15 +830,15 @@ static const struct samsung_pin_ctrl exynos7885_pin_ctrl[] __initconst = {
 		.pin_banks	= exynos7885_pin_banks2,
 		.nr_banks	= ARRAY_SIZE(exynos7885_pin_banks2),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 3 TOP data */
 		.pin_banks	= exynos7885_pin_banks3,
 		.nr_banks	= ARRAY_SIZE(exynos7885_pin_banks3),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 	},
 };
 
@@ -1175,8 +1175,8 @@ static const struct samsung_pin_ctrl exynos9810_pin_ctrl[] __initconst = {
 		.nr_banks       = ARRAY_SIZE(exynos9810_pin_banks0),
 		.eint_wkup_init = exynos_eint_wkup_init,
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend        = exynos_pinctrl_suspend,
-		.resume         = exynos_pinctrl_resume,
+		.suspend        = exynos9_pinctrl_suspend,
+		.resume         = exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 1 AUD data */
 		.pin_banks      = exynos9810_pin_banks1,
@@ -1186,44 +1186,44 @@ static const struct samsung_pin_ctrl exynos9810_pin_ctrl[] __initconst = {
 		.pin_banks      = exynos9810_pin_banks2,
 		.nr_banks       = ARRAY_SIZE(exynos9810_pin_banks2),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend        = exynos_pinctrl_suspend,
-		.resume         = exynos_pinctrl_resume,
+		.suspend        = exynos9_pinctrl_suspend,
+		.resume         = exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 3 CMGP data */
 		.pin_banks      = exynos9810_pin_banks3,
 		.nr_banks       = ARRAY_SIZE(exynos9810_pin_banks3),
 		.eint_wkup_init = exynos_eint_wkup_init,
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend        = exynos_pinctrl_suspend,
-		.resume         = exynos_pinctrl_resume,
+		.suspend        = exynos9_pinctrl_suspend,
+		.resume         = exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 4 FSYS0 data */
 		.pin_banks      = exynos9810_pin_banks4,
 		.nr_banks       = ARRAY_SIZE(exynos9810_pin_banks4),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend        = exynos_pinctrl_suspend,
-		.resume         = exynos_pinctrl_resume,
+		.suspend        = exynos9_pinctrl_suspend,
+		.resume         = exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 5 FSYS1 data */
 		.pin_banks      = exynos9810_pin_banks5,
 		.nr_banks       = ARRAY_SIZE(exynos9810_pin_banks5),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend        = exynos_pinctrl_suspend,
-		.resume         = exynos_pinctrl_resume,
+		.suspend        = exynos9_pinctrl_suspend,
+		.resume         = exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 6 PERIC0 data */
 		.pin_banks      = exynos9810_pin_banks6,
 		.nr_banks       = ARRAY_SIZE(exynos9810_pin_banks6),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend        = exynos_pinctrl_suspend,
-		.resume         = exynos_pinctrl_resume,
+		.suspend        = exynos9_pinctrl_suspend,
+		.resume         = exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 7 PERIC1 data */
 		.pin_banks      = exynos9810_pin_banks7,
 		.nr_banks       = ARRAY_SIZE(exynos9810_pin_banks7),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend        = exynos_pinctrl_suspend,
-		.resume         = exynos_pinctrl_resume,
+		.suspend        = exynos9_pinctrl_suspend,
+		.resume         = exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 8 VTS data */
 		.pin_banks      = exynos9810_pin_banks8,
@@ -1295,8 +1295,8 @@ static const struct samsung_pin_ctrl exynosautov9_pin_ctrl[] __initconst = {
 		.pin_banks      = exynosautov9_pin_banks0,
 		.nr_banks       = ARRAY_SIZE(exynosautov9_pin_banks0),
 		.eint_wkup_init = exynos_eint_wkup_init,
-		.suspend        = exynos_pinctrl_suspend,
-		.resume         = exynos_pinctrl_resume,
+		.suspend        = exynos9_pinctrl_suspend,
+		.resume         = exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 1 AUD data */
 		.pin_banks      = exynosautov9_pin_banks1,
@@ -1306,36 +1306,36 @@ static const struct samsung_pin_ctrl exynosautov9_pin_ctrl[] __initconst = {
 		.pin_banks      = exynosautov9_pin_banks2,
 		.nr_banks       = ARRAY_SIZE(exynosautov9_pin_banks2),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend        = exynos_pinctrl_suspend,
-		.resume         = exynos_pinctrl_resume,
+		.suspend        = exynos9_pinctrl_suspend,
+		.resume         = exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 3 FSYS1 data */
 		.pin_banks      = exynosautov9_pin_banks3,
 		.nr_banks       = ARRAY_SIZE(exynosautov9_pin_banks3),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend        = exynos_pinctrl_suspend,
-		.resume         = exynos_pinctrl_resume,
+		.suspend        = exynos9_pinctrl_suspend,
+		.resume         = exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 4 FSYS2 data */
 		.pin_banks      = exynosautov9_pin_banks4,
 		.nr_banks       = ARRAY_SIZE(exynosautov9_pin_banks4),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend        = exynos_pinctrl_suspend,
-		.resume         = exynos_pinctrl_resume,
+		.suspend        = exynos9_pinctrl_suspend,
+		.resume         = exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 5 PERIC0 data */
 		.pin_banks      = exynosautov9_pin_banks5,
 		.nr_banks       = ARRAY_SIZE(exynosautov9_pin_banks5),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend        = exynos_pinctrl_suspend,
-		.resume         = exynos_pinctrl_resume,
+		.suspend        = exynos9_pinctrl_suspend,
+		.resume         = exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 6 PERIC1 data */
 		.pin_banks      = exynosautov9_pin_banks6,
 		.nr_banks       = ARRAY_SIZE(exynosautov9_pin_banks6),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend        = exynos_pinctrl_suspend,
-		.resume         = exynos_pinctrl_resume,
+		.suspend        = exynos9_pinctrl_suspend,
+		.resume         = exynos9_pinctrl_resume,
 	},
 };
 
@@ -1715,8 +1715,8 @@ static const struct samsung_pin_ctrl exynos8895_pin_ctrl[] __initconst = {
 		.nr_banks	= ARRAY_SIZE(exynos8895_pin_banks0),
 		.eint_gpio_init = exynos_eint_gpio_init,
 		.eint_wkup_init = exynos_eint_wkup_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 1 ABOX data */
 		.pin_banks	= exynos8895_pin_banks1,
@@ -1731,36 +1731,36 @@ static const struct samsung_pin_ctrl exynos8895_pin_ctrl[] __initconst = {
 		.pin_banks	= exynos8895_pin_banks3,
 		.nr_banks	= ARRAY_SIZE(exynos8895_pin_banks3),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 4 FSYS1 data */
 		.pin_banks	= exynos8895_pin_banks4,
 		.nr_banks	= ARRAY_SIZE(exynos8895_pin_banks4),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 5 BUSC data */
 		.pin_banks	= exynos8895_pin_banks5,
 		.nr_banks	= ARRAY_SIZE(exynos8895_pin_banks5),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 6 PERIC0 data */
 		.pin_banks	= exynos8895_pin_banks6,
 		.nr_banks	= ARRAY_SIZE(exynos8895_pin_banks6),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 7 PERIC1 data */
 		.pin_banks	= exynos8895_pin_banks7,
 		.nr_banks	= ARRAY_SIZE(exynos8895_pin_banks7),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 	},
 };
 
@@ -1819,15 +1819,15 @@ static const struct samsung_pin_ctrl fsd_pin_ctrl[] __initconst = {
 		.pin_banks	= fsd_pin_banks0,
 		.nr_banks	= ARRAY_SIZE(fsd_pin_banks0),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 1 PERIC data */
 		.pin_banks	= fsd_pin_banks1,
 		.nr_banks	= ARRAY_SIZE(fsd_pin_banks1),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 2 PMU data */
 		.pin_banks	= fsd_pin_banks2,
@@ -1927,16 +1927,16 @@ static const struct samsung_pin_ctrl gs101_pin_ctrl[] __initconst = {
 		.pin_banks	= gs101_pin_alive,
 		.nr_banks	= ARRAY_SIZE(gs101_pin_alive),
 		.eint_wkup_init = exynos_eint_wkup_init,
-		.suspend	= gs101_pinctrl_suspend,
-		.resume		= gs101_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 		.retention_data = &no_retention_data,
 	}, {
 		/* pin banks of gs101 pin-controller (FAR_ALIVE) */
 		.pin_banks	= gs101_pin_far_alive,
 		.nr_banks	= ARRAY_SIZE(gs101_pin_far_alive),
 		.eint_wkup_init = exynos_eint_wkup_init,
-		.suspend	= gs101_pinctrl_suspend,
-		.resume		= gs101_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 		.retention_data = &no_retention_data,
 	}, {
 		/* pin banks of gs101 pin-controller (GSACORE) */
@@ -1951,29 +1951,29 @@ static const struct samsung_pin_ctrl gs101_pin_ctrl[] __initconst = {
 		.pin_banks	= gs101_pin_peric0,
 		.nr_banks	= ARRAY_SIZE(gs101_pin_peric0),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend	= gs101_pinctrl_suspend,
-		.resume		= gs101_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 	}, {
 		/* pin banks of gs101 pin-controller (PERIC1) */
 		.pin_banks	= gs101_pin_peric1,
 		.nr_banks	= ARRAY_SIZE(gs101_pin_peric1),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend	= gs101_pinctrl_suspend,
-		.resume		= gs101_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 	}, {
 		/* pin banks of gs101 pin-controller (HSI1) */
 		.pin_banks	= gs101_pin_hsi1,
 		.nr_banks	= ARRAY_SIZE(gs101_pin_hsi1),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend	= gs101_pinctrl_suspend,
-		.resume		= gs101_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 	}, {
 		/* pin banks of gs101 pin-controller (HSI2) */
 		.pin_banks	= gs101_pin_hsi2,
 		.nr_banks	= ARRAY_SIZE(gs101_pin_hsi2),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend	= gs101_pinctrl_suspend,
-		.resume		= gs101_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 	},
 };
 
diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/samsung/pinctrl-exynos.c
index 81fe0b08a9af..a6dd0fa59230 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
@@ -906,7 +906,7 @@ void exynos_pinctrl_suspend(struct samsung_pin_bank *bank)
 	}
 }
 
-void gs101_pinctrl_suspend(struct samsung_pin_bank *bank)
+void exynos9_pinctrl_suspend(struct samsung_pin_bank *bank)
 {
 	struct exynos_eint_gpio_save *save = bank->soc_priv;
 	const void __iomem *regs = bank->eint_base;
@@ -961,7 +961,7 @@ void exynosautov920_pinctrl_suspend(struct samsung_pin_bank *bank)
 	}
 }
 
-void gs101_pinctrl_resume(struct samsung_pin_bank *bank)
+void exynos9_pinctrl_resume(struct samsung_pin_bank *bank)
 {
 	struct exynos_eint_gpio_save *save = bank->soc_priv;
 
diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.h b/drivers/pinctrl/samsung/pinctrl-exynos.h
index 476346d163d8..7421cb5fa2dc 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.h
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.h
@@ -225,8 +225,8 @@ void exynosautov920_pinctrl_resume(struct samsung_pin_bank *bank);
 void exynosautov920_pinctrl_suspend(struct samsung_pin_bank *bank);
 void exynos_pinctrl_suspend(struct samsung_pin_bank *bank);
 void exynos_pinctrl_resume(struct samsung_pin_bank *bank);
-void gs101_pinctrl_suspend(struct samsung_pin_bank *bank);
-void gs101_pinctrl_resume(struct samsung_pin_bank *bank);
+void exynos9_pinctrl_suspend(struct samsung_pin_bank *bank);
+void exynos9_pinctrl_resume(struct samsung_pin_bank *bank);
 struct samsung_retention_ctrl *
 exynos_retention_init(struct samsung_pinctrl_drv_data *drvdata,
 		      const struct samsung_retention_data *data);
-- 
2.39.2

