Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBE014389F
	for <linux-samsung-soc@vger.kernel.org>; Wed,  9 Oct 2024 04:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728447683; cv=none; b=YEU5ECTfZCEe+sm/YYILDVOsv1y28hoN0A/ag/Kn/+J5PyDyAnfE2jbHLOe60u1xkYyC34Ug18JDYTdbSdVxX+f29OWdlbjwTxJzWyZZUmZuU36dWioaTWtPxno0BxbQ8V0+YkhsfPXm97znbnVSizeqSamizXhxvYrIyY4A48w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728447683; c=relaxed/simple;
	bh=fqwA2g4aKsjz94sRbNK5N6jNtL1FKGiAqAteAvxOxMM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=ltso9IJDvYvHF53N2u3p3aAet+QKz0JIOCyW1d+2YPtnbKM6T3LE86VUnCV10bwzUFyQXPGhX4CiKKAHLnOlBrOlQkboA2VDCvlYnoDodzWReCgqQT+4d09nRnLR106JH/Vj/QpC3lpAccwy0FhPwknMpHTuTrC1zbjzSnPQVjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=gSxoIEyC; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="gSxoIEyC"
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20241009042119epoutp031904224953ecadf6f3ffcf1e8b832a26~8rgHDFEos3236832368epoutp03i
	for <linux-samsung-soc@vger.kernel.org>; Wed,  9 Oct 2024 04:21:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20241009042119epoutp031904224953ecadf6f3ffcf1e8b832a26~8rgHDFEos3236832368epoutp03i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1728447679;
	bh=/OuEIFi/AcVYrT4CS0PcouNWLMfpYYvGMuwAw+hOJJA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gSxoIEyCSnYBkAl3P/U9CVOSAwMd+nM8F3ZU44tiN+2NL2vhpVzYi7SjD9vNimOvv
	 F+AmxBQPB2o93XfnMvEkdor21lKJF3MX4pk2uf51By+jqOpZFfK/E3ZQyvlNLvL0Pt
	 b9IzNxrOg49IhI6frZeKtoNCXlNNHrwfvfEw0PwQ=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTP id
	20241009042118epcas2p16b117307b16493755b60cadf650024a5~8rgGbmZl-2655126551epcas2p1B;
	Wed,  9 Oct 2024 04:21:18 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.99]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4XNfpQ3nFTz4x9Pt; Wed,  9 Oct
	2024 04:21:18 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
	epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
	78.FF.09811.EB406076; Wed,  9 Oct 2024 13:21:18 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20241009042117epcas2p3fb2eea9d2618d36f6f9d6e0bb67a09f5~8rgFL8dnT2577225772epcas2p3T;
	Wed,  9 Oct 2024 04:21:17 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20241009042117epsmtrp2badfc1db5521fed6113f9681354e6a83~8rgFLI8K42528425284epsmtrp2k;
	Wed,  9 Oct 2024 04:21:17 +0000 (GMT)
X-AuditID: b6c32a48-84fb870000002653-7b-670604befaa1
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	CC.F6.18937.DB406076; Wed,  9 Oct 2024 13:21:17 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.60]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20241009042117epsmtip2f0ba3dae5b86b0568f66fa8a9e93f087~8rgE_ugrC3142531425epsmtip2u;
	Wed,  9 Oct 2024 04:21:17 +0000 (GMT)
From: Sunyeal Hong <sunyeal.hong@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar
	<alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Sunyeal Hong <sunyeal.hong@samsung.com>
Subject: [PATCH v3 1/3] dt-bindings: clock: exynosautov920: add peric1, misc
 and hsi0/1 clock definitions
