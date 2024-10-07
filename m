Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37753188013
	for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Oct 2024 07:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728285229; cv=none; b=knB7Xh8YB3fOJHojbRoSXCMXT0pr7tfPFLIrmkCzDuPXy1prLao+5OU6m3QSohxue1FWqIalm3FgrAyvdF4DPvdgdnWZljaED3kg7hTA88c0FVyo4lA0v6NWmTTa54zPueH950Ma/2PAWOiRo6z0ybMAmUso/PY27YvVIaxFv4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728285229; c=relaxed/simple;
	bh=fqwA2g4aKsjz94sRbNK5N6jNtL1FKGiAqAteAvxOxMM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=Sy5PEPn7ihOn4S+hVfS5Bemu7S40Q7LlVcQ28bd7iTHdpGBC7XKQ8XohRSU71N1+1OuGvIgXXavJ9hCrPFr8eNonDCcGRv0U896mCT9MHXMuD146EVhbj487lFsVSR2Ps9pTBZ4YldH0Bq0XMWNsbDvwF0JeQNtZRLyDNJ1hks0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=t8GRnHMr; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="t8GRnHMr"
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20241007071340epoutp0472beca1162e0479c5292ac8c64981d7d~8GkA-Ho8S2507125071epoutp04U
	for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Oct 2024 07:13:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20241007071340epoutp0472beca1162e0479c5292ac8c64981d7d~8GkA-Ho8S2507125071epoutp04U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1728285220;
	bh=/OuEIFi/AcVYrT4CS0PcouNWLMfpYYvGMuwAw+hOJJA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=t8GRnHMrg/q/YNXtCMQ45iDYvXlhgLpRfVHHS9zdfZLiZPfgIfRW4n0WkJL5bTQqM
	 E72MLmN56g9ed4a0SE8gvSB/KThFtZPtbEa2wYGLxLCHyoRVB2P3LHuANwYS4xoOZ9
	 +277X16yc8elF8j7ZlkBRL3yt0+fNpTb0vMRZ/Fc=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTP id
	20241007071339epcas2p10c68a67c8161fddb43ce177ea362b308~8GkAJJb8g0696906969epcas2p1B;
	Mon,  7 Oct 2024 07:13:39 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.100]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4XMVkB6wh7z4x9Q1; Mon,  7 Oct
	2024 07:13:38 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
	epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
	B2.E4.09811.22A83076; Mon,  7 Oct 2024 16:13:38 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20241007071338epcas2p175f486a1d5b2ff75393d30aeb967bac0~8Gj-S4bN-0691506915epcas2p1V;
	Mon,  7 Oct 2024 07:13:38 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20241007071338epsmtrp2e2093714ac42e2f791587cfb1c46c3b8~8Gj-R9PKv2804728047epsmtrp29;
	Mon,  7 Oct 2024 07:13:38 +0000 (GMT)
X-AuditID: b6c32a48-0869ea8000002653-69-67038a227d13
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	A3.E8.08229.22A83076; Mon,  7 Oct 2024 16:13:38 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.60]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20241007071338epsmtip28ca07d8d9c00ce5229a49750dcf10422~8Gj-BXvdO1315213152epsmtip2T;
	Mon,  7 Oct 2024 07:13:38 +0000 (GMT)
From: Sunyeal Hong <sunyeal.hong@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar
	<alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Sunyeal Hong <sunyeal.hong@samsung.com>
Subject: [PATCH v1 1/3] dt-bindings: clock: exynosautov920: add peric1, misc
 and hsi0/1 clock definitions
