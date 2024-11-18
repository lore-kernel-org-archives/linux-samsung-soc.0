Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5B117993
	for <linux-samsung-soc@vger.kernel.org>; Mon, 18 Nov 2024 02:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731895823; cv=none; b=jymuTP52kjTH1260NVu1qKw+K4GaVarwwwNEpMYODJTLoLxo+ULX4IJwJUWsK2lPDBwSSgnexN71Bz0X/yYR+g1IOSCwyl+7DGZ67viZoZYeUR5G5wO73NsYnX9xhSKTNSCZqpX0Gfyk0sc2N4ZQUHrfvuzd4LVsamBzlCodvFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731895823; c=relaxed/simple;
	bh=li4hv+3vfo4guMaxGEq5WUFfS9OA7DyyHNcTWPautww=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=oBn1V4+v5tMwSNOhlEtsbMqeTivw+x9YbUqihigdkxsheZGrOwiT1EOpAH7XD574pirKGnhptz8EzIicjtkTMQTDV6iCR95mtZPamXWwcuMJGX7nC0d7x/OiVFWk5riqwT/66k2xn31rmQncxMV3cvmuYwvCSeq0gtQ9aybvFBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=UBT+uYK9; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="UBT+uYK9"
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20241118021013epoutp02201bf15f93166552e2ea1334146f4d46~I7hD15kpr0755807558epoutp020
	for <linux-samsung-soc@vger.kernel.org>; Mon, 18 Nov 2024 02:10:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20241118021013epoutp02201bf15f93166552e2ea1334146f4d46~I7hD15kpr0755807558epoutp020
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1731895813;
	bh=zYQkCpiJVwuNTHU4rMxOAaO8+O6gTl9KRrlfJ1N52GI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UBT+uYK95d930y7pb6T/c7AE/5Fs8mFrBaJ8OIusGf4k+XWhTsDyDUtRVXms2Yd7L
	 jrPjZeEp0ygKK1Y7dI+RRur9zqruEizN4/aChhSq+iVERVTrsKZhE1o9UCGx8B9T1O
	 fq/vfcDoGLc0+IBbpEP6kqjJ0N8dXer5Q7UIxZKg=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTP id
	20241118021012epcas2p2f8f5c81c9a86b1281ce7e72e5f26f9b3~I7hDTEi4S0463304633epcas2p2K;
	Mon, 18 Nov 2024 02:10:12 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.101]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4XsB0g6CvYz4x9Q0; Mon, 18 Nov
	2024 02:10:11 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
	epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
	F2.9D.09811.302AA376; Mon, 18 Nov 2024 11:10:11 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20241118021011epcas2p4b71dadce42a321213bdf8d445a312a8f~I7hCEJI-x1616716167epcas2p4z;
	Mon, 18 Nov 2024 02:10:11 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20241118021011epsmtrp1761e2abb007ae02147ab1e381753e18a~I7hCDPX152168521685epsmtrp1k;
	Mon, 18 Nov 2024 02:10:11 +0000 (GMT)
