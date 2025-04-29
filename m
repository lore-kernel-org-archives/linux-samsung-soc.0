Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB818279347
	for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Apr 2025 09:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745919310; cv=none; b=YcVaY0f/T3ECSI4XzDPz8x4C4X8wYIwg4QYvhlyn1Yf7V4S78Y1aSK2sL1u32g2mwVNz9zi68DeciBv2eA0qhlkGnswO0QOdwmTi4XsZYWXiKyiKxVTUzqdAGpEcFL/k+CW+DKJyXZk0sldctmTpqNIQUlVwWHkggO8NroZiA7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745919310; c=relaxed/simple;
	bh=guAD50gmgdf8dNbOSIkbRIT3QyGj4WLIcqax997RKGg=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=jTPkgrf9UaAn+hhZMHW/hp4+sK0yCRkIGLhcVsQtyFEdCtd8sQr3xrPRrlIYOFQNIWN3a+IeIDTNJJzy5fcudXPdgyzrbKbxBlcrANkWHaRHkeJzwEQM0Ik9MBssVJd6NbKBuXiOR4UfHaqbxbIqwSgheIEIQCRcMWVCCJnKSRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=dKdk1vTn; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="dKdk1vTn"
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250429093458epoutp0343a94bf81982aa48a24bbc44503be857~6wFoW1-Ku3212532125epoutp03U
	for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Apr 2025 09:34:58 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250429093458epoutp0343a94bf81982aa48a24bbc44503be857~6wFoW1-Ku3212532125epoutp03U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1745919298;
	bh=Pi/iyF0IplJUPA7d0Z7gKsd7OHUodqqvbGsperI0axM=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=dKdk1vTnFVWqBAR2SqLxsvkR24HZJehguH3rUbBAEJbVDuU068FhhwprcjuoWmYVD
	 +QxiUfdPiLYwIKGECzqtXUifHOs/dwfFmc+0I/Biz153MLGw2my1Xp+dMw74C36bFL
	 xPFKnHHjVFszrH1obIRaxQsXlhBd7RNLs5FtKlsw=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250429093457epcas5p2b0fbeb86b8e679376761a83858e6041e~6wFneFqts1952619526epcas5p26;
	Tue, 29 Apr 2025 09:34:57 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.183]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4ZmwC41Dxcz6B9mH; Tue, 29 Apr
	2025 09:34:56 +0000 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250429092957epcas5p264b0dfae6bae9179df57e520fc59f8b5~6wBQCY4K62748727487epcas5p2B;
	Tue, 29 Apr 2025 09:29:57 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250429092957epsmtrp1a2a35e256eff10acc70d75b9a28f6bdb~6wBQBc9JQ2444424444epsmtrp1v;
	Tue, 29 Apr 2025 09:29:57 +0000 (GMT)
