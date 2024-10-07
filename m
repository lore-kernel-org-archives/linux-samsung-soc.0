Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554BB17C98C
	for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Oct 2024 07:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728285519; cv=none; b=TuJ3xWO4uTjgIHiq8/rVtgcbswDE8fMTNXRz1R1+3PnvvyuA4W8GycqjTUSn6pcbhj3IcEv5Yni8Xtztxd2rP2vJFPzFuJZ034gLlMe7+ksOYCNahPXKA3MRRTw1vFeY2FW4EKoHVHeQs1fHCsowCJC0mxYdn2RODUM+ZY3daW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728285519; c=relaxed/simple;
	bh=fqwA2g4aKsjz94sRbNK5N6jNtL1FKGiAqAteAvxOxMM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=qsyr25UxYZZs715OePlN0zDjdb78alIKBRtX4vN0DTsXZXyb+BAthfmSmZMYhoGwl4PJWphEzV8S1vh/ExztVgCznQREStZPT+G9tDfAQxAlwjSkdv+Uz0V2GIoraDlBoL8whStCMi9DGHzTwKrRWLRXsmhHv1Ke/rk/QdMBaXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=KRhOMOwn; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="KRhOMOwn"
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20241007071835epoutp031c670a1bd7059f85712ef7b8a7cfb03b~8GoULFF-T2468824688epoutp033
	for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Oct 2024 07:18:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20241007071835epoutp031c670a1bd7059f85712ef7b8a7cfb03b~8GoULFF-T2468824688epoutp033
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1728285515;
	bh=/OuEIFi/AcVYrT4CS0PcouNWLMfpYYvGMuwAw+hOJJA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KRhOMOwnw68Fd+FcpBvMkv7MH4AaH09HoPzwcAdN5SMYxAnOjTLk3WrtPvnQnt9x+
	 YFW3MexEnZN0RqnthkAM83VksbcePGchHeK/j1UWn8w9ktpO5uDSNsFNMP7ZIB2Hgu
	 PmE7z0lM0xCcR1tI5xoZ4DI6ci90cDc4smriX5jE=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTP id
	20241007071835epcas2p2dd6573cc4f9674f00b512ed71cc40038~8GoTlPqW51244212442epcas2p2d;
	Mon,  7 Oct 2024 07:18:35 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.97]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4XMVqt4Xkdz4x9QH; Mon,  7 Oct
	2024 07:18:34 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
	epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	F0.14.09396.A4B83076; Mon,  7 Oct 2024 16:18:34 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20241007071834epcas2p12827bf94b33bce2e5653e9520f29de31~8GoStkJN30296602966epcas2p1a;
	Mon,  7 Oct 2024 07:18:34 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20241007071834epsmtrp2255070a4400cdfcdd36c3cbb9261f2b6~8GoSsscML3077330773epsmtrp2D;
	Mon,  7 Oct 2024 07:18:34 +0000 (GMT)
X-AuditID: b6c32a45-6c5b7700000024b4-52-67038b4ad924
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	1C.69.08229.94B83076; Mon,  7 Oct 2024 16:18:33 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.60]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20241007071833epsmtip14ad4596a342c85ed924c774e28e979a2~8GoSa-jI-0981709817epsmtip1I;
	Mon,  7 Oct 2024 07:18:33 +0000 (GMT)
From: Sunyeal Hong <sunyeal.hong@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar
	<alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Sunyeal Hong <sunyeal.hong@samsung.com>
Subject: [PATCH v2 1/3] dt-bindings: clock: exynosautov920: add peric1, misc
 and hsi0/1 clock definitions
