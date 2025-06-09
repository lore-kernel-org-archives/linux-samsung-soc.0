Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761AE881E
	for <linux-samsung-soc@vger.kernel.org>; Mon,  9 Jun 2025 08:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749457980; cv=none; b=KzmceawrLDfWAzFxOukpmy2V0hGrLQ50fDVQ443LIh+b6A2kG3kiH7LSowbOVcCRUEMXjw/mjsj7FuGPbR3w0IJt4fonuteytZe1ivyeAcdwbfoXm+1DWNsg8LZhyo2yBTV6f1ZTUhCVB/5pd641a04Lht5rRukfUyDrrBS/oLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749457980; c=relaxed/simple;
	bh=YvbeRS0CNwTQZDVWn3o5Ny73fqKXWOdsBfUGNRzl0Jw=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=ZgF37sC3LA2MMZotrpe0hgzdWrnXAJe4Pavua/8j/afSw5qpv/xCci4Ggn4FTEVMuwEH2aZ3YK41cT5p5WJapur6skTQRjkJTNodm6KFYd8Fr5rVLn2kyXEQvPJ9twZ2uZkEvdCCQS5OiTOFvkCx7DWHWC25aFLAx+5hi2NZrU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=GOoEi8dn; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="GOoEi8dn"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250609083255epoutp03999285c01ef8a243c7b1ca3a5dc73206~HUsJ1VPUJ0451604516epoutp03e
	for <linux-samsung-soc@vger.kernel.org>; Mon,  9 Jun 2025 08:32:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250609083255epoutp03999285c01ef8a243c7b1ca3a5dc73206~HUsJ1VPUJ0451604516epoutp03e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1749457975;
	bh=raYhcpxvaUZ+U3DFFXokA1FxIAXMkZbDHQQsHnlKWKI=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=GOoEi8dngFVNeJONQ9mfq/T09fwR7WYEGOMbyQK+/rtoK0dGisjvx6pEr8hFVh6At
	 ZfK9QzcjKwu+ZraOf0+tatFdzdLep5bvLjWdCBJlcycDJocNu+xUafHoNDqc2Y42Vu
	 xv6kbPMU863HBsH29OktGcSRHPjWjLGG+hVYZ8j0=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250609083254epcas5p4582a8ece71f15b0d09c96fde109aabc7~HUsJBovem0515605156epcas5p49;
	Mon,  9 Jun 2025 08:32:54 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.183]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4bG4tX4gGSz6B9m9; Mon,  9 Jun
	2025 08:32:52 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250609083251epcas5p1380bd5ffe9b5b91f776a1c7f48b317df~HUsGa3UxF3208532085epcas5p1d;
	Mon,  9 Jun 2025 08:32:51 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250609083249epsmtip1185a8a7cdb024a1a522bad1061beae6f~HUsEApVOx2620026200epsmtip1X;
	Mon,  9 Jun 2025 08:32:49 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Raghav Sharma'" <raghav.s@samsung.com>, <krzk@kernel.org>,
	<s.nawrocki@samsung.com>, <cw00.choi@samsung.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
	<conor+dt@kernel.org>, <richardcochran@gmail.com>,
	<sunyeal.hong@samsung.com>, <shin.son@samsung.com>
Cc: <linux-samsung-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
	<chandan.vn@samsung.com>, <karthik.sun@samsung.com>,
	<dev.tailor@samsung.com>
In-Reply-To: <20250529112640.1646740-5-raghav.s@samsung.com>
Subject: RE: [PATCH v3 4/4] arm64: dts: exynosautov920: add CMU_HSI2 clock
 DT nodes
Date: Mon, 9 Jun 2025 14:02:47 +0530
Message-ID: <047901dbd919$16a39270$43eab750$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIRyuXPQglR2pg1tLiplohNF2WAzQHWb0Q+AhHSDDezb1SDcA==
Content-Language: en-us
X-CMS-MailID: 20250609083251epcas5p1380bd5ffe9b5b91f776a1c7f48b317df
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250529111718epcas5p4572d6aa7ae959b585b658d5a94f2b4ef
References: <20250529112640.1646740-1-raghav.s@samsung.com>
	<CGME20250529111718epcas5p4572d6aa7ae959b585b658d5a94f2b4ef@epcas5p4.samsung.com>
	<20250529112640.1646740-5-raghav.s@samsung.com>

Hi Raghav

> -----Original Message-----
> From: Raghav Sharma <raghav.s@samsung.com>
> Sent: Thursday, May 29, 2025 4:57 PM
> To: krzk@kernel.org; s.nawrocki@samsung.com; cw00.choi@samsung.com;
> alim.akhtar@samsung.com; mturquette@baylibre.com; sboyd@kernel.org;
> robh@kernel.org; conor+dt@kernel.org; richardcochran@gmail.com;
> sunyeal.hong@samsung.com; shin.son@samsung.com
> Cc: linux-samsung-soc@vger.kernel.org; linux-clk@vger.kernel.org;
> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> kernel@vger.kernel.org; netdev@vger.kernel.org;
> chandan.vn@samsung.com; karthik.sun@samsung.com;
> dev.tailor@samsung.com; Raghav Sharma <raghav.s@samsung.com>
> Subject: [PATCH v3 4/4] arm64: dts: exynosautov920: add CMU_HSI2 clock DT
> nodes
> 
> Add required dt node for CMU_HSI2 block, which provides clocks to ufs and
> ethernet IPs
> 
> Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> ---

Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>

>  arch/arm64/boot/dts/exynos/exynosautov920.dtsi | 17
> +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
> b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
> index 2cb8041c8a9f..7890373f5da0 100644
> --- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
> @@ -1048,6 +1048,23 @@ pinctrl_hsi1: pinctrl@16450000 {
>  			interrupts = <GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>;
>  		};
> 
> +		cmu_hsi2: clock-controller@16b00000 {
> +			compatible = "samsung,exynosautov920-cmu-hsi2";
> +			reg = <0x16b00000 0x8000>;
> +			#clock-cells = <1>;
> +
> +			clocks = <&xtcxo>,
> +				 <&cmu_top DOUT_CLKCMU_HSI2_NOC>,
> +				 <&cmu_top
> DOUT_CLKCMU_HSI2_NOC_UFS>,
> +				 <&cmu_top
> DOUT_CLKCMU_HSI2_UFS_EMBD>,
> +				 <&cmu_top
> DOUT_CLKCMU_HSI2_ETHERNET>;
> +			clock-names = "oscclk",
> +				      "noc",
> +				      "ufs",
> +				      "embd",
> +				      "ethernet";
> +		};
> +
>  		pinctrl_hsi2: pinctrl@16c10000 {
>  			compatible = "samsung,exynosautov920-pinctrl";
>  			reg = <0x16c10000 0x10000>;
> --
> 2.34.1


