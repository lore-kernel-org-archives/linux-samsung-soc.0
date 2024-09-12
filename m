Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4C918E349
	for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Sep 2024 10:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726137552; cv=none; b=kgNz4hVXxDPy2XA37pNBt0wxsOOtv+IvMAvjcpIkwVCl6UW4tKcUvSz0TwtiHqFWFqRsUui/aXbTHrtx23HmkVXR+l5JnijbVEff8hR7xOeBl3vokKCPFY78tX1IkdyxfIG8b8amA4Cjb+o5KmVcT02oEj++CKr+ipeyNYYCnXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726137552; c=relaxed/simple;
	bh=fqwA2g4aKsjz94sRbNK5N6jNtL1FKGiAqAteAvxOxMM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=Qmrg8I4j7+R28v688dfPRV0OwlRZkFPjljdRFLUMgSw5j2qHD6ncH5Qe4x/6FRt6uSuiofqRDUKpQkCu+9vKUahXcXIfKV2qwBOxknz4bO6Dvo2w/pFH8LF1V8akDRRzN+wRSb8+Ji2qp1VCwlbJQ8PUPTTOQT1Z3JoLPl7ZD2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=MT7tPsgC; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="MT7tPsgC"
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20240912103904epoutp02b3d4f2021aaa1bf31370e8e572977806~0ePODNBzw1290412904epoutp02O
	for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Sep 2024 10:39:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20240912103904epoutp02b3d4f2021aaa1bf31370e8e572977806~0ePODNBzw1290412904epoutp02O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1726137544;
	bh=/OuEIFi/AcVYrT4CS0PcouNWLMfpYYvGMuwAw+hOJJA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MT7tPsgC33QSbsvj+2PGvSqn20oJCr9slYtxRXHadiHF/24REzUCj9VuPqDp0/+pc
	 3aPJUWnLBDtDu69C+LvawCPLUkxUybF1O0w6wWgjAsCdsNvEms7sfsiJCDU4DsAV+j
	 L8VXrUjqWmjcnbVl1R9C1QDSXeqVLdWW1IqkZvC0=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTP id
	20240912103903epcas2p24089ec569091ac403761666cd673e0a5~0ePNnhkmW1074810748epcas2p2W;
	Thu, 12 Sep 2024 10:39:03 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.91]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4X4DSl4dYXz4x9Pt; Thu, 12 Sep
	2024 10:39:03 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
	epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	1E.D3.10431.7C4C2E66; Thu, 12 Sep 2024 19:39:03 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20240912103903epcas2p41445f34714dbc5c63bad5dd044965b5f~0ePM03tV92539125391epcas2p4U;
	Thu, 12 Sep 2024 10:39:03 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20240912103903epsmtrp18f984b460a82361b0fdbf8972316ab2c~0ePMz6azH0661906619epsmtrp1Q;
	Thu, 12 Sep 2024 10:39:03 +0000 (GMT)
X-AuditID: b6c32a45-da1ff700000028bf-bf-66e2c4c71a3d
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	F9.E4.19367.6C4C2E66; Thu, 12 Sep 2024 19:39:03 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.60]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20240912103902epsmtip18ac3cc9b84e8f4826070498508d392b1~0ePMlTpb13132831328epsmtip13;
	Thu, 12 Sep 2024 10:39:02 +0000 (GMT)
From: Sunyeal Hong <sunyeal.hong@samsung.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi
	<cw00.choi@samsung.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, Sunyeal Hong <sunyeal.hong@samsung.com>
Subject: [PATCH 1/3] dt-bindings: clock: exynosautov920: add peric1, misc
 and hsi0/1 clock definitions
