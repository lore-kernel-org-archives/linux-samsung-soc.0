Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1975189BA6
	for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Aug 2024 07:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724139928; cv=none; b=usjSq7gF+f3RzEd1iHNuuHrqEOQQk0MmNpJTb5GaXCsJ8zur7Qgk5PxJIkkTJ8v1SZqRMtcM868UxzlRd8qFjkHcpU/WFY874Pw4sJIm14a68233Z0sMJhjQ7Ty1rDVO3GoqKyBWCQrsgb5Zjxg1CeDyJGH5wuuklPY9CsmqSlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724139928; c=relaxed/simple;
	bh=1qw/Y/pJGdYJoP89EMr+s+Nx81kw46PPYysCfN3TZ6I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=t7wry0/xw2z/HPbJN15d0mUSs0BrNLU6ewluf5pI1fFBTE2bNKai9XemkkEoPQoC6vGauYgi9Z4XIfSZDXuzqvyI1tCDMpC9As41pHUuUDudsDCbFOyfbOpEu+I0ZFii90ZgpZ8fWcf+b4W0wAr/niarMNbXu2osClnb+aq+ack=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=fZDqTXF5; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="fZDqTXF5"
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20240820074522epoutp0172445888f60678e28c2ce8c5754ae83e~tYB-MVtBj1450814508epoutp010
	for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Aug 2024 07:45:22 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20240820074522epoutp0172445888f60678e28c2ce8c5754ae83e~tYB-MVtBj1450814508epoutp010
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1724139922;
	bh=c2cdGWtvoVG6tluq6LVhS7EhYRtZCWoSzpLlaZux+ec=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fZDqTXF5tzekyhuJS4UnAtpevsJZG7JlUS1Mn5vYUMa+SBqrieZLTOnCvM5qkqcB6
	 YHVRHpApJFyscyB4tr6yMvrmN31BcwwwvTE9HlcfwYdAwmLgbVDZnLHQet8kpdprRL
	 QVqznTzNUYDjHpCpzmriWUfZrkkKtDnFtX1al1AA=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTP id
	20240820074521epcas2p18ddc83dbb5a63229ae936f1ceb9b0cfe~tYB_tWfZa2005420054epcas2p1W;
	Tue, 20 Aug 2024 07:45:21 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.89]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4Wp1hw6b05z4x9QH; Tue, 20 Aug
	2024 07:45:20 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
	epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
	80.49.10012.09944C66; Tue, 20 Aug 2024 16:45:20 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20240820074520epcas2p13a30723354e1de941e58401dd5fde1e0~tYB9hvr6T2005420054epcas2p1O;
	Tue, 20 Aug 2024 07:45:20 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20240820074520epsmtrp148a3d6431e065a25f76cef5e982cf891~tYB9g0TS90720407204epsmtrp1B;
	Tue, 20 Aug 2024 07:45:20 +0000 (GMT)
X-AuditID: b6c32a47-ea1fa7000000271c-6b-66c449901d7d
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	BD.45.19367.09944C66; Tue, 20 Aug 2024 16:45:20 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.60]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20240820074519epsmtip29593e812c1304fd8608be58c7550bd31~tYB9RRrVu2524825248epsmtip2M;
	Tue, 20 Aug 2024 07:45:19 +0000 (GMT)
From: Sunyeal Hong <sunyeal.hong@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar
	<alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Sunyeal Hong <sunyeal.hong@samsung.com>
Subject: [PATCH v7 5/5] clk: samsung: add top clock support for ExynosAuto
 v920 SoC
Date: Tue, 20 Aug 2024 16:45:14 +0900
Message-ID: <20240820074514.3123767-6-sunyeal.hong@samsung.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240820074514.3123767-1-sunyeal.hong@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPJsWRmVeSWpSXmKPExsWy7bCmme4EzyNpBj+PaVg8mLeNzWLN3nNM
	Fte/PGe1mH/kHKvF+fMb2C02Pb7GavGx5x6rxeVdc9gsZpzfx2Rx8ZSrxf89O9gtDr9pZ7X4
	d20ji0XTsvVMDnwe72+0sntsWtXJ5rF5Sb1H35ZVjB6fN8kFsEZl22SkJqakFimk5iXnp2Tm
	pdsqeQfHO8ebmhkY6hpaWpgrKeQl5qbaKrn4BOi6ZeYA3amkUJaYUwoUCkgsLlbSt7Mpyi8t
	SVXIyC8usVVKLUjJKTAv0CtOzC0uzUvXy0stsTI0MDAyBSpMyM7Y8eI7S8GGTuaK9i23GRsY
	11xn6mLk5JAQMJF4ev8LO4gtJLCDUaJhWkUXIxeQ/YlRYt3SA4xwzu3VW5lhOlb9f8wGkdjJ
	KHGw9xczhPORUeLC3q9ADgcHm4CuxJ9/DiBxEYE9TBJbzi9hAnGYBc4yStydswBsobBAqMTR
	8/fBDmERUJX4c/IBI0gzr4C9RP/kUoht8hIX1zxnA7E5BRwkZnQeYQWxeQUEJU7OfMICYjMD
	1TRvnQ12hITAQg6JZ18boJ5zkfi99gIbhC0s8er4FnYIW0riZX8blJ0vMfn6WyaI5gZGiWv/
	uqH+tJdYdOYnO8hBzAKaEut36YOYEgLKEkduQe3lk+g4/JcdIswr0dEmBNGoJvHpymWoITIS
	x048g7I9JB5v2AENq8mMEpt+tzFPYFSYheSdWUjemYWweAEj8ypGsdSC4tz01GKjAmN4HCfn
	525iBKdcLfcdjDPeftA7xMjEwXiIUYKDWUmEt/vlwTQh3pTEyqrUovz4otKc1OJDjKbAsJ7I
	LCWanA9M+nkl8YYmlgYmZmaG5kamBuZK4rz3WuemCAmkJ5akZqemFqQWwfQxcXBKNTCt7VG3
	uDT7+uXTO89GT5bdGay13E18yruP1ubx672NGU3/TBGNO1EreavbkGNH9eEFGzMKJs4+Unhe
	l+nnpWU2KrYBH6xf2ASpBNxPDGR+9dy892+Byd4tCp/Pd/x3lnyf9WmmoOjPQxmdc75se/Jz
	bTPf/9NRJ5Vyz8Vb86xyPdfmmmfe3bpWaLqqiYZr8TmDyvs6feLGPnqnpx79t3td5kFr5tt8
	UpsOzV0a8OSdZ9GquMwjZ3hFi5YyhwbuvunfazPr2uvNE45L1anf/Pw8fd2WOb2MQTNOfms+
	U5soMsHWJtTyH/PXtWx9nw7ELLSQeVbUsPvtlsJJc7rK5Yt3i214oBUbM+8ds+H80MUGSizF
	GYmGWsxFxYkADLaHRkIEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrCLMWRmVeSWpSXmKPExsWy7bCSvO4EzyNpBpMnc1g8mLeNzWLN3nNM
	Fte/PGe1mH/kHKvF+fMb2C02Pb7GavGx5x6rxeVdc9gsZpzfx2Rx8ZSrxf89O9gtDr9pZ7X4
	d20ji0XTsvVMDnwe72+0sntsWtXJ5rF5Sb1H35ZVjB6fN8kFsEZx2aSk5mSWpRbp2yVwZex4
	8Z2lYEMnc0X7ltuMDYxrrjN1MXJySAiYSKz6/5iti5GLQ0hgO6PEpqsnWCASMhIbG/6zQ9jC
	EvdbjrCC2EIC7xkl3kwT6GLk4GAT0JX4888BpFdE4BCTxMTPT1lAHGaBy4wSx+5OZgZpEBYI
	lth7aQIjiM0ioCrx5+QDRpBmXgF7if7JpRDz5SUurnnOBmJzCjhIzOgE2cUBtMte4vFSY5Aw
	r4CgxMmZT8BOYwYqb946m3kCo8AsJKlZSFILGJlWMYqmFhTnpucmFxjqFSfmFpfmpesl5+du
	YgRHhFbQDsZl6//qHWJk4mA8xCjBwawkwtv98mCaEG9KYmVValF+fFFpTmrxIUZpDhYlcV7l
	nM4UIYH0xJLU7NTUgtQimCwTB6dUA9P2vFnM5qcetExboJ0cfv2hxLwe84dBbwxCjY3D0lmX
	/ll04v1FCZ9VSR92zBXjD/nNHOav/3CFvs6/23wtbp9/9ij0BGedTHr+7MeRbT8EQ75qF7gm
	pioc7OSKcFq1x+bXlE3sjU+TQr3DPLal5Uv/vsNyu8LszjSR3l03hFi5LPycUhM/vX1UYrk+
	SvT+t4rSA1El1WZnk1Lqngnds2tunfg9qmzuNqnS6yITwxxW7Z/M5Ja2fFZB5TF53oktObt1
	jQ/OynMOvCUgeCY1zHj9UllN9hML3iovustx/OOq8A8JpnO+eT/Y5NAy76pJecfhTb5c76zr
	XvtlfA//k37o0ME/U5qjL2yIzjWe3qjEUpyRaKjFXFScCADSzx2n9wIAAA==
X-CMS-MailID: 20240820074520epcas2p13a30723354e1de941e58401dd5fde1e0
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240820074520epcas2p13a30723354e1de941e58401dd5fde1e0
References: <20240820074514.3123767-1-sunyeal.hong@samsung.com>
	<CGME20240820074520epcas2p13a30723354e1de941e58401dd5fde1e0@epcas2p1.samsung.com>

This adds support for CMU_TOP which generates clocks for all the
function blocks such as CORE, HSI0/1/2, PERIC0/1 and so on. For
CMU_TOP, PLL_SHARED0,1,2,3,4 and 5 will be the sources of this block
and they will generate bus clocks.

Signed-off-by: Sunyeal Hong <sunyeal.hong@samsung.com>
---
 drivers/clk/samsung/Makefile             |    1 +
 drivers/clk/samsung/clk-exynosautov920.c | 1173 ++++++++++++++++++++++
 2 files changed, 1174 insertions(+)
 create mode 100644 drivers/clk/samsung/clk-exynosautov920.c

diff --git a/drivers/clk/samsung/Makefile b/drivers/clk/samsung/Makefile
index 3056944a5a54..f1ba48758c78 100644
--- a/drivers/clk/samsung/Makefile
+++ b/drivers/clk/samsung/Makefile
@@ -21,6 +21,7 @@ obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos7.o
 obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos7885.o
 obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos850.o
 obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynosautov9.o
+obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynosautov920.o
 obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-gs101.o
 obj-$(CONFIG_S3C64XX_COMMON_CLK)	+= clk-s3c64xx.o
 obj-$(CONFIG_S5PV210_COMMON_CLK)	+= clk-s5pv210.o clk-s5pv210-audss.o
