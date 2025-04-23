Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D19B256C6D
	for <linux-samsung-soc@vger.kernel.org>; Wed, 23 Apr 2025 01:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745370319; cv=none; b=bHsrrxdR4pRyEpK7sWPDdy8OgnOC13UNPWWzyuYqkBJ/pJQUhywooWIwYN3QlwT6kD9ULXMpfIRam7NIyKf9xI4ksA0EnLtJCFtAyDdQ89a+r3nlv8GV1PS5OEym+iv/cuFqECBMPsH/gppfNmMCUEF85Is/zVwU+lmSz4TsPvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745370319; c=relaxed/simple;
	bh=S3VynQkL+J30C91IMEY8VWWuKTtlTQTO3qXoF4phIjo=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=UDz3r43vkolz0XQ6np/9tzBYeO11cdBMbbjrLGzqX6L4mH2c59wBFMAj9Gd7oyF0Heevo0XrIzIdYUceMnGtj0qnAmsLHR1Hzjg5Q8tEjZXt+rm2vhvjljAVL5N489tRCcS6gGv9AN5mzMmGf9UDzJe8xEeNKvvIm7Y942r5qMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=AioVbg1e; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="AioVbg1e"
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250423010514epoutp03a8ae10c3750bbc22a02c52b9f9dc8d49~4zQ3ASrpu3111031110epoutp03V
	for <linux-samsung-soc@vger.kernel.org>; Wed, 23 Apr 2025 01:05:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250423010514epoutp03a8ae10c3750bbc22a02c52b9f9dc8d49~4zQ3ASrpu3111031110epoutp03V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1745370314;
	bh=pP+IFx7ncq0fcK/ShQu839YBHEsPNXLC3iMltP1GXV4=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=AioVbg1e2l/lYwDwIwuEkC1G413Ju9wZisMPf1goRUTEDXD+mjQP8X/K52eYDeUAf
	 vPPDK8FAa3DOk5McWfIafPYyXLlpjKA21/aHZ1Hl/Lr/qtCfo7XIkcaFoJoM+owoXb
	 xDecayfFbg9t0B0O1+aE6K0T44Kz7Ze5DamlLk0M=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
	20250423010514epcas2p4b2e31b25ce7e072e855c025729968f57~4zQ2oiYEO0926009260epcas2p44;
	Wed, 23 Apr 2025 01:05:14 +0000 (GMT)
