Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA351531F0
	for <linux-samsung-soc@vger.kernel.org>; Mon, 11 Nov 2024 04:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731299603; cv=none; b=ltTB9WX1kiLY8l0n/CMS90cfFhN+HO2xrnUzLYsDbZFCfXzhFQnvGEfUflvpOQ19VSFDifrSLj1jkkWgG0brhuNQfn0nIGmrwzOUACk0UdFTJ2lbZ0o70M6bNI3fRoRHiBadH2xFvW0SfXCYKlJBZ9g4I8By4h74eaCviH0+gWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731299603; c=relaxed/simple;
	bh=vn8E1TQaqhsbhLJBhBGlv+TheJqOc3cyRxq+aC9yjnc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=Vd30lnBc4S6ULWa3pdq6t7LyR6DSdz/krPW7kXXGm2hOI4qbQZDRQ4cTPwZE14QUPaD43I64FjEpBupPx95FLQuh2ljLSBTCq6PEOeLPaTxqVciHdLTwLQFDqTjOovpCe0gqSyt9KftZNNqsU4bPVMb/p/d4M1t5Jk6iUsNOwgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=fpBi3Kzz; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="fpBi3Kzz"
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20241111043319epoutp021107b039a4608d776680e390ed6beef2~Gz9AlH-5u2788227882epoutp02v
	for <linux-samsung-soc@vger.kernel.org>; Mon, 11 Nov 2024 04:33:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20241111043319epoutp021107b039a4608d776680e390ed6beef2~Gz9AlH-5u2788227882epoutp02v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1731299599;
	bh=igRWfuNqTfPwHBFKj4np22Spt+NI8v7GAGapPljbOy4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fpBi3KzzSGB4H+8sgJLtNq/fokB8b5h8EHsWBoUqASYhaml50ESsJSdp+4nl0SSXN
	 12PxIk/P8I41u6wfrSUTybflNUii51WDhHbVdVZO5ZNWj0dv0PiveH616+hl+3L/YQ
	 /aV+OwxGA+F2O+3DgzOW2xRrg499ryrl1OFWPsCc=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTP id
	20241111043319epcas2p344f636105068c5ee001d822d83c81d07~Gz9AFUP9W1539115391epcas2p3e;
	Mon, 11 Nov 2024 04:33:19 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.97]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4XmxW21nV8z4x9Pw; Mon, 11 Nov
	2024 04:33:18 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
	epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	96.48.14040.E0981376; Mon, 11 Nov 2024 13:33:18 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20241111043317epcas2p1fbabc25054bd345de15565982325c400~Gz8_3H4hb2764327643epcas2p1P;
	Mon, 11 Nov 2024 04:33:17 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20241111043317epsmtrp1df67b7d57304f1a2d3291d069e18e6ae~Gz8_1YsnU2474224742epsmtrp10;
	Mon, 11 Nov 2024 04:33:17 +0000 (GMT)
