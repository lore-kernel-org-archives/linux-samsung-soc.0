Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E8C19EEDB
	for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Jul 2024 11:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722339887; cv=none; b=LSZzrRP3qYZoXLaFw99B1NJvjkseLZ37P7LVbIkrmT/hdwd3j17lcdbJ9ajKpF2Tsoxw/vw60RkGUUrX0Ar6TzVhnZSNGoqyfYcdu/8HjURv7mADf/AId/SO2TzXiOrDl2qFzSwHQQuZmj4z79LLcLfhgrFxonhQh0eFRluFba0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722339887; c=relaxed/simple;
	bh=QRXj6RQttpiz5ZDNTET50nTYV/yvORvJdoGwJq46rAM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=A8TpGxhq3hcs+aRBMN+blnPDTwCFSMNqQbvjMn/UyjWcPCQA6wWF98z+YwOCvd1PibMmsBmLrMnnUZMFsjhVRwjT/AEb2y7YvBHpxOH9MPepY4AiA0u5k5KETqZPLF8uHTSNw4hUYw48uylujanBGZhkZJ+5HpV3gpmzT95JUCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=rs8gIPSc; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="rs8gIPSc"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20240730114442euoutp02944b3ec84696defc9cab052557665d68~m_v9TOyCN0129701297euoutp02j
	for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Jul 2024 11:44:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20240730114442euoutp02944b3ec84696defc9cab052557665d68~m_v9TOyCN0129701297euoutp02j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1722339882;
	bh=pCbKlJaDg+laaap6ynSdGrvZR5pllUN9unnnOVUI4G8=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=rs8gIPScHO8jZM6ap4o3/sxp21x7cC0pcFyFnF+SJHByu7fnuOeVCJtdex4+P780o
	 f7L94JS9S8Ob7ckpIPDmJniSA8cX2GEi2lFvZAAJgQFnuhMjuHEGeHxuojG6tau6Eh
	 XVdIhdmKidleBdAPtOI5ATsEWNQmNVksTXde/+Dg=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20240730114441eucas1p23f9982159414f819fc4d4b0cd76acbdf~m_v9Df34n1769217692eucas1p2d;
	Tue, 30 Jul 2024 11:44:41 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges3new.samsung.com (EUCPMTA) with SMTP id 77.1D.09620.922D8A66; Tue, 30
	Jul 2024 12:44:41 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20240730114441eucas1p16aabcc3a8097dbe284e73ecf69e6d03c~m_v8fTgWy0204902049eucas1p10;
	Tue, 30 Jul 2024 11:44:41 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
	eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20240730114441eusmtrp1170c8f6f96a84f6504c8002787a1890e~m_v8erAUp2598725987eusmtrp1V;
	Tue, 30 Jul 2024 11:44:41 +0000 (GMT)
X-AuditID: cbfec7f5-d1bff70000002594-77-66a8d229829e
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
	eusmgms2.samsung.com (EUCPMTA) with SMTP id 6C.2F.09010.822D8A66; Tue, 30
	Jul 2024 12:44:40 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20240730114439eusmtip1a520c3de7ae9ea61577d8218c192c31c~m_v7K3nXv0586705867eusmtip1P;
	Tue, 30 Jul 2024 11:44:39 +0000 (GMT)
Message-ID: <09e9cf0b-27fd-46b8-8631-87d798afd19e@samsung.com>
Date: Tue, 30 Jul 2024 13:44:38 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] ARM: dts: samsung: Add cache information to the
 Exynos542x SoC
