Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9EC72E736A
	for <linux-samsung-soc@vger.kernel.org>; Fri, 18 Sep 2026 03:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789701990; cv=none; b=s3NzV98XFG1OgCXSUVFrihfV0zzUf871Eln947x4DD2PkjGkDdAXu6hrqlfMVayNwniOAVP0WntNUzCpjMlTiB9ZqCY6QeQq2xjOT+IZ4u1zctRZGqrbZPKSE44vxxRYwa1rsQVKqDdQjGcObUcOzJn3acptj7ndiXOSqipDjnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789701990; c=relaxed/simple;
	bh=DAkHFLKW5R8gX+bnmJjASpjZGvtx6axHmmLZ31zshRE=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=fHRmIZpr8Uu4Yv+JYEBEPO+Ut3bwv6WYraRFhFG7zIlVd9nXZXRAsUb2oMKWt7pssu3lVrlq//tkkEIQEhn5FUdfXtpa5QUx+77AV20UpaSG9qJ7PV+xGcyF81v1mf3vK3MekF1dRDFWC+a6/l8Sju6o1eAFwmnrDrKILWr+jqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=m7ZQxwZr; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="m7ZQxwZr"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20260918032620epoutp028163e7c92ad9286dd926e6243685d96b~WTHgpkQKp0913609136epoutp02c
	for <linux-samsung-soc@vger.kernel.org>; Fri, 18 Sep 2026 03:26:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20260918032620epoutp028163e7c92ad9286dd926e6243685d96b~WTHgpkQKp0913609136epoutp02c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1789701980;
	bh=lQa5mHxFaZenQFbNXj3M8QXGg67jJVe+kRCeOm2ocMw=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=m7ZQxwZraolcPK00vck2WkQcQLsE2Kbyyq3eZXsUVjykqEOU/I0WXfQie2hyb7xVr
	 GIzWZw3CZkXQvFzGpit3TBhW2TkLAZU9mRJLTuJfOBfKDa/EZYPj/hlEUHOBc8nBWN
	 S0BHiRYnldYzr8AyIp4ontY2TIqMaGEOX+TSXXUA=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20260918032620epcas5p16d29c6802e42e2ffcfef27610814e80e~WTHgJiGgk1261512615epcas5p10;
	Fri, 18 Sep 2026 03:26:20 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.92]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4hmJ1l30JHz2SSKg; Fri, 18 Sep
	2026 03:26:19 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20260918032618epcas5p32f86bd24eeb25fdd4ee655495816ff4b~WTHepL_oj2572725727epcas5p3p;
	Fri, 18 Sep 2026 03:26:18 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20260918032615epsmtip18a6146a6aa358bc07d721d969f444f17~WTHb1aB5n3129331293epsmtip1U;
	Fri, 18 Sep 2026 03:26:15 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Selvarasu Ganesan'" <selvarasu.g@samsung.com>, <krzk@kernel.org>,
	<peter.griffin@linaro.org>, <gregkh@linuxfoundation.org>, <robh@kernel.org>,
	<conor+dt@kernel.org>, <Thinh.Nguyen@synopsys.com>, <mani@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Cc: <jh0801.jung@samsung.com>, <h10.kim@samsung.com>,
	<dh10.jung@samsung.com>, <akash.m5@samsung.com>, <hongpooh.kim@samsung.com>,
	<eomji.oh@samsung.com>, <shijie.cai@samsung.com>,
	<muhammed.ali@samsung.com>, <thiagu.r@samsung.com>
In-Reply-To: <20260916122229.2604003-4-selvarasu.g@samsung.com>
Subject: RE: [PATCH v2 3/3] usb: dwc3: Add Exynos8855 to the generic
 platform driver
Date: Fri, 18 Sep 2026 08:56:14 +0530
Message-ID: <058401dd471d$7801a3e0$6804eba0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGcfDqIrCW7OKewQ35ZfbAvR1onfQJI8H1BAp78Uta3LgLn8A==
Content-Language: en-us
X-CMS-MailID: 20260918032618epcas5p32f86bd24eeb25fdd4ee655495816ff4b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260916122357epcas5p3578059e36eafeb4602f4fb57cd72c883
References: <20260916122229.2604003-1-selvarasu.g@samsung.com>
	<CGME20260916122357epcas5p3578059e36eafeb4602f4fb57cd72c883@epcas5p3.samsung.com>
	<20260916122229.2604003-4-selvarasu.g@samsung.com>



