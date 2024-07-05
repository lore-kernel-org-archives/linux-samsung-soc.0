Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A9FF505
	for <linux-samsung-soc@vger.kernel.org>; Fri,  5 Jul 2024 02:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720145527; cv=none; b=oOgNiaf83PeUtriPr5E0wvMmO7dszrENE/96sOWET3R0Eyo8Cixf7DOLA4alOjqIUFrY58hrvzFzDhJA8HXy3jRDVghyxnjnMSpdeSXauR11X9KNu3gkXpxPLfVSlveXBzREZDVeev8zJ622l8xwSnaVfLAJ0byug7ILBHxCQ6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720145527; c=relaxed/simple;
	bh=4/t6YiMHZ0MZhEKpDxX+NPm2Mh1GX+WYLZQWTh+kpUU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=pElFOncQjBb9FM8ZwT5fxCzz++wG0nY/Eok6UvRuw1FVEWEx/ANjfIqJ1sXvCTl3QaOFk6ancesmEdA5LWPC/4oJA4gKpimI3mKhYViL7LLUoFep1p9rUoC9FibwScOP4/V0BGUVCZHpGWU/ul2kW5tSK9z19Gg72S5pWBHD4sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=gEhY+7/6; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="gEhY+7/6"
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20240705021203epoutp01a0f82ca59a6272dca7cc38f23135cb7f~fLz1Z_hgu2724727247epoutp01Y
	for <linux-samsung-soc@vger.kernel.org>; Fri,  5 Jul 2024 02:12:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20240705021203epoutp01a0f82ca59a6272dca7cc38f23135cb7f~fLz1Z_hgu2724727247epoutp01Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1720145523;
	bh=cVN5x6bXnx5dkYNSEl7oW+6okbBLJIrsabl3ccb288k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gEhY+7/6EiFXF8fgmannKBNBYRzYvpO6FM/ZHmVB3wL/KXRN8jML0enRUncaPJhSh
	 NP2R9G7yhHy3lkeI6LB6q8Y0t7gjkQ4tdL7HElu01pxtfiVfhoFm4wgEkd3ogjqLb+
	 GXFwx1ngmXd0Gvjg8PJ6gkbOwLCWDQTZWnZopBLU=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTP id
	20240705021201epcas2p4aeb58a4b240835281fa7726c898ced12~fLzzqgoLE1322213222epcas2p4c;
	Fri,  5 Jul 2024 02:12:01 +0000 (GMT)
Received: from epsmgec2p1-new.samsung.com (unknown [182.195.36.91]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4WFcTX5mWQz4x9QC; Fri,  5 Jul
	2024 02:12:00 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
	epsmgec2p1-new.samsung.com (Symantec Messaging Gateway) with SMTP id
	AE.CD.25328.07657866; Fri,  5 Jul 2024 11:12:00 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20240705021200epcas2p273ca089c2cb9882f121e864ec8407367~fLzysvrse2226622266epcas2p2E;
	Fri,  5 Jul 2024 02:12:00 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240705021200epsmtrp2df6b7c6da005805e5e386836a35c0bf7~fLzyr-qCH0904509045epsmtrp2K;
	Fri,  5 Jul 2024 02:12:00 +0000 (GMT)
X-AuditID: b6c32a4d-001ff700000262f0-07-66875670fbf1
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	ED.40.07412.07657866; Fri,  5 Jul 2024 11:12:00 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.60]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20240705021200epsmtip23a6bedf25da6b443ef1676d850ac94b5~fLzyg8A_c3133931339epsmtip2W;
	Fri,  5 Jul 2024 02:12:00 +0000 (GMT)
From: Sunyeal Hong <sunyeal.hong@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar
	<alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, Sunyeal Hong <sunyeal.hong@samsung.com>
Subject: [PATCH 2/5] dt-bindings: clock: add clock binding definitions for
 Exynos Auto v920
