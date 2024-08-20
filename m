Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ACAB4F5FB
	for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Aug 2024 08:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724141120; cv=none; b=bDR3MOTJfxBVavXs8gTnmKYDrb6V8yWpstzOwXIids31xG3A3Xj8B6/YhzwQzdYg+7xglEuqEnqzzL77f6Ed4wJtf0CY2Sgamnn9QfYze/TRpDwz9Wcns1TIiumzY+pf41pe9AqdZpF5F4Vm6hnvq+RQptNlZZwKRq5gjktLVAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724141120; c=relaxed/simple;
	bh=ze1Bef1k460f/MyM5J2XB/cu4iMMNDPwANG5OWEMAT0=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=NTntRSuyR2l+z9483DO14i6/2/UA5wL42D4DXBYNHQDAyKnI7nJS4ae3filB/rNkviC4ccdxuqviKNvDq78xrAcZD5XLdyvjSjWE8GaiDRRXwydQ07//kHRWZ3ABpKQk46/E+xEnL0QeeLaVbB8h3gHzwf7+RyHJFk3teoVyZFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=bMZ6OD+0; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="bMZ6OD+0"
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20240820080516epoutp03918278683dcf1df817e43de6085f61c3~tYTXldIKO0889108891epoutp03s
	for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Aug 2024 08:05:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20240820080516epoutp03918278683dcf1df817e43de6085f61c3~tYTXldIKO0889108891epoutp03s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1724141116;
	bh=kVG01Wa5EXAa3H2AZMsSEWsg04emWgbC2f9DmyYU8IQ=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=bMZ6OD+0WbvU4BwgvtqLdvJY2xVY/4F1q3qZS9HI3Iej0gzRmf4OQSkr/Ui3shcjx
	 NLj6K3C9bw+AFfMC3zp48qCrTmW/Joi/ayGOAK1F0O6qzPi+r/L0NWRosNV9CjBAEg
	 06356ZtJy/Exk3RxvKsf0nTn6Ks1eUuF28mjTb38=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTP id
	20240820080516epcas2p1e5e7654158c85dba2fdc6b50ae8d6f8f~tYTXKewMb1706817068epcas2p1E;
	Tue, 20 Aug 2024 08:05:16 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.92]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4Wp27v2Ds0z4x9Px; Tue, 20 Aug
	2024 08:05:15 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
	epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
	85.96.10012.B3E44C66; Tue, 20 Aug 2024 17:05:15 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20240820080514epcas2p438abbbe16c8cd38d44667c97f71d4cd7~tYTV_5kK91182611826epcas2p4I;
	Tue, 20 Aug 2024 08:05:14 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240820080514epsmtrp21651568bb4504fb5c43cbef3dd5ce15e~tYTV95fF31783117831epsmtrp2X;
	Tue, 20 Aug 2024 08:05:14 +0000 (GMT)
