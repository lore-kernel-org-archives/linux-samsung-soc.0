Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA04532C8B
	for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Nov 2024 02:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732675645; cv=none; b=C6M7iPh6I2ix+7wc964VT9Tm1K3c/w/X9ZZmAhhLhXfIdS2ETUVMZXlR257e5diYg1xS70n4faxUq3rpySyPrgUAK4SfENdTNeklwpHvIRE5KWHbpLUYMFd9CrEvx4wbscs/RC2smaedoHWT8N8Iy5oph33cRIqVFwvxMQHem08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732675645; c=relaxed/simple;
	bh=9HwmE7IhBdS2/+3DDmaxB4U3mQrAWn1dRTvOTTM83FA=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=mwtCjgUBABvBVCrqncU9Tnsz7tDK6fmmRY+ueL50GPUKibhJUpBlLRlIQ85kmlE6JtMeA+i2+fs9uHuqZjhQDDCBddnd0c/qn1lJpaxkhrSQGpYMv8sq7ra4pVGp1IJnp4fSmLti0SbVNt9+MpuQOQuiV70kYwYsB/gmTHihMxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=ncGkFpQA; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="ncGkFpQA"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20241127024721epoutp0264946df74ae7ae05de67e841a63fbb1f~Ls1Dy_9dq1597015970epoutp028
	for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Nov 2024 02:47:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20241127024721epoutp0264946df74ae7ae05de67e841a63fbb1f~Ls1Dy_9dq1597015970epoutp028
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1732675641;
	bh=jDGRvOu+CdTH37gi93v1zy/QnDNwATH0Yqk8c5eap0g=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=ncGkFpQA6ncnVh7wszRvSnwA0YdgJnFHyCKBRYjjGFKPeb7gXfBipAT2BScP8yH9Q
	 7JdIhrjf00cZpbg9JbVBjm+U6cWzuFqs+6Kljbc0mUwxehQhCsUN5PD1zeWcAJJ9C3
	 oSa2hVD3Vvr6PFseQEjhPN+q7DJ+jM0cJ5VCEzo0=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTP id
	20241127024720epcas5p4db0636150f72f8b56bd03e6dfefd967a~Ls1C6qIfG2002520025epcas5p4S;
	Wed, 27 Nov 2024 02:47:20 +0000 (GMT)