diff --git a/drivers/clk/samsung/clk-exynosautov920.c b/drivers/clk/samsung/clk-exynosautov920.c
new file mode 100644
index 000000000000..c17d25e3c9a0
--- /dev/null
+++ b/drivers/clk/samsung/clk-exynosautov920.c
@@ -0,0 +1,1173 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2024 Samsung Electronics Co., Ltd.
+ * Author: Sunyeal Hong <sunyeal.hong@samsung.com>
+ *
+ * Common Clock Framework support for ExynosAuto v920 SoC.
+ */
+
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+
+#include <dt-bindings/clock/samsung,exynosautov920.h>
+
+#include "clk.h"
+#include "clk-exynos-arm64.h"
+
+/* NOTE: Must be equal to the last clock ID increased by one */
+#define CLKS_NR_TOP			(DOUT_CLKCMU_TAA_NOC + 1)
+#define CLKS_NR_PERIC0			(CLK_DOUT_PERIC0_I3C + 1)
+
+/* ---- CMU_TOP ------------------------------------------------------------ */
+
+/* Register Offset definitions for CMU_TOP (0x11000000) */
+#define PLL_LOCKTIME_PLL_MMC			0x0004
+#define PLL_LOCKTIME_PLL_SHARED0		0x0008
+#define PLL_LOCKTIME_PLL_SHARED1		0x000c
+#define PLL_LOCKTIME_PLL_SHARED2		0x0010
+#define PLL_LOCKTIME_PLL_SHARED3		0x0014
+#define PLL_LOCKTIME_PLL_SHARED4		0x0018
+#define PLL_LOCKTIME_PLL_SHARED5		0x0018
+#define PLL_CON0_PLL_MMC			0x0140
+#define PLL_CON3_PLL_MMC			0x014c
+#define PLL_CON0_PLL_SHARED0			0x0180
+#define PLL_CON3_PLL_SHARED0			0x018c
+#define PLL_CON0_PLL_SHARED1			0x01c0
+#define PLL_CON3_PLL_SHARED1			0x01cc
+#define PLL_CON0_PLL_SHARED2			0x0200
+#define PLL_CON3_PLL_SHARED2			0x020c
+#define PLL_CON0_PLL_SHARED3			0x0240
+#define PLL_CON3_PLL_SHARED3			0x024c
+#define PLL_CON0_PLL_SHARED4			0x0280
+#define PLL_CON3_PLL_SHARED4			0x028c
+#define PLL_CON0_PLL_SHARED5			0x02c0
+#define PLL_CON3_PLL_SHARED5			0x02cc
+
+/* MUX */
+#define CLK_CON_MUX_MUX_CLKCMU_ACC_NOC		0x1000
+#define CLK_CON_MUX_MUX_CLKCMU_APM_NOC		0x1004
+#define CLK_CON_MUX_MUX_CLKCMU_AUD_CPU		0x1008
+#define CLK_CON_MUX_MUX_CLKCMU_AUD_NOC		0x100c
+#define CLK_CON_MUX_MUX_CLKCMU_CIS_MCLK0	0x1010
+#define CLK_CON_MUX_MUX_CLKCMU_CIS_MCLK1	0x1014
+#define CLK_CON_MUX_MUX_CLKCMU_CIS_MCLK2	0x1018
+#define CLK_CON_MUX_MUX_CLKCMU_CIS_MCLK3	0x101c
+#define CLK_CON_MUX_MUX_CLKCMU_CMU_BOOST	0x1020
+#define CLK_CON_MUX_MUX_CLKCMU_CPUCL0_CLUSTER	0x1024
+#define CLK_CON_MUX_MUX_CLKCMU_CPUCL0_DBG	0x1028
+#define CLK_CON_MUX_MUX_CLKCMU_CPUCL0_SWITCH	0x102c
+#define CLK_CON_MUX_MUX_CLKCMU_CPUCL1_CLUSTER	0x1030
+#define CLK_CON_MUX_MUX_CLKCMU_CPUCL1_SWITCH	0x1034
+#define CLK_CON_MUX_MUX_CLKCMU_CPUCL2_CLUSTER	0x1038
+#define CLK_CON_MUX_MUX_CLKCMU_CPUCL2_SWITCH	0x103c
+#define CLK_CON_MUX_MUX_CLKCMU_DNC_NOC		0x1040
+#define CLK_CON_MUX_MUX_CLKCMU_DPTX_DPGTC	0x1044
+#define CLK_CON_MUX_MUX_CLKCMU_DPTX_DPOSC	0x1048
+#define CLK_CON_MUX_MUX_CLKCMU_DPTX_NOC		0x104c
+#define CLK_CON_MUX_MUX_CLKCMU_DPUB_DSIM	0x1050
+#define CLK_CON_MUX_MUX_CLKCMU_DPUB_NOC		0x1054
+#define CLK_CON_MUX_MUX_CLKCMU_DPUF0_NOC	0x1058
+#define CLK_CON_MUX_MUX_CLKCMU_DPUF1_NOC	0x105c
+#define CLK_CON_MUX_MUX_CLKCMU_DPUF2_NOC	0x1060
+#define CLK_CON_MUX_MUX_CLKCMU_DSP_NOC		0x1064
+#define CLK_CON_MUX_MUX_CLKCMU_G3D_NOCP		0x1068
+#define CLK_CON_MUX_MUX_CLKCMU_G3D_SWITCH	0x106c
+#define CLK_CON_MUX_MUX_CLKCMU_GNPU_NOC		0x1070
+#define CLK_CON_MUX_MUX_CLKCMU_HSI0_NOC		0x1074
+#define CLK_CON_MUX_MUX_CLKCMU_ACC_ORB		0x1078
+#define CLK_CON_MUX_MUX_CLKCMU_GNPU_XMAA	0x107c
+#define CLK_CON_MUX_MUX_CLKCMU_HSI1_MMC_CARD	0x1080
+#define CLK_CON_MUX_MUX_CLKCMU_HSI1_NOC		0x1084
+#define CLK_CON_MUX_MUX_CLKCMU_HSI1_USBDRD	0x1088
+#define CLK_CON_MUX_MUX_CLKCMU_HSI2_ETHERNET	0x108c
+#define CLK_CON_MUX_MUX_CLKCMU_HSI2_NOC		0x1090
+#define CLK_CON_MUX_MUX_CLKCMU_HSI2_NOC_UFS	0x1094
+#define CLK_CON_MUX_MUX_CLKCMU_HSI2_UFS_EMBD	0x1098
+#define CLK_CON_MUX_MUX_CLKCMU_ISP_NOC		0x109c
+#define CLK_CON_MUX_MUX_CLKCMU_M2M_JPEG		0x10a0
+#define CLK_CON_MUX_MUX_CLKCMU_M2M_NOC		0x10a4
+#define CLK_CON_MUX_MUX_CLKCMU_MFC_MFC		0x10a8
+#define CLK_CON_MUX_MUX_CLKCMU_MFC_WFD		0x10ac
+#define CLK_CON_MUX_MUX_CLKCMU_MFD_NOC		0x10b0
+#define CLK_CON_MUX_MUX_CLKCMU_MIF_NOCP		0x10b4
+#define CLK_CON_MUX_MUX_CLKCMU_MIF_SWITCH	0x10b8
+#define CLK_CON_MUX_MUX_CLKCMU_MISC_NOC		0x10bc
+#define CLK_CON_MUX_MUX_CLKCMU_NOCL0_NOC	0x10c0
+#define CLK_CON_MUX_MUX_CLKCMU_NOCL1_NOC	0x10c4
+#define CLK_CON_MUX_MUX_CLKCMU_NOCL2_NOC	0x10c8
+#define CLK_CON_MUX_MUX_CLKCMU_PERIC0_IP	0x10cc
+#define CLK_CON_MUX_MUX_CLKCMU_PERIC0_NOC	0x10d0
+#define CLK_CON_MUX_MUX_CLKCMU_PERIC1_IP	0x10d4
+#define CLK_CON_MUX_MUX_CLKCMU_PERIC1_NOC	0x10d8
+#define CLK_CON_MUX_MUX_CLKCMU_SDMA_NOC		0x10dc
+#define CLK_CON_MUX_MUX_CLKCMU_SNW_NOC		0x10e0
+#define CLK_CON_MUX_MUX_CLKCMU_SSP_NOC		0x10e4
+#define CLK_CON_MUX_MUX_CLKCMU_TAA_NOC		0x10e8
+#define CLK_CON_MUX_MUX_CLK_CMU_NOCP		0x10ec
+#define CLK_CON_MUX_MUX_CLK_CMU_PLLCLKOUT	0x10f0
+#define CLK_CON_MUX_MUX_CMU_CMUREF		0x10f4
+
+/* DIV */
+#define CLK_CON_DIV_CLKCMU_ACC_NOC		0x1800
+#define CLK_CON_DIV_CLKCMU_APM_NOC		0x1804
+#define CLK_CON_DIV_CLKCMU_AUD_CPU		0x1808
+#define CLK_CON_DIV_CLKCMU_AUD_NOC		0x180c
+#define CLK_CON_DIV_CLKCMU_CIS_MCLK0		0x1810
+#define CLK_CON_DIV_CLKCMU_CIS_MCLK1		0x1814
+#define CLK_CON_DIV_CLKCMU_CIS_MCLK2		0x1818
+#define CLK_CON_DIV_CLKCMU_CIS_MCLK3		0x181c
+#define CLK_CON_DIV_CLKCMU_CPUCL0_CLUSTER	0x1820
+#define CLK_CON_DIV_CLKCMU_CPUCL0_DBG		0x1824
+#define CLK_CON_DIV_CLKCMU_CPUCL0_SWITCH	0x1828
+#define CLK_CON_DIV_CLKCMU_CPUCL1_CLUSTER	0x182c
+#define CLK_CON_DIV_CLKCMU_CPUCL1_SWITCH	0x1830
+#define CLK_CON_DIV_CLKCMU_CPUCL2_CLUSTER	0x1834
+#define CLK_CON_DIV_CLKCMU_CPUCL2_SWITCH	0x1838
+#define CLK_CON_DIV_CLKCMU_DNC_NOC		0x183c
+#define CLK_CON_DIV_CLKCMU_DPTX_DPGTC		0x1840
+#define CLK_CON_DIV_CLKCMU_DPTX_DPOSC		0x1844
+#define CLK_CON_DIV_CLKCMU_DPTX_NOC		0x1848
+#define CLK_CON_DIV_CLKCMU_DPUB_DSIM		0x184c
+#define CLK_CON_DIV_CLKCMU_DPUB_NOC		0x1850
+#define CLK_CON_DIV_CLKCMU_DPUF0_NOC		0x1854
+#define CLK_CON_DIV_CLKCMU_DPUF1_NOC		0x1858
+#define CLK_CON_DIV_CLKCMU_DPUF2_NOC		0x185c
+#define CLK_CON_DIV_CLKCMU_DSP_NOC		0x1860
+#define CLK_CON_DIV_CLKCMU_G3D_NOCP		0x1864
+#define CLK_CON_DIV_CLKCMU_G3D_SWITCH		0x1868
+#define CLK_CON_DIV_CLKCMU_GNPU_NOC		0x186c
+#define CLK_CON_DIV_CLKCMU_HSI0_NOC		0x1870
+#define CLK_CON_DIV_CLKCMU_ACC_ORB		0x1874
+#define CLK_CON_DIV_CLKCMU_GNPU_XMAA		0x1878
+#define CLK_CON_DIV_CLKCMU_HSI1_MMC_CARD	0x187c
+#define CLK_CON_DIV_CLKCMU_HSI1_NOC		0x1880
+#define CLK_CON_DIV_CLKCMU_HSI1_USBDRD		0x1884
+#define CLK_CON_DIV_CLKCMU_HSI2_ETHERNET	0x1888
+#define CLK_CON_DIV_CLKCMU_HSI2_NOC		0x188c
+#define CLK_CON_DIV_CLKCMU_HSI2_NOC_UFS		0x1890
+#define CLK_CON_DIV_CLKCMU_HSI2_UFS_EMBD	0x1894
+#define CLK_CON_DIV_CLKCMU_ISP_NOC		0x1898
+#define CLK_CON_DIV_CLKCMU_M2M_JPEG		0x189c
+#define CLK_CON_DIV_CLKCMU_M2M_NOC		0x18a0
+#define CLK_CON_DIV_CLKCMU_MFC_MFC		0x18a4
+#define CLK_CON_DIV_CLKCMU_MFC_WFD		0x18a8
+#define CLK_CON_DIV_CLKCMU_MFD_NOC		0x18ac
+#define CLK_CON_DIV_CLKCMU_MIF_NOCP		0x18b0
+#define CLK_CON_DIV_CLKCMU_MISC_NOC		0x18b4
+#define CLK_CON_DIV_CLKCMU_NOCL0_NOC		0x18b8
+#define CLK_CON_DIV_CLKCMU_NOCL1_NOC		0x18bc
+#define CLK_CON_DIV_CLKCMU_NOCL2_NOC		0x18c0
+#define CLK_CON_DIV_CLKCMU_PERIC0_IP		0x18c4
+#define CLK_CON_DIV_CLKCMU_PERIC0_NOC		0x18c8
+#define CLK_CON_DIV_CLKCMU_PERIC1_IP		0x18cc
+#define CLK_CON_DIV_CLKCMU_PERIC1_NOC		0x18d0
+#define CLK_CON_DIV_CLKCMU_SDMA_NOC		0x18d4
+#define CLK_CON_DIV_CLKCMU_SNW_NOC		0x18d8
+#define CLK_CON_DIV_CLKCMU_SSP_NOC		0x18dc
+#define CLK_CON_DIV_CLKCMU_TAA_NOC		0x18e0
+#define CLK_CON_DIV_CLK_ADD_CH_CLK		0x18e4
+#define CLK_CON_DIV_CLK_CMU_PLLCLKOUT		0x18e8
+#define CLK_CON_DIV_DIV_CLKCMU_CMU_BOOST	0x18ec
+#define CLK_CON_DIV_DIV_CLK_CMU_NOCP		0x18f0
+
+static const unsigned long top_clk_regs[] __initconst = {
+	PLL_LOCKTIME_PLL_MMC,
+	PLL_LOCKTIME_PLL_SHARED0,
+	PLL_LOCKTIME_PLL_SHARED1,
+	PLL_LOCKTIME_PLL_SHARED2,
+	PLL_LOCKTIME_PLL_SHARED3,
+	PLL_LOCKTIME_PLL_SHARED4,
+	PLL_LOCKTIME_PLL_SHARED5,
+	PLL_CON0_PLL_MMC,
+	PLL_CON3_PLL_MMC,
+	PLL_CON0_PLL_SHARED0,
+	PLL_CON3_PLL_SHARED0,
+	PLL_CON0_PLL_SHARED1,
+	PLL_CON3_PLL_SHARED1,
+	PLL_CON0_PLL_SHARED2,
+	PLL_CON3_PLL_SHARED2,
+	PLL_CON0_PLL_SHARED3,
+	PLL_CON3_PLL_SHARED3,
+	PLL_CON0_PLL_SHARED4,
+	PLL_CON3_PLL_SHARED4,
+	PLL_CON0_PLL_SHARED5,
+	PLL_CON3_PLL_SHARED5,
+	CLK_CON_MUX_MUX_CLKCMU_ACC_NOC,
+	CLK_CON_MUX_MUX_CLKCMU_APM_NOC,
+	CLK_CON_MUX_MUX_CLKCMU_AUD_CPU,
+	CLK_CON_MUX_MUX_CLKCMU_AUD_NOC,
+	CLK_CON_MUX_MUX_CLKCMU_CIS_MCLK0,
+	CLK_CON_MUX_MUX_CLKCMU_CIS_MCLK1,
+	CLK_CON_MUX_MUX_CLKCMU_CIS_MCLK2,
+	CLK_CON_MUX_MUX_CLKCMU_CIS_MCLK3,
+	CLK_CON_MUX_MUX_CLKCMU_CMU_BOOST,
+	CLK_CON_MUX_MUX_CLKCMU_CPUCL0_CLUSTER,
+	CLK_CON_MUX_MUX_CLKCMU_CPUCL0_DBG,
+	CLK_CON_MUX_MUX_CLKCMU_CPUCL0_SWITCH,
+	CLK_CON_MUX_MUX_CLKCMU_CPUCL1_CLUSTER,
+	CLK_CON_MUX_MUX_CLKCMU_CPUCL1_SWITCH,
+	CLK_CON_MUX_MUX_CLKCMU_CPUCL2_CLUSTER,
+	CLK_CON_MUX_MUX_CLKCMU_CPUCL2_SWITCH,
+	CLK_CON_MUX_MUX_CLKCMU_DNC_NOC,
+	CLK_CON_MUX_MUX_CLKCMU_DPTX_DPGTC,
+	CLK_CON_MUX_MUX_CLKCMU_DPTX_DPOSC,
+	CLK_CON_MUX_MUX_CLKCMU_DPTX_NOC,
+	CLK_CON_MUX_MUX_CLKCMU_DPUB_DSIM,
+	CLK_CON_MUX_MUX_CLKCMU_DPUB_NOC,
+	CLK_CON_MUX_MUX_CLKCMU_DPUF0_NOC,
+	CLK_CON_MUX_MUX_CLKCMU_DPUF1_NOC,
+	CLK_CON_MUX_MUX_CLKCMU_DPUF2_NOC,
+	CLK_CON_MUX_MUX_CLKCMU_DSP_NOC,
+	CLK_CON_MUX_MUX_CLKCMU_G3D_NOCP,
+	CLK_CON_MUX_MUX_CLKCMU_G3D_SWITCH,
+	CLK_CON_MUX_MUX_CLKCMU_GNPU_NOC,
+	CLK_CON_MUX_MUX_CLKCMU_HSI0_NOC,
+	CLK_CON_MUX_MUX_CLKCMU_ACC_ORB,
+	CLK_CON_MUX_MUX_CLKCMU_GNPU_XMAA,
+	CLK_CON_MUX_MUX_CLKCMU_HSI1_MMC_CARD,
+	CLK_CON_MUX_MUX_CLKCMU_HSI1_NOC,
+	CLK_CON_MUX_MUX_CLKCMU_HSI1_USBDRD,
+	CLK_CON_MUX_MUX_CLKCMU_HSI2_ETHERNET,
+	CLK_CON_MUX_MUX_CLKCMU_HSI2_NOC,
+	CLK_CON_MUX_MUX_CLKCMU_HSI2_NOC_UFS,
+	CLK_CON_MUX_MUX_CLKCMU_HSI2_UFS_EMBD,
+	CLK_CON_MUX_MUX_CLKCMU_ISP_NOC,
+	CLK_CON_MUX_MUX_CLKCMU_M2M_JPEG,
+	CLK_CON_MUX_MUX_CLKCMU_M2M_NOC,
+	CLK_CON_MUX_MUX_CLKCMU_MFC_MFC,
+	CLK_CON_MUX_MUX_CLKCMU_MFC_WFD,
+	CLK_CON_MUX_MUX_CLKCMU_MFD_NOC,
+	CLK_CON_MUX_MUX_CLKCMU_MIF_NOCP,
+	CLK_CON_MUX_MUX_CLKCMU_MIF_SWITCH,
+	CLK_CON_MUX_MUX_CLKCMU_MISC_NOC,
+	CLK_CON_MUX_MUX_CLKCMU_NOCL0_NOC,
+	CLK_CON_MUX_MUX_CLKCMU_NOCL1_NOC,
+	CLK_CON_MUX_MUX_CLKCMU_NOCL2_NOC,
+	CLK_CON_MUX_MUX_CLKCMU_PERIC0_IP,
+	CLK_CON_MUX_MUX_CLKCMU_PERIC0_NOC,
+	CLK_CON_MUX_MUX_CLKCMU_PERIC1_IP,
+	CLK_CON_MUX_MUX_CLKCMU_PERIC1_NOC,
+	CLK_CON_MUX_MUX_CLKCMU_SDMA_NOC,
+	CLK_CON_MUX_MUX_CLKCMU_SNW_NOC,
+	CLK_CON_MUX_MUX_CLKCMU_SSP_NOC,
+	CLK_CON_MUX_MUX_CLKCMU_TAA_NOC,
+	CLK_CON_MUX_MUX_CLK_CMU_NOCP,
+	CLK_CON_MUX_MUX_CLK_CMU_PLLCLKOUT,
+	CLK_CON_MUX_MUX_CMU_CMUREF,
+	CLK_CON_DIV_CLKCMU_ACC_NOC,
+	CLK_CON_DIV_CLKCMU_APM_NOC,
+	CLK_CON_DIV_CLKCMU_AUD_CPU,
+	CLK_CON_DIV_CLKCMU_AUD_NOC,
+	CLK_CON_DIV_CLKCMU_CIS_MCLK0,
+	CLK_CON_DIV_CLKCMU_CIS_MCLK1,
+	CLK_CON_DIV_CLKCMU_CIS_MCLK2,
+	CLK_CON_DIV_CLKCMU_CIS_MCLK3,
+	CLK_CON_DIV_CLKCMU_CPUCL0_CLUSTER,
+	CLK_CON_DIV_CLKCMU_CPUCL0_DBG,
+	CLK_CON_DIV_CLKCMU_CPUCL0_SWITCH,
+	CLK_CON_DIV_CLKCMU_CPUCL1_CLUSTER,
+	CLK_CON_DIV_CLKCMU_CPUCL1_SWITCH,
+	CLK_CON_DIV_CLKCMU_CPUCL2_CLUSTER,
+	CLK_CON_DIV_CLKCMU_CPUCL2_SWITCH,
+	CLK_CON_DIV_CLKCMU_DNC_NOC,
+	CLK_CON_DIV_CLKCMU_DPTX_DPGTC,
+	CLK_CON_DIV_CLKCMU_DPTX_DPOSC,
+	CLK_CON_DIV_CLKCMU_DPTX_NOC,
+	CLK_CON_DIV_CLKCMU_DPUB_DSIM,
+	CLK_CON_DIV_CLKCMU_DPUB_NOC,
+	CLK_CON_DIV_CLKCMU_DPUF0_NOC,
+	CLK_CON_DIV_CLKCMU_DPUF1_NOC,
+	CLK_CON_DIV_CLKCMU_DPUF2_NOC,
+	CLK_CON_DIV_CLKCMU_DSP_NOC,
+	CLK_CON_DIV_CLKCMU_G3D_NOCP,
+	CLK_CON_DIV_CLKCMU_G3D_SWITCH,
+	CLK_CON_DIV_CLKCMU_GNPU_NOC,
+	CLK_CON_DIV_CLKCMU_HSI0_NOC,
+	CLK_CON_DIV_CLKCMU_ACC_ORB,
+	CLK_CON_DIV_CLKCMU_GNPU_XMAA,
+	CLK_CON_DIV_CLKCMU_HSI1_MMC_CARD,
+	CLK_CON_DIV_CLKCMU_HSI1_NOC,
+	CLK_CON_DIV_CLKCMU_HSI1_USBDRD,
+	CLK_CON_DIV_CLKCMU_HSI2_ETHERNET,
+	CLK_CON_DIV_CLKCMU_HSI2_NOC,
+	CLK_CON_DIV_CLKCMU_HSI2_NOC_UFS,
+	CLK_CON_DIV_CLKCMU_HSI2_UFS_EMBD,
+	CLK_CON_DIV_CLKCMU_ISP_NOC,
+	CLK_CON_DIV_CLKCMU_M2M_JPEG,
+	CLK_CON_DIV_CLKCMU_M2M_NOC,
+	CLK_CON_DIV_CLKCMU_MFC_MFC,
+	CLK_CON_DIV_CLKCMU_MFC_WFD,
+	CLK_CON_DIV_CLKCMU_MFD_NOC,
+	CLK_CON_DIV_CLKCMU_MIF_NOCP,
+	CLK_CON_DIV_CLKCMU_MISC_NOC,
+	CLK_CON_DIV_CLKCMU_NOCL0_NOC,
+	CLK_CON_DIV_CLKCMU_NOCL1_NOC,
+	CLK_CON_DIV_CLKCMU_NOCL2_NOC,
+	CLK_CON_DIV_CLKCMU_PERIC0_IP,
+	CLK_CON_DIV_CLKCMU_PERIC0_NOC,
+	CLK_CON_DIV_CLKCMU_PERIC1_IP,
+	CLK_CON_DIV_CLKCMU_PERIC1_NOC,
+	CLK_CON_DIV_CLKCMU_SDMA_NOC,
+	CLK_CON_DIV_CLKCMU_SNW_NOC,
+	CLK_CON_DIV_CLKCMU_SSP_NOC,
+	CLK_CON_DIV_CLKCMU_TAA_NOC,
+	CLK_CON_DIV_CLK_ADD_CH_CLK,
+	CLK_CON_DIV_CLK_CMU_PLLCLKOUT,
+	CLK_CON_DIV_DIV_CLKCMU_CMU_BOOST,
+	CLK_CON_DIV_DIV_CLK_CMU_NOCP,
+};
+
+static const struct samsung_pll_clock top_pll_clks[] __initconst = {
+	/* CMU_TOP_PURECLKCOMP */
+	PLL(pll_531x, FOUT_SHARED0_PLL, "fout_shared0_pll", "oscclk",
+	    PLL_LOCKTIME_PLL_SHARED0, PLL_CON3_PLL_SHARED0, NULL),
+	PLL(pll_531x, FOUT_SHARED1_PLL, "fout_shared1_pll", "oscclk",
+	    PLL_LOCKTIME_PLL_SHARED1, PLL_CON3_PLL_SHARED1, NULL),
+	PLL(pll_531x, FOUT_SHARED2_PLL, "fout_shared2_pll", "oscclk",
+	    PLL_LOCKTIME_PLL_SHARED2, PLL_CON3_PLL_SHARED2, NULL),
+	PLL(pll_531x, FOUT_SHARED3_PLL, "fout_shared3_pll", "oscclk",
+	    PLL_LOCKTIME_PLL_SHARED3, PLL_CON3_PLL_SHARED3, NULL),
+	PLL(pll_531x, FOUT_SHARED4_PLL, "fout_shared4_pll", "oscclk",
+	    PLL_LOCKTIME_PLL_SHARED4, PLL_CON3_PLL_SHARED4, NULL),
+	PLL(pll_531x, FOUT_SHARED5_PLL, "fout_shared5_pll", "oscclk",
+	    PLL_LOCKTIME_PLL_SHARED5, PLL_CON3_PLL_SHARED5, NULL),
+	PLL(pll_531x, FOUT_MMC_PLL, "fout_mmc_pll", "oscclk",
+	    PLL_LOCKTIME_PLL_MMC, PLL_CON3_PLL_MMC, NULL),
+};
+
+/* List of parent clocks for Muxes in CMU_TOP */
+PNAME(mout_shared0_pll_p) = { "oscclk", "fout_shared0_pll" };
+PNAME(mout_shared1_pll_p) = { "oscclk", "fout_shared1_pll" };
+PNAME(mout_shared2_pll_p) = { "oscclk", "fout_shared2_pll" };
+PNAME(mout_shared3_pll_p) = { "oscclk", "fout_shared3_pll" };
+PNAME(mout_shared4_pll_p) = { "oscclk", "fout_shared4_pll" };
+PNAME(mout_shared5_pll_p) = { "oscclk", "fout_shared5_pll" };
+PNAME(mout_mmc_pll_p) = { "oscclk", "fout_mmc_pll" };
+
+PNAME(mout_clkcmu_cmu_boost_p) = { "dout_shared2_div3", "dout_shared1_div4",
+				   "dout_shared2_div4", "dout_shared4_div4" };
+
+PNAME(mout_clkcmu_cmu_cmuref_p) = { "oscclk", "dout_cmu_boost" };
+
+PNAME(mout_clkcmu_acc_noc_p) = { "dout_shared2_div2", "dout_shared0_div3",
+				 "dout_shared4_div2", "dout_shared1_div3",
+				 "dout_shared2_div3", "dout_shared5_div1",
+				 "dout_shared3_div1", "oscclk" };
+
+PNAME(mout_clkcmu_acc_orb_p) = { "dout_shared2_div2", "dout_shared0_div3",
+				 "dout_shared1_div2", "dout_shared1_div3",
+				 "dout_shared2_div3", "fout_shared5_pll",
+				 "fout_shared3_pll", "oscclk" };
+
+PNAME(mout_clkcmu_apm_noc_p) = { "dout_shared2_div2", "dout_shared1_div4",
+				 "dout_shared2_div4", "dout_shared4_div4" };
+
+PNAME(mout_clkcmu_aud_cpu_p) = { "dout_shared0_div2", "dout_shared1_div2",
+				 "dout_shared2_div2", "dout_shared0_div3",
+				 "dout_shared4_div2", "dout_shared1_div3",
+				 "dout_shared2_div3", "dout_shared4_div3" };
+
+PNAME(mout_clkcmu_aud_noc_p) = { "dout_shared2_div2", "dout_shared4_div2",
+				 "dout_shared1_div2", "dout_shared2_div3" };
+
+PNAME(mout_clkcmu_cpucl0_switch_p) = { "dout_shared0_div2", "dout_shared1_div2",
+				       "dout_shared2_div2", "dout_shared4_div2" };
+
+PNAME(mout_clkcmu_cpucl0_cluster_p) = { "fout_shared2_pll", "fout_shared4_pll",
+					"dout_shared0_div2", "dout_shared1_div2",
+					"dout_shared2_div2", "dout_shared4_div2",
+					"dout_shared2_div3", "fout_shared3_pll" };
+
+PNAME(mout_clkcmu_cpucl0_dbg_p) = { "dout_shared2_div2", "dout_shared0_div3",
+				    "dout_shared4_div2", "dout_shared0_div4" };
+
+PNAME(mout_clkcmu_cpucl1_switch_p) = { "dout_shared0_div2", "dout_shared1_div2",
+				       "dout_shared2_div2", "dout_shared4_div2" };
+
+PNAME(mout_clkcmu_cpucl1_cluster_p) = { "fout_shared2_pll", "fout_shared4_pll",
+					"dout_shared0_div2", "dout_shared1_div2",
+					"dout_shared2_div2", "dout_shared4_div2",
+					"dout_shared2_div3", "fout_shared3_pll" };
+
+PNAME(mout_clkcmu_cpucl2_switch_p) = { "dout_shared0_div2", "dout_shared1_div2",
+				       "dout_shared2_div2", "dout_shared4_div2" };
+
+PNAME(mout_clkcmu_cpucl2_cluster_p) = { "fout_shared2_pll", "fout_shared4_pll",
+					"dout_shared0_div2", "dout_shared1_div2",
+					"dout_shared2_div2", "dout_shared4_div2",
+					"dout_shared2_div3", "fout_shared3_pll" };
+
+PNAME(mout_clkcmu_dnc_noc_p) = { "dout_shared1_div2", "dout_shared2_div2",
+				 "dout_shared0_div3", "dout_shared4_div2",
+				 "dout_shared1_div3", "dout_shared2_div3",
+				 "dout_shared1_div4", "fout_shared3_pll" };
+
+PNAME(mout_clkcmu_dptx_noc_p) = { "dout_shared4_div2", "dout_shared2_div3",
+				  "dout_shared1_div4", "dout_shared2_div4" };
+
+PNAME(mout_clkcmu_dptx_dpgtc_p) = { "oscclk", "dout_shared2_div3",
+				    "dout_shared2_div4", "dout_shared4_div4" };
+
+PNAME(mout_clkcmu_dptx_dposc_p) = { "oscclk", "dout_shared2_div4" };
+
+PNAME(mout_clkcmu_dpub_noc_p) = { "dout_shared4_div2", "dout_shared1_div3",
+				 "dout_shared2_div3", "dout_shared1_div4",
+				 "dout_shared2_div4", "dout_shared4_div4",
+				 "fout_shared3_pll" };
+
+PNAME(mout_clkcmu_dpub_dsim_p) = { "dout_shared2_div3", "dout_shared2_div4" };
+
+PNAME(mout_clkcmu_dpuf_noc_p) = { "dout_shared4_div2", "dout_shared1_div3",
+				   "dout_shared2_div3", "dout_shared1_div4",
+				   "dout_shared2_div4", "dout_shared4_div4",
+				   "fout_shared3_pll" };
+
+PNAME(mout_clkcmu_dsp_noc_p) = { "dout_shared0_div2", "dout_shared1_div2",
+				 "dout_shared2_div2", "dout_shared0_div3",
+				 "dout_shared4_div2", "dout_shared1_div3",
+				 "fout_shared5_pll", "fout_shared3_pll" };
+
+PNAME(mout_clkcmu_g3d_switch_p) = { "dout_shared0_div2", "dout_shared1_div2",
+				    "dout_shared2_div2", "dout_shared4_div2" };
+
+PNAME(mout_clkcmu_g3d_nocp_p) = { "dout_shared2_div3", "dout_shared1_div4",
+				  "dout_shared2_div4", "dout_shared4_div4" };
+
+PNAME(mout_clkcmu_gnpu_noc_p) = { "dout_shared0_div2", "dout_shared1_div2",
+				  "dout_shared2_div2", "dout_shared0_div3",
+				  "dout_shared4_div2", "dout_shared2_div3",
+				  "fout_shared5_pll", "fout_shared3_pll" };
+
+PNAME(mout_clkcmu_hsi0_noc_p) = { "dout_shared4_div2", "dout_shared2_div3",
+				  "dout_shared1_div4", "dout_shared2_div4" };
+
+PNAME(mout_clkcmu_hsi1_noc_p) = { "dout_shared2_div3", "dout_shared1_div4",
+				  "dout_shared2_div4", "dout_shared4_div4" };
+
+PNAME(mout_clkcmu_hsi1_usbdrd_p) = { "oscclk", "dout_shared2_div3",
+				     "dout_shared2_div4", "dout_shared4_div4" };
+
+PNAME(mout_clkcmu_hsi1_mmc_card_p) = { "oscclk", "dout_shared2_div2",
+				       "dout_shared4_div2", "fout_mmc_pll" };
+
+PNAME(mout_clkcmu_hsi2_noc_p) = { "dout_shared4_div2", "dout_shared2_div3",
+				  "dout_shared1_div4", "dout_shared2_div4" };
+
+PNAME(mout_clkcmu_hsi2_noc_ufs_p) = { "dout_shared4_div2", "dout_shared2_div3",
+				      "dout_shared1_div4", "dout_shared2_div2" };
+
+PNAME(mout_clkcmu_hsi2_ufs_embd_p) = { "oscclk", "dout_shared2_div3",
+				       "dout_shared2_div4", "dout_shared4_div4" };
+
+PNAME(mout_clkcmu_hsi2_ethernet_p) = { "oscclk", "dout_shared2_div2",
+				       "dout_shared0_div3", "dout_shared1_div3" };
+
+PNAME(mout_clkcmu_isp_noc_p) = { "dout_shared2_div2", "dout_shared0_div3",
+				 "dout_shared4_div2", "dout_shared1_div3",
+				 "dout_shared2_div3", "fout_shared5_pll",
+				 "fout_shared3_pll", "oscclk" };
+
+PNAME(mout_clkcmu_m2m_noc_p) = { "dout_shared0_div3", "dout_shared4_div2",
+				 "dout_shared2_div3", "dout_shared1_div4" };
+
+PNAME(mout_clkcmu_m2m_jpeg_p) = { "dout_shared0_div3", "dout_shared4_div2",
+				  "dout_shared2_div3", "dout_shared1_div4" };
+
+PNAME(mout_clkcmu_mfc_mfc_p) = { "dout_shared0_div3", "dout_shared4_div2",
+				 "dout_shared2_div3", "dout_shared1_div4" };
+
+PNAME(mout_clkcmu_mfc_wfd_p) = { "dout_shared0_div3", "dout_shared4_div2",
+				 "dout_shared2_div3", "dout_shared1_div4" };
+
+PNAME(mout_clkcmu_mfd_noc_p) = { "dout_shared2_div2", "dout_shared0_div3",
+				 "dout_shared4_div2", "dout_shared1_div3",
+				 "dout_shared2_div3", "fout_shared5_pll",
+				 "fout_shared3_pll", "oscclk" };
+
+PNAME(mout_clkcmu_mif_switch_p) = { "fout_shared0_pll", "fout_shared1_pll",
+				    "fout_shared2_pll", "fout_shared4_pll",
+				    "dout_shared0_div2", "dout_shared1_div2",
+				    "dout_shared2_div2", "fout_shared5_pll" };
+
+PNAME(mout_clkcmu_mif_nocp_p) = { "dout_shared2_div3", "dout_shared1_div4",
+				  "dout_shared2_div4", "dout_shared4_div4" };
+
+PNAME(mout_clkcmu_misc_noc_p) = { "dout_shared4_div2", "dout_shared2_div3",
+				  "dout_shared1_div4", "dout_shared2_div4" };
+
+PNAME(mout_clkcmu_nocl0_noc_p) = { "dout_shared0_div2", "dout_shared1_div2",
+				   "dout_shared2_div2", "dout_shared0_div3",
+				   "dout_shared4_div2", "dout_shared1_div3",
+				   "dout_shared2_div3", "fout_shared3_pll" };
+
+PNAME(mout_clkcmu_nocl1_noc_p) = { "dout_shared2_div2", "dout_shared0_div3",
+				   "dout_shared4_div2", "dout_shared1_div3",
+				   "dout_shared2_div3", "fout_shared5_pll",
+				   "fout_shared3_pll", "oscclk" };
+
+PNAME(mout_clkcmu_nocl2_noc_p) = { "dout_shared2_div2", "dout_shared0_div3",
+				   "dout_shared4_div2", "dout_shared1_div3",
+				   "dout_shared2_div3", "fout_shared5_pll",
+				   "fout_shared3_pll", "oscclk" };
+
+PNAME(mout_clkcmu_peric0_noc_p) = { "dout_shared2_div3", "dout_shared2_div4" };
+
+PNAME(mout_clkcmu_peric0_ip_p) = { "dout_shared2_div3", "dout_shared2_div4" };
+
+PNAME(mout_clkcmu_peric1_noc_p) = { "dout_shared2_div3", "dout_shared2_div4" };
+
+PNAME(mout_clkcmu_peric1_ip_p) = { "dout_shared2_div3", "dout_shared2_div4" };
+
+PNAME(mout_clkcmu_sdma_noc_p) = { "dout_shared1_div2", "dout_shared2_div2",
+				  "dout_shared0_div3", "dout_shared4_div2",
+				  "dout_shared1_div3", "dout_shared2_div3",
+				  "dout_shared1_div4", "fout_shared3_pll" };
+
+PNAME(mout_clkcmu_snw_noc_p) = { "dout_shared2_div2", "dout_shared0_div3",
+				 "dout_shared4_div2", "dout_shared1_div3",
+				 "dout_shared2_div3", "fout_shared5_pll",
+				 "fout_shared3_pll", "oscclk" };
+
+PNAME(mout_clkcmu_ssp_noc_p) = { "dout_shared2_div3", "dout_shared1_div4",
+				  "dout_shared2_div2", "dout_shared4_div4" };
+
+PNAME(mout_clkcmu_taa_noc_p) = { "dout_shared2_div2", "dout_shared0_div3",
+				 "dout_shared4_div2", "dout_shared1_div3",
+				 "dout_shared2_div3", "fout_shared5_pll",
+				 "fout_shared3_pll", "oscclk" };
+
+static const struct samsung_mux_clock top_mux_clks[] __initconst = {
+	/* CMU_TOP_PURECLKCOMP */
+	MUX(MOUT_SHARED0_PLL, "mout_shared0_pll", mout_shared0_pll_p,
+	    PLL_CON0_PLL_SHARED0, 4, 1),
+	MUX(MOUT_SHARED1_PLL, "mout_shared1_pll", mout_shared1_pll_p,
+	    PLL_CON0_PLL_SHARED1, 4, 1),
+	MUX(MOUT_SHARED2_PLL, "mout_shared2_pll", mout_shared2_pll_p,
+	    PLL_CON0_PLL_SHARED2, 4, 1),
+	MUX(MOUT_SHARED3_PLL, "mout_shared3_pll", mout_shared3_pll_p,
+	    PLL_CON0_PLL_SHARED3, 4, 1),
+	MUX(MOUT_SHARED4_PLL, "mout_shared4_pll", mout_shared4_pll_p,
+	    PLL_CON0_PLL_SHARED4, 4, 1),
+	MUX(MOUT_SHARED5_PLL, "mout_shared5_pll", mout_shared5_pll_p,
+	    PLL_CON0_PLL_SHARED5, 4, 1),
+	MUX(MOUT_MMC_PLL, "mout_mmc_pll", mout_mmc_pll_p,
+	    PLL_CON0_PLL_MMC, 4, 1),
+
+	/* BOOST */
+	MUX(MOUT_CLKCMU_CMU_BOOST, "mout_clkcmu_cmu_boost",
+	    mout_clkcmu_cmu_boost_p, CLK_CON_MUX_MUX_CLKCMU_CMU_BOOST, 0, 2),
+	MUX(MOUT_CLKCMU_CMU_CMUREF, "mout_clkcmu_cmu_cmuref",
+	    mout_clkcmu_cmu_cmuref_p, CLK_CON_MUX_MUX_CMU_CMUREF, 0, 1),
+
+	/* ACC */
+	MUX(MOUT_CLKCMU_ACC_NOC, "mout_clkcmu_acc_noc",
+	    mout_clkcmu_acc_noc_p, CLK_CON_MUX_MUX_CLKCMU_ACC_NOC, 0, 3),
+	MUX(MOUT_CLKCMU_ACC_ORB, "mout_clkcmu_acc_orb",
+	    mout_clkcmu_acc_orb_p, CLK_CON_MUX_MUX_CLKCMU_ACC_ORB, 0, 3),
+
+	/* APM */
+	MUX(MOUT_CLKCMU_APM_NOC, "mout_clkcmu_apm_noc",
+	    mout_clkcmu_apm_noc_p, CLK_CON_MUX_MUX_CLKCMU_APM_NOC, 0, 2),
+
+	/* AUD */
+	MUX(MOUT_CLKCMU_AUD_CPU, "mout_clkcmu_aud_cpu",
+	    mout_clkcmu_aud_cpu_p, CLK_CON_MUX_MUX_CLKCMU_AUD_CPU, 0, 3),
+	MUX(MOUT_CLKCMU_AUD_NOC, "mout_clkcmu_aud_noc",
+	    mout_clkcmu_aud_noc_p, CLK_CON_MUX_MUX_CLKCMU_AUD_NOC, 0, 2),
+
+	/* CPUCL0 */
+	MUX(MOUT_CLKCMU_CPUCL0_SWITCH, "mout_clkcmu_cpucl0_switch",
+	    mout_clkcmu_cpucl0_switch_p, CLK_CON_MUX_MUX_CLKCMU_CPUCL0_SWITCH,
+	    0, 2),
+	MUX(MOUT_CLKCMU_CPUCL0_CLUSTER, "mout_clkcmu_cpucl0_cluster",
+	    mout_clkcmu_cpucl0_cluster_p, CLK_CON_MUX_MUX_CLKCMU_CPUCL0_CLUSTER,
+	    0, 3),
+	MUX(MOUT_CLKCMU_CPUCL0_DBG, "mout_clkcmu_cpucl0_dbg",
+	    mout_clkcmu_cpucl0_dbg_p, CLK_CON_MUX_MUX_CLKCMU_CPUCL0_DBG,
+	    0, 2),
+
+	/* CPUCL1 */
+	MUX(MOUT_CLKCMU_CPUCL1_SWITCH, "mout_clkcmu_cpucl1_switch",
+	    mout_clkcmu_cpucl1_switch_p, CLK_CON_MUX_MUX_CLKCMU_CPUCL1_SWITCH,
+	    0, 2),
+	MUX(MOUT_CLKCMU_CPUCL1_CLUSTER, "mout_clkcmu_cpucl1_cluster",
+	    mout_clkcmu_cpucl1_cluster_p, CLK_CON_MUX_MUX_CLKCMU_CPUCL1_CLUSTER,
+	    0, 3),
+
+	/* CPUCL2 */
+	MUX(MOUT_CLKCMU_CPUCL2_SWITCH, "mout_clkcmu_cpucl2_switch",
+	    mout_clkcmu_cpucl2_switch_p, CLK_CON_MUX_MUX_CLKCMU_CPUCL2_SWITCH,
+	    0, 2),
+	MUX(MOUT_CLKCMU_CPUCL2_CLUSTER, "mout_clkcmu_cpucl2_cluster",
+	    mout_clkcmu_cpucl2_cluster_p, CLK_CON_MUX_MUX_CLKCMU_CPUCL2_CLUSTER,
+	    0, 3),
+
+	/* DNC */
+	MUX(MOUT_CLKCMU_DNC_NOC, "mout_clkcmu_dnc_noc",
+	    mout_clkcmu_dnc_noc_p, CLK_CON_MUX_MUX_CLKCMU_DNC_NOC, 0, 3),
+
+	/* DPTX */
+	MUX(MOUT_CLKCMU_DPTX_NOC, "mout_clkcmu_dptx_noc",
+	    mout_clkcmu_dptx_noc_p, CLK_CON_MUX_MUX_CLKCMU_DPTX_NOC, 0, 2),
+	MUX(MOUT_CLKCMU_DPTX_DPGTC, "mout_clkcmu_dptx_dpgtc",
+	    mout_clkcmu_dptx_dpgtc_p, CLK_CON_MUX_MUX_CLKCMU_DPTX_DPGTC, 0, 2),
+	MUX(MOUT_CLKCMU_DPTX_DPOSC, "mout_clkcmu_dptx_dposc",
+	    mout_clkcmu_dptx_dposc_p, CLK_CON_MUX_MUX_CLKCMU_DPTX_DPOSC, 0, 1),
+
+	/* DPUB */
+	MUX(MOUT_CLKCMU_DPUB_NOC, "mout_clkcmu_dpub_noc",
+	    mout_clkcmu_dpub_noc_p, CLK_CON_MUX_MUX_CLKCMU_DPUB_NOC, 0, 3),
+	MUX(MOUT_CLKCMU_DPUB_DSIM, "mout_clkcmu_dpub_dsim",
+	    mout_clkcmu_dpub_dsim_p, CLK_CON_MUX_MUX_CLKCMU_DPUB_DSIM, 0, 1),
+
+	/* DPUF */
+	MUX(MOUT_CLKCMU_DPUF0_NOC, "mout_clkcmu_dpuf0_noc",
+	    mout_clkcmu_dpuf_noc_p, CLK_CON_MUX_MUX_CLKCMU_DPUF0_NOC, 0, 3),
+	MUX(MOUT_CLKCMU_DPUF1_NOC, "mout_clkcmu_dpuf1_noc",
+	    mout_clkcmu_dpuf_noc_p, CLK_CON_MUX_MUX_CLKCMU_DPUF1_NOC, 0, 3),
+	MUX(MOUT_CLKCMU_DPUF2_NOC, "mout_clkcmu_dpuf2_noc",
+	    mout_clkcmu_dpuf_noc_p, CLK_CON_MUX_MUX_CLKCMU_DPUF2_NOC, 0, 3),
+
+	/* DSP */
+	MUX(MOUT_CLKCMU_DSP_NOC, "mout_clkcmu_dsp_noc",
+	    mout_clkcmu_dsp_noc_p, CLK_CON_MUX_MUX_CLKCMU_DSP_NOC, 0, 3),
+
+	/* G3D */
+	MUX(MOUT_CLKCMU_G3D_SWITCH, "mout_clkcmu_g3d_switch",
+	    mout_clkcmu_g3d_switch_p, CLK_CON_MUX_MUX_CLKCMU_G3D_SWITCH, 0, 2),
+	MUX(MOUT_CLKCMU_G3D_NOCP, "mout_clkcmu_g3d_nocp",
+	    mout_clkcmu_g3d_nocp_p, CLK_CON_MUX_MUX_CLKCMU_G3D_NOCP, 0, 2),
+
+	/* GNPU */
+	MUX(MOUT_CLKCMU_GNPU_NOC, "mout_clkcmu_gnpu_noc",
+	    mout_clkcmu_gnpu_noc_p, CLK_CON_MUX_MUX_CLKCMU_GNPU_NOC, 0, 3),
+
+	/* HSI0 */
+	MUX(MOUT_CLKCMU_HSI0_NOC, "mout_clkcmu_hsi0_noc",
+	    mout_clkcmu_hsi0_noc_p, CLK_CON_MUX_MUX_CLKCMU_HSI0_NOC, 0, 2),
+
+	/* HSI1 */
+	MUX(MOUT_CLKCMU_HSI1_NOC, "mout_clkcmu_hsi1_noc",
+	    mout_clkcmu_hsi1_noc_p, CLK_CON_MUX_MUX_CLKCMU_HSI1_NOC,
+	    0, 2),
+	MUX(MOUT_CLKCMU_HSI1_USBDRD, "mout_clkcmu_hsi1_usbdrd",
+	    mout_clkcmu_hsi1_usbdrd_p, CLK_CON_MUX_MUX_CLKCMU_HSI1_USBDRD,
+	    0, 2),
+	MUX(MOUT_CLKCMU_HSI1_MMC_CARD, "mout_clkcmu_hsi1_mmc_card",
+	    mout_clkcmu_hsi1_mmc_card_p, CLK_CON_MUX_MUX_CLKCMU_HSI1_MMC_CARD,
+	    0, 2),
+
+	/* HSI2 */
+	MUX(MOUT_CLKCMU_HSI2_NOC, "mout_clkcmu_hsi2_noc",
+	    mout_clkcmu_hsi2_noc_p, CLK_CON_MUX_MUX_CLKCMU_HSI2_NOC,
+	    0, 2),
+	MUX(MOUT_CLKCMU_HSI2_NOC_UFS, "mout_clkcmu_hsi2_noc_ufs",
+	    mout_clkcmu_hsi2_noc_ufs_p, CLK_CON_MUX_MUX_CLKCMU_HSI2_NOC_UFS,
+	    0, 2),
+	MUX(MOUT_CLKCMU_HSI2_UFS_EMBD, "mout_clkcmu_hsi2_ufs_embd",
+	    mout_clkcmu_hsi2_ufs_embd_p, CLK_CON_MUX_MUX_CLKCMU_HSI2_UFS_EMBD,
+	    0, 2),
+	MUX(MOUT_CLKCMU_HSI2_ETHERNET, "mout_clkcmu_hsi2_ethernet",
+	    mout_clkcmu_hsi2_ethernet_p, CLK_CON_MUX_MUX_CLKCMU_HSI2_ETHERNET,
+	    0, 2),
+
+	/* ISP */
+	MUX(MOUT_CLKCMU_ISP_NOC, "mout_clkcmu_isp_noc",
+	    mout_clkcmu_isp_noc_p, CLK_CON_MUX_MUX_CLKCMU_ISP_NOC, 0, 3),
+
+	/* M2M */
+	MUX(MOUT_CLKCMU_M2M_NOC, "mout_clkcmu_m2m_noc",
+	    mout_clkcmu_m2m_noc_p, CLK_CON_MUX_MUX_CLKCMU_M2M_NOC, 0, 2),
+	MUX(MOUT_CLKCMU_M2M_JPEG, "mout_clkcmu_m2m_jpeg",
+	    mout_clkcmu_m2m_jpeg_p, CLK_CON_MUX_MUX_CLKCMU_M2M_JPEG, 0, 2),
+
+	/* MFC */
+	MUX(MOUT_CLKCMU_MFC_MFC, "mout_clkcmu_mfc_mfc",
+	    mout_clkcmu_mfc_mfc_p, CLK_CON_MUX_MUX_CLKCMU_MFC_MFC, 0, 2),
+	MUX(MOUT_CLKCMU_MFC_WFD, "mout_clkcmu_mfc_wfd",
+	    mout_clkcmu_mfc_wfd_p, CLK_CON_MUX_MUX_CLKCMU_MFC_WFD, 0, 2),
+
+	/* MFD */
+	MUX(MOUT_CLKCMU_MFD_NOC, "mout_clkcmu_mfd_noc",
+	    mout_clkcmu_mfd_noc_p, CLK_CON_MUX_MUX_CLKCMU_MFD_NOC, 0, 3),
+
+	/* MIF */
+	MUX(MOUT_CLKCMU_MIF_SWITCH, "mout_clkcmu_mif_switch",
+	    mout_clkcmu_mif_switch_p, CLK_CON_MUX_MUX_CLKCMU_MIF_SWITCH, 0, 3),
+	MUX(MOUT_CLKCMU_MIF_NOCP, "mout_clkcmu_mif_nocp",
+	    mout_clkcmu_mif_nocp_p, CLK_CON_MUX_MUX_CLKCMU_MIF_NOCP, 0, 2),
+
+	/* MISC */
+	MUX(MOUT_CLKCMU_MISC_NOC, "mout_clkcmu_misc_noc",
+	    mout_clkcmu_misc_noc_p, CLK_CON_MUX_MUX_CLKCMU_MISC_NOC, 0, 2),
+
+	/* NOCL0 */
+	MUX(MOUT_CLKCMU_NOCL0_NOC, "mout_clkcmu_nocl0_noc",
+	    mout_clkcmu_nocl0_noc_p, CLK_CON_MUX_MUX_CLKCMU_NOCL0_NOC, 0, 3),
+
+	/* NOCL1 */
+	MUX(MOUT_CLKCMU_NOCL1_NOC, "mout_clkcmu_nocl1_noc",
+	    mout_clkcmu_nocl1_noc_p, CLK_CON_MUX_MUX_CLKCMU_NOCL1_NOC, 0, 3),
+
+	/* NOCL2 */
+	MUX(MOUT_CLKCMU_NOCL2_NOC, "mout_clkcmu_nocl2_noc",
+	    mout_clkcmu_nocl2_noc_p, CLK_CON_MUX_MUX_CLKCMU_NOCL2_NOC, 0, 3),
+
+	/* PERIC0 */
+	MUX(MOUT_CLKCMU_PERIC0_NOC, "mout_clkcmu_peric0_noc",
+	    mout_clkcmu_peric0_noc_p, CLK_CON_MUX_MUX_CLKCMU_PERIC0_NOC, 0, 1),
+	MUX(MOUT_CLKCMU_PERIC0_IP, "mout_clkcmu_peric0_ip",
+	    mout_clkcmu_peric0_ip_p, CLK_CON_MUX_MUX_CLKCMU_PERIC0_IP, 0, 1),
+
+	/* PERIC1 */
+	MUX(MOUT_CLKCMU_PERIC1_NOC, "mout_clkcmu_peric1_noc",
+	    mout_clkcmu_peric1_noc_p, CLK_CON_MUX_MUX_CLKCMU_PERIC1_NOC, 0, 1),
+	MUX(MOUT_CLKCMU_PERIC1_IP, "mout_clkcmu_peric1_ip",
+	    mout_clkcmu_peric1_ip_p, CLK_CON_MUX_MUX_CLKCMU_PERIC1_IP, 0, 1),
+
+	/* SDMA */
+	MUX(MOUT_CLKCMU_SDMA_NOC, "mout_clkcmu_sdma_noc",
+	    mout_clkcmu_sdma_noc_p, CLK_CON_MUX_MUX_CLKCMU_SDMA_NOC, 0, 3),
+
+	/* SNW */
+	MUX(MOUT_CLKCMU_SNW_NOC, "mout_clkcmu_snw_noc",
+	    mout_clkcmu_snw_noc_p, CLK_CON_MUX_MUX_CLKCMU_SNW_NOC, 0, 3),
+
+	/* SSP */
+	MUX(MOUT_CLKCMU_SSP_NOC, "mout_clkcmu_ssp_noc",
+	    mout_clkcmu_ssp_noc_p, CLK_CON_MUX_MUX_CLKCMU_SSP_NOC, 0, 2),
+
+	/* TAA */
+	MUX(MOUT_CLKCMU_TAA_NOC, "mout_clkcmu_taa_noc",
+	    mout_clkcmu_taa_noc_p, CLK_CON_MUX_MUX_CLKCMU_TAA_NOC, 0, 3),
+};
+
+static const struct samsung_div_clock top_div_clks[] __initconst = {
+	/* CMU_TOP_PURECLKCOMP */
+
+	/* BOOST */
+	DIV(DOUT_CLKCMU_CMU_BOOST, "dout_clkcmu_cmu_boost",
+	    "mout_clkcmu_cmu_boost", CLK_CON_DIV_DIV_CLKCMU_CMU_BOOST, 0, 2),
+
+	/* ACC */
+	DIV(DOUT_CLKCMU_ACC_NOC, "dout_clkcmu_acc_noc",
+	    "mout_clkcmu_acc_noc", CLK_CON_DIV_CLKCMU_ACC_NOC, 0, 4),
+	DIV(DOUT_CLKCMU_ACC_ORB, "dout_clkcmu_acc_orb",
+	    "mout_clkcmu_acc_orb", CLK_CON_DIV_CLKCMU_ACC_ORB, 0, 4),
+
+	/* APM */
+	DIV(DOUT_CLKCMU_APM_NOC, "dout_clkcmu_apm_noc",
+	    "mout_clkcmu_apm_noc", CLK_CON_DIV_CLKCMU_APM_NOC, 0, 3),
+
+	/* AUD */
+	DIV(DOUT_CLKCMU_AUD_CPU, "dout_clkcmu_aud_cpu",
+	    "mout_clkcmu_aud_cpu", CLK_CON_DIV_CLKCMU_AUD_CPU, 0, 3),
+	DIV(DOUT_CLKCMU_AUD_NOC, "dout_clkcmu_aud_noc",
+	    "mout_clkcmu_aud_noc", CLK_CON_DIV_CLKCMU_AUD_NOC, 0, 4),
+
+	/* CPUCL0 */
+	DIV(DOUT_CLKCMU_CPUCL0_SWITCH, "dout_clkcmu_cpucl0_switch",
+	    "mout_clkcmu_cpucl0_switch",
+	    CLK_CON_DIV_CLKCMU_CPUCL0_SWITCH, 0, 3),
+	DIV(DOUT_CLKCMU_CPUCL0_CLUSTER, "dout_clkcmu_cpucl0_cluster",
+	    "mout_clkcmu_cpucl0_cluster",
+	    CLK_CON_DIV_CLKCMU_CPUCL0_CLUSTER, 0, 3),
+	DIV(DOUT_CLKCMU_CPUCL0_DBG, "dout_clkcmu_cpucl0_dbg",
+	    "mout_clkcmu_cpucl0_dbg",
+	    CLK_CON_DIV_CLKCMU_CPUCL0_DBG, 0, 4),
+
+	/* CPUCL1 */
+	DIV(DOUT_CLKCMU_CPUCL1_SWITCH, "dout_clkcmu_cpucl1_switch",
+	    "mout_clkcmu_cpucl1_switch",
+	    CLK_CON_DIV_CLKCMU_CPUCL1_SWITCH, 0, 3),
+	DIV(DOUT_CLKCMU_CPUCL1_CLUSTER, "dout_clkcmu_cpucl1_cluster",
+	    "mout_clkcmu_cpucl1_cluster",
+	    CLK_CON_DIV_CLKCMU_CPUCL1_CLUSTER, 0, 3),
+
+	/* CPUCL2 */
+	DIV(DOUT_CLKCMU_CPUCL2_SWITCH, "dout_clkcmu_cpucl2_switch",
+	    "mout_clkcmu_cpucl2_switch",
+	    CLK_CON_DIV_CLKCMU_CPUCL2_SWITCH, 0, 3),
+	DIV(DOUT_CLKCMU_CPUCL2_CLUSTER, "dout_clkcmu_cpucl2_cluster",
+	    "mout_clkcmu_cpucl2_cluster",
+	    CLK_CON_DIV_CLKCMU_CPUCL2_CLUSTER, 0, 3),
+
+	/* DNC */
+	DIV(DOUT_CLKCMU_DNC_NOC, "dout_clkcmu_dnc_noc",
+	    "mout_clkcmu_dnc_noc", CLK_CON_DIV_CLKCMU_DNC_NOC, 0, 4),
+
+	/* DPTX */
+	DIV(DOUT_CLKCMU_DPTX_NOC, "dout_clkcmu_dptx_noc",
+	    "mout_clkcmu_dptx_noc", CLK_CON_DIV_CLKCMU_DPTX_NOC, 0, 4),
+	DIV(DOUT_CLKCMU_DPTX_DPGTC, "dout_clkcmu_dptx_dpgtc",
+	    "mout_clkcmu_dptx_dpgtc", CLK_CON_DIV_CLKCMU_DPTX_DPGTC, 0, 3),
+	DIV(DOUT_CLKCMU_DPTX_DPOSC, "dout_clkcmu_dptx_dposc",
+	    "mout_clkcmu_dptx_dposc", CLK_CON_DIV_CLKCMU_DPTX_DPOSC, 0, 5),
+
+	/* DPUB */
+	DIV(DOUT_CLKCMU_DPUB_NOC, "dout_clkcmu_dpub_noc",
+	    "mout_clkcmu_dpub_noc", CLK_CON_DIV_CLKCMU_DPUB_NOC, 0, 4),
+	DIV(DOUT_CLKCMU_DPUB_DSIM, "dout_clkcmu_dpub_dsim",
+	    "mout_clkcmu_dpub_dsim", CLK_CON_DIV_CLKCMU_DPUB_DSIM, 0, 4),
+
+	/* DPUF */
+	DIV(DOUT_CLKCMU_DPUF0_NOC, "dout_clkcmu_dpuf0_noc",
+	    "mout_clkcmu_dpuf0_noc", CLK_CON_DIV_CLKCMU_DPUF0_NOC, 0, 4),
+	DIV(DOUT_CLKCMU_DPUF1_NOC, "dout_clkcmu_dpuf1_noc",
+	    "mout_clkcmu_dpuf1_noc", CLK_CON_DIV_CLKCMU_DPUF1_NOC, 0, 4),
+	DIV(DOUT_CLKCMU_DPUF2_NOC, "dout_clkcmu_dpuf2_noc",
+	    "mout_clkcmu_dpuf2_noc", CLK_CON_DIV_CLKCMU_DPUF2_NOC, 0, 4),
+
+	/* DSP */
+	DIV(DOUT_CLKCMU_DSP_NOC, "dout_clkcmu_dsp_noc",
+	    "mout_clkcmu_dsp_noc", CLK_CON_DIV_CLKCMU_DSP_NOC, 0, 4),
+
+	/* G3D */
+	DIV(DOUT_CLKCMU_G3D_SWITCH, "dout_clkcmu_g3d_switch",
+	    "mout_clkcmu_g3d_switch", CLK_CON_DIV_CLKCMU_G3D_SWITCH, 0, 3),
+	DIV(DOUT_CLKCMU_G3D_NOCP, "dout_clkcmu_g3d_nocp",
+	    "mout_clkcmu_g3d_nocp", CLK_CON_DIV_CLKCMU_G3D_NOCP, 0, 3),
+
+	/* GNPU */
+	DIV(DOUT_CLKCMU_GNPU_NOC, "dout_clkcmu_gnpu_noc",
+	    "mout_clkcmu_gnpu_noc", CLK_CON_DIV_CLKCMU_GNPU_NOC, 0, 4),
+
+	/* HSI0 */
+	DIV(DOUT_CLKCMU_HSI0_NOC, "dout_clkcmu_hsi0_noc",
+	    "mout_clkcmu_hsi0_noc", CLK_CON_DIV_CLKCMU_HSI0_NOC, 0, 4),
+
+	/* HSI1 */
+	DIV(DOUT_CLKCMU_HSI1_NOC, "dout_clkcmu_hsi1_noc",
+	    "mout_clkcmu_hsi1_noc", CLK_CON_DIV_CLKCMU_HSI1_NOC, 0, 4),
+	DIV(DOUT_CLKCMU_HSI1_USBDRD, "dout_clkcmu_hsi1_usbdrd",
+	    "mout_clkcmu_hsi1_usbdrd", CLK_CON_DIV_CLKCMU_HSI1_USBDRD, 0, 4),
+	DIV(DOUT_CLKCMU_HSI1_MMC_CARD, "dout_clkcmu_hsi1_mmc_card",
+	    "mout_clkcmu_hsi1_mmc_card", CLK_CON_DIV_CLKCMU_HSI1_MMC_CARD, 0, 9),
+
+	/* HSI2 */
+	DIV(DOUT_CLKCMU_HSI2_NOC, "dout_clkcmu_hsi2_noc",
+	    "mout_clkcmu_hsi2_noc", CLK_CON_DIV_CLKCMU_HSI2_NOC, 0, 4),
+	DIV(DOUT_CLKCMU_HSI2_NOC_UFS, "dout_clkcmu_hsi2_noc_ufs",
+	    "mout_clkcmu_hsi2_noc_ufs", CLK_CON_DIV_CLKCMU_HSI2_NOC_UFS, 0, 4),
+	DIV(DOUT_CLKCMU_HSI2_UFS_EMBD, "dout_clkcmu_hsi2_ufs_embd",
+	    "mout_clkcmu_hsi2_ufs_embd", CLK_CON_DIV_CLKCMU_HSI2_UFS_EMBD, 0, 3),
+	DIV(DOUT_CLKCMU_HSI2_ETHERNET, "dout_clkcmu_hsi2_ethernet",
+	    "mout_clkcmu_hsi2_ethernet", CLK_CON_DIV_CLKCMU_HSI2_ETHERNET, 0, 3),
+
+	/* ISP */
+	DIV(DOUT_CLKCMU_ISP_NOC, "dout_clkcmu_isp_noc",
+	    "mout_clkcmu_isp_noc", CLK_CON_DIV_CLKCMU_ISP_NOC, 0, 4),
+
+	/* M2M */
+	DIV(DOUT_CLKCMU_M2M_NOC, "dout_clkcmu_m2m_noc",
+	    "mout_clkcmu_m2m_noc", CLK_CON_DIV_CLKCMU_M2M_NOC, 0, 4),
+	DIV(DOUT_CLKCMU_M2M_JPEG, "dout_clkcmu_m2m_jpeg",
+	    "mout_clkcmu_m2m_jpeg", CLK_CON_DIV_CLKCMU_M2M_JPEG, 0, 4),
+
+	/* MFC */
+	DIV(DOUT_CLKCMU_MFC_MFC, "dout_clkcmu_mfc_mfc",
+	    "mout_clkcmu_mfc_mfc", CLK_CON_DIV_CLKCMU_MFC_MFC, 0, 4),
+	DIV(DOUT_CLKCMU_MFC_WFD, "dout_clkcmu_mfc_wfd",
+	    "mout_clkcmu_mfc_wfd", CLK_CON_DIV_CLKCMU_MFC_WFD, 0, 4),
+
+	/* MFD */
+	DIV(DOUT_CLKCMU_MFD_NOC, "dout_clkcmu_mfd_noc",
+	    "mout_clkcmu_mfd_noc", CLK_CON_DIV_CLKCMU_MFD_NOC, 0, 4),
+
+	/* MIF */
+	DIV(DOUT_CLKCMU_MIF_NOCP, "dout_clkcmu_mif_nocp",
+	    "mout_clkcmu_mif_nocp", CLK_CON_DIV_CLKCMU_MIF_NOCP, 0, 4),
+
+	/* MISC */
+	DIV(DOUT_CLKCMU_MISC_NOC, "dout_clkcmu_misc_noc",
+	    "mout_clkcmu_misc_noc", CLK_CON_DIV_CLKCMU_MISC_NOC, 0, 4),
+
+	/* NOCL0 */
+	DIV(DOUT_CLKCMU_NOCL0_NOC, "dout_clkcmu_nocl0_noc",
+	    "mout_clkcmu_nocl0_noc", CLK_CON_DIV_CLKCMU_NOCL0_NOC, 0, 4),
+
+	/* NOCL1 */
+	DIV(DOUT_CLKCMU_NOCL1_NOC, "dout_clkcmu_nocl1_noc",
+	    "mout_clkcmu_nocl1_noc", CLK_CON_DIV_CLKCMU_NOCL1_NOC, 0, 4),
+
+	/* NOCL2 */
+	DIV(DOUT_CLKCMU_NOCL2_NOC, "dout_clkcmu_nocl2_noc",
+	    "mout_clkcmu_nocl2_noc", CLK_CON_DIV_CLKCMU_NOCL2_NOC, 0, 4),
+
+	/* PERIC0 */
+	DIV(DOUT_CLKCMU_PERIC0_NOC, "dout_clkcmu_peric0_noc",
+	    "mout_clkcmu_peric0_noc", CLK_CON_DIV_CLKCMU_PERIC0_NOC, 0, 4),
+	DIV(DOUT_CLKCMU_PERIC0_IP, "dout_clkcmu_peric0_ip",
+	    "mout_clkcmu_peric0_ip", CLK_CON_DIV_CLKCMU_PERIC0_IP, 0, 4),
+
+	/* PERIC1 */
+	DIV(DOUT_CLKCMU_PERIC1_NOC, "dout_clkcmu_peric1_noc",
+	    "mout_clkcmu_peric1_noc", CLK_CON_DIV_CLKCMU_PERIC1_NOC, 0, 4),
+	DIV(DOUT_CLKCMU_PERIC1_IP, "dout_clkcmu_peric1_ip",
+	    "mout_clkcmu_peric1_ip", CLK_CON_DIV_CLKCMU_PERIC1_IP, 0, 4),
+
+	/* SDMA */
+	DIV(DOUT_CLKCMU_SDMA_NOC, "dout_clkcmu_sdma_noc",
+	    "mout_clkcmu_sdma_noc", CLK_CON_DIV_CLKCMU_SDMA_NOC, 0, 4),
+
+	/* SNW */
+	DIV(DOUT_CLKCMU_SNW_NOC, "dout_clkcmu_snw_noc",
+	    "mout_clkcmu_snw_noc", CLK_CON_DIV_CLKCMU_SNW_NOC, 0, 4),
+
+	/* SSP */
+	DIV(DOUT_CLKCMU_SSP_NOC, "dout_clkcmu_ssp_noc",
+	    "mout_clkcmu_ssp_noc", CLK_CON_DIV_CLKCMU_SSP_NOC, 0, 4),
+
+	/* TAA */
+	DIV(DOUT_CLKCMU_TAA_NOC, "dout_clkcmu_taa_noc",
+	    "mout_clkcmu_taa_noc", CLK_CON_DIV_CLKCMU_TAA_NOC, 0, 4),
+};
+
+static const struct samsung_fixed_factor_clock top_fixed_factor_clks[] __initconst = {
+	FFACTOR(DOUT_SHARED0_DIV1, "dout_shared0_div1",
+		"mout_shared0_pll", 1, 1, 0),
+	FFACTOR(DOUT_SHARED0_DIV2, "dout_shared0_div2",
+		"mout_shared0_pll", 1, 2, 0),
+	FFACTOR(DOUT_SHARED0_DIV3, "dout_shared0_div3",
+		"mout_shared0_pll", 1, 3, 0),
+	FFACTOR(DOUT_SHARED0_DIV4, "dout_shared0_div4",
+		"mout_shared0_pll", 1, 4, 0),
+	FFACTOR(DOUT_SHARED1_DIV1, "dout_shared1_div1",
+		"mout_shared1_pll", 1, 1, 0),
+	FFACTOR(DOUT_SHARED1_DIV2, "dout_shared1_div2",
+		"mout_shared1_pll", 1, 2, 0),
+	FFACTOR(DOUT_SHARED1_DIV3, "dout_shared1_div3",
+		"mout_shared1_pll", 1, 3, 0),
+	FFACTOR(DOUT_SHARED1_DIV4, "dout_shared1_div4",
+		"mout_shared1_pll", 1, 4, 0),
+	FFACTOR(DOUT_SHARED2_DIV1, "dout_shared2_div1",
+		"mout_shared2_pll", 1, 1, 0),
+	FFACTOR(DOUT_SHARED2_DIV2, "dout_shared2_div2",
+		"mout_shared2_pll", 1, 2, 0),
+	FFACTOR(DOUT_SHARED2_DIV3, "dout_shared2_div3",
+		"mout_shared2_pll", 1, 3, 0),
+	FFACTOR(DOUT_SHARED2_DIV4, "dout_shared2_div4",
+		"mout_shared2_pll", 1, 4, 0),
+	FFACTOR(DOUT_SHARED3_DIV1, "dout_shared3_div1",
+		"mout_shared3_pll", 1, 1, 0),
+	FFACTOR(DOUT_SHARED3_DIV2, "dout_shared3_div2",
+		"mout_shared3_pll", 1, 2, 0),
+	FFACTOR(DOUT_SHARED3_DIV3, "dout_shared3_div3",
+		"mout_shared3_pll", 1, 3, 0),
+	FFACTOR(DOUT_SHARED3_DIV4, "dout_shared3_div4",
+		"mout_shared3_pll", 1, 4, 0),
+	FFACTOR(DOUT_SHARED4_DIV1, "dout_shared4_div1",
+		"mout_shared4_pll", 1, 1, 0),
+	FFACTOR(DOUT_SHARED4_DIV2, "dout_shared4_div2",
+		"mout_shared4_pll", 1, 2, 0),
+	FFACTOR(DOUT_SHARED4_DIV3, "dout_shared4_div3",
+		"mout_shared4_pll", 1, 3, 0),
+	FFACTOR(DOUT_SHARED4_DIV4, "dout_shared4_div4",
+		"mout_shared4_pll", 1, 4, 0),
+	FFACTOR(DOUT_SHARED5_DIV1, "dout_shared5_div1",
+		"mout_shared5_pll", 1, 1, 0),
+	FFACTOR(DOUT_SHARED5_DIV2, "dout_shared5_div2",
+		"mout_shared5_pll", 1, 2, 0),
+	FFACTOR(DOUT_SHARED5_DIV3, "dout_shared5_div3",
+		"mout_shared5_pll", 1, 3, 0),
+	FFACTOR(DOUT_SHARED5_DIV4, "dout_shared5_div4",
+		"mout_shared5_pll", 1, 4, 0),
+};
+
+static const struct samsung_cmu_info top_cmu_info __initconst = {
+	.pll_clks		= top_pll_clks,
+	.nr_pll_clks		= ARRAY_SIZE(top_pll_clks),
+	.mux_clks		= top_mux_clks,
+	.nr_mux_clks		= ARRAY_SIZE(top_mux_clks),
+	.div_clks		= top_div_clks,
+	.nr_div_clks		= ARRAY_SIZE(top_div_clks),
+	.fixed_factor_clks	= top_fixed_factor_clks,
+	.nr_fixed_factor_clks	= ARRAY_SIZE(top_fixed_factor_clks),
+	.nr_clk_ids		= CLKS_NR_TOP,
+	.clk_regs		= top_clk_regs,
+	.nr_clk_regs		= ARRAY_SIZE(top_clk_regs),
+};
+
+static void __init exynosautov920_cmu_top_init(struct device_node *np)
+{
+	exynos_arm64_register_cmu(NULL, np, &top_cmu_info);
+}
+
+/* Register CMU_TOP early, as it's a dependency for other early domains */
+CLK_OF_DECLARE(exynosautov920_cmu_top, "samsung,exynosautov920-cmu-top",
+	       exynosautov920_cmu_top_init);
+
+/* ---- CMU_PERIC0 --------------------------------------------------------- */
+
+/* Register Offset definitions for CMU_PERIC0 (0x10800000) */
+#define PLL_CON0_MUX_CLKCMU_PERIC0_IP_USER	0x0600
+#define PLL_CON0_MUX_CLKCMU_PERIC0_NOC_USER	0x0610
+#define CLK_CON_MUX_MUX_CLK_PERIC0_I3C		0x1000
+#define CLK_CON_MUX_MUX_CLK_PERIC0_USI00_USI	0x1004
+#define CLK_CON_MUX_MUX_CLK_PERIC0_USI01_USI	0x1008
+#define CLK_CON_MUX_MUX_CLK_PERIC0_USI02_USI	0x100c
+#define CLK_CON_MUX_MUX_CLK_PERIC0_USI03_USI	0x1010
+#define CLK_CON_MUX_MUX_CLK_PERIC0_USI04_USI	0x1014
+#define CLK_CON_MUX_MUX_CLK_PERIC0_USI05_USI	0x1018
+#define CLK_CON_MUX_MUX_CLK_PERIC0_USI06_USI	0x101c
+#define CLK_CON_MUX_MUX_CLK_PERIC0_USI07_USI	0x1020
+#define CLK_CON_MUX_MUX_CLK_PERIC0_USI08_USI	0x1024
+#define CLK_CON_MUX_MUX_CLK_PERIC0_USI_I2C	0x1028
+#define CLK_CON_DIV_DIV_CLK_PERIC0_I3C		0x1800
+#define CLK_CON_DIV_DIV_CLK_PERIC0_USI00_USI	0x1804
+#define CLK_CON_DIV_DIV_CLK_PERIC0_USI01_USI	0x1808
+#define CLK_CON_DIV_DIV_CLK_PERIC0_USI02_USI	0x180c
+#define CLK_CON_DIV_DIV_CLK_PERIC0_USI03_USI	0x1810
+#define CLK_CON_DIV_DIV_CLK_PERIC0_USI04_USI	0x1814
+#define CLK_CON_DIV_DIV_CLK_PERIC0_USI05_USI	0x1818
+#define CLK_CON_DIV_DIV_CLK_PERIC0_USI06_USI	0x181c
+#define CLK_CON_DIV_DIV_CLK_PERIC0_USI07_USI	0x1820
+#define CLK_CON_DIV_DIV_CLK_PERIC0_USI08_USI	0x1824
+#define CLK_CON_DIV_DIV_CLK_PERIC0_USI_I2C	0x1828
+
+static const unsigned long peric0_clk_regs[] __initconst = {
+	PLL_CON0_MUX_CLKCMU_PERIC0_IP_USER,
+	PLL_CON0_MUX_CLKCMU_PERIC0_NOC_USER,
+	CLK_CON_MUX_MUX_CLK_PERIC0_I3C,
+	CLK_CON_MUX_MUX_CLK_PERIC0_USI00_USI,
+	CLK_CON_MUX_MUX_CLK_PERIC0_USI01_USI,
+	CLK_CON_MUX_MUX_CLK_PERIC0_USI02_USI,
+	CLK_CON_MUX_MUX_CLK_PERIC0_USI03_USI,
+	CLK_CON_MUX_MUX_CLK_PERIC0_USI04_USI,
+	CLK_CON_MUX_MUX_CLK_PERIC0_USI05_USI,
+	CLK_CON_MUX_MUX_CLK_PERIC0_USI06_USI,
+	CLK_CON_MUX_MUX_CLK_PERIC0_USI07_USI,
+	CLK_CON_MUX_MUX_CLK_PERIC0_USI08_USI,
+	CLK_CON_MUX_MUX_CLK_PERIC0_USI_I2C,
+	CLK_CON_DIV_DIV_CLK_PERIC0_I3C,
+	CLK_CON_DIV_DIV_CLK_PERIC0_USI00_USI,
+	CLK_CON_DIV_DIV_CLK_PERIC0_USI01_USI,
+	CLK_CON_DIV_DIV_CLK_PERIC0_USI02_USI,
+	CLK_CON_DIV_DIV_CLK_PERIC0_USI03_USI,
+	CLK_CON_DIV_DIV_CLK_PERIC0_USI04_USI,
+	CLK_CON_DIV_DIV_CLK_PERIC0_USI05_USI,
+	CLK_CON_DIV_DIV_CLK_PERIC0_USI06_USI,
+	CLK_CON_DIV_DIV_CLK_PERIC0_USI07_USI,
+	CLK_CON_DIV_DIV_CLK_PERIC0_USI08_USI,
+	CLK_CON_DIV_DIV_CLK_PERIC0_USI_I2C,
+};
+
+/* List of parent clocks for Muxes in CMU_PERIC0 */
+PNAME(mout_peric0_ip_user_p) = { "oscclk", "dout_clkcmu_peric0_ip" };
+PNAME(mout_peric0_noc_user_p) = { "oscclk", "dout_clkcmu_peric0_noc" };
+PNAME(mout_peric0_usi_p) = { "oscclk", "mout_peric0_ip_user" };
+
+static const struct samsung_mux_clock peric0_mux_clks[] __initconst = {
+	MUX(CLK_MOUT_PERIC0_IP_USER, "mout_peric0_ip_user",
+	    mout_peric0_ip_user_p, PLL_CON0_MUX_CLKCMU_PERIC0_IP_USER, 4, 1),
+	MUX(CLK_MOUT_PERIC0_NOC_USER, "mout_peric0_noc_user",
+	    mout_peric0_noc_user_p, PLL_CON0_MUX_CLKCMU_PERIC0_NOC_USER, 4, 1),
+	/* USI00 ~ USI08 */
+	MUX(CLK_MOUT_PERIC0_USI00_USI, "mout_peric0_usi00_usi",
+	    mout_peric0_usi_p, CLK_CON_MUX_MUX_CLK_PERIC0_USI00_USI, 0, 1),
+	MUX(CLK_MOUT_PERIC0_USI01_USI, "mout_peric0_usi01_usi",
+	    mout_peric0_usi_p, CLK_CON_MUX_MUX_CLK_PERIC0_USI01_USI, 0, 1),
+	MUX(CLK_MOUT_PERIC0_USI02_USI, "mout_peric0_usi02_usi",
+	    mout_peric0_usi_p, CLK_CON_MUX_MUX_CLK_PERIC0_USI02_USI, 0, 1),
+	MUX(CLK_MOUT_PERIC0_USI03_USI, "mout_peric0_usi03_usi",
+	    mout_peric0_usi_p, CLK_CON_MUX_MUX_CLK_PERIC0_USI03_USI, 0, 1),
+	MUX(CLK_MOUT_PERIC0_USI04_USI, "mout_peric0_usi04_usi",
+	    mout_peric0_usi_p, CLK_CON_MUX_MUX_CLK_PERIC0_USI04_USI, 0, 1),
+	MUX(CLK_MOUT_PERIC0_USI05_USI, "mout_peric0_usi05_usi",
+	    mout_peric0_usi_p, CLK_CON_MUX_MUX_CLK_PERIC0_USI05_USI, 0, 1),
+	MUX(CLK_MOUT_PERIC0_USI06_USI, "mout_peric0_usi06_usi",
+	    mout_peric0_usi_p, CLK_CON_MUX_MUX_CLK_PERIC0_USI06_USI, 0, 1),
+	MUX(CLK_MOUT_PERIC0_USI07_USI, "mout_peric0_usi07_usi",
+	    mout_peric0_usi_p, CLK_CON_MUX_MUX_CLK_PERIC0_USI07_USI, 0, 1),
+	MUX(CLK_MOUT_PERIC0_USI08_USI, "mout_peric0_usi08_usi",
+	    mout_peric0_usi_p, CLK_CON_MUX_MUX_CLK_PERIC0_USI08_USI, 0, 1),
+	/* USI_I2C */
+	MUX(CLK_MOUT_PERIC0_USI_I2C, "mout_peric0_usi_i2c",
+	    mout_peric0_usi_p, CLK_CON_MUX_MUX_CLK_PERIC0_USI_I2C, 0, 1),
+	/* USI_I3C */
+	MUX(CLK_MOUT_PERIC0_I3C, "mout_peric0_i3c",
+	    mout_peric0_usi_p, CLK_CON_MUX_MUX_CLK_PERIC0_I3C, 0, 1),
+};
+
+static const struct samsung_div_clock peric0_div_clks[] __initconst = {
+	/* USI00 ~ USI08 */
+	DIV(CLK_DOUT_PERIC0_USI00_USI, "dout_peric0_usi00_usi",
+	    "mout_peric0_usi00_usi", CLK_CON_DIV_DIV_CLK_PERIC0_USI00_USI,
+	    0, 4),
+	DIV(CLK_DOUT_PERIC0_USI01_USI, "dout_peric0_usi01_usi",
+	    "mout_peric0_usi01_usi", CLK_CON_DIV_DIV_CLK_PERIC0_USI01_USI,
+	    0, 4),
+	DIV(CLK_DOUT_PERIC0_USI02_USI, "dout_peric0_usi02_usi",
+	    "mout_peric0_usi02_usi", CLK_CON_DIV_DIV_CLK_PERIC0_USI02_USI,
+	    0, 4),
+	DIV(CLK_DOUT_PERIC0_USI03_USI, "dout_peric0_usi03_usi",
+	    "mout_peric0_usi03_usi", CLK_CON_DIV_DIV_CLK_PERIC0_USI03_USI,
+	    0, 4),
+	DIV(CLK_DOUT_PERIC0_USI04_USI, "dout_peric0_usi04_usi",
+	    "mout_peric0_usi04_usi", CLK_CON_DIV_DIV_CLK_PERIC0_USI04_USI,
+	    0, 4),
+	DIV(CLK_DOUT_PERIC0_USI05_USI, "dout_peric0_usi05_usi",
+	    "mout_peric0_usi05_usi", CLK_CON_DIV_DIV_CLK_PERIC0_USI05_USI,
+	    0, 4),
+	DIV(CLK_DOUT_PERIC0_USI06_USI, "dout_peric0_usi06_usi",
+	    "mout_peric0_usi06_usi", CLK_CON_DIV_DIV_CLK_PERIC0_USI06_USI,
+	    0, 4),
+	DIV(CLK_DOUT_PERIC0_USI07_USI, "dout_peric0_usi07_usi",
+	    "mout_peric0_usi07_usi", CLK_CON_DIV_DIV_CLK_PERIC0_USI07_USI,
+	    0, 4),
+	DIV(CLK_DOUT_PERIC0_USI08_USI, "dout_peric0_usi08_usi",
+	    "mout_peric0_usi08_usi", CLK_CON_DIV_DIV_CLK_PERIC0_USI08_USI,
+	    0, 4),
+	/* USI_I2C */
+	DIV(CLK_DOUT_PERIC0_USI_I2C, "dout_peric0_usi_i2c",
+	    "mout_peric0_usi_i2c", CLK_CON_DIV_DIV_CLK_PERIC0_USI_I2C, 0, 4),
+	/* USI_I3C */
+	DIV(CLK_DOUT_PERIC0_I3C, "dout_peric0_i3c",
+	    "mout_peric0_i3c", CLK_CON_DIV_DIV_CLK_PERIC0_I3C, 0, 4),
+};
+
+static const struct samsung_cmu_info peric0_cmu_info __initconst = {
+	.mux_clks		= peric0_mux_clks,
+	.nr_mux_clks		= ARRAY_SIZE(peric0_mux_clks),
+	.div_clks		= peric0_div_clks,
+	.nr_div_clks		= ARRAY_SIZE(peric0_div_clks),
+	.nr_clk_ids		= CLKS_NR_PERIC0,
+	.clk_regs		= peric0_clk_regs,
+	.nr_clk_regs		= ARRAY_SIZE(peric0_clk_regs),
+	.clk_name		= "dout_clkcmu_peric0_noc",
+};
+
+static int __init exynosautov920_cmu_probe(struct platform_device *pdev)
+{
+	const struct samsung_cmu_info *info;
+	struct device *dev = &pdev->dev;
+
+	info = of_device_get_match_data(dev);
+	exynos_arm64_register_cmu(dev, dev->of_node, info);
+
+	return 0;
+}
+
+static const struct of_device_id exynosautov920_cmu_of_match[] = {
+	{
+		.compatible = "samsung,exynosautov920-cmu-peric0",
+		.data = &peric0_cmu_info,
+	},
+};
+
+static struct platform_driver exynosautov920_cmu_driver __refdata = {
+	.driver = {
+		.name = "exynosautov920-cmu",
+		.of_match_table = exynosautov920_cmu_of_match,
+		.suppress_bind_attrs = true,
+	},
+	.probe = exynosautov920_cmu_probe,
+};
+
+static int __init exynosautov920_cmu_init(void)
+{
+	return platform_driver_register(&exynosautov920_cmu_driver);
+}
+core_initcall(exynosautov920_cmu_init);
-- 
2.45.2