To: Anand Moon <linux.amoon@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20240730091322.5741-2-linux.amoon@gmail.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrJKsWRmVeSWpSXmKPExsWy7djPc7qal1akGXy/p2jxYN42Nos1e88x
	Wcw/co7V4uWse2wWmx5fY7W4vGsOm8WM8/uYLNZtvMVu8X/PDnYHTo+ds+6ye2xa1cnmsXlJ
	vUffllWMHp83yQWwRnHZpKTmZJalFunbJXBl/Fh2h71gsmHF/Xs/mBoYF6p2MXJySAiYSMx4
	NYG5i5GLQ0hgBaPEhgN3GCGcL4wSvdeOMINUCQl8ZpS4v1oBpuP8hFdQRcsZJc6daWODcD4y
	SrRf+QXWwStgJ7Fr5RRWEJtFQFXi5eSVrBBxQYmTM5+wgNiiAvIS92/NYAexhQViJD7vWwN2
	h4jAPkaJHdsWs4M4zALtjBKn5twAq2IWEJe49WQ+E4jNJmAo0fW2iw3E5hSwknjY+pYJokZe
	YvvbOWCTJATecEhMaGpmhzjcReLZ9TesELawxKvjW6DiMhKnJ/ewQDQAbVvw+z4ThDOBUaLh
	+S1GiCpriTvnfgGt4wBaoSmxfpc+RNhR4lrbW7CwhACfxI23ghBH8ElM2jadGSLMK9HRJgRR
	rSYx6/g6uLUHL1xinsCoNAspYGYheXMWkndmIexdwMiyilE8tbQ4Nz212DgvtVyvODG3uDQv
	XS85P3cTIzA1nf53/OsOxhWvPuodYmTiYDzEKMHBrCTCG39laZoQb0piZVVqUX58UWlOavEh
	RmkOFiVxXtUU+VQhgfTEktTs1NSC1CKYLBMHp1QDk8s149+mJ77+l/F9meD5ZSrbmin67V9M
	u//KTykJcJKc3FN07+SEYy8br9t/bVv8ZueamfbNug4RW6a5f9l1fY4b+9MlbfU/nxkXfuuS
	tyg945D/lrnlHZuQTfNEqymVxRc+uovdv/f7sgo7a9qN2z/uFCzf9eL0rsZbjVIXv+w/u+jR
	xHs/y3e+kZtUev9/8c7jF3wTmJyCwlrmWH+cuZnt6mddV8VPX/4rlLzh3xPEsi7U9skEWRXF
	BC/DrzGaJzsnVilXKh1we5OU5x71qbbGZseZAy5P+08qi50SbJEx3Lf9/iqpk3x5wfOm+Z95
	FuDkuGTGqcdv/X/vtyjceWFz1OnSacZyFna6XVulfxQosRRnJBpqMRcVJwIAKAYGFbwDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNIsWRmVeSWpSXmKPExsVy+t/xu7oal1akGXy4aGXxYN42Nos1e88x
	Wcw/co7V4uWse2wWmx5fY7W4vGsOm8WM8/uYLNZtvMVu8X/PDnYHTo+ds+6ye2xa1cnmsXlJ
	vUffllWMHp83yQWwRunZFOWXlqQqZOQXl9gqRRtaGOkZWlroGZlY6hkam8daGZkq6dvZpKTm
	ZJalFunbJehl/Fh2h71gsmHF/Xs/mBoYF6p2MXJySAiYSJyf8IoRxBYSWMooMWunNkRcRuLk
	tAZWCFtY4s+1LrYuRi6gmveMEpsOz2UDSfAK2EnsWjkFrIhFQFXi5eSVrBBxQYmTM5+wgNii
	AvIS92/NYAexhQViJD7vW8MMMkhEYB+jxNmppxlBHGaBdkaJO29nQ63YC3TGim9MIC3MAuIS
	t57MB7PZBAwlut52ga3mFLCSeNj6FqrGTKJraxcjhC0vsf3tHOYJjEKzkFwyC8moWUhaZiFp
	WcDIsopRJLW0ODc9t9hIrzgxt7g0L10vOT93EyMwFrcd+7llB+PKVx/1DjEycTAeYpTgYFYS
	4Y2/sjRNiDclsbIqtSg/vqg0J7X4EKMpMDgmMkuJJucDk0FeSbyhmYGpoYmZpYGppZmxkjiv
	Z0FHopBAemJJanZqakFqEUwfEwenVAPTboafDLIse7uEW0U/H6zl82nzqHD5fezsmlqdTbYT
	+uzPtE54+UVhfUHLGYPDvrWKfyZ80fH69j1Ycos87//Loe2Vy35cWbROxCu30Mo9THj39Sk9
	+kzGvzVTbjPYB2yJFXF4/aT/3wb+ysfqL75477hqr83E1rgs8UCmx2/XGV+fz3f9X9kSqcD4
	K2Pn/PL7Rw4vTRZsifw7Z+7ULTfDn1VcjrooyPwtlImtj62IZSXn0VdPQt0tGDQ/+KTPZHoY
	XGfT+f3reZO1nsZT4m2K1h5MDThXxbnc/OnNYylBPsySkinXxUqMG32/PGfjv8Z4atcEq+Uv
	C9SFz6g0WU/26p4Q+3PRRRvV1EYTMx8lluKMREMt5qLiRACaRA+FTgMAAA==
