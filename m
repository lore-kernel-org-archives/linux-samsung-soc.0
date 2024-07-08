Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0CB1DA4E
	for <linux-samsung-soc@vger.kernel.org>; Mon,  8 Jul 2024 11:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720436729; cv=none; b=ctBcs42TSiNA/fuEo+1rf5wiU1rARcVEwFE8yKXrmgzq37znKWCbciSf8jgbewrTzpKiSmba+m2NNXRMU9+bJUjHQ/+Cvj1DrD+ujlShe5vfWZggRMk7rkWrf5IwgM/wk5s55ykYnrWYiX7DCJpDmS5mCVD7XICoBcavFY5Nkjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720436729; c=relaxed/simple;
	bh=Fz1hNpc1a9lRNAxVwjw3EIxjdgXejbsHUuImVYrQtmU=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=u3DwB9sH76XJHu5aLybbktKuYBlp0XVNihM4XjArPiyZM741aMcovyWx9rMBsrehta0+2Rj1ysiCbGjnQdHIN6lTRnFO+gjlbOLILN8fsI9Y/n9vVlClHZYTyFDbpNgGojP7wLy9Iu6wxKI6WwEoRe5u2qZU+X6h6GYrc4E93kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=iR3Oz2dO; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="iR3Oz2dO"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20240708110525epoutp027a6ced19b80b5bb2a877343abd386e44~gOBYMdjsC2170921709epoutp02a
	for <linux-samsung-soc@vger.kernel.org>; Mon,  8 Jul 2024 11:05:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20240708110525epoutp027a6ced19b80b5bb2a877343abd386e44~gOBYMdjsC2170921709epoutp02a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1720436725;
	bh=edWOgq+47j6RjtPzbJiMxL+RDBWdxNJFAhdSeOiUlDA=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=iR3Oz2dOkWvmSPOLp47RR2/OJf601eRE5VPLnj6u5faU/XUu9Qf2ae9dyIhC/VQZy
	 /TsGrbF9AT/1ZaBTZFoTf8S8GtBLiG57yf4iSnMFHdX058TdkYq6pcpTbGUgOjLuHx
	 Maw1f43EZ/fnOzJLHJ8+Alt6Y2Fn1gRQiikKVJgw=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTP id
	20240708110524epcas5p11d4c5fe6d1062a8bc36500c6c1a49ad4~gOBXzYXbS1920419204epcas5p1O;
	Mon,  8 Jul 2024 11:05:24 +0000 (GMT)