X-AuditID: b6c32a47-ea1fa7000000271c-86-66c44e3b18c9
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	60.A3.08964.A3E44C66; Tue, 20 Aug 2024 17:05:14 +0900 (KST)
Received: from KORCO118965 (unknown [10.229.18.201]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20240820080514epsmtip2c19824ba993b283089636413fd7a3418~tYTVqiEKD0550205502epsmtip2Y;
	Tue, 20 Aug 2024 08:05:14 +0000 (GMT)
From: "sunyeal.hong" <sunyeal.hong@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, "'Sylwester Nawrocki'"
	<s.nawrocki@samsung.com>, "'Chanwoo Choi'" <cw00.choi@samsung.com>, "'Alim
 Akhtar'" <alim.akhtar@samsung.com>, "'Michael Turquette'"
	<mturquette@baylibre.com>, "'Stephen Boyd'" <sboyd@kernel.org>, "'Rob
 Herring'" <robh@kernel.org>, "'Conor Dooley'" <conor+dt@kernel.org>
Cc: <linux-samsung-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, "'Kwanghoon Son'" <k.son@samsung.com>,
	"'Krzysztof	Kozlowski'" <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240820074514.3123767-2-sunyeal.hong@samsung.com>
Subject: RE: [PATCH v7 1/5] clk: samsung: exynosautov9: add dpum clock
 support
Date: Tue, 20 Aug 2024 17:05:14 +0900
Message-ID: <08f101daf2d7$afd0ad30$0f720790$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: ko
Thread-Index: AQKrMICelBUPPtumeu1u6GDrTK3MsAGiEL2DAV7kiHmwd0ZHUA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrEJsWRmVeSWpSXmKPExsWy7bCmha6135E0g4972SwezNvGZrFm7zkm
	i+tfnrNazD9yjtWid81VJovz5zewW+x9vZXdYtPja6wWH3vusVpc3jWHzWLG+X1MFhdPuVr8
	37OD3eLwm3ZWi3/XNrI48Hu8v9HK7rFpVSebx51re9g8Ni+p9+jbsorR4/MmuQC2qGybjNTE
	lNQihdS85PyUzLx0WyXv4HjneFMzA0NdQ0sLcyWFvMTcVFslF58AXbfMHKCLlRTKEnNKgUIB
	icXFSvp2NkX5pSWpChn5xSW2SqkFKTkF5gV6xYm5xaV56Xp5qSVWhgYGRqZAhQnZGaunbGIr
	eGVU8ft6QQPjFO0uRg4OCQETiVMrq7oYuTiEBHYwSvTu2cEI4XxilNgy5SszhPMNyLkxjbWL
	kROs40/Hc1aIxF5GiQs9F9khnJeMEtuvfGADqWIT0JdY3X2bDSQhInCHSeLy9DdgVcwCE5kk
	TqzYzgxSxSngINE88TTYXGGBAImlk3aygNgsAqoSV54sBqvhFbCU2Lh0LguELShxcuYTMJtZ
	QF5i+9s5zBA3KUj8fLqMFSIuIjG7sw0sLiLgJLHl6ikWkMUSAlc4JK7OX8gM8baLxJquQIhe
	YYlXx7ewQ9hSEp/f7WWDsPMlJl9/ywTR28Aoce1fN9Qye4lFZ36yg8xhFtCUWL9LH2KkssSR
	W1Cn8Ul0HP7LDhHmlehoE4JoVJP4dOUy1BAZiWMnnjFPYFSaheSxWUgem4XkmVkIuxYwsqxi
	FEstKM5NTy02KjCGR3Zyfu4mRnBi1nLfwTjj7Qe9Q4xMHIyHGCU4mJVEeLtfHkwT4k1JrKxK
	LcqPLyrNSS0+xGgKDOqJzFKiyfnA3JBXEm9oYmlgYmZmaG5kamCuJM57r3VuipBAemJJanZq
	akFqEUwfEwenVAPTnA6ZPefvvZC5uaK8h2HCH/5MnVbZNaFFOsbJmRnK06TutaSHGx+z3rpZ
	+aL0zoYH54weBaSGbbc32r22vMvEv17yWtpJg8hl9uunCd59mBKpfk/2mbnrGhntvS4uorxC
	X/iOHKrT31Vx4fLTCToOse5uDacjGOrSZhbwzXJvTpywlCei4f1jAb37vDqHjdc2u01Z9e7H
	Mw2r3/v8ZCqVXheuybRcHXxZMCMo6OhvGa9lz/5rB7V9P3N0z2OBN4uOztzM6npp/oy/AkrC
	2/bHXQpWk1174QGj22zWoiitP/8UTxrtu8Opk8L/7Phb07zDTqumscgYqGbv+nd7aq5R+7Mt
	1z/obZ+gvnkvu4mTEktxRqKhFnNRcSIAV53g2VUEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRmVeSWpSXmKPExsWy7bCSvK6V35E0g0UrFSwezNvGZrFm7zkm
	i+tfnrNazD9yjtWid81VJovz5zewW+x9vZXdYtPja6wWH3vusVpc3jWHzWLG+X1MFhdPuVr8
	37OD3eLwm3ZWi3/XNrI48Hu8v9HK7rFpVSebx51re9g8Ni+p9+jbsorR4/MmuQC2KC6blNSc
	zLLUIn27BK6M1VM2sRW8Mqr4fb2ggXGKdhcjJ4eEgInEn47nrCC2kMBuRonrq7Qg4jISGxv+
	s0PYwhL3W44A1XAB1TxnlHi19z4zSIJNQF9idfdtNpCEiMAjJonpRz6xgzjMAtOZJOY0zWaG
	aDnKKLHl3ESwHZwCDhLNE0+D2cICfhJHW6aC7WARUJW48mQx2FheAUuJjUvnskDYghInZz4B
	s5kFtCV6H7YyQtjyEtvfzmGGuE9B4ufTZawQcRGJ2Z1tYHERASeJLVdPsUxgFJ6FZNQsJKNm
	IRk1C0n7AkaWVYySqQXFuem5xYYFhnmp5XrFibnFpXnpesn5uZsYwXGqpbmDcfuqD3qHGJk4
	GA8xSnAwK4nwdr88mCbEm5JYWZValB9fVJqTWnyIUZqDRUmcV/xFb4qQQHpiSWp2ampBahFM
	lomDU6qBSTfpzLJJH9KjbH7vDt2gPaf2epa62c2DhRUm2cKZRoYn1U6rsfitTUgx+LBUM2Ge
	pfP2PdOfP86fNe8oMwvzs4s8ksU7y1QW3VsX+/ndg4CNLgZSbBtU7JmW6564L3juzsyFTwN2
	nvwR+qKGvWvOqsALt87+ssnKs22MeCDSwJkaHBm751pN1kLf+60bjY5Ovhv+lPnMrtbMX413
	Zx9/tK9PXin7crDOWRa993bFf+9M+mRlYnmw8OiSXl3ZFdfT2+zCn8yx+rr+n6R1XaGnR8iu
	f8GfBQ0X792x0fKzhcH+49Y/3TanNt26uzDzuN1il4zYrYLdGS2Wh849S1NYNUHvlx7vWq++
	NNmlaUx/2JRYijMSDbWYi4oTAX3VbjhCAwAA
X-CMS-MailID: 20240820080514epcas2p438abbbe16c8cd38d44667c97f71d4cd7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240820074519epcas2p2d44214309359b0b1927947f7d52d4f89
References: <20240820074514.3123767-1-sunyeal.hong@samsung.com>
	<CGME20240820074519epcas2p2d44214309359b0b1927947f7d52d4f89@epcas2p2.samsung.com>
	<20240820074514.3123767-2-sunyeal.hong@samsung.com>

Hello All,

Some incorrect patches were included. I will re-upload it to v8.

Best Regards,
sunyeal

> -----Original Message-----
> From: Sunyeal Hong <sunyeal.hong@samsung.com>
> Sent: Tuesday, August 20, 2024 4:45 PM
> To: Krzysztof Kozlowski <krzk@kernel.org>; Sylwester Nawrocki
> <s.nawrocki@samsung.com>; Chanwoo Choi <cw00.choi@samsung.com>; Alim
> Akhtar <alim.akhtar@samsung.com>; Michael Turquette
> <mturquette@baylibre.com>; Stephen Boyd <sboyd@kernel.org>; Rob Herring
> <robh@kernel.org>; Conor Dooley <conor+dt@kernel.org>
> Cc: linux-samsung-soc@vger.kernel.org; linux-clk@vger.kernel.org;
> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> kernel@vger.kernel.org; Kwanghoon Son <k.son@samsung.com>; Krzysztof
> Kozlowski <krzysztof.kozlowski@linaro.org>
> Subject: [PATCH v7 1/5] clk: samsung: exynosautov9: add dpum clock support
> 
> From: Kwanghoon Son <k.son@samsung.com>
> 
> Add dpum clock for exynosautov9.
> 
> Signed-off-by: Kwanghoon Son <k.son@samsung.com>
> Link: https://lore.kernel.org/r/20240809-clk_dpum-v3-3-
> 359decc30fe2@samsung.com
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/clk/samsung/clk-exynosautov9.c | 83 ++++++++++++++++++++++++++
>  1 file changed, 83 insertions(+)
> 
> diff --git a/drivers/clk/samsung/clk-exynosautov9.c
> b/drivers/clk/samsung/clk-exynosautov9.c
> index f04bacacab2c..5971e680e566 100644
> --- a/drivers/clk/samsung/clk-exynosautov9.c
> +++ b/drivers/clk/samsung/clk-exynosautov9.c
> @@ -20,6 +20,7 @@
>  #define CLKS_NR_TOP			(GOUT_CLKCMU_PERIS_BUS + 1)
>  #define CLKS_NR_BUSMC			(CLK_GOUT_BUSMC_SPDMA_PCLK + 1)
>  #define CLKS_NR_CORE			(CLK_GOUT_CORE_CMU_CORE_PCLK + 1)
> +#define CLKS_NR_DPUM			(CLK_GOUT_DPUM_SYSMMU_D3_CLK + 1)
>  #define CLKS_NR_FSYS0			(CLK_GOUT_FSYS0_PCIE_GEN3B_4L_CLK
> + 1)
>  #define CLKS_NR_FSYS1			(CLK_GOUT_FSYS1_USB30_1_ACLK + 1)
>  #define CLKS_NR_FSYS2			(CLK_GOUT_FSYS2_UFS_EMBD1_UNIPRO +
> 1)
> @@ -1076,6 +1077,85 @@ static const struct samsung_cmu_info core_cmu_info
> __initconst = {
>  	.clk_name		= "dout_clkcmu_core_bus",
>  };
> 
> +/* ---- CMU_DPUM
> +---------------------------------------------------------- */
> +
> +/* Register Offset definitions for CMU_DPUM (0x18c00000) */
> +#define PLL_CON0_MUX_CLKCMU_DPUM_BUS_USER				0x0600
> +#define CLK_CON_DIV_DIV_CLK_DPUM_BUSP					0x1800
> +#define CLK_CON_GAT_GOUT_BLK_DPUM_UID_DPUM_IPCLKPORT_ACLK_DECON
> 	0x202c
> +#define CLK_CON_GAT_GOUT_BLK_DPUM_UID_DPUM_IPCLKPORT_ACLK_DMA
> 	0x2030
> +#define CLK_CON_GAT_GOUT_BLK_DPUM_UID_DPUM_IPCLKPORT_ACLK_DPP
> 	0x2034
> +#define CLK_CON_GAT_GOUT_BLK_DPUM_UID_SYSMMU_D0_DPUM_IPCLKPORT_CLK_S1
> 	0x207c
> +#define CLK_CON_GAT_GOUT_BLK_DPUM_UID_SYSMMU_D1_DPUM_IPCLKPORT_CLK_S1
> 	0x2084
> +#define CLK_CON_GAT_GOUT_BLK_DPUM_UID_SYSMMU_D2_DPUM_IPCLKPORT_CLK_S1
> 	0x208c
> +#define CLK_CON_GAT_GOUT_BLK_DPUM_UID_SYSMMU_D3_DPUM_IPCLKPORT_CLK_S1
> 	0x2094
> +
> +static const unsigned long dpum_clk_regs[] __initconst = {
> +	PLL_CON0_MUX_CLKCMU_DPUM_BUS_USER,
> +	CLK_CON_DIV_DIV_CLK_DPUM_BUSP,
> +	CLK_CON_GAT_GOUT_BLK_DPUM_UID_DPUM_IPCLKPORT_ACLK_DECON,
> +	CLK_CON_GAT_GOUT_BLK_DPUM_UID_DPUM_IPCLKPORT_ACLK_DMA,
> +	CLK_CON_GAT_GOUT_BLK_DPUM_UID_DPUM_IPCLKPORT_ACLK_DPP,
> +	CLK_CON_GAT_GOUT_BLK_DPUM_UID_SYSMMU_D0_DPUM_IPCLKPORT_CLK_S1,
> +	CLK_CON_GAT_GOUT_BLK_DPUM_UID_SYSMMU_D1_DPUM_IPCLKPORT_CLK_S1,
> +	CLK_CON_GAT_GOUT_BLK_DPUM_UID_SYSMMU_D2_DPUM_IPCLKPORT_CLK_S1,
> +	CLK_CON_GAT_GOUT_BLK_DPUM_UID_SYSMMU_D3_DPUM_IPCLKPORT_CLK_S1,
> +};
> +
> +PNAME(mout_dpum_bus_user_p) = { "oscclk", "dout_clkcmu_dpum_bus" };
> +
> +static const struct samsung_mux_clock dpum_mux_clks[] __initconst = {
> +	MUX(CLK_MOUT_DPUM_BUS_USER, "mout_dpum_bus_user",
> +	    mout_dpum_bus_user_p, PLL_CON0_MUX_CLKCMU_DPUM_BUS_USER, 4,
> 1), };
> +
> +static const struct samsung_div_clock dpum_div_clks[] __initconst = {
> +	DIV(CLK_DOUT_DPUM_BUSP, "dout_dpum_busp", "mout_dpum_bus_user",
> +	    CLK_CON_DIV_DIV_CLK_DPUM_BUSP, 0, 3), };
> +
> +static const struct samsung_gate_clock dpum_gate_clks[] __initconst = {
> +	GATE(CLK_GOUT_DPUM_ACLK_DECON, "gout_dpum_decon_aclk",
> +	     "mout_dpum_bus_user",
> +	     CLK_CON_GAT_GOUT_BLK_DPUM_UID_DPUM_IPCLKPORT_ACLK_DECON, 21,
> +	     0, 0),
> +	GATE(CLK_GOUT_DPUM_ACLK_DMA, "gout_dpum_dma_aclk",
> "mout_dpum_bus_user",
> +	     CLK_CON_GAT_GOUT_BLK_DPUM_UID_DPUM_IPCLKPORT_ACLK_DMA, 21,
> +	     0, 0),
> +	GATE(CLK_GOUT_DPUM_ACLK_DPP, "gout_dpum_dpp_aclk",
> "mout_dpum_bus_user",
> +	     CLK_CON_GAT_GOUT_BLK_DPUM_UID_DPUM_IPCLKPORT_ACLK_DPP, 21,
> +	     0, 0),
> +	GATE(CLK_GOUT_DPUM_SYSMMU_D0_CLK, "gout_dpum_sysmmu_d0_clk",
> +	     "mout_dpum_bus_user",
> +	     CLK_CON_GAT_GOUT_BLK_DPUM_UID_SYSMMU_D0_DPUM_IPCLKPORT_CLK_S1,
> 21,
> +	     0, 0),
> +	GATE(CLK_GOUT_DPUM_SYSMMU_D1_CLK, "gout_dpum_sysmmu_d1_clk",
> +	     "mout_dpum_bus_user",
> +	     CLK_CON_GAT_GOUT_BLK_DPUM_UID_SYSMMU_D1_DPUM_IPCLKPORT_CLK_S1,
> 21,
> +	     0, 0),
> +	GATE(CLK_GOUT_DPUM_SYSMMU_D2_CLK, "gout_dpum_sysmmu_d2_clk",
> +	     "mout_dpum_bus_user",
> +	     CLK_CON_GAT_GOUT_BLK_DPUM_UID_SYSMMU_D2_DPUM_IPCLKPORT_CLK_S1,
> 21,
> +	     0, 0),
> +	GATE(CLK_GOUT_DPUM_SYSMMU_D3_CLK, "gout_dpum_sysmmu_d3_clk",
> +	     "mout_dpum_bus_user",
> +	     CLK_CON_GAT_GOUT_BLK_DPUM_UID_SYSMMU_D3_DPUM_IPCLKPORT_CLK_S1,
> 21,
> +	     0, 0),
> +};
> +
> +static const struct samsung_cmu_info dpum_cmu_info __initconst = {
> +	.mux_clks		= dpum_mux_clks,
> +	.nr_mux_clks		= ARRAY_SIZE(dpum_mux_clks),
> +	.div_clks		= dpum_div_clks,
> +	.nr_div_clks		= ARRAY_SIZE(dpum_div_clks),
> +	.gate_clks		= dpum_gate_clks,
> +	.nr_gate_clks		= ARRAY_SIZE(dpum_gate_clks),
> +	.nr_clk_ids		= CLKS_NR_DPUM,
> +	.clk_regs		= dpum_clk_regs,
> +	.nr_clk_regs		= ARRAY_SIZE(dpum_clk_regs),
> +	.clk_name		= "bus",
> +};
> +
>  /* ---- CMU_FSYS0 -------------------------------------------------------
> --- */
> 
>  /* Register Offset definitions for CMU_FSYS2 (0x17700000) */ @@ -2085,6
> +2165,9 @@ static const struct of_device_id exynosautov9_cmu_of_match[] =
> {
>  	}, {
>  		.compatible = "samsung,exynosautov9-cmu-core",
>  		.data = &core_cmu_info,
> +	}, {
> +		.compatible = "samsung,exynosautov9-cmu-dpum",
> +		.data = &dpum_cmu_info,
>  	}, {
>  		.compatible = "samsung,exynosautov9-cmu-fsys0",
>  		.data = &fsys0_cmu_info,
> --
> 2.45.2
> 