Received: from epsmgec5p1-new.samsung.com (unknown [182.195.38.175]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4XykPM0Qmqz4x9Q2; Wed, 27 Nov
	2024 02:47:19 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
	epsmgec5p1-new.samsung.com (Symantec Messaging Gateway) with SMTP id
	F0.39.29212.63886476; Wed, 27 Nov 2024 11:47:18 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20241127024718epcas5p34fc130a33edebe09fa2ac6d1a61771d8~Ls1Ar6fCf0958009580epcas5p34;
	Wed, 27 Nov 2024 02:47:18 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20241127024718epsmtrp1116f952d92eb1c6bb5099b6974a4532c~Ls1AqjAzv1388113881epsmtrp1T;
	Wed, 27 Nov 2024 02:47:18 +0000 (GMT)
X-AuditID: b6c32a50-7ebff7000000721c-68-67468836cc89
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	CC.CB.18729.63886476; Wed, 27 Nov 2024 11:47:18 +0900 (KST)
Received: from INBRO002756 (unknown [107.122.12.5]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20241127024713epsmtip17932b4d34b5aa07c8be31fc89442a33d~Ls08OVR_X0594505945epsmtip12;
	Wed, 27 Nov 2024 02:47:13 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Sowon Na'" <sowon.na@samsung.com>, <robh@kernel.org>,
	<krzk@kernel.org>, <conor+dt@kernel.org>, <vkoul@kernel.org>,
	<kishon@kernel.org>
Cc: <krzk+dt@kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>
In-Reply-To: <20241118021009.2858849-4-sowon.na@samsung.com>
Subject: RE: [PATCH v3 3/3] arm64: dts: exynosautov920: add ufs phy for
 ExynosAutov920 SoC
Date: Wed, 27 Nov 2024 08:17:11 +0530
Message-ID: <000101db4076$ac6b18a0$054149e0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQKN54LK9wdlweRKh/1XLNX4aAwNFgK+n1kYAa5oYP6xQbXeAA==
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrAJsWRmVeSWpSXmKPExsWy7bCmpq5Zh1u6wX02izV7zzFZzD9yjtXi
	aOt/ZouXs+6xWZw/v4Hd4vKuOWwWM87vY7L4v2cHu8Xvn4eYLHbeOcHswOWxaVUnm0ffllWM
	Hp83yQUwR2XbZKQmpqQWKaTmJeenZOal2yp5B8c7x5uaGRjqGlpamCsp5CXmptoqufgE6Lpl
	5gCdoqRQlphTChQKSCwuVtK3synKLy1JVcjILy6xVUotSMkpMCnQK07MLS7NS9fLSy2xMjQw
	MDIFKkzIzvh2fSJzwW++ip2T1jM2MO7h6WLk5JAQMJE4v3Q6YxcjF4eQwB5GicuXW9ghnE+M
	Ev+PnmWDcL4xSvy5dZodpmXigm5WiMReRomzGzZC9b9glFhz/yULSBWbgK7EjsVtYO0iAhMZ
	JbY//8vUxcjBwSxQK7G/0wSkhlPARuJH40cmEFtYIEbieEMfI4jNIqAqsWrvTTCbV8BS4s6G
	LmYIW1Di5MwnYPOZBbQlli18zQxxkYLEz6fLWEFsEQEniccHVjJD1IhLvDx6BOwfCYGpHBJt
	i+cyQjS4SMx7OAeqWVji1fEtUK9JSbzsb4OysyWOX5zFBmFXSHS3foSK20vsfHSTBeIXTYn1
	u/QhdvFJ9P5+AvaihACvREebEES1qkTzu6ssELa0xMTublYI20Pi7NXzLBMYFWch+WwWks9m
	IflgFsKyBYwsqxilUguKc9NTk00LDHXzUsvhMZ6cn7uJEZxUtQJ2MK7e8FfvECMTB+MhRgkO
	ZiURXj5x53Qh3pTEyqrUovz4otKc1OJDjKbA8J7ILCWanA9M63kl8YYmlgYmZmZmJpbGZoZK
	4ryvW+emCAmkJ5akZqemFqQWwfQxcXBKNTAF7fB/0GVYtDPEVmbi19/+7Wysta9yCyqP9u52
	FjZfIiWxr5V/ntINLpkzZV4NfMzaD87oVwWWFj1nlE0Ivqe7sOzl864m5+NZDgy3GFffjbi3
	euIOl9DqWWUyHCee6D5Q2vqKRSV29T9nCd9H7l7ixqLXnqYbmHMvmyh44deMX0b+m6b4LZjm
	MVXP4VrQC9f/WZLFKSa367/2qT7ffHf21bfyEnknzt9cwMh+ffataxzvvn+N3tnYWP0wjDUz
	Q+1YiemUZXdnWh1YuKbmkMPDH//DXk5jPM049Xvf7wf/r3w1LZvyLznyquBqizP3jpYY/Fzy
	9sADIxnHNfPcf/EwKkn8XVvg5xSnlLS7jX2WEktxRqKhFnNRcSIA92uEyTMEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupgkeLIzCtJLcpLzFFi42LZdlhJTteswy3dYNZOaYs1e88xWcw/co7V
	4mjrf2aLl7PusVmcP7+B3eLyrjlsFjPO72Oy+L9nB7vF75+HmCx23jnB7MDlsWlVJ5tH35ZV
	jB6fN8kFMEdx2aSk5mSWpRbp2yVwZUzq8SpYzVfx/lgfUwPjG+4uRk4OCQETiYkLulm7GLk4
	hAR2M0oc3nOAHSIhLXF94wQoW1hi5b/n7BBFzxglGj89YAZJsAnoSuxY3MYGkhARmM4osW/N
	D7AEs0Ajo8TFDjYQW0hgL6PEjHt1IDangI3Ej8aPTCC2sECURPef3WA1LAKqEqv23mQEsXkF
	LCXubOhihrAFJU7OfMICMVNb4unNp3D2soWvmSGuU5D4+XQZK4gtIuAk8fjASqgbxCVeHj3C
	PoFReBaSUbOQjJqFZNQsJC0LGFlWMUqmFhTnpucWGxYY5qWW6xUn5haX5qXrJefnbmIER5aW
	5g7G7as+6B1iZOJgPMQowcGsJMLLJ+6cLsSbklhZlVqUH19UmpNafIhRmoNFSZxX/EVvipBA
	emJJanZqakFqEUyWiYNTqoEp/WnR9p9Vk9XjCsp0l5j8WLJK0jXiNM8y7rZeU9dFCx807vQ2
	fMDNm9MhdvDmj/it9xhbSpNty06IKTCdZwiWWMy8qmen4pntmVy2Oz6kOD3e/9Y1N8wiqqKG
	+9q0Nf07ZTqehN1qCvvauct5huWmEq+WrIVzT384XatYtMdz5YG1BwJ3+ths/8N6aIPUlZ7P
	fBM/yDVn58bGBE+M2Lc/84bcIQt/fbV1j2N1fi2xuBXD5acU7HpUNI/Hf61j4JUIKyZpZdGl
	RX7mIg9Pe819X6Xc/qCEk7XwzJU/V/hFNDdlHO+xTGdYKhS/eEkLN8fLdVNUr7HJdqcxpfw7
	p7tUd4KjLktywL6bv7TS5JVYijMSDbWYi4oTAZ79A0EbAwAA
X-CMS-MailID: 20241127024718epcas5p34fc130a33edebe09fa2ac6d1a61771d8
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241118021011epcas2p3db133a3cffb13fba8ce3c973d8ffff65
References: <20241118021009.2858849-1-sowon.na@samsung.com>
	<CGME20241118021011epcas2p3db133a3cffb13fba8ce3c973d8ffff65@epcas2p3.samsung.com>
	<20241118021009.2858849-4-sowon.na@samsung.com>



> -----Original Message-----
> From: Sowon Na <sowon.na=40samsung.com>
> Sent: Monday, November 18, 2024 7:40 AM
> To: robh=40kernel.org; krzk=40kernel.org; conor+dt=40kernel.org;
> vkoul=40kernel.org; alim.akhtar=40samsung.com; kishon=40kernel.org
> Cc: krzk+dt=40kernel.org; linux-kernel=40vger.kernel.org;
> devicetree=40vger.kernel.org; linux-samsung-soc=40vger.kernel.org;
> sowon.na=40samsung.com
> Subject: =5BPATCH v3 3/3=5D arm64: dts: exynosautov920: add ufs phy for
> ExynosAutov920 SoC
>=20
> Add UFS Phy for ExynosAutov920
>=20
> Like ExynosAutov9, this also uses fixed-rate clock nodes until clock driv=
er has
> been supported. The clock nodes are initialized on bootloader stage thus =
we
> don't need to control them so far.
>=20
> Signed-off-by: Sowon Na <sowon.na=40samsung.com>
> ---
Reviewed-by: Alim Akhtar <alim.akhtar=40samsung.com>

Are you planning to send UFS HCI patches as well?


>  arch/arm64/boot/dts/exynos/exynosautov920.dtsi =7C 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
> b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
> index c759134c909e..505ba04722de 100644
> --- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
> =40=40 -361,6 +361,17 =40=40 pinctrl_aud: pinctrl=401a460000 =7B
>  			compatible =3D =22samsung,exynosautov920-pinctrl=22;
>  			reg =3D <0x1a460000 0x10000>;
>  		=7D;
> +
> +		ufs_0_phy: phy=4016e04000 =7B
> +			compatible =3D =22samsung,exynosautov920-ufs-phy=22;
> +			reg =3D <0x16e04000 0x4000>;
> +			reg-names =3D =22phy-pma=22;
> +			clocks =3D <&xtcxo>;
> +			clock-names =3D =22ref_clk=22;
> +			samsung,pmu-syscon =3D <&pmu_system_controller>;
> +			=23phy-cells =3D <0>;
> +			status =3D =22disabled=22;
> +		=7D;
>  	=7D;
>=20
>  	timer =7B
> --
> 2.45.2


