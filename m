Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9950214A60C
	for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Nov 2025 08:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762762907; cv=none; b=eDeaHe5L9iHDPe86jdrNVEiEzDjNY4clXvVx7epwuq4xWd9gEL7b+cJ9BsBc8zWNEpUE+EQh7ZubzM0UjpDQ01pxbpprwtOQ6bOArCnz0kbEk+u9XTbXhm54yd9QXjh1icI7XNExZOCvvGSe6PXN7690ksaRhAAEe2idEhuo2hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762762907; c=relaxed/simple;
	bh=gkqdNS4ofLtWQ2i1U2LN2qqNsmUleJ/h012bniS1ZoU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=jarYTQ06mMXZyvts6iiQBKMthBFHpRJDUSHZxxi2jJmip/IEgR71o8E2wVytnVTIdQLItA5/eksCoX6gipZxJKuROWe6PCH1prD+L6GARVUCjUouGKuFyXKUF7zNC1PV1muf42Tb6Xm13tz2/TPYaPK9ZxZLgVNouASZkj9EVgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=RI/H0XMj; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="RI/H0XMj"
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20251110082143epoutp0447b7be727a6e14a32c42ee3215adc1e5~2l4Vqml7D1219312193epoutp04u
	for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Nov 2025 08:21:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20251110082143epoutp0447b7be727a6e14a32c42ee3215adc1e5~2l4Vqml7D1219312193epoutp04u
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1762762903;
	bh=z22LSM75yanWcvsMpACwYcJ+/LePkkFvegqugG3dens=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RI/H0XMjj1uYy9fuU+Mwbjm6AefLO/ap3okxHOT0/FsQO010N67vdzu3WIVqprYBU
	 1RZtliPTiW9wQpAGYaOL7I5DssAyfYyaMUQ+nuVCKvb0U/+pbz7jZceE4yKoCq635d
	 yRQ6Pnp7RQ5dZcU58/mkDdk71/PTOm1PYQR0pFcA=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPS id
	20251110082142epcas2p3de20e29f8558e616a729c7767650c83c~2l4Uk5Bof0120601206epcas2p3j;
	Mon, 10 Nov 2025 08:21:42 +0000 (GMT)
Received: from epcas2p3.samsung.com (unknown [182.195.38.200]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4d4jLY6bTNz3hhT3; Mon, 10 Nov
	2025 08:21:41 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20251110082141epcas2p4de27828f15600071f03611d2c67db9ab~2l4To1BO00886908869epcas2p4I;
	Mon, 10 Nov 2025 08:21:41 +0000 (GMT)
Received: from perf.dsn.sec.samsung.com (unknown [10.229.95.91]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20251110082141epsmtip1c9460c39982b4b8dd13241077b31f4b0~2l4Tlj3pD1751917519epsmtip1c;
	Mon, 10 Nov 2025 08:21:41 +0000 (GMT)
From: Youngmin Nam <youngmin.nam@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, alim.akhtar@samsung.com,
	linus.walleij@linaro.org, peter.griffin@linaro.org,
	semen.protsenko@linaro.org
Cc: ryu.real@samsung.com, d7271.choe@samsung.com,
	linux-samsung-soc@vger.kernel.org, Youngmin Nam <youngmin.nam@samsung.com>
Subject: [RFT PATCH v1 2/5] pinctrl: samsung: fix incorrect pin-bank entries
 on Exynos2200/7885/8890/8895
Date: Mon, 10 Nov 2025 17:26:46 +0900
Message-Id: <20251110082649.3109858-3-youngmin.nam@samsung.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20251110082649.3109858-1-youngmin.nam@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251110082141epcas2p4de27828f15600071f03611d2c67db9ab
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251110082141epcas2p4de27828f15600071f03611d2c67db9ab
References: <20251110082649.3109858-1-youngmin.nam@samsung.com>
	<CGME20251110082141epcas2p4de27828f15600071f03611d2c67db9ab@epcas2p4.samsung.com>

This patch corrects wrong pin bank table definitions for 4 SoCs
based on their TRMs.

Exynos2200
- gpq0/1/2 were using EXYNOS_PIN_BANK_EINTN(),
  which implies a bank_type_off layout (.fld_width = {4,1,2,2,2,2}).
- Per the SoC TRM these banks must use the “alive” layout
  (.fld_width = {4,1,4,4}).
- Switch them to EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, …).

Exynos7885
- etc0, etc1: update bank type to match the SoC TRM.
- gpq0 is a non-wakeup interrupt bank; change EINTW -> EINTN accordingly.

Exynos8890
- Per the SoC TRM, rename bank ect0 to gpb3 and mark it as
  a non-external interrupt bank.
- gpi1, gpi2: update bank type to match the SoC TRM.
  exynos8895_bank_type_off (.fld_width = {4,1,2,3,2,2}) ->
  exynos5433_bank_type_off (.fld_width = {4,1,2,4,2,2})
- Per the SoC TRM, mark etc1 as a non-external interrupt bank.

Exynos8895
- gpa4 is a non-wakeup interrupt bank per the SoC TRM.
  change EINTW -> EINTN.
  (The bank_type itself was correct and is kept unchanged.)

This aligns the pin-bank tables with the documented bitfield layouts and
wakeup domains. No DT/ABI change.

Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
---
 .../pinctrl/samsung/pinctrl-exynos-arm64.c    | 22 +++++++++----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
index f8fbdd921d00..6e874ce40ff5 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
@@ -95,9 +95,9 @@ static const struct samsung_pin_bank_data exynos2200_pin_banks0[] __initconst =
 	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x40, "gpa2", 0x08),
 	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x60, "gpa3", 0x0c),
 	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x80, "gpa4", 0x10),