Date: Mon,  7 Oct 2024 16:18:27 +0900
Message-ID: <20241007071829.3042094-2-sunyeal.hong@samsung.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241007071829.3042094-1-sunyeal.hong@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPJsWRmVeSWpSXmKPExsWy7bCmma5XN3O6QcceOYsH87axWazZe47J
	4vqX56wW84+cY7U4f34Du8Wmx9dYLT723GO1uLxrDpvFjPP7mCwunnK1+L9nB7vF4TftrBb/
	rm1ksWhatp7Jgc/j/Y1Wdo9NqzrZPDYvqffo27KK0ePzJrkA1qhsm4zUxJTUIoXUvOT8lMy8
	dFsl7+B453hTMwNDXUNLC3MlhbzE3FRbJRefAF23zBygO5UUyhJzSoFCAYnFxUr6djZF+aUl
	qQoZ+cUltkqpBSk5BeYFesWJucWleel6eaklVoYGBkamQIUJ2RlXnl9gKTgpVDGr7SFbA+Nb
	/i5GTg4JAROJeSc3M3YxcnEICexglJhxdzo7hPOJUeJTax8bhPONUeLrSpAMRMu3t4tZIBJ7
	GSV+nzzLCuF8ZJQ49rEZyOHgYBPQlfjzzwEkLiKwh0liy/klTCAOs8BZRom7cxaAjRIWyJbo
	6VzFCGKzCKhK/Nk3CczmFbCX+P7wMgvEOnmJ64+PMoHYnAIOEndvfISqEZQ4OfMJWA0zUE3z
	1tnMIAskBGZySGxp2MgI0ewi8bR9FhuELSzx6vgWqB+kJD6/2wsVz5eYfP0tE0RzA6PEtX/d
	zBAJe4lFZ36yg7zDLKApsX6XPogpIaAsceQW1F4+iY7Df9khwrwSHW1CEI1qEp+uXIYaIiNx
	7MQzKNtDovnGL2j4TmaUWHbzBdMERoVZSN6ZheSdWQiLFzAyr2IUSy0ozk1PLTYqMITHcXJ+
	7iZGcMrVct3BOPntB71DjEwcjIcYJTiYlUR4I9YwpgvxpiRWVqUW5ccXleakFh9iNAUG9kRm
	KdHkfGDSzyuJNzSxNDAxMzM0NzI1MFcS573XOjdFSCA9sSQ1OzW1ILUIpo+Jg1OqgUnuxqTo
	q0qlt2trzKJD2hSXb0h6IxT7V2nhtLbTrBtu6ca2OS/mPMuqdevQ5WV2Myd6le3xF2czzm8L
	ju2o+5Sx4ZC+982CbpO6XysES+7GLfr4dMPciezHBcXm/2ves+fYyTX5EXLr9SRfrC5V0rs6
	XUpY4dm0t59+G5c/PfPp7ySxx3ILe23Mf/9p1TFQ//729tS/LddCcpYHJ+il7d8mZPdOx3mb
	UoLdrd5zHZ9W/lpvoFHpEqBqEvV5q3ZrSObfm49vffP+r7eGc8K0oJ3S01Z/KtBlFZV2U4rs
	sRRJb9T1r55yrfleyLTKd9vOhrCa85j+5DVaJ7JkbfcSr3m7rh2vX3FhS4LdufXBFSeUWIoz
	Eg21mIuKEwFxsXI+QgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrBLMWRmVeSWpSXmKPExsWy7bCSnK5nN3O6wZTd1hYP5m1js1iz9xyT
	xfUvz1kt5h85x2px/vwGdotNj6+xWnzsucdqcXnXHDaLGef3MVlcPOVq8X/PDnaLw2/aWS3+
	XdvIYtG0bD2TA5/H+xut7B6bVnWyeWxeUu/Rt2UVo8fnTXIBrFFcNimpOZllqUX6dglcGVee
	X2ApOClUMavtIVsD41v+LkZODgkBE4lvbxezdDFycQgJ7GaUuDrjAStEQkZiY8N/dghbWOJ+
	yxFWiKL3jBK7Dq0BSnBwsAnoSvz55wASFxE4xCQx8fNTsEnMApcZJY7dncwMUiQskClxZ2MJ
	yCAWAVWJP/smMYLYvAL2Et8fXmaBWCAvcf3xUSYQm1PAQeLujY9gNUJANS/OvoeqF5Q4OfMJ
	WD0zUH3z1tnMExgFZiFJzUKSWsDItIpRMrWgODc9t9iwwDAvtVyvODG3uDQvXS85P3cTIzgy
	tDR3MG5f9UHvECMTB+MhRgkOZiUR3og1jOlCvCmJlVWpRfnxRaU5qcWHGKU5WJTEecVf9KYI
	CaQnlqRmp6YWpBbBZJk4OKUamCawpOTPea8lc8Te+45Q5cXqdtdTUovmN2nv6tl2pmhFR9H3
	g0ELHXoeNPJI2exNr+Lj/17p9XyL5feLwn7bDdpiFoj1c/zalmn7pT7wxqGXQjeucR05ETRx
	w6Rzy9IEQi+8EV8zZ7kJ13n7yQGi3z6t8iqQ+yQ+PfrU7f+dJ4o3evf5M5ZuEP/tNrMh6Szr
	riNdiy2snvY8TD0aX2G59H62oeRBj+ypQWvuHWep1Pq9IcA8UPb6PhZup0nV3OyvXtXvWTHR
	ztzH5cNMpqf7LTh3bWCMe8B1fWnoTF7PoAU2ZRN1H2eV+outeJJTtC7rm6W+BJ/6doWaghsP
	2rXXXmjIDs081PaCVTS3UMGHR4mlOCPRUIu5qDgRAKIMzN37AgAA
