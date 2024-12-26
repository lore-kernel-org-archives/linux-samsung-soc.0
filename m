Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4774417C77
	for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Dec 2024 03:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735182711; cv=none; b=tiGTidvce6RZk3lbwyGWEkMZyz3NOTPcUgHa7n2kyML/x1f8gL72fE7S9tpHRzVwLlVRKSZDny5TgpD4F00uhYa7FvDQNLaU96JotVv9DVYpzlB2MohkVDzxNihZVmNRjZRzcFRzAluDtA1vWCZ96EsMBn9+8lG7t0pxtNFKm1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735182711; c=relaxed/simple;
	bh=z5FfS+FaKJm9e5Mw7VDnvHtnEmKT+A8GMIsXjFEcc9A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=nNKT/Q5mMQrnuYDVOwZ81Xt5V3yte+kVQq9HPqCYIa0JUApKhXb/co61PfG7FfVZEaDSIAoW/LXca8clOX14EcNpix6cTIohyfC4wQA6TBZombt6Cjud/Ukw0lxoO+t0jK0o8rZN8ia2syrc9KSf3hV1YdeonP7/lIPYEy4vrPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=o/Kx+aQv; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="o/Kx+aQv"
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20241226031147epoutp03fc82d18724d5309d2554f89e966fa6cf~Um3qeT5Ds2515125151epoutp03Z
	for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Dec 2024 03:11:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20241226031147epoutp03fc82d18724d5309d2554f89e966fa6cf~Um3qeT5Ds2515125151epoutp03Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1735182707;
	bh=umNDv3FoDsPRc6l9FQxKWZoky2iWFpEJaB/qCjmRFI8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=o/Kx+aQv4aCR/VHrUNEI7rSiCL5sPQ+mU/sPGUldDrC/vhziTUs79EPi4GVhQG+pv
	 MTo9LUGrRM6qY0UjBPuw1SxgrxHSFnYLzLDVYHbLefrU04nLs6vTrWCr1ARVstN7ks
	 diK9T6bDgefyTMhQMvPemgsLV6IjUEU2O2Y2FUP0=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTP id
	20241226031146epcas2p1c730d0b3de263615d03b193c93769973~Um3qF8L__1307913079epcas2p1-;
	Thu, 26 Dec 2024 03:11:46 +0000 (GMT)