-	EXYNOS_PIN_BANK_EINTN(4, 0xa0, "gpq0"),
-	EXYNOS_PIN_BANK_EINTN(2, 0xc0, "gpq1"),
-	EXYNOS_PIN_BANK_EINTN(2, 0xe0, "gpq2"),
+	EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 4, 0xa0, "gpq0"),
+	EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 2, 0xc0, "gpq1"),
+	EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 2, 0xe0, "gpq2"),
 };
 
 /* pin banks of exynos2200 pin-controller - CMGP */
@@ -768,12 +768,12 @@ const struct samsung_pinctrl_of_match_data exynos7870_of_data __initconst = {
 
 /* pin banks of exynos7885 pin-controller 0 (ALIVE) */
 static const struct samsung_pin_bank_data exynos7885_pin_banks0[] __initconst = {
-	EXYNOS_PIN_BANK_EINTN(3, 0x000, "etc0"),
-	EXYNOS_PIN_BANK_EINTN(3, 0x020, "etc1"),
+	EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 3, 0x000, "etc0"),
+	EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 3, 0x020, "etc1"),
 	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x040, "gpa0", 0x00),
 	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x060, "gpa1", 0x04),
 	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x080, "gpa2", 0x08),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 5, 0x0a0, "gpq0", 0x0c),
+	EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 5, 0x0a0, "gpq0"),
 };
 
 /* pin banks of exynos7885 pin-controller 1 (DISPAUD) */
@@ -1502,7 +1502,7 @@ static const struct samsung_pin_bank_data exynos8890_pin_banks1[] __initconst =
 /* pin banks of exynos8890 pin-controller 2 (CCORE) */
 static const struct samsung_pin_bank_data exynos8890_pin_banks2[] __initconst = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
-	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x000, "etc0", 0x00),
+	EXYNOS9_PIN_BANK_EINTN(exynos8895_bank_type_off, 2, 0x000, "gpb3"),
 };
 
 /* pin banks of exynos8890 pin-controller 3 (ESE) */
@@ -1520,8 +1520,8 @@ static const struct samsung_pin_bank_data exynos8890_pin_banks4[] __initconst =
 /* pin banks of exynos8890 pin-controller 5 (FSYS0) */
 static const struct samsung_pin_bank_data exynos8890_pin_banks5[] __initconst = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
-	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x000, "gpi1", 0x00),
-	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x020, "gpi2", 0x04),
+	EXYNOS9_PIN_BANK_EINTG(exynos5433_bank_type_off, 4, 0x000, "gpi1", 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos5433_bank_type_off, 8, 0x020, "gpi2", 0x04),
 };
 
 /* pin banks of exynos8890 pin-controller 6 (FSYS1) */
@@ -1552,7 +1552,7 @@ static const struct samsung_pin_bank_data exynos8890_pin_banks8[] __initconst =
 	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 6, 0x140, "gpc2", 0x28),
 	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x160, "gpc3", 0x2c),
 	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x180, "gpk0", 0x30),
-	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 7, 0x1A0, "etc1", 0x34),
+	EXYNOS9_PIN_BANK_EINTN(exynos8895_bank_type_off, 7, 0x1A0, "etc1"),
 };
 
 /* pin banks of exynos8890 pin-controller 9 (PERIC1) */
@@ -1647,7 +1647,7 @@ static const struct samsung_pin_bank_data exynos8895_pin_banks0[] __initconst =
 	EXYNOS9_PIN_BANK_EINTW(bank_type_alive, 8, 0x040, "gpa1", 0x04),
 	EXYNOS9_PIN_BANK_EINTW(bank_type_alive, 8, 0x060, "gpa2", 0x08),
 	EXYNOS9_PIN_BANK_EINTW(bank_type_alive, 8, 0x080, "gpa3", 0x0c),
-	EXYNOS9_PIN_BANK_EINTW(bank_type_alive, 7, 0x0a0, "gpa4", 0x24),
+	EXYNOS9_PIN_BANK_EINTN(bank_type_alive, 7, 0x0a0, "gpa4"),
 };
 
 /* pin banks of exynos8895 pin-controller 1 (ABOX) */
-- 
2.39.2