X-CMS-MailID: 20241007071834epcas2p12827bf94b33bce2e5653e9520f29de31
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241007071834epcas2p12827bf94b33bce2e5653e9520f29de31
References: <20241007071829.3042094-1-sunyeal.hong@samsung.com>
	<CGME20241007071834epcas2p12827bf94b33bce2e5653e9520f29de31@epcas2p1.samsung.com>

Add peric1, misc and hsi0/1 clock definitions.

- CMU_PERIC1 for USI, IC2 and I3C
- CMU_MISC for MISC, GIC and OTP
- HSI0 for PCIE
- HSI1 for USB and MMC

Signed-off-by: Sunyeal Hong <sunyeal.hong@samsung.com>
---
 .../clock/samsung,exynosautov920.h            | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/include/dt-bindings/clock/samsung,exynosautov920.h b/include/dt-bindings/clock/samsung,exynosautov920.h
index c720f344b6bf..0c681f2ba3d0 100644
--- a/include/dt-bindings/clock/samsung,exynosautov920.h
+++ b/include/dt-bindings/clock/samsung,exynosautov920.h
@@ -160,6 +160,7 @@
 #define DOUT_CLKCMU_SNW_NOC		144
 #define DOUT_CLKCMU_SSP_NOC		145
 #define DOUT_CLKCMU_TAA_NOC		146
+#define DOUT_TCXO_DIV2			147
 
 /* CMU_PERIC0 */
 #define CLK_MOUT_PERIC0_IP_USER		1
@@ -188,4 +189,50 @@
 #define CLK_DOUT_PERIC0_USI_I2C		23
 #define CLK_DOUT_PERIC0_I3C		24
 
+/* CMU_PERIC1 */
+#define CLK_MOUT_PERIC1_IP_USER		1
+#define CLK_MOUT_PERIC1_NOC_USER	2
+#define CLK_MOUT_PERIC1_USI09_USI	3
+#define CLK_MOUT_PERIC1_USI10_USI	4
+#define CLK_MOUT_PERIC1_USI11_USI	5
+#define CLK_MOUT_PERIC1_USI12_USI	6
+#define CLK_MOUT_PERIC1_USI13_USI	7
+#define CLK_MOUT_PERIC1_USI14_USI	8
+#define CLK_MOUT_PERIC1_USI15_USI	9
+#define CLK_MOUT_PERIC1_USI16_USI	10
+#define CLK_MOUT_PERIC1_USI17_USI	11
+#define CLK_MOUT_PERIC1_USI_I2C		12
+#define CLK_MOUT_PERIC1_I3C		13
+
+#define CLK_DOUT_PERIC1_USI09_USI	14
+#define CLK_DOUT_PERIC1_USI10_USI	15
+#define CLK_DOUT_PERIC1_USI11_USI	16
+#define CLK_DOUT_PERIC1_USI12_USI	17
+#define CLK_DOUT_PERIC1_USI13_USI	18
+#define CLK_DOUT_PERIC1_USI14_USI	19
+#define CLK_DOUT_PERIC1_USI15_USI	20
+#define CLK_DOUT_PERIC1_USI16_USI	21
+#define CLK_DOUT_PERIC1_USI17_USI	22
+#define CLK_DOUT_PERIC1_USI_I2C		23
+#define CLK_DOUT_PERIC1_I3C		24
+
+/* CMU_MISC */
+#define CLK_MOUT_MISC_NOC_USER		1
+#define CLK_MOUT_MISC_GIC		2
+
+#define CLK_DOUT_MISC_OTP		3
+#define CLK_DOUT_MISC_NOCP		4
+#define CLK_DOUT_MISC_OSC_DIV2		5
+
+/* CMU_HSI0 */
+#define CLK_MOUT_HSI0_NOC_USER		1
+
+#define CLK_DOUT_HSI0_PCIE_APB		2
+
+/* CMU_HSI1 */
+#define CLK_MOUT_HSI1_MMC_CARD_USER	1
+#define CLK_MOUT_HSI1_NOC_USER		2
+#define CLK_MOUT_HSI1_USBDRD_USER	3
+#define CLK_MOUT_HSI1_USBDRD		4
+
 #endif /* _DT_BINDINGS_CLOCK_EXYNOSAUTOV920_H */
-- 
2.46.0