X-AuditID: b6c32a52-41dfa70000004c16-e5-68109c1514f7
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	FD.FD.19478.51C90186; Tue, 29 Apr 2025 18:29:57 +0900 (KST)
Received: from INBRO002053 (unknown [107.122.2.234]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250429092955epsmtip192a33218257ecbc1e6673c37e238d0e8~6wBOVcwOw0967309673epsmtip1z;
	Tue, 29 Apr 2025 09:29:55 +0000 (GMT)
From: "Yashwant Varur" <yashwant.v@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <alim.akhtar@samsung.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Cc: <cs0617.lee@samsung.com>, <g.naidu@samsung.com>,
	<niyas.ahmed@samsung.com>
In-Reply-To: <73a5d0a6-ceb0-4c47-9992-260828f074d0@kernel.org>
Subject: RE: [PATCH] arm64: dts: exynos: Added the ethernet pin
 configuration
Date: Tue, 29 Apr 2025 14:59:54 +0530
Message-ID: <0ed501dbb8e9$45aa96e0$d0ffc4a0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQI+tP5AvR0g22A5T67WLyfPVk3CYgKkYErqAxsAxq2yxm0V4A==
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupnkeLIzCtJLcpLzFFi42LZdlhJTld0jkCGwfVnKhYP5m1js1iz9xyT
	xap3vBbzj5xjtdgy8zKzxctZ99gszp/fwG6x6fE1VovLu+awWcw4v4/J4smUR6wW//fsYHfg
	8di0qpPNY/OSeo++LasYPT5vkgtgieKySUnNySxLLdK3S+DKePyvnbngJF/F31+32BsYF/N0
	MXJySAiYSBz/+Jixi5GLQ0hgO6PE+Xsn2boYOYASUhINb8IhaoQlVv57zg5iCwk8Z5ToOSsG
	YrMJ6Es833yNCaRXRGAxk8SXpoNgvcwCQRJfdgdCzNzLKDGvdzcLSAOngJ3E2a6HYIOEBXwl
	dnecAbNZBFQlzk8+wgLSyytgKTHhqRpImFdAUOLkzCdgrcwC2hJPbz6Fs5ctfM0McZuCxM+n
	y1hBbBEBJ4n9J9cyQtSIS7w8eoR9AqPwLCSjZiEZNQvJqFlIWhYwsqxiFE0tKM5Nz00uMNQr
	TswtLs1L10vOz93ECI4zraAdjMvW/9U7xMjEwXiIUYKDWUmEt8qAP0OINyWxsiq1KD++qDQn
	tfgQozQHi5I4r3JOZ4qQQHpiSWp2ampBahFMlomDU6qByTVe5u5+psuu9/VLDx8zV2Dd06M2
	U/5eTdOpFhcWkyLO2j2MTFOv5Ksrsz76ZMC6Oe7E3uhFD6Ye5qo/+4/Fe2K99PLWjVbZVbOm
	XjWt2R1u8Wzvb9m3ofMsExJ+9BpLcTItVY95vK2IiftEqvSLxvxdzuec7OI+OU6cZhUjMa23
	2O76hv64q5esbufqpO/PVy7mVjdx9l5TN7uzK6FfPErf80bWfkeLHTU3JhxmWM5UpLBw0pTq
	l3bJ3dcmyS/u4269orir5Dpv9KSC8iVhZa8O/Vqx/dY8rfS7zt8MGpo59/K6euTeZff64JOh
	zi7mEff6f/1GXSvDF9slUtrunRCe+C15mlO3UMWj3/+UWIozEg21mIuKEwEo7Tz1IgMAAA==
X-CMS-MailID: 20250429092957epcas5p264b0dfae6bae9179df57e520fc59f8b5
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250423060042epcas5p2c04be779e21089f33b8a9a7785bb151a
References: <CGME20250423060042epcas5p2c04be779e21089f33b8a9a7785bb151a@epcas5p2.samsung.com>
	<20250423060034.973-1-yashwant.v@samsung.com>
	<73a5d0a6-ceb0-4c47-9992-260828f074d0@kernel.org>



-----Original Message-----
From: Krzysztof Kozlowski <krzk=40kernel.org>=20
Sent: Wednesday, April 23, 2025 8:41 PM
To: Yashwant Varur <yashwant.v=40samsung.com>; robh=40kernel.org; krzk+dt=
=40kernel.org; conor+dt=40kernel.org; alim.akhtar=40samsung.com; devicetree=
=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org; linux-samsung-s=
oc=40vger.kernel.org; linux-kernel=40vger.kernel.org
Cc: cs0617.lee=40samsung.com; g.naidu=40samsung.com; niyas.ahmed=40samsung.=
com
Subject: Re: =5BPATCH=5D arm64: dts: exynos: Added the ethernet pin configu=
ration

On 23/04/2025 08:00, Yashwant Varur wrote:
> This patch adds the ethernet pin configuration.


>=20
> Signed-off-by: Yashwant Varur <yashwant.v=40samsung.com>
> Signed-off-by: Changsub Lee <cs0617.lee=40samsung.com>

Incorrect chain or confusing. Who was the author? What is the meaning of th=
e last SoB?
>
Sorry will correct the order.


> ---
>  .../dts/exynos/exynosautov920-pinctrl.dtsi    =7C 41 +++++++++++++++++++
>  1 file changed, 41 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/exynos/exynosautov920-pinctrl.dtsi=20
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

Please follow DTS coding style carefully. This applies to all commits you t=
ry to send from your downstream/vendor code.
>
Sure, thanks

What is more important, I don't really understand why you are doing this
- there is no user of these entries - and commit msg does not help here.
>
Understood, in v2 will add the Ethernet node as well.



Best regards,
Krzysztof