Received: from epsmges5p2new.samsung.com (unknown [182.195.38.180]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4WHh9b106bz4x9Pq; Mon,  8 Jul
	2024 11:05:23 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
	epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	41.97.09989.2F7CB866; Mon,  8 Jul 2024 20:05:22 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20240708110521epcas5p4a58dda213051749c1b402db30c6545a9~gOBVDAgPr2322323223epcas5p4r;
	Mon,  8 Jul 2024 11:05:21 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20240708110521epsmtrp1e1b21bfdbf88dda5bf258d4dcd0bab66~gOBVCOb4q2572525725epsmtrp1Y;
	Mon,  8 Jul 2024 11:05:21 +0000 (GMT)
X-AuditID: b6c32a4a-e57f970000002705-52-668bc7f27dc8
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	E6.37.07412.1F7CB866; Mon,  8 Jul 2024 20:05:21 +0900 (KST)
Received: from INBRO002756 (unknown [107.122.12.5]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20240708110519epsmtip215208df90841a394d1b63b8a70720e50~gOBTJektR1337213372epsmtip2H;
	Mon,  8 Jul 2024 11:05:19 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Sunyeal Hong'" <sunyeal.hong@samsung.com>, "'Krzysztof Kozlowski'"
	<krzk@kernel.org>, "'Sylwester Nawrocki'" <s.nawrocki@samsung.com>,
	"'Chanwoo Choi'" <cw00.choi@samsung.com>, "'Michael Turquette'"
	<mturquette@baylibre.com>, "'Stephen Boyd'" <sboyd@kernel.org>, "'Rob
 Herring'" <robh@kernel.org>, "'Conor Dooley'" <conor+dt@kernel.org>
Cc: <linux-samsung-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <20240707231331.3433340-3-sunyeal.hong@samsung.com>
Subject: RE: [PATCH v2 2/4] arm64: dts: exynos: add initial CMU clock nodes
 in Exynos Auto v920
Date: Mon, 8 Jul 2024 16:35:18 +0530
Message-ID: <000101dad126$b964e2d0$2c2ea870$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJHtUpDsgLCeLIQdS8546uqgvLWdQIAh4UhAdGvMNqw9FDbkA==
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrKJsWRmVeSWpSXmKPExsWy7bCmpu6n491pBqs/WFus2XuOyeL6l+es
	FvOPnGO1OH9+A7vFpsfXWC0+9txjtbi8aw6bxYzz+5gsLp5ytfi/Zwe7xeE37awW/65tZLFo
	WraeyYHX4/2NVnaPTas62Tw2L6n36NuyitHj8ya5ANaobJuM1MSU1CKF1Lzk/JTMvHRbJe/g
	eOd4UzMDQ11DSwtzJYW8xNxUWyUXnwBdt8wcoBOVFMoSc0qBQgGJxcVK+nY2RfmlJakKGfnF
	JbZKqQUpOQUmBXrFibnFpXnpenmpJVaGBgZGpkCFCdkZb79pFSyWr1j86yVbA+MKyS5GTg4J
	AROJ7XOusncxcnEICexmlPjz5g4jhPOJUaJ16X4mCOcbo8Tta6uZYVqePDsEVbWXUeLttq9s
	EM4LRonpy96BVbEJ6ErsWNzGBmKLCNxjkvi41xykiFlgHaPE5plHgDZycHAKOEjc2aoJUiMs
	kCjx+ckEJpAwi4CKxNZfYGN4BSwl7u3bzAJhC0qcnPkEzGYW0JZYtvA11EEKEj+fLmOFWOUk
	sb/jCBNEjbjEy6NHwH6TEDjAIfFu1Q4WiAYXidtbX7JB2MISr45vYYewpSRe9rdB2dkSxy/O
	gqqpkOhu/QgVt5fY+egmC8idzAKaEut36UPs4pPo/f0E7HwJAV6JjjYhiGpVieZ3V6G2SktM
	7O5mhbA9JL5fb2CfwKg4C8lns5B8NgvJB7MQli1gZFnFKJlaUJybnlpsWmCUl1oOj+7k/NxN
	jOD0q+W1g/Hhgw96hxiZOBgPMUpwMCuJ8J5+3J4mxJuSWFmVWpQfX1Sak1p8iNEUGNoTmaVE
	k/OBGSCvJN7QxNLAxMzMzMTS2MxQSZz3devcFCGB9MSS1OzU1ILUIpg+Jg5OqQam2Gv6uy26
	bz/+s+ZqgNRpQ5Gnq13VIr2eJ2/dVCT6vm1aptSt98UfG6LWSTfeu9d38x2v5Of7D97f+mo/
	XavYvu3nsgRHY9nkquaNJs+0n5srb3mUpzrVW4F36YGuJcdSRde/Xe78gJOtasu/uvef4nmr
	b096Y3JKteViv2vxJ7sIlyKme09rGJ4KBjVo7dj3uFPG6uV3zeq19bXOnKycXZwfbdakf36X
	usVacrXd28wpU2f9XOGWsnFNxN9wbt7Xp8J/3Uy61XwoY04ya5J/X0WhZ6Jjv4TRldgIhRf7
	ZrH8YK+7zVuxfdqW888SVhisP963vXNNh/7e3DufGD7FWfdw9v/uCveVztr1fmamEktxRqKh
	FnNRcSIAAWQtd0gEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprHIsWRmVeSWpSXmKPExsWy7bCSvO7H491pBhPeS1ms2XuOyeL6l+es
	FvOPnGO1OH9+A7vFpsfXWC0+9txjtbi8aw6bxYzz+5gsLp5ytfi/Zwe7xeE37awW/65tZLFo
	WraeyYHX4/2NVnaPTas62Tw2L6n36NuyitHj8ya5ANYoLpuU1JzMstQifbsErozL7etZCq7J
	Vjw7/pO5gfGmeBcjJ4eEgInEk2eHGLsYuTiEBHYzSmyY/oYNIiEtcX3jBHYIW1hi5b/n7BBF
	zxglbh/bBVbEJqArsWNxG5gtIvCESWLr4WiQImaBTYwS53bfBEsICRxllHi4PaOLkYODU8BB
	4s5WTZCwsEC8xNtH75hBwiwCKhJbfzGDhHkFLCXu7dvMAmELSpyc+QTMZhbQlnh68ymcvWzh
	a2aI2xQkfj5dxgpxgpPE/o4jTBA14hIvjx5hn8AoPAvJqFlIRs1CMmoWkpYFjCyrGCVTC4pz
	03OTDQsM81LL9YoTc4tL89L1kvNzNzGCo1BLYwfjvfn/9A4xMnEwHmKU4GBWEuE9/bg9TYg3
	JbGyKrUoP76oNCe1+BCjNAeLkjiv4YzZKUIC6YklqdmpqQWpRTBZJg5OqQamgoObauP+fjgv
	PUfi/zutSMdvwdNVW0/vkNmhL+6mGLVsf2xzWf7il19qlnbfnn41dfst8dXP2BLYvB6xZSZu
	MYgLSFmcfed29sWYt49+Tphvol6Y+dnik/C0/2sWnHbRntT69M7nJXfvb1xpsG0Ng7ZDG+sO
	VqUVR5UX+qta7z0oul9xt9fLb4xVs6XVP+U8nsBodPbR56UZmw/ZSZvNVzRs6v7onGBqVdZk
	0um9w/jVMiZ5/iwOoQ1esZt/dpydmdNQVTI7pFsiR+6odfQh/8itzmum5+8TWm+2svuQj3JG
	mKSs8OV9Z2cd2H+uatLML2/rU3bzPXzVfr6HtYbZ/v6Dq3sn6jzkr3Zenhx3UImlOCPRUIu5
	qDgRAGHeitMxAwAA
X-CMS-MailID: 20240708110521epcas5p4a58dda213051749c1b402db30c6545a9
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240707231445epcas2p2cf78684e3cbcf8ed914a0d8e52115216
References: <20240707231331.3433340-1-sunyeal.hong@samsung.com>
	<CGME20240707231445epcas2p2cf78684e3cbcf8ed914a0d8e52115216@epcas2p2.samsung.com>
	<20240707231331.3433340-3-sunyeal.hong@samsung.com>



> -----Original Message-----
> From: Sunyeal Hong <sunyeal.hong=40samsung.com>
> Sent: Monday, July 8, 2024 4:43 AM
> To: Krzysztof Kozlowski <krzk=40kernel.org>; Sylwester Nawrocki
> <s.nawrocki=40samsung.com>; Chanwoo Choi <cw00.choi=40samsung.com>;
> Alim Akhtar <alim.akhtar=40samsung.com>; Michael Turquette
> <mturquette=40baylibre.com>; Stephen Boyd <sboyd=40kernel.org>; Rob
> Herring <robh=40kernel.org>; Conor Dooley <conor+dt=40kernel.org>
> Cc: linux-samsung-soc=40vger.kernel.org; linux-clk=40vger.kernel.org;
> devicetree=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org; lin=
ux-
> kernel=40vger.kernel.org; Sunyeal Hong <sunyeal.hong=40samsung.com>
> Subject: =5BPATCH v2 2/4=5D arm64: dts: exynos: add initial CMU clock nod=
es in
> Exynos Auto v920
>=20
> Add cmu_top, cmu_peric0 clock nodes and
> switch USI clocks instead of dummy fixed-rate-clock.
>=20
> Signed-off-by: Sunyeal Hong <sunyeal.hong=40samsung.com>
> ---
>  .../arm64/boot/dts/exynos/exynosautov920.dtsi =7C 40 +++++++++++++------
>  1 file changed, 27 insertions(+), 13 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
> b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
> index c1c8566d74f5..54fc32074379 100644
> --- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
> =40=40 -6,6 +6,7 =40=40
>   *
>   */
>=20
> +=23include <dt-bindings/clock/samsung,exynosautov920.h>
>  =23include <dt-bindings/interrupt-controller/arm-gic.h>
>  =23include <dt-bindings/soc/samsung,exynos-usi.h>
>=20
> =40=40 -38,17 +39,6 =40=40 xtcxo: clock =7B
>  		clock-output-names =3D =22oscclk=22;
>  	=7D;
>=20
> -	/*
> -	 * FIXME: Keep the stub clock for serial driver, until proper clock
> -	 * driver is implemented.
> -	 */
> -	clock_usi: clock-usi =7B
> -		compatible =3D =22fixed-clock=22;
> -		=23clock-cells =3D <0>;
> -		clock-frequency =3D <200000000>;
> -		clock-output-names =3D =22usi=22;
> -	=7D;
> -
>  	cpus: cpus =7B
>  		=23address-cells =3D <2>;
>  		=23size-cells =3D <0>;
> =40=40 -182,6 +172,28 =40=40 chipid=4010000000 =7B
>  			reg =3D <0x10000000 0x24>;
>  		=7D;
>=20
> +		cmu_peric0: clock-controller=4010800000 =7B
> +			compatible =3D =22samsung,exynosautov920-cmu-
> peric0=22;
> +			reg =3D <0x10800000 0x8000>;
Please cross check the size of the register range, this looks to be more th=
en what is needed.=20

> +			=23clock-cells =3D <1>;
> +
> +			clocks =3D <&xtcxo>,
> +				 <&cmu_top DOUT_CLKCMU_PERIC0_NOC>,
> +				 <&cmu_top DOUT_CLKCMU_PERIC0_IP>;
> +			clock-names =3D =22oscclk=22,
> +				      =22noc=22,
> +				      =22ip=22;
> +		=7D;
> +
> +		cmu_top: clock-controller=4011000000 =7B
> +			compatible =3D =22samsung,exynosautov920-cmu-top=22;
> +			reg =3D <0x11000000 0x8000>;
> +			=23clock-cells =3D <1>;
> +
> +			clocks =3D <&xtcxo>;
> +			clock-names =3D =22oscclk=22;
> +		=7D;
> +
>  		gic: interrupt-controller=4010400000 =7B
>  			compatible =3D =22arm,gic-v3=22;
>  			=23interrupt-cells =3D <3>;
> =40=40 -213,7 +225,8 =40=40 usi_0: usi=40108800c0 =7B
>  			=23address-cells =3D <1>;
>  			=23size-cells =3D <1>;
>  			ranges;
> -			clocks =3D <&clock_usi>, <&clock_usi>;
> +			clocks =3D <&cmu_peric0
> CLK_MOUT_PERIC0_NOC_USER>,
> +				 <&cmu_peric0
> CLK_DOUT_PERIC0_USI00_USI>;
>  			clock-names =3D =22pclk=22, =22ipclk=22;
>  			status =3D =22disabled=22;
>=20
> =40=40 -224,7 +237,8 =40=40 serial_0: serial=4010880000 =7B
>  				interrupts =3D <GIC_SPI 764
> IRQ_TYPE_LEVEL_HIGH>;
>  				pinctrl-names =3D =22default=22;
>  				pinctrl-0 =3D <&uart0_bus>;
> -				clocks =3D <&clock_usi>, <&clock_usi>;
> +				clocks =3D <&cmu_peric0
> CLK_MOUT_PERIC0_NOC_USER>,
> +					 <&cmu_peric0
> CLK_DOUT_PERIC0_USI00_USI>;
>  				clock-names =3D =22uart=22, =22clk_uart_baud0=22;
>  				samsung,uart-fifosize =3D <256>;
>  				status =3D =22disabled=22;
> --
> 2.45.2