X-CMS-MailID: 20240730114441eucas1p16aabcc3a8097dbe284e73ecf69e6d03c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20240730091412eucas1p18feced3968a5f87dc8fe05f78d5c7659
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20240730091412eucas1p18feced3968a5f87dc8fe05f78d5c7659
References: <20240730091322.5741-1-linux.amoon@gmail.com>
	<CGME20240730091412eucas1p18feced3968a5f87dc8fe05f78d5c7659@eucas1p1.samsung.com>
	<20240730091322.5741-2-linux.amoon@gmail.com>


On 30.07.2024 11:13, Anand Moon wrote:
> As per Exynos 5422 user manual add missing cache information to
> the Exynos542x SoC.
>
> - Each Cortex-A7 core has 32 KB of instruction cache and
> 	32 KB of L1 data cache available.
> - Each Cortex-A15 core has 32 KB of L1 instruction cache and
> 	32 KB of L1 data cache available.
> - The little (A7) cluster has 512 KB of unified L2 cache available.
> - The big (A15) cluster has 2 MB of unified L2 cache available.
>
> Features:
> - Exynos 5422 support cache coherency interconnect (CCI) bus with
>    L2 cache snooping capability. This hardware automatic L2 cache
>    snooping removes the efforts of synchronizing the contents of the
>    two L2 caches in core switching event.
>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>