Date: Wed,  9 Oct 2024 13:21:08 +0900
Message-ID: <20241009042110.2379903-2-sunyeal.hong@samsung.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241009042110.2379903-1-sunyeal.hong@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDJsWRmVeSWpSXmKPExsWy7bCmhe4+FrZ0g4svpS0ezNvGZrFm7zkm
	i+tfnrNazD9yjtXi/PkN7BabHl9jtfjYc4/V4vKuOWwWM87vY7K4eMrV4v+eHewWh9+0s1r8
	u7aRxaJp2XomBz6P9zda2T02repk89i8pN6jb8sqRo/Pm+QCWKOybTJSE1NSixRS85LzUzLz
	0m2VvIPjneNNzQwMdQ0tLcyVFPISc1NtlVx8AnTdMnOA7lRSKEvMKQUKBSQWFyvp29kU5ZeW
	pCpk5BeX2CqlFqTkFJgX6BUn5haX5qXr5aWWWBkaGBiZAhUmZGdceX6BpeCkUMWstodsDYxv
	+bsYOTkkBEwkzu5fwdjFyMUhJLCDUeLM1NVsEM4nRonJb68iODeWz2eGafm9ZhlUYiejxPUd
	j1kgnI+MEpvmXgCq4uBgE9CV+PPPASQuIrCHSWLL+SVMIA6zwFlGibtzFrCDjBIWyJbonnCQ
	DaSBRUBV4uyxaBCTV8BeYvaZJIhl8hLXHx9lArE5BRwkOuZdYQSxeQUEJU7OfMICYjMD1TRv
	nc0MMl5CYCqHxL2Ps9ggml0kul6vYoKwhSVeHd/CDmFLSXx+txeqJl9i8vW3TBDNDYwS1/51
	Q71pL7HozE92kIOYBTQl1u/SBzElBJQljtyC2ssn0XH4LztEmFeio00IolFN4tOVy1BDZCSO
	nXgGZXtIzH/wlRXEFhKYzCjx6l7iBEaFWUi+mYXkm1kIexcwMq9iFEstKM5NTy02KjCBR3By
	fu4mRnCy1fLYwTj77Qe9Q4xMHIyHGCU4mJVEeHUXsqYL8aYkVlalFuXHF5XmpBYfYjQFhvRE
	ZinR5Hxgus8riTc0sTQwMTMzNDcyNTBXEue91zo3RUggPbEkNTs1tSC1CKaPiYNTqoGp6tD8
	snz1rGkn5sTYv1z8KMn32/37O31DCjszr+bpGBYHf7Seu15UZW5GyOXTvocm3Fx25egBvhWr
	wrU3xDJVJl/Um8jTv3V3rc4x4+O3vvQtvutr5bHFoW5HpYmcQqM3m/Ebrl0/rvJuVDvYd/B8
	UkN1F9NWlm0zFvz05//ac1FxM5/p4a/9kZ8s47sUAxZZvLfLWbK0/X9kQuQpZ4cZu57OPm75
	gVHd5YtqbQ3780MPTm1UcQ3qjNnHksA6Q37a3XLJZJuJNufyK35aS6/6LdPwTf3KzycGLmcV
	GRelv2b+EMq1sMXnVtv1S/XvXG5HnTos/SdtfVvJbcunT2XNZLYlik+WXKDC2Xlp0hQ+JZbi
	jERDLeai4kQAgd73gD8EAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrELMWRmVeSWpSXmKPExsWy7bCSvO5eFrZ0g1sL5SwezNvGZrFm7zkm
	i+tfnrNazD9yjtXi/PkN7BabHl9jtfjYc4/V4vKuOWwWM87vY7K4eMrV4v+eHewWh9+0s1r8
	u7aRxaJp2XomBz6P9zda2T02repk89i8pN6jb8sqRo/Pm+QCWKO4bFJSczLLUov07RK4Mq48
	v8BScFKoYlbbQ7YGxrf8XYycHBICJhK/1yxj62Lk4hAS2M4o8WNeCztEQkZiY8N/KFtY4n7L
	EVaIoveMEiv6vgMlODjYBHQl/vxzAImLCBxikpj4+SkLiMMscJlR4tjdycwgRcICmRItC8VB
	TBYBVYmzx6JBTF4Be4nZZ5IgxstLXH98lAnE5hRwkOiYd4URxBYCKnnSMpUZxOYVEJQ4OfMJ
	C4jNDFTfvHU28wRGgVlIUrOQpBYwMq1iFE0tKM5Nz00uMNQrTswtLs1L10vOz93ECI4GraAd
	jMvW/9U7xMjEwXiIUYKDWUmEV3cha7oQb0piZVVqUX58UWlOavEhRmkOFiVxXuWczhQhgfTE
	ktTs1NSC1CKYLBMHp1QDU+l9rY7ZrzytTfoExBrkG/r0pB2bDeap1jPk3zz8fsXLtwduqzoZ
	cgT+OaRu5T738wxP+0SeAzeWvWC89ulrx9ZUsyfNb1ZtV9Z3Yzx203v5v39Rx17KHYrYzv8g
	VMZdLF3OZUf7Spe+14lRy67KH9q8V+B3zk3/27OiLTpCVRnUl+lMKDzE3eRwXjje9+Ru3SVX
	u6zWPmx/XxmccYXbp8z7i25S5oHNiUvn7TN7cHTvr6cnvPasOfA3PkZ2MkdmfX/Tj5r1Hsra
	s7p6dZqlHv5etimhP8brkk3uz8D/IRFdmuoPnH5ZhJTP3B5T3uL3da03k9aswAbXLhG5U06S
	C2P+iLccTd7t2FP47cg2JZbijERDLeai4kQAHt+AefUCAAA=
X-CMS-MailID: 20241009042117epcas2p3fb2eea9d2618d36f6f9d6e0bb67a09f5
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241009042117epcas2p3fb2eea9d2618d36f6f9d6e0bb67a09f5
References: <20241009042110.2379903-1-sunyeal.hong@samsung.com>
	<CGME20241009042117epcas2p3fb2eea9d2618d36f6f9d6e0bb67a09f5@epcas2p3.samsung.com>

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