> -----Original Message-----
> From: Selvarasu Ganesan <selvarasu.g=40samsung.com>
> Sent: Wednesday, September 16, 2026 5:52 PM
> To: krzk=40kernel.org; peter.griffin=40linaro.org; alim.akhtar=40samsung.=
com;
> gregkh=40linuxfoundation.org; robh=40kernel.org; conor+dt=40kernel.org;
> Thinh.Nguyen=40synopsys.com; mani=40kernel.org;
> selvarasu.g=40samsung.com; linux-arm-kernel=40lists.infradead.org; linux-
> samsung-soc=40vger.kernel.org; linux-usb=40vger.kernel.org;
> devicetree=40vger.kernel.org; linux-kernel=40vger.kernel.org
> Cc: jh0801.jung=40samsung.com; h10.kim=40samsung.com;
> dh10.jung=40samsung.com; akash.m5=40samsung.com;
> hongpooh.kim=40samsung.com; eomji.oh=40samsung.com;
> shijie.cai=40samsung.com; muhammed.ali=40samsung.com;
> thiagu.r=40samsung.com
> Subject: =5BPATCH v2 3/3=5D usb: dwc3: Add Exynos8855 to the generic plat=
form
> driver
>=20
> Add the =22samsung,snps-dwc3=22 compatible string to dwc3-generic-plat so=
 the
> Exynos8855 USB3 DWC3 controller can probe through the generic DWC3
> platform glue. While at it, alphabetically reorder the existing entries.
>=20
> The =22samsung,snps-dwc3=22 string is used as a generic fallback to suppo=
rt any
> Exynos SoC that utilizes a flattened model instantiation. This fallback a=
llows
> multiple Exynos SoCs to be supported by the generic platform driver simpl=
y
> by adding the fallback compatible to their respective device tree nodes.
>=20
> Co-developed-by: Muhammed Ali <muhammed.ali=40samsung.com>
> Signed-off-by: Muhammed Ali <muhammed.ali=40samsung.com>
> Signed-off-by: Selvarasu Ganesan <selvarasu.g=40samsung.com>
> ---
Reviewed-by: Alim Akhtar <alim.akhtar=40samsung.com>

>  drivers/usb/dwc3/dwc3-generic-plat.c =7C 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3=
-
> generic-plat.c
> index ca69ac0eb07c..10c1146564b7 100644
> --- a/drivers/usb/dwc3/dwc3-generic-plat.c
> +++ b/drivers/usb/dwc3/dwc3-generic-plat.c
> =40=40 -232,10 +232,11 =40=40 static const struct dwc3_generic_config
> eic7700_dwc3 =3D  =7B  =7D;
>=20
>  static const struct of_device_id dwc3_generic_of_match=5B=5D =3D =7B
> +	=7B .compatible =3D =22eswin,eic7700-dwc3=22, &eic7700_dwc3=7D,
> +	=7B .compatible =3D =22fsl,ls1028a-dwc3=22, &fsl_ls1028_dwc3=7D,
> +	=7B .compatible =3D =22samsung,snps-dwc3=22, =7D,
>  	=7B .compatible =3D =22spacemit,k1-dwc3=22, &spacemit_k1_dwc3=7D,
>  	=7B .compatible =3D =22spacemit,k3-dwc3=22, =7D,
> -	=7B .compatible =3D =22fsl,ls1028a-dwc3=22, &fsl_ls1028_dwc3=7D,
> -	=7B .compatible =3D =22eswin,eic7700-dwc3=22, &eic7700_dwc3=7D,
>  	=7B .compatible =3D =22starfive,jhb100-dwc3=22, =7D,
>  	=7B /* sentinel */ =7D
>  =7D;
> --
> 2.17.1