The provided values are not correct. Please refer to commit 5f41f9198f29 
("ARM: 8864/1: Add workaround for I-Cache line size mismatch between CPU 
cores"), which adds workaround for different l1 icache line size between 
big and little CPUs. This workaround gets enabled on all Exynos542x/5800 
boards.


> ---
>   .../arm/boot/dts/samsung/exynos5422-cpus.dtsi | 74 +++++++++++++++++++
>   1 file changed, 74 insertions(+)
>
> diff --git a/arch/arm/boot/dts/samsung/exynos5422-cpus.dtsi b/arch/arm/boot/dts/samsung/exynos5422-cpus.dtsi
> index 412a0bb4b988..9b9b2bdfb522 100644
> --- a/arch/arm/boot/dts/samsung/exynos5422-cpus.dtsi
> +++ b/arch/arm/boot/dts/samsung/exynos5422-cpus.dtsi
> @@ -59,6 +59,13 @@ cpu0: cpu@100 {
>   			reg = <0x100>;
>   			clocks = <&clock CLK_KFC_CLK>;
>   			clock-frequency = <1000000000>;
> +			d-cache-line-size = <32>;
> +			d-cache-size = <0x8000>;
> +			d-cache-sets = <32>;
> +			i-cache-line-size = <32>;
> +			i-cache-size = <0x8000>;
> +			i-cache-sets = <32>;
> +			next-level-cache = <&L2_a7>;
>   			cci-control-port = <&cci_control0>;
>   			operating-points-v2 = <&cluster_a7_opp_table>;
>   			#cooling-cells = <2>; /* min followed by max */
> @@ -72,6 +79,13 @@ cpu1: cpu@101 {
>   			reg = <0x101>;
>   			clocks = <&clock CLK_KFC_CLK>;
>   			clock-frequency = <1000000000>;
> +			d-cache-line-size = <32>;
> +			d-cache-size = <0x8000>;
> +			d-cache-sets = <32>;
> +			i-cache-line-size = <32>;
> +			i-cache-size = <0x8000>;
> +			i-cache-sets = <32>;
> +			next-level-cache = <&L2_a7>;
>   			cci-control-port = <&cci_control0>;
>   			operating-points-v2 = <&cluster_a7_opp_table>;
>   			#cooling-cells = <2>; /* min followed by max */
> @@ -85,6 +99,13 @@ cpu2: cpu@102 {
>   			reg = <0x102>;
>   			clocks = <&clock CLK_KFC_CLK>;
>   			clock-frequency = <1000000000>;
> +			d-cache-line-size = <32>;
> +			d-cache-size = <0x8000>;
> +			d-cache-sets = <32>;
> +			i-cache-line-size = <32>;
> +			i-cache-size = <0x8000>;
> +			i-cache-sets = <32>;
> +			next-level-cache = <&L2_a7>;
>   			cci-control-port = <&cci_control0>;
>   			operating-points-v2 = <&cluster_a7_opp_table>;
>   			#cooling-cells = <2>; /* min followed by max */
> @@ -98,6 +119,13 @@ cpu3: cpu@103 {
>   			reg = <0x103>;
>   			clocks = <&clock CLK_KFC_CLK>;
>   			clock-frequency = <1000000000>;
> +			d-cache-line-size = <32>;
> +			d-cache-size = <0x8000>;
> +			d-cache-sets = <32>;
> +			i-cache-line-size = <32>;
> +			i-cache-size = <0x8000>;
> +			i-cache-sets = <32>;
> +			next-level-cache = <&L2_a7>;
>   			cci-control-port = <&cci_control0>;
>   			operating-points-v2 = <&cluster_a7_opp_table>;
>   			#cooling-cells = <2>; /* min followed by max */
> @@ -111,6 +139,13 @@ cpu4: cpu@0 {
>   			reg = <0x0>;
>   			clocks = <&clock CLK_ARM_CLK>;
>   			clock-frequency = <1800000000>;
> +			d-cache-line-size = <32>;
> +			d-cache-size = <0x8000>;
> +			d-cache-sets = <32>;
> +			i-cache-line-size = <32>;
> +			i-cache-size = <0x8000>;
> +			i-cache-sets = <32>;
> +			next-level-cache = <&L2_a15>;
>   			cci-control-port = <&cci_control1>;
>   			operating-points-v2 = <&cluster_a15_opp_table>;
>   			#cooling-cells = <2>; /* min followed by max */
> @@ -124,6 +159,13 @@ cpu5: cpu@1 {
>   			reg = <0x1>;
>   			clocks = <&clock CLK_ARM_CLK>;
>   			clock-frequency = <1800000000>;
> +			d-cache-line-size = <32>;
> +			d-cache-size = <0x8000>;
> +			d-cache-sets = <32>;
> +			i-cache-line-size = <32>;
> +			i-cache-size = <0x8000>;
> +			i-cache-sets = <32>;
> +			next-level-cache = <&L2_a15>;
>   			cci-control-port = <&cci_control1>;
>   			operating-points-v2 = <&cluster_a15_opp_table>;
>   			#cooling-cells = <2>; /* min followed by max */
> @@ -137,6 +179,13 @@ cpu6: cpu@2 {
>   			reg = <0x2>;
>   			clocks = <&clock CLK_ARM_CLK>;
>   			clock-frequency = <1800000000>;
> +			d-cache-line-size = <32>;
> +			d-cache-size = <0x8000>;
> +			d-cache-sets = <32>;
> +			i-cache-line-size = <32>;
> +			i-cache-size = <0x8000>;
> +			i-cache-sets = <32>;
> +			next-level-cache = <&L2_a15>;
>   			cci-control-port = <&cci_control1>;
>   			operating-points-v2 = <&cluster_a15_opp_table>;
>   			#cooling-cells = <2>; /* min followed by max */
> @@ -150,12 +199,37 @@ cpu7: cpu@3 {
>   			reg = <0x3>;
>   			clocks = <&clock CLK_ARM_CLK>;
>   			clock-frequency = <1800000000>;
> +			d-cache-line-size = <32>;
> +			d-cache-size = <0x8000>;
> +			d-cache-sets = <32>;
> +			i-cache-line-size = <32>;
> +			i-cache-size = <0x8000>;
> +			i-cache-sets = <32>;
> +			next-level-cache = <&L2_a15>;
>   			cci-control-port = <&cci_control1>;
>   			operating-points-v2 = <&cluster_a15_opp_table>;
>   			#cooling-cells = <2>; /* min followed by max */
>   			capacity-dmips-mhz = <1024>;
>   			dynamic-power-coefficient = <310>;
>   		};
> +
> +		L2_a7: l2-cache-cluster0 {
> +			compatible = "cache";
> +			cache-level = <2>;
> +			cache-unified;
> +			cache-size = <0x80000>;	/* L2. 512 KB */
> +			cache-line-size = <64>;
> +			cache-sets = <512>;
> +		};
> +
> +		L2_a15: l2-cache-cluster1 {
> +			compatible = "cache";
> +			cache-level = <2>;
> +			cache-unified;
> +			cache-size = <0x200000>; /* L2, 2M */
> +			cache-line-size = <64>;
> +			cache-sets = <512>;
> +		};
>   	};
>   };
>   

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