X-AuditID: b6c32a45-ee3fa700000136d8-76-6731890e7bc7
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	43.E5.18937.D0981376; Mon, 11 Nov 2024 13:33:17 +0900 (KST)
Received: from asswp146.dsn.sec.samsung.com (unknown [10.229.19.146]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20241111043317epsmtip1978158f323632d0027a6fa86c6dcbf1c~Gz8_nBnNv3087930879epsmtip1V;
	Mon, 11 Nov 2024 04:33:17 +0000 (GMT)
From: Sowon Na <sowon.na@samsung.com>
To: robh@kernel.org, krzk@kernel.org, conor+dt@kernel.org, vkoul@kernel.org,
	alim.akhtar@samsung.com, kishon@kernel.org
Cc: krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	sowon.na@samsung.com
Subject: [PATCH v2 2/3] phy: samsung-ufs: support ExynosAutov920 ufs phy
 driver
Date: Mon, 11 Nov 2024 13:33:01 +0900
Message-ID: <20241111043306.1250488-3-sowon.na@samsung.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241111043306.1250488-1-sowon.na@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprMJsWRmVeSWpSXmKPExsWy7bCmmS5fp2G6wcF+DosH87axWazZe47J
	Yv6Rc6wWR1v/M1u8nHWPzeL8+Q3sFpd3zWGzmHF+H5PF/z072C1+/zzEZLHzzglmB26PTas6
	2Tz6tqxi9Pi8SS6AOSrbJiM1MSW1SCE1Lzk/JTMv3VbJOzjeOd7UzMBQ19DSwlxJIS8xN9VW
	ycUnQNctMwfoICWFssScUqBQQGJxsZK+nU1RfmlJqkJGfnGJrVJqQUpOgXmBXnFibnFpXrpe
	XmqJlaGBgZEpUGFCdsapjpPMBYd9Kx59XcjSwLjbuYuRk0NCwETi3bfjrF2MXBxCAjsYJT4v
	mMkC4XxilFjYvpMdpArMWb25DKZj+ZnVzBBFOxklzv/thur4xSgx+/oXti5GDg42AVWJaw1V
	IKaIQKXE3GXOICXMAr2MEv131rKADBIWCJQ48P8qE0gNC1D50Y86IGFeAWuJrdsXs0Dskpe4
	uOY5G4jNKWAj8fF6LzNEjaDEyZlPwGqYgWqat84Gu0dC4CO7xJaVh5ggml0ktp+ewwphC0u8
	Or6FHcKWknjZ3wZl50usf3iXDcKukLh76D/UYnuJRWd+soPcxiygKbF+lz6IKSGgLHHkFtRa
	PomOw3/ZIcK8Eh1tQhCNShId5+dAHSAhserFZKjhHhInP51jhwRUP6PEmZvLWSYwKsxC8s0s
	JN/MQli8gJF5FaNYakFxbnpqsVGBITx6k/NzNzGCU6eW6w7GyW8/6B1iZOJgPMQowcGsJMKr
	4a+fLsSbklhZlVqUH19UmpNafIjRFBjUE5mlRJPzgck7ryTe0MTSwMTMzNDcyNTAXEmc917r
	3BQhgfTEktTs1NSC1CKYPiYOTqkGpr6jIdK+Z94bxe/RXzL7V+e2rfN9GRVKuCcxcZ01YXy+
	5FWudM4Rw0uSrzZ5pLsHHbun9ulR8EmzjuP3AmW3Lz1xM7Cvz+X417V1VjeeXsy4tiHPt0c8
	8uRRQzXe9wmPZN7+NZm9UtwiPqJne6KaiHXCbP7FqrKRMR3NtuoWjCkH31gvZDeZeGTvuVXf
	j+jyHmOt+lOu+urh7wVxv7u/XNA/GX3l/J68S56v2PRn//5v9jh/ssPCaV3ZB29Ovp+nWXm9
	XL1u+Zq4AzaefdKTfXasTXnK4mGmdZN5gYfsNdZI3dc7eQ58/BfTk/3l2y11Hr61zuoMsuGq
	TXLC3x56qsWFLPxibaLPdPTgNRadO0osxRmJhlrMRcWJAEJQo4omBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDLMWRmVeSWpSXmKPExsWy7bCSnC5vp2G6wdtTGhYP5m1js1iz9xyT
	xfwj51gtjrb+Z7Z4Oesem8X58xvYLS7vmsNmMeP8PiaL/3t2sFv8/nmIyWLnnRPMDtwem1Z1
	snn0bVnF6PF5k1wAcxSXTUpqTmZZapG+XQJXxqmOk8wFh30rHn1dyNLAuNu5i5GTQ0LARGL5
	mdXMILaQwHZGiTUzWCHiEhLf3uxhgrCFJe63HAGKcwHV/GCUmPzjGnsXIwcHm4CqxLWGKpC4
	iEAjo8TzD5OZQRxmgYmMEufnHWEH6RYW8JfobJgH1sAC1HD0ow5ImFfAWmLr9sUsEAvkJS6u
	ec4GYnMK2Eh8vN4LdZC1xOn7t5gh6gUlTs58AlbPDFTfvHU28wRGgVlIUrOQpBYwMq1iFE0t
	KM5Nz00uMNQrTswtLs1L10vOz93ECA5wraAdjMvW/9U7xMjEwXiIUYKDWUmEV8NfP12INyWx
	siq1KD++qDQntfgQozQHi5I4r3JOZ4qQQHpiSWp2ampBahFMlomDU6qBaa0iU1jDLLmTAh3b
	rj1iYA9x9b2Y6XvmcWMxx8q/Vaeqb/+sYl6xqNfn0/ODqjLxk8u/7D3fEn1JWuiGsUDE9ab7
	CR43RTbUH+Q2tnFQLD93TqfnwCWLnPrw0NJbf5PC2ma8+GstaLV9T9YfXZ/ot50Nb+WC+4Vl
	FLrsCpbnL54k2FExPT6kbB3H9ZowfrtjkSH6einzUjboqHycdeF7bOLMF5/vl9TPn/VBZd0C
	n+p1UVNbQ/bt/7cmTSecrd/6EDPj29PeJ7I3btm/+pmKdGXlU7MHK+cGnBdedHIqr+xaYwGe
	OMlds4Un/eoNv2v+PbTh/22pF2zPNpv9Zbbast5y8VlW7x8BFS7713DNVWIpzkg01GIuKk4E
	AKI5sHTfAgAA
X-CMS-MailID: 20241111043317epcas2p1fbabc25054bd345de15565982325c400
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241111043317epcas2p1fbabc25054bd345de15565982325c400
References: <20241111043306.1250488-1-sowon.na@samsung.com>
	<CGME20241111043317epcas2p1fbabc25054bd345de15565982325c400@epcas2p1.samsung.com>

Add support for ExynosAutov920 ufs phy driver.

Signed-off-by: Sowon Na <sowon.na@samsung.com>
---
 drivers/phy/samsung/Makefile                 |   1 +
 drivers/phy/samsung/phy-exynosautov920-ufs.c | 170 +++++++++++++++++++
 drivers/phy/samsung/phy-samsung-ufs.c        |   9 +-
 drivers/phy/samsung/phy-samsung-ufs.h        |   4 +
 4 files changed, 181 insertions(+), 3 deletions(-)
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
index 000000000000..f00f82132921
--- /dev/null
+++ b/drivers/phy/samsung/phy-exynosautov920-ufs.c
@@ -0,0 +1,170 @@
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
+int samsung_exynosautov920_ufs_phy_wait_cdr_lock(struct phy *phy, u8 lane)
+{
+	struct samsung_ufs_phy *ufs_phy = get_samsung_ufs_phy(phy);
+	int ret = 0;
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
+		if ((reg & EXYNOSAUTOV920_CDR_LOCK_MASK)
+					== EXYNOSAUTOV920_CDR_LOCK_MASK)
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
+	if (i >= RETRY_CNT) {
+		dev_err(ufs_phy->dev, "failed to get phy cdr lock\n");
+		ret = -ETIMEDOUT;
+	}
+
+	return ret;
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
+	.wait_for_cdr = samsung_exynosautov920_ufs_phy_wait_cdr_lock,
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
index 9b7deef6e10f..7f759141ee87 100644
--- a/drivers/phy/samsung/phy-samsung-ufs.h
+++ b/drivers/phy/samsung/phy-samsung-ufs.h
@@ -143,9 +143,13 @@ static inline void samsung_ufs_phy_ctrl_isol(
 }
 
 int samsung_ufs_phy_wait_for_lock_acq(struct phy *phy, u8 lane);
+int samsung_exynosautov920_ufs_phy_wait_cdr_lock(struct phy *phy, u8 lane);
+void samsung_ufs_phy_config(struct samsung_ufs_phy *phy,
+			    const struct samsung_ufs_phy_cfg *cfg, u8 lane);
 
 extern const struct samsung_ufs_phy_drvdata exynos7_ufs_phy;
 extern const struct samsung_ufs_phy_drvdata exynosautov9_ufs_phy;
+extern const struct samsung_ufs_phy_drvdata exynosautov920_ufs_phy;
 extern const struct samsung_ufs_phy_drvdata fsd_ufs_phy;
 extern const struct samsung_ufs_phy_drvdata tensor_gs101_ufs_phy;
 
-- 
2.45.2