X-AuditID: b6c32a48-0869ea8000002653-ab-673aa2033923
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	77.6C.18937.302AA376; Mon, 18 Nov 2024 11:10:11 +0900 (KST)
Received: from asswp146.dsn.sec.samsung.com (unknown [10.229.19.146]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20241118021011epsmtip1712073d1a4e8884d26e3773a1d61dff4~I7hB1rTv13059530595epsmtip1S;
	Mon, 18 Nov 2024 02:10:11 +0000 (GMT)
From: Sowon Na <sowon.na@samsung.com>
To: robh@kernel.org, krzk@kernel.org, conor+dt@kernel.org, vkoul@kernel.org,
	alim.akhtar@samsung.com, kishon@kernel.org
Cc: krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	sowon.na@samsung.com
Subject: [PATCH v3 2/3] phy: samsung-ufs: support ExynosAutov920 ufs phy
 driver
Date: Mon, 18 Nov 2024 11:10:05 +0900
Message-ID: <20241118021009.2858849-3-sowon.na@samsung.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241118021009.2858849-1-sowon.na@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprKJsWRmVeSWpSXmKPExsWy7bCmqS7zIqt0g60/9C0ezNvGZrFm7zkm
	i/lHzrFaHG39z2zxctY9Novz5zewW1zeNYfNYsb5fUwW//fsYLf4/fMQk8XOOyeYHbg9Nq3q
	ZPPo27KK0ePzJrkA5qhsm4zUxJTUIoXUvOT8lMy8dFsl7+B453hTMwNDXUNLC3MlhbzE3FRb
	JRefAF23zBygg5QUyhJzSoFCAYnFxUr6djZF+aUlqQoZ+cUltkqpBSk5BeYFesWJucWleel6
	eaklVoYGBkamQIUJ2RlH3/xiL5jhW3Gp/QJ7A+MM5y5GTg4JAROJaTNfMHYxcnEICexglFhz
	6xgrhPOJUWJK630mOOf44YuMMC1dx2eyQSR2MkqcvNQK1f+LUeLQm9dA/RwcbAKqEtcaqkBM
	EYFKibnLnEFKmAV6GSX676xlARkkLBAocWfXVXYQmwWofMPzVcwgNq+AtcSirZdYIJbJS1xc
	85wNxOYUsJGYvXkVO0SNoMTJmU/AapiBapq3zmYGWSAh8JVd4vW2H0wQzS4S7Y3HoK4Wlnh1
	fAs7hC0l8bK/DcrOl1j/8C4bhF0hcffQf6jF9hKLzvxkB3mAWUBTYv0ufRBTQkBZ4sgtqLV8
	Eh2H/7JDhHklOtqEIBqVJDrOz4E6QEJi1YvJUMM9JD5cWwENqX5Gid7VJ5gmMCrMQvLNLCTf
	zEJYvICReRWjWGpBcW56arFRgQk8gpPzczcxgtOnlscOxtlvP+gdYmTiYDzEKMHBrCTCe8nV
	PF2INyWxsiq1KD++qDQntfgQoykwrCcyS4km5wMTeF5JvKGJpYGJmZmhuZGpgbmSOO+91rkp
	QgLpiSWp2ampBalFMH1MHJxSDUxJbjsm310d7PVp3u4qv/OL3vtfuX7Sb6N4bXr9hSk99i71
	3EHL399lbAg5+F5Q2t4qUkDl9e1tIt7yO70XnerXbdnV498wWbpsdozn7Efz/k15EXXhjoas
	tM2lQuX+P40qihZTzyor/d4UKLrxW/uTDdef2po2nAiZ5L/m8lexPQ83/3k9YypDsQO3G3tG
	DNt1y/0JO86YZYbKHtzzxM7q+I6n9z123JX9c/tm9ORnEzS+cRxqa1BOT946Z3f0nnsrTPeV
	caz6voqvfYP1JAaux69zVXckiHoxXfwea2bNznwl7Nn5ufGhzHZ+CcIlBpOMLoWdEryX2nU8
	rNzHzETU9lvQroALURufL/Q5cuiAEktxRqKhFnNRcSIA/mdl2CgEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrLLMWRmVeSWpSXmKPExsWy7bCSnC7zIqt0gyfrhC0ezNvGZrFm7zkm
	i/lHzrFaHG39z2zxctY9Novz5zewW1zeNYfNYsb5fUwW//fsYLf4/fMQk8XOOyeYHbg9Nq3q
	ZPPo27KK0ePzJrkA5igum5TUnMyy1CJ9uwSujKNvfrEXzPCtuNR+gb2BcYZzFyMnh4SAiUTX
	8ZlsXYxcHEIC2xklunp+skIkJCS+vdnDBGELS9xvOcIKUfSDUeLd0lNADgcHm4CqxLWGKpC4
	iEAjo8TzD5OZQRxmgYmMEufnHWEH6RYW8JeYtvUJG4jNAtSw4fkqZhCbV8BaYtHWSywQG+Ql
	Lq55DlbDKWAjMXvzKnaQBUJANZ0HwiHKBSVOznwCVs4MVN68dTbzBEaBWUhSs5CkFjAyrWIU
	TS0ozk3PTS4w1CtOzC0uzUvXS87P3cQIDnGtoB2My9b/1TvEyMTBeIhRgoNZSYT3kqt5uhBv
	SmJlVWpRfnxRaU5q8SFGaQ4WJXFe5ZzOFCGB9MSS1OzU1ILUIpgsEwenVAOTduUH2U02P27z
	yimYblyjd5lzi7LD5Nszv7fN1dlZtVUhaZtB0vInt/ct3jPr//EJLpf27t0nbJGyVnHbqV6F
	AN363tD7h2Z+cDuT7cg3zVDazOvP4Y15hppZGne6NryNW7p8pvD1Evnd5cWBGzZMnsn0ukBm
	3ao2g+0/YlSFb5s95eVYve7t9HalP7xbj3+X+dPjcbW39C/ru2NnJsmenZX+zT51c+vKe9Fe
	MnvXrHWJ+xcX/36F8o0z6a2heYr5pZ85Hiuax6Q/Ul44+Z3G5pxj17std/z9asgUvn8+q0OO
	UqPvajv9+0virjoffXO+dVajz9w17jrv/Xiz9QxFZKbpMDz8md+uJWr1Yss+ayWW4oxEQy3m
	ouJEAFIUUw3gAgAA
X-CMS-MailID: 20241118021011epcas2p4b71dadce42a321213bdf8d445a312a8f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241118021011epcas2p4b71dadce42a321213bdf8d445a312a8f
References: <20241118021009.2858849-1-sowon.na@samsung.com>
	<CGME20241118021011epcas2p4b71dadce42a321213bdf8d445a312a8f@epcas2p4.samsung.com>

Add support for ExynosAutov920 ufs phy driver.

Signed-off-by: Sowon Na <sowon.na@samsung.com>
---
 drivers/phy/samsung/Makefile                 |   1 +
 drivers/phy/samsung/phy-exynosautov920-ufs.c | 167 +++++++++++++++++++
 drivers/phy/samsung/phy-samsung-ufs.c        |   9 +-
 drivers/phy/samsung/phy-samsung-ufs.h        |   4 +
 4 files changed, 178 insertions(+), 3 deletions(-)
 create mode 100644 drivers/phy/samsung/phy-exynosautov920-ufs.c

diff --git a/drivers/phy/samsung/Makefile b/drivers/phy/samsung/Makefile
index fea1f96d0e43..342682638a87 100644
--- a/drivers/phy/samsung/Makefile
+++ b/drivers/phy/samsung/Makefile
@@ -7,6 +7,7 @@ phy-exynos-ufs-y			+= phy-gs101-ufs.o
 phy-exynos-ufs-y			+= phy-samsung-ufs.o
 phy-exynos-ufs-y			+= phy-exynos7-ufs.o
 phy-exynos-ufs-y			+= phy-exynosautov9-ufs.o
+phy-exynos-ufs-y			+= phy-exynosautov920-ufs.o
 phy-exynos-ufs-y			+= phy-fsd-ufs.o
 obj-$(CONFIG_PHY_SAMSUNG_USB2)		+= phy-exynos-usb2.o
 phy-exynos-usb2-y			+= phy-samsung-usb2.o
diff --git a/drivers/phy/samsung/phy-exynosautov920-ufs.c b/drivers/phy/samsung/phy-exynosautov920-ufs.c
new file mode 100644
index 000000000000..8a7ba159bbfe
--- /dev/null
+++ b/drivers/phy/samsung/phy-exynosautov920-ufs.c
@@ -0,0 +1,167 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * UFS PHY driver data for Samsung ExynosAuto v920 SoC
+ *
+ * Copyright (C) 2024 Samsung Electronics Co., Ltd.
+ */
+
+#include "phy-samsung-ufs.h"
+
+#define EXYNOSAUTOV920_EMBEDDED_COMBO_PHY_CTRL			0x708
+#define EXYNOSAUTOV920_EMBEDDED_COMBO_PHY_CTRL_MASK		0x1
+#define EXYNOSAUTOV920_EMBEDDED_COMBO_PHY_CTRL_EN		BIT(0)
+#define EXYNOSAUTOV920_EMBEDDED_COMBO_PHY_CDR_LOCK_STATUS	0x5e
+
+#define EXYNOSAUTOV920_CDR_LOCK_OFFSET				0xCE4
+
+#define PHY_EXYNOSAUTOV920_LANE_OFFSET				0x200
+#define PHY_TRSV_REG_CFG_AUTOV920(o, v, d) \
+	PHY_TRSV_REG_CFG_OFFSET(o, v, d, PHY_EXYNOSAUTOV920_LANE_OFFSET)
+
+/* Calibration for phy initialization */
+static const struct samsung_ufs_phy_cfg exynosautov920_pre_init_cfg[] = {
+	PHY_COMN_REG_CFG(0x29, 0x22, PWR_MODE_ANY),
+	PHY_COMN_REG_CFG(0x43, 0x10, PWR_MODE_ANY),
+	PHY_COMN_REG_CFG(0x3C, 0x14, PWR_MODE_ANY),
+	PHY_COMN_REG_CFG(0x46, 0x48, PWR_MODE_ANY),
+	PHY_COMN_REG_CFG(0x04, 0x95, PWR_MODE_ANY),
+	PHY_COMN_REG_CFG(0x06, 0x30, PWR_MODE_ANY),
+
+	PHY_TRSV_REG_CFG_AUTOV920(0x200, 0x00, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x201, 0x06, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x202, 0x06, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x203, 0x0A, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x204, 0x00, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x205, 0x10, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x207, 0x0C, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x2E1, 0xC0, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x22D, 0xF8, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x234, 0x60, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x238, 0x13, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x239, 0x48, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x23A, 0x01, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x23B, 0x29, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x23C, 0x2A, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x23D, 0x01, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x23E, 0x14, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x23F, 0x13, PWR_MODE_ANY),
+
+	PHY_TRSV_REG_CFG_AUTOV920(0x240, 0x4A, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x243, 0x40, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x244, 0x02, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x25D, 0x00, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x25E, 0x3F, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x25F, 0xFF, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x26F, 0xF0, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x273, 0x33, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x274, 0x50, PWR_MODE_ANY),
+
+	PHY_TRSV_REG_CFG_AUTOV920(0x284, 0x02, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x285, 0x02, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x2A2, 0x04, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x27D, 0x01, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x2FA, 0x01, PWR_MODE_ANY),
+
+	PHY_TRSV_REG_CFG_AUTOV920(0x286, 0x03, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x287, 0x03, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x288, 0x03, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x289, 0x03, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x2B3, 0x04, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x2B6, 0x0B, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x2B7, 0x0B, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x2B8, 0x0B, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x2B9, 0x0B, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x2BA, 0x0B, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x2BB, 0x06, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x2BC, 0x06, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x2BD, 0x06, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x2BE, 0x06, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x34B, 0x01, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x34C, 0x24, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x34D, 0x23, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x34E, 0x45, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x34F, 0x00, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x350, 0x31, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x351, 0x00, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x352, 0x02, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x353, 0x00, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x354, 0x01, PWR_MODE_ANY),
+
+	PHY_COMN_REG_CFG(0x43, 0x18, PWR_MODE_ANY),
+	PHY_COMN_REG_CFG(0x43, 0x00, PWR_MODE_ANY),
+
+	END_UFS_PHY_CFG,
+};
+
+/* Calibration for HS mode series A/B */
+static const struct samsung_ufs_phy_cfg exynosautov920_pre_pwr_hs_cfg[] = {
+	PHY_TRSV_REG_CFG_AUTOV920(0x369, 0x11, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x246, 0x03, PWR_MODE_ANY),
+
+	END_UFS_PHY_CFG,
+};
+
+static const struct samsung_ufs_phy_cfg exynosautov920_post_pwr_hs_cfg[] = {
+	END_UFS_PHY_CFG,
+};
+
+#define DELAY_IN_US	40
+#define RETRY_CNT	100
+#define EXYNOSAUTOV920_CDR_LOCK_MASK	0x8
+int exynosautov920_ufs_phy_wait_cdr_lock(struct phy *phy, u8 lane)
+{
+	struct samsung_ufs_phy *ufs_phy = get_samsung_ufs_phy(phy);
+	u32 reg, i;
+
+	struct samsung_ufs_phy_cfg cfg[4] = {
+		PHY_TRSV_REG_CFG_AUTOV920(0x222, 0x10, PWR_MODE_ANY),
+		PHY_TRSV_REG_CFG_AUTOV920(0x222, 0x18, PWR_MODE_ANY),
+		PHY_TRSV_REG_CFG_AUTOV920(0x246, 0x01, PWR_MODE_ANY),
+		END_UFS_PHY_CFG,
+	};
+
+	for (i = 0; i < RETRY_CNT; i++) {
+		udelay(DELAY_IN_US);
+
+		reg = readl(ufs_phy->reg_pma + EXYNOSAUTOV920_CDR_LOCK_OFFSET +
+			(PHY_APB_ADDR(PHY_EXYNOSAUTOV920_LANE_OFFSET) * lane));
+
+		if ((reg & EXYNOSAUTOV920_CDR_LOCK_MASK)
+					== EXYNOSAUTOV920_CDR_LOCK_MASK) {
+			samsung_ufs_phy_config(ufs_phy, &cfg[2], lane);
+			return 0;
+		}
+
+		udelay(DELAY_IN_US);
+
+		/* Disable and enable CDR */
+		samsung_ufs_phy_config(ufs_phy, &cfg[0], lane);
+		samsung_ufs_phy_config(ufs_phy, &cfg[1], lane);
+	}
+
+	dev_err(ufs_phy->dev, "failed to get phy cdr lock\n");
+	return -ETIMEDOUT;
+}
+
+static const struct samsung_ufs_phy_cfg *exynosautov920_ufs_phy_cfgs[CFG_TAG_MAX] = {
+	[CFG_PRE_INIT]          = exynosautov920_pre_init_cfg,
+	[CFG_PRE_PWR_HS]        = exynosautov920_pre_pwr_hs_cfg,
+	[CFG_POST_PWR_HS]       = exynosautov920_post_pwr_hs_cfg,
+};
+
+static const char * const exynosautov920_ufs_phy_clks[] = {
+	"ref_clk",
+};
+
+const struct samsung_ufs_phy_drvdata exynosautov920_ufs_phy = {
+	.cfgs = exynosautov920_ufs_phy_cfgs,
+	.isol = {
+		.offset = EXYNOSAUTOV920_EMBEDDED_COMBO_PHY_CTRL,
+		.mask = EXYNOSAUTOV920_EMBEDDED_COMBO_PHY_CTRL_MASK,
+		.en = EXYNOSAUTOV920_EMBEDDED_COMBO_PHY_CTRL_EN,
+	},
+	.clk_list = exynosautov920_ufs_phy_clks,
+	.num_clks = ARRAY_SIZE(exynosautov920_ufs_phy_clks),
+	.cdr_lock_status_offset = EXYNOSAUTOV920_EMBEDDED_COMBO_PHY_CDR_LOCK_STATUS,
+	.wait_for_cdr = exynosautov920_ufs_phy_wait_cdr_lock,
+};
diff --git a/drivers/phy/samsung/phy-samsung-ufs.c b/drivers/phy/samsung/phy-samsung-ufs.c
index 6c5d41552649..c13fe149bc75 100644
--- a/drivers/phy/samsung/phy-samsung-ufs.c
+++ b/drivers/phy/samsung/phy-samsung-ufs.c
@@ -28,9 +28,9 @@
 
 #define PHY_DEF_LANE_CNT	1
 
-static void samsung_ufs_phy_config(struct samsung_ufs_phy *phy,
-				   const struct samsung_ufs_phy_cfg *cfg,
-				   u8 lane)
+void samsung_ufs_phy_config(struct samsung_ufs_phy *phy,
+			    const struct samsung_ufs_phy_cfg *cfg,
+			    u8 lane)
 {
 	enum {LANE_0, LANE_1}; /* lane index */
 
@@ -323,6 +323,9 @@ static const struct of_device_id samsung_ufs_phy_match[] = {
 	}, {
 		.compatible = "samsung,exynosautov9-ufs-phy",
 		.data = &exynosautov9_ufs_phy,
+	}, {
+		.compatible = "samsung,exynosautov920-ufs-phy",
+		.data = &exynosautov920_ufs_phy,
 	}, {
 		.compatible = "tesla,fsd-ufs-phy",
 		.data = &fsd_ufs_phy,
diff --git a/drivers/phy/samsung/phy-samsung-ufs.h b/drivers/phy/samsung/phy-samsung-ufs.h
index 9b7deef6e10f..a28f148081d1 100644
--- a/drivers/phy/samsung/phy-samsung-ufs.h
+++ b/drivers/phy/samsung/phy-samsung-ufs.h
@@ -143,9 +143,13 @@ static inline void samsung_ufs_phy_ctrl_isol(
 }
 
 int samsung_ufs_phy_wait_for_lock_acq(struct phy *phy, u8 lane);
+int exynosautov920_ufs_phy_wait_cdr_lock(struct phy *phy, u8 lane);
+void samsung_ufs_phy_config(struct samsung_ufs_phy *phy,
+			    const struct samsung_ufs_phy_cfg *cfg, u8 lane);
 
 extern const struct samsung_ufs_phy_drvdata exynos7_ufs_phy;
 extern const struct samsung_ufs_phy_drvdata exynosautov9_ufs_phy;
+extern const struct samsung_ufs_phy_drvdata exynosautov920_ufs_phy;
 extern const struct samsung_ufs_phy_drvdata fsd_ufs_phy;
 extern const struct samsung_ufs_phy_drvdata tensor_gs101_ufs_phy;
 
-- 
2.45.2