Date: Mon,  7 Oct 2024 16:13:31 +0900
Message-ID: <20241007071333.3011125-2-sunyeal.hong@samsung.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241007071333.3011125-1-sunyeal.hong@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLJsWRmVeSWpSXmKPExsWy7bCmma5SF3O6wZXnphYP5m1js1iz9xyT
	xfUvz1kt5h85x2px/vwGdotNj6+xWnzsucdqcXnXHDaLGef3MVlcPOVq8X/PDnaLw2/aWS3+
	XdvIYtG0bD2TA5/H+xut7B6bVnWyeWxeUu/Rt2UVo8fnTXIBrFHZNhmpiSmpRQqpecn5KZl5
	6bZK3sHxzvGmZgaGuoaWFuZKCnmJuam2Si4+AbpumTlAdyoplCXmlAKFAhKLi5X07WyK8ktL
	UhUy8otLbJVSC1JyCswL9IoTc4tL89L18lJLrAwNDIxMgQoTsjOuPL/AUnBSqGJW20O2Bsa3
	/F2MnBwSAiYS8++0MoPYQgI7GCXmTHDpYuQCsj8xSvTv62WBcL4xSvx9fJ0FpmNH/wqoxF5G
	iY9X+xghnI+MEh8m3wNyODjYBHQl/vxzAImLCOxhkthyfgkTiMMscJZR4u6cBewgo4QFsiWO
	f5zCBNLAIqAqMe+YI0iYV8Be4vvvp6wQ2+Qlrj8+ygRicwo4SDw795ARokZQ4uTMJ2AXMQPV
	NG+dzQwyX0JgLofE+m/fmSCaXST6f9yFGiQs8er4FnYIW0ri87u9bBB2vsTk62+ZIJobGCWu
	/etmhkjYSyw685Md5DhmAU2J9bv0QUwJAWWJI7eg9vJJdBz+yw4R5pXoaBOCaFST+HTlMtQQ
	GYljJ55B2R4Sj1dtYIKE1WRGiYPfb7NOYFSYheSdWUjemYWweAEj8ypGsdSC4tz01GKjAhN4
	DCfn525iBKdbLY8djLPfftA7xMjEwXiIUYKDWUmEN2INY7oQb0piZVVqUX58UWlOavEhRlNg
	WE9klhJNzgcm/LySeEMTSwMTMzNDcyNTA3Mlcd57rXNThATSE0tSs1NTC1KLYPqYODilGpjY
	lgt/5vsix/bnZ/HdyS+PH0vIUWBerZD4+Hb979KMwHW7j30xiLvPL/HDXXVSZ/HKTT9lVSQm
	Po+a/9PtZ/WxpoPOfKr39j65xZCydZnbfsFvPxpLLzr3+F7eN+Hjr90v6kyarj//97te2pt/
	d7SqQo8sz9Kg31d+32i12a+9dcP6U5fOvVRdf0RORWbr9GjJG0c4/ay6t7Idz/weZ3+YZ/7v
	9CMRMxW7pDOnex49yXn9piJX1lUJh9vRzXYzfZO/Jf0zz7d7ZLW0NXflxBLhf7k5nut49pa9
	Mjwu+sLmv5iqk+RcX7V5B8XU/qgbbpv3RWD3EkOGlg+L/r6QuJu8ke/DZdFdt/eWx/1X/zlJ
	TYmlOCPRUIu5qDgRABoge/NABAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrGLMWRmVeSWpSXmKPExsWy7bCSvK5SF3O6wbL7/BYP5m1js1iz9xyT
	xfUvz1kt5h85x2px/vwGdotNj6+xWnzsucdqcXnXHDaLGef3MVlcPOVq8X/PDnaLw2/aWS3+
	XdvIYtG0bD2TA5/H+xut7B6bVnWyeWxeUu/Rt2UVo8fnTXIBrFFcNimpOZllqUX6dglcGVee
	X2ApOClUMavtIVsD41v+LkZODgkBE4kd/StYuhi5OIQEdjNKNH+4zw6RkJHY2PAfyhaWuN9y
	hBXEFhJ4zyhxp9Wki5GDg01AV+LPPweQXhGBQ0wSEz8/BRvELHCZUeLY3cnMIA3CApkSc06u
	ZQJpYBFQlZh3zBEkzCtgL/H991NWiPnyEtcfH2UCsTkFHCSenXvICFIuBFRz80MCRLmgxMmZ
	T1hAbGag8uats5knMArMQpKahSS1gJFpFaNkakFxbnpusWGBYV5quV5xYm5xaV66XnJ+7iZG
	cFRoae5g3L7qg94hRiYOxkOMEhzMSiK8EWsY04V4UxIrq1KL8uOLSnNSiw8xSnOwKInzir/o
	TRESSE8sSc1OTS1ILYLJMnFwSjUw2dxZ7lwoezWZUfrTrSZZ70vJCfsfvV81h6uR98YS0bxW
	X7d+oZoSE5GqQ4//zf7N5nD+bkrQZOtNQQUfBFXYs1suPJv4+52vRtlB5wfFTRsWzQ/oyz3h
	l9DTOLHWXYL1bbSG7uePVuf3b078c+w4+8r5kqcPTTtgnHbSp986+WnGf/uXM+8yHD17LPnp
	kV9HJAy5F9YuqE5pW9NceDKYzTn4c5ZgfpIdS/rW52eNuBfPmCpd7fX9u6k8X4kSK79x2jez
	vqvCHt+kxZYYLl6mmnlNZf2+fa4T1lzasdiD76GcyNw/YbKTai8Yi5WneH0Oy5M/6XT3ZnAK
	R/yda/eiL0fdabczYvZ/zCVauXq2EktxRqKhFnNRcSIAij3G9/kCAAA=
X-CMS-MailID: 20241007071338epcas2p175f486a1d5b2ff75393d30aeb967bac0
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241007071338epcas2p175f486a1d5b2ff75393d30aeb967bac0
References: <20241007071333.3011125-1-sunyeal.hong@samsung.com>
	<CGME20241007071338epcas2p175f486a1d5b2ff75393d30aeb967bac0@epcas2p1.samsung.com>

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

