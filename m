Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD75A281376
	for <linux-samsung-soc@vger.kernel.org>; Wed, 23 Apr 2025 08:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745396635; cv=none; b=jiDrti+gPAYNep/P2ZXV/N+Jt7/yXghz4bBWazfb4tw4JbSgvmqkMOf6nBinPVjySktSATewFSMfeRYfdeHGCnBSs27Yp6vuWnN1hw8EoK57QaCehNpXG4YjwHdA4sfiB3by8GJ8zcHmlqwdR39bo5Fo4d8fDVVi+BzV587TMLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745396635; c=relaxed/simple;
	bh=nA8rNGt4A1igenmejWnsQynu+m/nFjtozT6TQLu70NI=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=rZu/RquPRPcEeYsSzHn60im84Py/vY9/hWfl4DPKQeSr15nCIutauSAIIp9Xr93+gnSjPkoHYjNVawbVM+Ysz3/XEIPIXlaqor2vpSIRkPEgXg/mqPvFrBhLntILMYmhKLtvRgB8zjpPEHQA6/EIqfGZAXUSSlfLLaEztUUNWyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=svc3XXae; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="svc3XXae"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250423082344epoutp031c51b7f4648e8ab62d5b07b0b77a273f~45PtqCsLk1217812178epoutp03P
	for <linux-samsung-soc@vger.kernel.org>; Wed, 23 Apr 2025 08:23:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250423082344epoutp031c51b7f4648e8ab62d5b07b0b77a273f~45PtqCsLk1217812178epoutp03P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1745396624;
	bh=4S1yvQgwjaSQPCxRvjbfFApSmtTLLVqtOux/1CmiffM=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=svc3XXaemdH98jUA8H5RBZnG51pHpCw0Cqv1L20oGkKKbHwb2ykgfQwgay6kuPIeE
	 Dny87YEJKb59sEihRkJ9bPhQ9+yVjv/tr/GOAe1PZrtS5mAQ4YaTyquFBi2zFE9GDZ
	 BVjZSptrZlymnoChPdh1deegEVZ7PL4Pa9u+ArdA=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250423082343epcas5p2859446c8e5bc718417786106955cc012~45PsvxeeO1969819698epcas5p28;
	Wed, 23 Apr 2025 08:23:43 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.176]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4ZjBvd5GpSz6B9mD; Wed, 23 Apr
	2025 08:23:41 +0000 (GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250423082341epcas5p39444809bd4c8cb0676dc942d76b42365~45PrBIWav1352713527epcas5p3m;
	Wed, 23 Apr 2025 08:23:41 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250423082341epsmtrp20653e6b78f9f4c17e6effa4382b3c3bb~45PrATVbO0694106941epsmtrp2J;
	Wed, 23 Apr 2025 08:23:41 +0000 (GMT)
X-AuditID: b6c32a28-460ee70000001e8a-53-6808a38dc248
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	81.F5.07818.D83A8086; Wed, 23 Apr 2025 17:23:41 +0900 (KST)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250423082339epsmtip2a817efb40038bd9238c8dd033bde5bcc~45PpYrBW91211812118epsmtip2W;
	Wed, 23 Apr 2025 08:23:39 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Yashwant Varur'" <yashwant.v@samsung.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Cc: <cs0617.lee@samsung.com>, <g.naidu@samsung.com>,
	<niyas.ahmed@samsung.com>
In-Reply-To: <20250423060034.973-1-yashwant.v@samsung.com>
Subject: RE: [PATCH] arm64: dts: exynos: Added the ethernet pin
 configuration
Date: Wed, 23 Apr 2025 13:53:38 +0530
Message-ID: <008a01dbb429$04f55f50$0ee01df0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQI+tP5AvR0g22A5T67WLyfPVk3CYgKkYErqstW+shA=
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprAIsWRmVeSWpSXmKPExsWy7bCSvG7vYo4Mg847LBZr9p5jslj1jtdi
	/pFzrBZbZl5mtng56x6bxabH11gtLu+aw2Yx4/w+JosnUx6xWvzfs4PdYtXER2wO3B6bVnWy
	eWxeUu/Rt2UVo8fnTXIBLFFcNimpOZllqUX6dglcGQceJhU0CFR8u3GVqYHxKm8XIyeHhICJ
	ROPFLYxdjFwcQgK7GSW+npzKDJGQlri+cQI7hC0ssfLfc3aIoueMEq0rHoEl2AR0JXYsbmMD
	SYgIdDBJXH/zgLWLkYODWSBI4svuQIiGbkaJFQc7waZyClhJ/F14mRXEFhbwldjdcQZsEIuA
	qsSudRvB4rwClhLn/sxlgbAFJU7OfAJmMwtoS/Q+bGWEsZctfA11qYLEz6fLwHpFgObPaOtl
	g6gRl3h59Aj7BEbhWUhGzUIyahaSUbOQtCxgZFnFKJlaUJybnptsWGCYl1quV5yYW1yal66X
	nJ+7iREcaVoaOxjffWvSP8TIxMF4iFGCg1lJhPeXG3uGEG9KYmVValF+fFFpTmrxIUZpDhYl
	cd6VhhHpQgLpiSWp2ampBalFMFkmDk6pBia71hmcnT3e2Tl626N2Hpuw4I5wsJmWRvC/VsVP
	9f9n1kywtzkzOX5lXq3sBwv/av/fAndeXnTLn2jAn/NMU8PiefKCfXsE3C43Vrd/ON5hMP/a
	RF7RZ3k/EsUTF5UXXhJ8HT3/T87Bn1c0NzkdqDt0z6qyfou5GJ+A28L4hS9VDdcEFPi/Xv91
	NueC5pLVEzScucuW1azun+qVpb/33KudNkWzIkuuLjD1S/13fJKMrqnf1EMLFsRerA5rt5r/
	4crG7X8/FD5Y7nN4oV6b+zXpbZ85jq9Si5H03y6h+Gqp0nyx3xINAkp9kls8wsUENpfeeXc7
	yOTZivdft5rJNm0/dK69c6oVI9O7f/4b+mYqsRRnJBpqMRcVJwIAfGKkqSMDAAA=
X-CMS-MailID: 20250423082341epcas5p39444809bd4c8cb0676dc942d76b42365
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250423060042epcas5p2c04be779e21089f33b8a9a7785bb151a
References: <CGME20250423060042epcas5p2c04be779e21089f33b8a9a7785bb151a@epcas5p2.samsung.com>
	<20250423060034.973-1-yashwant.v@samsung.com>

Hi Yashwant,

> -----Original Message-----
> From: Yashwant Varur <yashwant.v=40samsung.com>
> Sent: Wednesday, April 23, 2025 11:31 AM
> To: robh=40kernel.org; krzk+dt=40kernel.org; conor+dt=40kernel.org;
> alim.akhtar=40samsung.com; devicetree=40vger.kernel.org; linux-arm-
> kernel=40lists.infradead.org; linux-samsung-soc=40vger.kernel.org; linux-
> kernel=40vger.kernel.org
> Cc: cs0617.lee=40samsung.com; g.naidu=40samsung.com;
> niyas.ahmed=40samsung.com; yashwant.v=40samsung.com
> Subject: =5BPATCH=5D arm64: dts: exynos: Added the ethernet pin configura=
tion
>=20
> This patch adds the ethernet pin configuration.
>=20
Please follow https://www.kernel.org/doc/html/latest/process/submitting-pat=
ches.html=23describe-your-changes
to describe our changes.

> Signed-off-by: Yashwant Varur <yashwant.v=40samsung.com>
> Signed-off-by: Changsub Lee <cs0617.lee=40samsung.com>
> ---
>  .../dts/exynos/exynosautov920-pinctrl.dtsi    =7C 41 +++++++++++++++++++
>  1 file changed, 41 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/exynos/exynosautov920-pinctrl.dtsi
> b/arch/arm64/boot/dts/exynos/exynosautov920-pinctrl.dtsi
> index 663e8265cbf5..778584d339d5 100644
> --- a/arch/arm64/boot/dts/exynos/exynosautov920-pinctrl.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynosautov920-pinctrl.dtsi
> =40=40 -166,6 +166,24 =40=40 gph6: gph6-gpio-bank =7B
>  		interrupt-controller;
>  		=23interrupt-cells =3D <2>;
>  	=7D;
> +
> +	eth0_pps_out: eth0_pps_out =7B
> +		samsung,pins =3D =22gph3-0=22;
> +		samsung,pin-function =3D <EXYNOS_PIN_FUNC_OUTPUT>;
> +		samsung,pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
> +	=7D;
> +
> +	eth0_rgmii: eth0_rgmii =7B
> +		samsung,pins =3D =22gph3-1=22, =22gph3-2=22, =22gph3-3=22, =22gph3-4=
=22,
> +				=22gph3-5=22, =22gph3-6=22, =22gph3-7=22, =22gph4-0=22,
> +				=22gph4-1=22, =22gph4-2=22, =22gph4-3=22, =22gph4-4=22;
> +		samsung,pin-function =3D <EXYNOS_PIN_FUNC_2>;
> +	=7D;
> +
> +	eth0_mdc_mdio: eth0_mdc_mdio =7B
> +		samsung,pins =3D =22gph4-5=22, =22gph4-6=22;
> +		samsung,pin-function =3D <EXYNOS_PIN_FUNC_2>;
No need to set drive strength and pull-=7Bup/down=7D??