Date: Fri,  5 Jul 2024 11:11:07 +0900
Message-ID: <20240705021110.2495344-3-sunyeal.hong@samsung.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240705021110.2495344-1-sunyeal.hong@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOJsWRmVeSWpSXmKPExsWy7bCmqW5BWHuawaa/OhYP5m1js7j+5Tmr
	xfnzG9gtPvbcY7W4vGsOm8WM8/uYLC6ecrU4/Kad1eLftY0sFk3L1jM5cHm8v9HK7rFpVSeb
	R9+WVYwenzfJBbBEZdtkpCampBYppOYl56dk5qXbKnkHxzvHm5oZGOoaWlqYKynkJeam2iq5
	+AToumXmAN2jpFCWmFMKFApILC5W0rezKcovLUlVyMgvLrFVSi1IySkwL9ArTswtLs1L18tL
	LbEyNDAwMgUqTMjO2LdrA2vBNYuK+bensTQwfjHoYuTkkBAwkbj2ZAZLFyMXh5DAHkaJ5X+2
	MIIkhAQ+MUrsuhEPkfjGKHH/7UygKg6wjt4lvhDxvYwSrScXsEM4HxklOnsegRWxCehK/Pnn
	ABIXEfjOKNH/dh/YCmaBTkaJq0e3M4GsEBaIlVhy+DELiM0ioCrx++sBVpBmXgF7ia07HCHO
	k5e4uOY5G4jNKeAg8fwISAknUImgxMmZT8BamYFqmrfOZgaZLyHwl11i8ZkZ7BDNLhL/jh5m
	hrCFJV4d3wIVl5L4/G4vG4SdLzH5+lsmiOYGRolr/7qhGuwlFp35yQ5yELOApsT6XfoQ3ytL
	HLkFtZdPouPwX3aIMK9ER5sQRKOaxKcrl6GGyEgcO/GMGaLEQ+LU2VJIUE1mlHjXeoZxAqPC
	LCTfzELyzSyEvQsYmVcxSqUWFOempyYbFRjq5qWWw+M4OT93EyM4hWr57mB8vf6v3iFGJg7G
	Q4wSHMxKIrxS75vThHhTEiurUovy44tKc1KLDzGaAoN7IrOUaHI+MInnlcQbmlgamJiZGZob
	mRqYK4nz3mudmyIkkJ5YkpqdmlqQWgTTx8TBKdXAZPJ12ZSPcq4V3ps7pmyremGYtTCzOdtv
	ktFaU5/j8x+r8161mG64TJw7VD7n1Be3B79+z5634oDruehStbw3NjkXpA/XxLhOkLPY8+He
	tIkXkliO7D92L7D23I7G1jOXBVY8Xp/PLZv/WH/a+T0Sce32f+fbLBD8KzRvbbagi9S8l/m9
	e2PsJvje/8m6JnvFIq5q6aYEQfYrLJkf809zzHwnrsF4bIf+5Y7ooJ3G9gUpj5Z6i9kqHEl4
	v3xD4JSgOOe9zU3tvQkzVp0wEN1rvmny1NqKopodExV+JPlOZZ/w5Qbb/2PTF1922NH45Y2l
	g4eCxa5a5bbnRvfK4yXDlotPuP/T2PbYMR6jjhVL5ZVYijMSDbWYi4oTARDt1+wqBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPLMWRmVeSWpSXmKPExsWy7bCSvG5BWHuawZ1dfBYP5m1js7j+5Tmr
	xfnzG9gtPvbcY7W4vGsOm8WM8/uYLC6ecrU4/Kad1eLftY0sFk3L1jM5cHm8v9HK7rFpVSeb
	R9+WVYwenzfJBbBEcdmkpOZklqUW6dslcGXs27WBteCaRcX829NYGhi/GHQxcnBICJhI9C7x
	7WLk4hAS2M0ocXTLD5YuRk6guIzExob/7BC2sMT9liOsEEXvGSV2HOhjAWlmE9CV+PPPASQu
	IvCbUeLH3u+MIA6zQC+jxJ3b/5hAuoUFoiV+bj7GCGKzCKhK/P56gBWkmVfAXmLrDkeIBfIS
	F9c8ZwOxOQUcJJ4fASnhBFpmL9G17CbYQbwCghInZz4Bs5mB6pu3zmaewCgwC0lqFpLUAkam
	VYySqQXFuem5yYYFhnmp5XrFibnFpXnpesn5uZsYwWGupbGD8d78f3qHGJk4GA8xSnAwK4nw
	Sr1vThPiTUmsrEotyo8vKs1JLT7EKM3BoiTOazhjdoqQQHpiSWp2ampBahFMlomDU6qBiYNZ
	/CbDG4FbRVz3LmTpcz+PU3x9LvLzpneK4Y8O8HRyXTU1CLAQfv7378ek2el3lokKr23VzFM2
	8v608OvjYt0nk7c6LImx2LSyxYkz79hHTbUblxduXKLz+2FXtquy/CPO/VdftqpUBp1hk1oc
	8kqC17T7mmnwREfu7ZKdbUa/DBz5f3x7GK3qp1kys/TBtomHnqjOeP371dEnN4RT8wPOHxFp
	8GfYenf2bi8ZlXAFgd89Ao9n2Ii8nffUMOtLdw5vR8jaXkGbmnnPps4/pSZ4NujNU9ZG9Q0P
	rJOr7+/bVeGuwGka5STRt8/w1tYdB92bGhUPXuHbYGb2bOImT9YJsbbSh+qOR/FmdOY+UWIp
	zkg01GIuKk4EAEy2L2HiAgAA
