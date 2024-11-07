Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1D31885BD
	for <linux-samsung-soc@vger.kernel.org>; Thu,  7 Nov 2024 04:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730952924; cv=none; b=QdjunCjmFP8Xg7KPRnb2hEP7ic4pDGhrxkJSGUaNAxpRrQOVAMCcAJDA9aABfHpyNeCRcQSDWfB8z7Fz+00cBQNmBtEces3TuovrBZ9KKKI7WWWHJL6/iF4wLSmvzPZ/1YjZOjvw0XzWro9L6XEXllkB93O0fGWIgGm8Sz2bJIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730952924; c=relaxed/simple;
	bh=vWbFUe177jkfU5l/h0UFI4DxbjqeBX/fOaYHqrulW+A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=ueSMc86uyiMP/SSHz8UJHWEK7mD08rSwgJIXYM2zHJEgtdcdbzHs2lxZJRSgutwZG/zuUQqcyCZf16MIKkL5qnrHkBuAawWldDRXduyP3JWLa6MIkbwcAW7oTvAFZuOljshrevXdBVdap7c6FS3GCyZIwdc3MGooEBwFqosLQqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=rdiUHNkb; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="rdiUHNkb"
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20241107041512epoutp04c045919e50ab49720696bb3e88716ce9~FlIDRndfz0373103731epoutp043
	for <linux-samsung-soc@vger.kernel.org>; Thu,  7 Nov 2024 04:15:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20241107041512epoutp04c045919e50ab49720696bb3e88716ce9~FlIDRndfz0373103731epoutp043
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1730952912;
	bh=1oa+mg4rWDdlxtBgxHgKjyjAd/+DrCx/eMNRFN6eYC4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rdiUHNkbxF3FX1nhkY1PW0JOQctz1wRlH8N9c2jSJo4TnG9AShFCwBBnY66IG2Xrf
	 ZAaRptsg3bczpxeaiSqT6lFNsNZtTDxWLKseR+4TOnrfMRl8LQw9wT7WkfDZ+VvBwm
	 Pmu9jz6szpFgt+lr3p5blpaJuW/nZsvnUKY08S1Y=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTP id
	20241107041512epcas2p4da9ca00d3e5e4a14737d0315284f781f~FlIC3uPtV2906429064epcas2p4z;
	Thu,  7 Nov 2024 04:15:12 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.97]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4XkTHz3chWz4x9QG; Thu,  7 Nov
	2024 04:15:11 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
	epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	08.4C.14040.FCE3C276; Thu,  7 Nov 2024 13:15:11 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20241107041511epcas2p295c24724f736363ef8a765a165979bca~FlIBtLRGM0976909769epcas2p2j;
	Thu,  7 Nov 2024 04:15:11 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20241107041511epsmtrp11e36caff710f03688fc89db8dc379020~FlIBsW8nh2445424454epsmtrp1Z;
	Thu,  7 Nov 2024 04:15:11 +0000 (GMT)