Received: from epsmgec2p1.samsung.com (unknown [182.195.36.91]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4YJYZB0wzvz4x9Pp; Thu, 26 Dec
	2024 03:11:46 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
	epsmgec2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	4E.06.22938.179CC676; Thu, 26 Dec 2024 12:11:46 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20241226031145epcas2p218657a4f56f105eb7649e580b199a338~Um3ormZrK2140021400epcas2p2S;
	Thu, 26 Dec 2024 03:11:45 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20241226031145epsmtrp27493094d5dcf2ad58d1cf4648ddb82c6~Um3oqJF8w2151821518epsmtrp2V;
	Thu, 26 Dec 2024 03:11:45 +0000 (GMT)
X-AuditID: b6c32a43-0b1e27000000599a-2e-676cc9715391
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	F9.49.33707.179CC676; Thu, 26 Dec 2024 12:11:45 +0900 (KST)
Received: from asswp146.dsn.sec.samsung.com (unknown [10.229.19.146]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20241226031145epsmtip292b10615d8a20dc3fb032e4e2d544f1a~Um3od5BcR2747327473epsmtip2i;
	Thu, 26 Dec 2024 03:11:45 +0000 (GMT)
From: Sowon Na <sowon.na@samsung.com>
To: robh@kernel.org, krzk@kernel.org, conor+dt@kernel.org, vkoul@kernel.org,
	alim.akhtar@samsung.com, kishon@kernel.org
Cc: krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	sowon.na@samsung.com
Subject: [PATCH v4 2/3] phy: samsung-ufs: support ExynosAutov920 ufs phy
 driver
Date: Thu, 26 Dec 2024 12:11:37 +0900
Message-ID: <20241226031142.1764652-3-sowon.na@samsung.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241226031142.1764652-1-sowon.na@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprKJsWRmVeSWpSXmKPExsWy7bCmhW7RyZx0g4O7mS0ezNvGZrFm7zkm
	i/lHzrFaHG39z2zxctY9Novz5zewW1zeNYfNYsb5fUwW//fsYLf4/fMQk8XOOyeYHbg9Nq3q
	ZPPo27KK0ePzJrkA5qhsm4zUxJTUIoXUvOT8lMy8dFsl7+B453hTMwNDXUNLC3MlhbzE3FRb
	JRefAF23zBygg5QUyhJzSoFCAYnFxUr6djZF+aUlqQoZ+cUltkqpBSk5BeYFesWJucWleel6
	eaklVoYGBkamQIUJ2Rl9+9YzF5z3rehfcImtgfGEcxcjJ4eEgIlE24bFrF2MXBxCAjsYJb4c
	bGWGcD4xSrw434XgzG0/ywjTsm3jQ3aIxE5GiQkL/zFCOL8YJfbObARq4eBgE1CVuNZQBWKK
	CFRKzF3mDFLCLNDLKNF/Zy0LyCBhgUCJpsknwYayAJWfOPeNHcTmFbCWaLl4jRlimbzExTXP
	2UBsTgEbiRNtM5khagQlTs58AjaHGaimeetssEslBL6yS6y6PZMVotlFonfZdKhBwhKvjm9h
	h7ClJD6/28sGYedLrH94F8qukLh76D8LhG0vsejMT3aQB5gFNCXW79IHMSUElCWO3IJayyfR
	cfgvO0SYV6KjTQiiUUmi4/wcJghbQmLVi8lQwz0ktsztY4OEVD+jxJw/s1gmMCrMQvLNLCTf
	zEJYvICReRWjWGpBcW56arJRgSE8gpPzczcxgtOnlvMOxivz/+kdYmTiYDzEKMHBrCTCe0go
	M12INyWxsiq1KD++qDQntfgQoykwrCcyS4km5wMTeF5JvKGJpYGJmZmhuZGpgbmSOO+91rkp
	QgLpiSWp2ampBalFMH1MHJxSDUzi0y1ufHi64kRp9+RJ647kTpON47fZyuU+pa21tcz+3TQd
	ofwDUw89YG5oe1Hf/ueS2Qbea9XRNxRmxr4P2/Q+pfBrTP+HtkyG2AwTTxehv1en/r030Shd
	l++0sc23ssTYY6vd9BZ+Nv3e8rb+lXFGzJSX2wXN3yxUDzNT9qnX8A5wUvz0KzZhRTr7y52r
	7Lh9T153KqwKU+ANEJ+5XpThlGdzwsWM352S/Cv7/n44WyA/k4H1UhenVeTpDZypbu33Hm/y
	Clm/Wyw+3HiiyuLtifMOGSRXTf8VaO/19DR3W86OxPXp++/NOzzf1ez6jJ3R2fOs57TWn1Sx
	dfos9231nWqVy50GcYuL+DdMfKXEUpyRaKjFXFScCAB2el4iKAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrLLMWRmVeSWpSXmKPExsWy7bCSvG7hyZx0gwe/RC0ezNvGZrFm7zkm
	i/lHzrFaHG39z2zxctY9Novz5zewW1zeNYfNYsb5fUwW//fsYLf4/fMQk8XOOyeYHbg9Nq3q
	ZPPo27KK0ePzJrkA5igum5TUnMyy1CJ9uwSujL5965kLzvtW9C+4xNbAeMK5i5GTQ0LARGLb
	xofsXYxcHEIC2xkl5k6fzQ6RkJD49mYPE4QtLHG/5QgrRNEPRonHu34wdjFycLAJqEpca6gC
	iYsINDJKPP8wmRnEYRaYyChxft4RdpAiYQF/iV8T40EGsQDVnzj3DWwBr4C1RMvFa8wQC+Ql
	Lq55zgZicwrYSJxomwkWFwKq+fR9OVS9oMTJmU9YQGxmoPrmrbOZJzAKzEKSmoUktYCRaRWj
	aGpBcW56bnKBoV5xYm5xaV66XnJ+7iZGcIhrBe1gXLb+r94hRiYOxkOMEhzMSiK8h4Qy04V4
	UxIrq1KL8uOLSnNSiw8xSnOwKInzKud0pggJpCeWpGanphakFsFkmTg4pRqY5P4duTrdpKfJ
	Z8PCE3cvb9b99akt6/VVI1Z5a47D0wxmmW9WnPvT89mkJt282mXnvHp55BmLvUrOHo1X3eC7
	P43hVP+CC84ztzztXfGegWv9k6MMCt4Ke02fOGXy+rpV2glo/Mr0i2GzuZaVfzL4wCPD2S3c
	/L9v7ry1a41k/RSjI6+0XzWHfN+1oMSD98Vlo9PTjgUtvcgZmz/9y9FzVjyza1fc3vdBbWrE
	dJdNxwI6j03YKnK01G/agvSrBc8kdCZbXHGTOaZx//SyKY/UFgra3JzMHnitoePLm8//ONpO
	aqfqVuutXZorc25h1dIG8WOaquWz7JmUHzn0tWkpO+dm9c4vYtC+qGR80i3cQImlOCPRUIu5
	qDgRAKWIivHgAgAA
X-CMS-MailID: 20241226031145epcas2p218657a4f56f105eb7649e580b199a338
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241226031145epcas2p218657a4f56f105eb7649e580b199a338
References: <20241226031142.1764652-1-sowon.na@samsung.com>
	<CGME20241226031145epcas2p218657a4f56f105eb7649e580b199a338@epcas2p2.samsung.com>

Add support for ExynosAutov920 ufs phy driver.

Signed-off-by: Sowon Na <sowon.na@samsung.com>
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
---
 drivers/phy/samsung/Makefile                 |   1 +
 drivers/phy/samsung/phy-exynosautov920-ufs.c | 168 +++++++++++++++++++
 drivers/phy/samsung/phy-samsung-ufs.c        |   9 +-
 drivers/phy/samsung/phy-samsung-ufs.h        |   4 +
 4 files changed, 179 insertions(+), 3 deletions(-)
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
index 000000000000..21ef79c42f95
--- /dev/null
+++ b/drivers/phy/samsung/phy-exynosautov920-ufs.c
@@ -0,0 +1,168 @@
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
+#define EXYNOSAUTOV920_CDR_LOCK_OFFSET				0xce4
+
+#define PHY_EXYNOSAUTOV920_LANE_OFFSET				0x200
+#define PHY_TRSV_REG_CFG_AUTOV920(o, v, d) \
+	PHY_TRSV_REG_CFG_OFFSET(o, v, d, PHY_EXYNOSAUTOV920_LANE_OFFSET)
+
+/* Calibration for phy initialization */
+static const struct samsung_ufs_phy_cfg exynosautov920_pre_init_cfg[] = {
+	PHY_COMN_REG_CFG(0x29, 0x22, PWR_MODE_ANY),
+	PHY_COMN_REG_CFG(0x43, 0x10, PWR_MODE_ANY),
+	PHY_COMN_REG_CFG(0x3c, 0x14, PWR_MODE_ANY),
+	PHY_COMN_REG_CFG(0x46, 0x48, PWR_MODE_ANY),
+	PHY_COMN_REG_CFG(0x04, 0x95, PWR_MODE_ANY),
+	PHY_COMN_REG_CFG(0x06, 0x30, PWR_MODE_ANY),
+
+	PHY_TRSV_REG_CFG_AUTOV920(0x200, 0x00, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x201, 0x06, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x202, 0x06, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x203, 0x0a, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x204, 0x00, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x205, 0x10, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x207, 0x0c, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x2e1, 0xc0, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x22d, 0xf8, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x234, 0x60, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x238, 0x13, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x239, 0x48, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x23a, 0x01, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x23b, 0x29, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x23c, 0x2a, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x23d, 0x01, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x23e, 0x14, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x23f, 0x13, PWR_MODE_ANY),
+
+	PHY_TRSV_REG_CFG_AUTOV920(0x240, 0x4a, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x243, 0x40, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x244, 0x02, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x25d, 0x00, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x25e, 0x3f, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x25f, 0xff, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x26f, 0xf0, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x273, 0x33, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x274, 0x50, PWR_MODE_ANY),
+
+	PHY_TRSV_REG_CFG_AUTOV920(0x284, 0x02, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x285, 0x02, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x2a2, 0x04, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x27d, 0x01, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x2fa, 0x01, PWR_MODE_ANY),
+
+	PHY_TRSV_REG_CFG_AUTOV920(0x286, 0x03, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x287, 0x03, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x288, 0x03, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x289, 0x03, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x2b3, 0x04, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x2b6, 0x0b, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x2b7, 0x0b, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x2b8, 0x0b, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x2b9, 0x0b, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x2ba, 0x0b, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x2bb, 0x06, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x2bc, 0x06, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x2bd, 0x06, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x2be, 0x06, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x34b, 0x01, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x34c, 0x24, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x34d, 0x23, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x34e, 0x45, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x34f, 0x00, PWR_MODE_ANY),
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
+
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