X-CMS-MailID: 20240705021200epcas2p273ca089c2cb9882f121e864ec8407367
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240705021200epcas2p273ca089c2cb9882f121e864ec8407367
References: <20240705021110.2495344-1-sunyeal.hong@samsung.com>
	<CGME20240705021200epcas2p273ca089c2cb9882f121e864ec8407367@epcas2p2.samsung.com>

Add device tree clock binding definitions for below CMU blocks.

- CMU_TOP
- CMU_PERIC0

Signed-off-by: Sunyeal Hong <sunyeal.hong@samsung.com>
---
 .../clock/samsung,exynosautov920.h            | 191 ++++++++++++++++++
 1 file changed, 191 insertions(+)
 create mode 100644 include/dt-bindings/clock/samsung,exynosautov920.h

diff --git a/include/dt-bindings/clock/samsung,exynosautov920.h b/include/dt-bindings/clock/samsung,exynosautov920.h
new file mode 100644
index 000000000000..bbddf7583e61
--- /dev/null
+++ b/include/dt-bindings/clock/samsung,exynosautov920.h
@@ -0,0 +1,191 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2024 Samsung Electronics Co., Ltd.
+ * Author: Sunyeal Hong <sunyeal.hong@samsung.com>
+ *
+ * Device Tree binding constants for Exynos Auto V209 clock controller.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_EXYNOSAUTOV920_H
+#define _DT_BINDINGS_CLOCK_EXYNOSAUTOV920_H
+
+/* CMU_TOP */
+#define FOUT_SHARED0_PLL		1
+#define FOUT_SHARED1_PLL		2
+#define FOUT_SHARED2_PLL		3
+#define FOUT_SHARED3_PLL		4
+#define FOUT_SHARED4_PLL		5
+#define FOUT_SHARED5_PLL		6
+#define FOUT_MMC_PLL			7
+
+/* MUX in CMU_TOP */
+#define MOUT_SHARED0_PLL		101
+#define MOUT_SHARED1_PLL		102
+#define MOUT_SHARED2_PLL		103
+#define MOUT_SHARED3_PLL		104
+#define MOUT_SHARED4_PLL		105
+#define MOUT_SHARED5_PLL		106
+#define MOUT_MMC_PLL			107
+#define MOUT_CLKCMU_CMU_BOOST		108
+#define MOUT_CLKCMU_CMU_CMUREF		109
+#define MOUT_CLKCMU_ACC_NOC		110
+#define MOUT_CLKCMU_ACC_ORB		111
+#define MOUT_CLKCMU_APM_NOC		112
+#define MOUT_CLKCMU_AUD_CPU		113
+#define MOUT_CLKCMU_AUD_NOC		114
+#define MOUT_CLKCMU_CPUCL0_SWITCH	115
+#define MOUT_CLKCMU_CPUCL0_CLUSTER	116
+#define MOUT_CLKCMU_CPUCL0_DBG		117
+#define MOUT_CLKCMU_CPUCL1_SWITCH	118
+#define MOUT_CLKCMU_CPUCL1_CLUSTER	119
+#define MOUT_CLKCMU_CPUCL2_SWITCH	120
+#define MOUT_CLKCMU_CPUCL2_CLUSTER	121
+#define MOUT_CLKCMU_DNC_NOC		122
+#define MOUT_CLKCMU_DPTX_NOC		123
+#define MOUT_CLKCMU_DPTX_DPGTC		124
+#define MOUT_CLKCMU_DPTX_DPOSC		125
+#define MOUT_CLKCMU_DPUB_NOC		126
+#define MOUT_CLKCMU_DPUB_DSIM		127
+#define MOUT_CLKCMU_DPUF0_NOC		128
+#define MOUT_CLKCMU_DPUF1_NOC		129
+#define MOUT_CLKCMU_DPUF2_NOC		130
+#define MOUT_CLKCMU_DSP_NOC		131
+#define MOUT_CLKCMU_G3D_SWITCH		132
+#define MOUT_CLKCMU_G3D_NOCP		133
+#define MOUT_CLKCMU_GNPU_NOC		134
+#define MOUT_CLKCMU_HSI0_NOC		135
+#define MOUT_CLKCMU_HSI1_NOC		136
+#define MOUT_CLKCMU_HSI1_USBDRD		137
+#define MOUT_CLKCMU_HSI1_MMC_CARD	138
+#define MOUT_CLKCMU_HSI2_NOC		139
+#define MOUT_CLKCMU_HSI2_NOC_UFS	140
+#define MOUT_CLKCMU_HSI2_UFS_EMBD	141
+#define MOUT_CLKCMU_HSI2_ETHERNET	142
+#define MOUT_CLKCMU_ISP_NOC		143
+#define MOUT_CLKCMU_M2M_NOC		144
+#define MOUT_CLKCMU_M2M_JPEG		145
+#define MOUT_CLKCMU_MFC_MFC		146
+#define MOUT_CLKCMU_MFC_WFD		147
+#define MOUT_CLKCMU_MFD_NOC		148
+#define MOUT_CLKCMU_MIF_SWITCH		149
+#define MOUT_CLKCMU_MIF_NOCP		150
+#define MOUT_CLKCMU_MISC_NOC		151
+#define MOUT_CLKCMU_NOCL0_NOC		152
+#define MOUT_CLKCMU_NOCL1_NOC		153
+#define MOUT_CLKCMU_NOCL2_NOC		154
+#define MOUT_CLKCMU_PERIC0_NOC		155
+#define MOUT_CLKCMU_PERIC0_IP		156
+#define MOUT_CLKCMU_PERIC1_NOC		157
+#define MOUT_CLKCMU_PERIC1_IP		158
+#define MOUT_CLKCMU_SDMA_NOC		159
+#define MOUT_CLKCMU_SNW_NOC		160
+#define MOUT_CLKCMU_SSP_NOC		161
+#define MOUT_CLKCMU_TAA_NOC		162
+
+/* DIV in CMU_TOP */
+#define DOUT_SHARED0_DIV1		201
+#define DOUT_SHARED0_DIV2		202
+#define DOUT_SHARED0_DIV3		203
+#define DOUT_SHARED0_DIV4		204
+#define DOUT_SHARED1_DIV1		205
+#define DOUT_SHARED1_DIV2		206
+#define DOUT_SHARED1_DIV3		207
+#define DOUT_SHARED1_DIV4		208
+#define DOUT_SHARED2_DIV1		209
+#define DOUT_SHARED2_DIV2		210
+#define DOUT_SHARED2_DIV3		211
+#define DOUT_SHARED2_DIV4		212
+#define DOUT_SHARED3_DIV1		213
+#define DOUT_SHARED3_DIV2		214
+#define DOUT_SHARED3_DIV3		215
+#define DOUT_SHARED3_DIV4		216
+#define DOUT_SHARED4_DIV1		217
+#define DOUT_SHARED4_DIV2		218
+#define DOUT_SHARED4_DIV3		219
+#define DOUT_SHARED4_DIV4		220
+#define DOUT_SHARED5_DIV1		221
+#define DOUT_SHARED5_DIV2		222
+#define DOUT_SHARED5_DIV3		223
+#define DOUT_SHARED5_DIV4		224
+#define DOUT_CLKCMU_CMU_BOOST		225
+#define DOUT_CLKCMU_ACC_NOC		226
+#define DOUT_CLKCMU_ACC_ORB		227
+#define DOUT_CLKCMU_APM_NOC		228
+#define DOUT_CLKCMU_AUD_CPU		229
+#define DOUT_CLKCMU_AUD_NOC		230
+#define DOUT_CLKCMU_CPUCL0_SWITCH	231
+#define DOUT_CLKCMU_CPUCL0_CLUSTER	232
+#define DOUT_CLKCMU_CPUCL0_DBG		233
+#define DOUT_CLKCMU_CPUCL1_SWITCH	234
+#define DOUT_CLKCMU_CPUCL1_CLUSTER	235
+#define DOUT_CLKCMU_CPUCL2_SWITCH	236
+#define DOUT_CLKCMU_CPUCL2_CLUSTER	237
+#define DOUT_CLKCMU_DNC_NOC		238
+#define DOUT_CLKCMU_DPTX_NOC		239
+#define DOUT_CLKCMU_DPTX_DPGTC		240
+#define DOUT_CLKCMU_DPTX_DPOSC		241
+#define DOUT_CLKCMU_DPUB_NOC		242
+#define DOUT_CLKCMU_DPUB_DSIM		243
+#define DOUT_CLKCMU_DPUF0_NOC		244
+#define DOUT_CLKCMU_DPUF1_NOC		245
+#define DOUT_CLKCMU_DPUF2_NOC		246
+#define DOUT_CLKCMU_DSP_NOC		247
+#define DOUT_CLKCMU_G3D_SWITCH		248
+#define DOUT_CLKCMU_G3D_NOCP		249
+#define DOUT_CLKCMU_GNPU_NOC		250
+#define DOUT_CLKCMU_HSI0_NOC		251
+#define DOUT_CLKCMU_HSI1_NOC		252
+#define DOUT_CLKCMU_HSI1_USBDRD		253
+#define DOUT_CLKCMU_HSI1_MMC_CARD	254
+#define DOUT_CLKCMU_HSI2_NOC		255
+#define DOUT_CLKCMU_HSI2_NOC_UFS	256
+#define DOUT_CLKCMU_HSI2_UFS_EMBD	257
+#define DOUT_CLKCMU_HSI2_ETHERNET	258
+#define DOUT_CLKCMU_ISP_NOC		259
+#define DOUT_CLKCMU_M2M_NOC		260
+#define DOUT_CLKCMU_M2M_JPEG		261
+#define DOUT_CLKCMU_MFC_MFC		262
+#define DOUT_CLKCMU_MFC_WFD		263
+#define DOUT_CLKCMU_MFD_NOC		264
+#define DOUT_CLKCMU_MIF_NOCP		265
+#define DOUT_CLKCMU_MISC_NOC		266
+#define DOUT_CLKCMU_NOCL0_NOC		267
+#define DOUT_CLKCMU_NOCL1_NOC		268
+#define DOUT_CLKCMU_NOCL2_NOC		269
+#define DOUT_CLKCMU_PERIC0_NOC		270
+#define DOUT_CLKCMU_PERIC0_IP		271
+#define DOUT_CLKCMU_PERIC1_NOC		272
+#define DOUT_CLKCMU_PERIC1_IP		273
+#define DOUT_CLKCMU_SDMA_NOC		274
+#define DOUT_CLKCMU_SNW_NOC		275
+#define DOUT_CLKCMU_SSP_NOC		276
+#define DOUT_CLKCMU_TAA_NOC		277
+
+/* CMU_PERIC0 */
+#define CLK_MOUT_PERIC0_IP_USER		1
+#define CLK_MOUT_PERIC0_NOC_USER	2
+#define CLK_MOUT_PERIC0_USI00_USI	3
+#define CLK_MOUT_PERIC0_USI01_USI	4
+#define CLK_MOUT_PERIC0_USI02_USI	5
+#define CLK_MOUT_PERIC0_USI03_USI	6
+#define CLK_MOUT_PERIC0_USI04_USI	7
+#define CLK_MOUT_PERIC0_USI05_USI	8
+#define CLK_MOUT_PERIC0_USI06_USI	9
+#define CLK_MOUT_PERIC0_USI07_USI	10
+#define CLK_MOUT_PERIC0_USI08_USI	11
+#define CLK_MOUT_PERIC0_USI_I2C		12
+#define CLK_MOUT_PERIC0_I3C		13
+
+#define CLK_DOUT_PERIC0_USI00_USI	14
+#define CLK_DOUT_PERIC0_USI01_USI	15
+#define CLK_DOUT_PERIC0_USI02_USI	16
+#define CLK_DOUT_PERIC0_USI03_USI	17
+#define CLK_DOUT_PERIC0_USI04_USI	18
+#define CLK_DOUT_PERIC0_USI05_USI	19
+#define CLK_DOUT_PERIC0_USI06_USI	20
+#define CLK_DOUT_PERIC0_USI07_USI	21
+#define CLK_DOUT_PERIC0_USI08_USI	22
+#define CLK_DOUT_PERIC0_USI_I2C		23
+#define CLK_DOUT_PERIC0_I3C		24
+
+#endif /* _DT_BINDINGS_CLOCK_EXYNOSAUTOV920_H */
-- 
2.43.2