Received: from epcas2p1.samsung.com (unknown [182.195.36.88]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4Zj19j5NMjz3hhTJ; Wed, 23 Apr
	2025 01:05:13 +0000 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20250423010513epcas2p4a58363956c1dab356dc2004471232d46~4zQ1nc1qf1202112021epcas2p4D;
	Wed, 23 Apr 2025 01:05:13 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250423010513epsmtrp15a682a7fd5d5c8ce826e278baa2c388c~4zQ1mEXdE2717927179epsmtrp1X;
	Wed, 23 Apr 2025 01:05:13 +0000 (GMT)
X-AuditID: b6c32a29-55afd7000000223e-49-68083cc81705
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	8A.82.08766.8CC38086; Wed, 23 Apr 2025 10:05:12 +0900 (KST)
Received: from KORCO115296 (unknown [12.36.150.221]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250423010512epsmtip1f394b0c85d0f7460339f546da0bb6f4c~4zQ1UwOTK1433614336epsmtip1H;
	Wed, 23 Apr 2025 01:05:12 +0000 (GMT)
From: =?UTF-8?B?7IaQ7Iug?= <shin.son@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, "'Sylwester Nawrocki'"
	<s.nawrocki@samsung.com>, "'Chanwoo Choi'" <cw00.choi@samsung.com>, "'Alim
 Akhtar'" <alim.akhtar@samsung.com>, "'Michael Turquette'"
	<mturquette@baylibre.com>, "'Stephen Boyd'" <sboyd@kernel.org>, "'Rob
 Herring'" <robh@kernel.org>, "'Conor Dooley'" <conor+dt@kernel.org>,
	"'Sunyeal Hong'" <sunyeal.hong@samsung.com>
Cc: <linux-samsung-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <bc7a33de-9c8c-4377-a813-562da18ab314@kernel.org>
Subject: RE: [PATCH 3/3] arm64: dts: exynosautov920: add cpucl0 clock DT
 nodes
Date: Wed, 23 Apr 2025 10:05:12 +0900
Message-ID: <003801dbb3eb$c435aca0$4ca105e0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AQGPEGrsijGqefHqKZlvX6MGGm+h1AGVZY6SAqxO1r0BaffYMbQcWNlQ
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGIsWRmVeSWpSXmKPExsWy7bCSnO4JG44Mg/mTzSwezNvGZrFm7zkm
	i+tfnrNazD9yjtXi/PkN7BabHl9jtfjYc4/V4vKuOWwWM87vY7K4eMrV4v+eHewWh9+0s1r8
	u7aRxaJp2XomBz6P9zda2T02repk89i8pN6jb8sqRo/Pm+QCWKO4bFJSczLLUov07RK4Mg40
	3WAsuMVfcX97D2sDYydvFyMnh4SAicSzdwvZuxi5OIQEdjNKbGjYwA6RkJA4PGMCI4QtLHG/
	5QgrRNFzRonLT6ezgSTYBAwlVv3YzgSSEBGYyCxx6cMFFhCHWWATo8S53TfZIFreM0qs7rwP
	NpdTwE7i2JcdzCC2sICfRE/3BxYQm0VAVeL+kXlA+zg4eAUsJX7fBgvzCghKnJz5BMxmFtCW
	6H3Yyghhy0tsfzuHGeI8BYndn46ygtgiAm4SvR//sEHUiEjM7mxjnsAoPAvJqFlIRs1CMmoW
	kpYFjCyrGCVTC4pz03OLDQsM81LL9YoTc4tL89L1kvNzNzGCo1JLcwfj9lUf9A4xMnEwHmKU
	4GBWEuH95caeIcSbklhZlVqUH19UmpNafIhRmoNFSZxX/EVvipBAemJJanZqakFqEUyWiYNT
	qoGpf765d2irwcNvHw89luU+IyzpasTkNDnceF+h2NmFVz+9M9bRTgjaPuX1RVtfxwv82/xs
	Z8hvbnz49t9snsTf0n8kzzpfOSstvdIlI7/hr/r2ErMDBVEcve+WqG6sU6xQjpvGInfbTNRc
	4rLDxrlnrBtiv9XOL21SsTBkvPr3p++1Egvra7+n9yXPfZLqsXPz7WXzhTYrGKjzpcb9P7o8
	j2Gdpuv/S7mpfSK7r6XejX334wCz077Z84pFZJbOz5FrTZ0s+G/CbcHsE57uRV29lyT3sRov
	+9H742DVyz4+59Q184t7LTQYykymxVtIlx54bTRb5I3fkqAJp5X//n55x81J6sijB0L1/nmr
	VwYrsRRnJBpqMRcVJwIAb2U1azkDAAA=
X-CMS-MailID: 20250423010513epcas2p4a58363956c1dab356dc2004471232d46
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250418061515epcas2p4b57102967b07d665051a6297ab451a3c
References: <20250418061500.1629200-1-shin.son@samsung.com>
	<CGME20250418061515epcas2p4b57102967b07d665051a6297ab451a3c@epcas2p4.samsung.com>
	<20250418061500.1629200-4-shin.son@samsung.com>
	<bc7a33de-9c8c-4377-a813-562da18ab314@kernel.org>

Hello Krzysztof Kozlowski,

> -----Original Message-----
> From: Krzysztof Kozlowski [mailto:krzk@kernel.org]
> Sent: Tuesday, April 22, 2025 5:00 PM
> To: Shin Son <shin.son@samsung.com>; Sylwester Nawrocki
> <s.nawrocki@samsung.com>; Chanwoo Choi <cw00.choi@samsung.com>; Alim
> Akhtar <alim.akhtar@samsung.com>; Michael Turquette
> <mturquette@baylibre.com>; Stephen Boyd <sboyd@kernel.org>; Rob Herring
> <robh@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Sunyeal Hong
> <sunyeal.hong@samsung.com>
> Cc: linux-samsung-soc@vger.kernel.org; linux-clk@vger.kernel.org;
> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> kernel@vger.kernel.org
> Subject: Re: [PATCH 3/3] arm64: dts: exynosautov920: add cpucl0 clock DT
> nodes
> 
> On 18/04/2025 08:15, Shin Son wrote:
> > Add cmu_cpucl0 clocks for switch, cluster, and dbg domains respectively.
> >
> > Signed-off-by: Shin Son <shin.son@samsung.com>
> > ---
> >  arch/arm64/boot/dts/exynos/exynosautov920.dtsi | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
> b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
> > index fc6ac531d597..d1528633adfe 100644
> > --- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
> > +++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
> > @@ -582,6 +582,21 @@ pinctrl_aud: pinctrl@1a460000 {
> >  			compatible = "samsung,exynosautov920-pinctrl";
> >  			reg = <0x1a460000 0x10000>;
> >  		};
> > +
> > +		cmu_cpucl0: clock-controller@1ec00000 {
> > +			compatible = "samsung,exynosautov920-cmu-cpucl0";
> > +			reg = <0x1EC00000 0x8000>;
> 
> Lowercase hex.
> > +			#clock-cells = <1>;
> > +
> > +			clocks = <&xtcxo>,
> > +				<&cmu_top DOUT_CLKCMU_CPUCL0_SWITCH>,
> 
> This looks misaligned.
> 
> 
> Best regards,
> Krzysztof

Thanks for the quick response.
I'll revise everything you pointed out and send an  updated patch shortly.

Best regards,
Shin Son