X-AuditID: b6c32a45-c7fff700000136d8-59-672c3ecfdd4d
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	14.C1.08227.ECE3C276; Thu,  7 Nov 2024 13:15:10 +0900 (KST)
Received: from asswp146.dsn.sec.samsung.com (unknown [10.229.19.146]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20241107041510epsmtip2cc5f27badafcebf0339bc7d822473327~FlIBeqf5a1197911979epsmtip2R;
	Thu,  7 Nov 2024 04:15:10 +0000 (GMT)
From: Sowon Na <sowon.na@samsung.com>
To: robh@kernel.org, krzk@kernel.org, conor+dt@kernel.org, vkoul@kernel.org,
	alim.akhtar@samsung.com, kishon@kernel.org
Cc: krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	sowon.na@samsung.com
Subject: [PATCH 2/3] phy: samsung-ufs: support exynosauto ufs phy driver
Date: Thu,  7 Nov 2024 13:15:04 +0900
Message-ID: <20241107041509.824457-4-sowon.na@samsung.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241107041509.824457-1-sowon.na@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprMJsWRmVeSWpSXmKPExsWy7bCmue55O510g0v3JSwezNvGZrFm7zkm
	i/lHzrFaHG39z2zxctY9Novz5zewW1zeNYfNYsb5fUwW//fsYLf4/fMQk8XOOyeYHbg9Nq3q
	ZPPo27KK0ePzJrkA5qhsm4zUxJTUIoXUvOT8lMy8dFsl7+B453hTMwNDXUNLC3MlhbzE3FRb
	JRefAF23zBygg5QUyhJzSoFCAYnFxUr6djZF+aUlqQoZ+cUltkqpBSk5BeYFesWJucWleel6
	eaklVoYGBkamQIUJ2RlX+q4wFpzyqri++CNLA+NPhy5GDg4JAROJa6ujuxi5OIQEdjBKbPve
	zQjhfGKUeHnqMCuE841RoqdlMksXIydEx8/ZTCC2kMBeRonZ3XEQRb8YJaY8vMMEMpZNQFXi
	WkMViCkiUCkxd5kzSAmzQC+jRP+dtWBzhAU8JC5f/M4OYrMAlZ/d3coGYvMKWEncedrJDrFL
	XuLimudgcU4Ba4lZ156yQ9QISpyc+QRsDjNQTfPW2cwgCyQEfrJLzOrdDXWoi8SEhq2MELaw
	xKvjW6CGSkm87G+DsvMl1j+8ywZhV0jcPfQfqtdeYtGZn+wgDzALaEqs36UPCS1liSO3oNby
	SXQc/ssOEeaV6GgTgmhUkug4P4cJwpaQWPViMtRwD4mDE+4yQ0Kqj1FiXe8ylgmMCrOQfDML
	yTezEBYvYGRexSiWWlCcm55abFRgCI/e5PzcTYzg1KnluoNx8tsPeocYmTgYDzFKcDArifD6
	R2mnC/GmJFZWpRblxxeV5qQWH2I0BYb1RGYp0eR8YPLOK4k3NLE0MDEzMzQ3MjUwVxLnvdc6
	N0VIID2xJDU7NbUgtQimj4mDU6qBSVLIc86WW3v+sEk8/zF336JpAV7fPP60vLrQOdPsV8wx
	ufUPzNR+ZsnNTFC5VfHQbPp+nUrF1+nTbSZPn75OJH1x8vpPiecP73JaN0fnk8fzU/LtaxKW
	b+kviuzmLaw467hzvtLdQzNfuWx5qO1775uxwMSC0r3plR2rpTc6mPNzT1d1YpGfqyJlq1fg
	eDay5/Uxb5W1a9O+Ljxl0ZKxQqUzXb5r/nvNXbJ/ih/Nqsl48/qYvxbv7LjveT7a511ecQe0
	Hz//4YLP/UzfKa43sh/qrFpiEby/cLKbyP/akIgvEaG82TMW3mX8vJd75qXFrz74u+/b/lOm
	TtxK2Tp2rUvHkQfXuef6X3I6F7aLf6ISS3FGoqEWc1FxIgCjn1LdJgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrELMWRmVeSWpSXmKPExsWy7bCSvO45O510g74H1hYP5m1js1iz9xyT
	xfwj51gtjrb+Z7Z4Oesem8X58xvYLS7vmsNmMeP8PiaL/3t2sFv8/nmIyWLnnRPMDtwem1Z1
	snn0bVnF6PF5k1wAcxSXTUpqTmZZapG+XQJXxpW+K4wFp7wqri/+yNLA+NOhi5GTQ0LAROLa
	z9lMXYxcHEICuxkl9t14ygSRkJD49mYPlC0scb/lCCtE0Q9GiYYfs4EcDg42AVWJaw1VIHER
	gUZGiecfJjODOMwCExklzs87wg7SLSzgIXH54ncwmwWo4ezuVjYQm1fASuLO0052iA3yEhfX
	PAeLcwpYS8y69hQsLgRU83TrQnaIekGJkzOfsIDYzED1zVtnM09gFJiFJDULSWoBI9MqRsnU
	guLc9NxiwwKjvNRyveLE3OLSvHS95PzcTYzgYNfS2sG4Z9UHvUOMTByMhxglOJiVRHj9o7TT
	hXhTEiurUovy44tKc1KLDzFKc7AoifN+e92bIiSQnliSmp2aWpBaBJNl4uCUamDqnqX9yy7i
	2Ubb2qrmX603m7e11f5rd3s/caLKLeYtRxlFVlYsfDxJKjYxOiKiIq61ZOFTgwmPVFv4Pi46
	vl56ZujC7HRXmYiqT7dkqnZOkqk5ZrI9inu/vo+D2HEtvyN6B04+2LYnWap50uOcSz9mM301
	j4lvSGrb8/phKZu7k2OC9v2Qouq1n67HV6z4/fod3+/IitRtPXe546MKn1tafFT3q5hkne5f
	s+ZUjq32JatXiasELzUc+XbPo77bgP2ECLfI6pez9DZt65v++tl/3v8FJde15qtkzxETmz9n
	t35+nN+0Luf1CTuv202rOfLVJkj1xqodc/OMb1548ls/amPtC7WtG0wmPwzXLU9WYinOSDTU
	Yi4qTgQAYzBxY+UCAAA=
X-CMS-MailID: 20241107041511epcas2p295c24724f736363ef8a765a165979bca
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241107041511epcas2p295c24724f736363ef8a765a165979bca
References: <20241107041509.824457-1-sowon.na@samsung.com>
	<CGME20241107041511epcas2p295c24724f736363ef8a765a165979bca@epcas2p2.samsung.com>

Support phy-exynosautov920-ufs driver for ExynosAutov920 series SoCs,
using "samsung,exynosautov920-ufs-phy" compatible.

Signed-off-by: Sowon Na <sowon.na@samsung.com>
---
 drivers/phy/samsung/Makefile                 |   1 +
 drivers/phy/samsung/phy-exynosautov920-ufs.c | 159 +++++++++++++++++++
 drivers/phy/samsung/phy-samsung-ufs.c        |   9 +-
 drivers/phy/samsung/phy-samsung-ufs.h        |   4 +
 4 files changed, 170 insertions(+), 3 deletions(-)
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
index 000000000000..8f4a94e13781
--- /dev/null
+++ b/drivers/phy/samsung/phy-exynosautov920-ufs.c
@@ -0,0 +1,159 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * UFS PHY driver data for Samsung EXYNOSAUTO v920 SoC
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
+#define PHY_TRSV_REG_CFG_AUTOV920(o, v, d) \
+	PHY_TRSV_REG_CFG_OFFSET(o, v, d, 0x200)
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
+#define MASK		0x8
+int samsung_ufs_phy_wait_cdr_lock(struct phy *phy, u8 lane)
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
+		reg = readl(ufs_phy->reg_pma + 0xCE4 + (0x800 * lane));
+		if ((reg & MASK) == MASK)
+			break;
+
+		udelay(DELAY_IN_US);
+
+		samsung_ufs_phy_config(ufs_phy, &cfg[0], lane);
+		samsung_ufs_phy_config(ufs_phy, &cfg[1], lane);
+	}
+
+	samsung_ufs_phy_config(ufs_phy, &cfg[2], lane);
+
+	return 0;
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
+	.wait_for_cdr = samsung_ufs_phy_wait_cdr_lock,
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
index 9b7deef6e10f..b7a8ec6bcafa 100644
--- a/drivers/phy/samsung/phy-samsung-ufs.h
+++ b/drivers/phy/samsung/phy-samsung-ufs.h
@@ -143,9 +143,13 @@ static inline void samsung_ufs_phy_ctrl_isol(
 }
 
 int samsung_ufs_phy_wait_for_lock_acq(struct phy *phy, u8 lane);
+int samsung_ufs_phy_wait_cdr_lock(struct phy *phy, u8 lane);
+void samsung_ufs_phy_config(struct samsung_ufs_phy *phy,
+			    const struct samsung_ufs_phy_cfg *cfg, u8 lane);
 
 extern const struct samsung_ufs_phy_drvdata exynos7_ufs_phy;
 extern const struct samsung_ufs_phy_drvdata exynosautov9_ufs_phy;
+extern const struct samsung_ufs_phy_drvdata exynosautov920_ufs_phy;
 extern const struct samsung_ufs_phy_drvdata fsd_ufs_phy;
 extern const struct samsung_ufs_phy_drvdata tensor_gs101_ufs_phy;
 
-- 
2.45.2