Date: Thu, 12 Sep 2024 19:38:54 +0900
Message-ID: <20240912103856.3330631-2-sunyeal.hong@samsung.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240912103856.3330631-1-sunyeal.hong@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLJsWRmVeSWpSXmKPExsWy7bCmhe7xI4/SDK4elbV4MG8bm8WaveeY
	LK5/ec5qMf/IOVaLl7PusVlsenyN1eJjzz1Wi8u75rBZzDi/j8ni4ilXi/97drBbHH7Tzmrx
	79pGFoumZeuZHPg83t9oZffYtKqTzWPzknqPvi2rGD0+b5ILYI3KtslITUxJLVJIzUvOT8nM
	S7dV8g6Od443NTMw1DW0tDBXUshLzE21VXLxCdB1y8wBulNJoSwxpxQoFJBYXKykb2dTlF9a
	kqqQkV9cYquUWpCSU2BeoFecmFtcmpeul5daYmVoYGBkClSYkJ1x5fkFloKTQhWz2h6yNTC+
	5e9i5OSQEDCROP5+GnsXIxeHkMAORolJfaehnE+MEv1bVjPDOdN/bGSDaZna+oEVxBYS2Mko
	MaXFG6LoI6PEw6tLGbsYOTjYBHQl/vxzAImLCOxnkri1YCYriMMscJZRYtXhPSwg3cICGRKv
	5vwGs1kEVCVmL+sFm8orYC/xbOFEZoht8hLXHx9lArE5BRwk1tybwQJRIyhxcuYTMJsZqKZ5
	62yo+qkcEvNOOkPYLhLfpzyEulpY4tXxLewQtpTEy/42KDtfYvL1t0wgx0kINDBKXPvXDTXI
	XmLRmZ/sIN8wC2hKrN+lD2JKCChLHLkFtZZPouPwX3aIMK9ER5sQRKOaxKcrl6GGyEgcO/EM
	yvaQmHW+jRUSVpMZJe6+m8k8gVFhFpJvZiH5ZhbC4gWMzKsYxVILinPTU4uNCgzhMZycn7uJ
	EZxutVx3ME5++0HvECMTB+MhRgkOZiUR3klsj9KEeFMSK6tSi/Lji0pzUosPMZoCw3ois5Ro
	cj4w4eeVxBuaWBqYmJkZmhuZGpgrifPea52bIiSQnliSmp2aWpBaBNPHxMEp1cDEaF1ZWvra
	tVHAVDWR/5r12Rc7m8wNbpXXvHzj7vffP07VV8epafJZzzql4i2v99cxWcfEOWSK+fy7eXOD
	zPRllr8DF938HF0ZtuHp5ryso5/bTNKMRLLd8i7q3ri4+cvuXovYHe+Yt7I76m0WZlqdUD1d
	NP9jHrfjocij1+1aV4k/7VW3/nvE9u/ZW87zDsv+1YhhfdEdHx574MDW7XNjln383rP7CkfH
	uqluoUK/FmTaerqr6Lx6ns1SUHtqw3KB8PQXm95dC1028fcnjrwjzun/i1k23y9x5WVxUP6z
	u5FfrMpi59tfNqd4eSw9JSYklrnYzAx9dWKJYMCbxsj6a7EGYjHu65cVumvav1ViKc5INNRi
	LipOBADCUDOWQAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrKLMWRmVeSWpSXmKPExsWy7bCSnO7xI4/SDF79ZbR4MG8bm8WaveeY
	LK5/ec5qMf/IOVaLl7PusVlsenyN1eJjzz1Wi8u75rBZzDi/j8ni4ilXi/97drBbHH7Tzmrx
	79pGFoumZeuZHPg83t9oZffYtKqTzWPzknqPvi2rGD0+b5ILYI3isklJzcksSy3St0vgyrjy
	/AJLwUmhilltD9kaGN/ydzFyckgImEhMbf3A2sXIxSEksJ1R4uqMY0wQCRmJjQ3/2SFsYYn7
	LUegit4zSrxvWQfkcHCwCehK/PnnABIXETjKJLFpwTNmEIdZ4DKjxNldEN3CAmkSt++1sIDY
	LAKqErOX9bKC2LwC9hLPFk5khtggL3H98VGwzZwCDhJr7s0AqxcCqtm96wsLRL2gxMmZT8Bs
	ZqD65q2zmScwCsxCkpqFJLWAkWkVo2hqQXFuem5ygaFecWJucWleul5yfu4mRnBMaAXtYFy2
	/q/eIUYmDsZDjBIczEoivJPYHqUJ8aYkVlalFuXHF5XmpBYfYpTmYFES51XO6UwREkhPLEnN
	Tk0tSC2CyTJxcEo1MLWkrpRtthb9Ecdy7PdVpcRnnw/u8dFdfa/j1M6C941VGzJu/k1Ys3qa
	cmp734zjk389Eo67ztpy+uhEF56zZzZ9qJWpLt77+5V0d2nHYnbTBNldjMUJrLapbxiTH8nc
	vxSm77ep3zxzXVn8A7Yz2y4f3TyfuaG/Mlz+15/DF/R+/fmvsvn7l56WRI7Ca2vitFed2mP0
	/92+okMTJ5qb7JH6YLaxZMbT5Ijdr5Ytadw/XaB5m/Gtb/NV+ZZv57K9WL5iwu8PER+OuvDd
	3t2qMMdkdbbO0qoDoVmGW66ZGBdt3DMzuSTZfsnu7ax2zT83fz4b/Omxp86Xip1OhVtX8tbf
	D9Ce5aJms7Hk1fKZu5LClViKMxINtZiLihMBMps1G/gCAAA=
X-CMS-MailID: 20240912103903epcas2p41445f34714dbc5c63bad5dd044965b5f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240912103903epcas2p41445f34714dbc5c63bad5dd044965b5f
References: <20240912103856.3330631-1-sunyeal.hong@samsung.com>
	<CGME20240912103903epcas2p41445f34714dbc5c63bad5dd044965b5f@epcas2p4.samsung.com>

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

