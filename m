Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9873B71DF
	for <linux-samsung-soc@vger.kernel.org>; Fri, 18 Sep 2026 03:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789701942; cv=none; b=So5Mw0B1rmapKTPHk+tkrY8JM43OM5F4unDusxpX18YPOE4Ghiyte+IbaBS1MvsqgcI8g1XFlZZkcekXkkRZ4e2TWLz6EJvztpcO9n+m0AqPE+j5QNejqVhOh2oyp4p4wmcUGBaqPUKxoPckRftxFHki+DssRExcaedTLCWlyAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789701942; c=relaxed/simple;
	bh=EdQvZ61QalUJARA1z7MGMnRy/kwDRIhCjBePd5NVVQ0=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=LRf8LpQuyMbd3Cuj/4gKTur3eXpHHNbdh+5QsiNzrYgdz7WRufGShck9DdpzIh+MqBmh+OOYyg55ilmKaNHlnD/WQ4SRKoDDPFosK+xrcwwtrWk3b1LG4mwS8nPfXb+ZiC2YMNXPvTChuZWpKF/E48iSXnoxmIZQ8YQm4TMhVAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=RwXjMA+Z; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="RwXjMA+Z"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20260918032537epoutp0327cc161214dd30b0def9e5ffca9a4ad2~WTG4K7X1F2131921319epoutp03N
	for <linux-samsung-soc@vger.kernel.org>; Fri, 18 Sep 2026 03:25:37 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20260918032537epoutp0327cc161214dd30b0def9e5ffca9a4ad2~WTG4K7X1F2131921319epoutp03N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1789701937;
	bh=EdQvZ61QalUJARA1z7MGMnRy/kwDRIhCjBePd5NVVQ0=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=RwXjMA+ZDheh/JjJSjft4QdcZk4bIXCNxOnoeBinV65wU5Y/FqHCVlF7/hxl2RH4O
	 IvASdMKrbOzORuVdTjRGGsRQztJYnMQYf+deW1dcEY7m1rTpFKAaBfQozIGJCyhzq0
	 sHvcUqs1uKRWZZjQZMF5jxQcKlOcHlHF1HZnwmc4=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20260918032536epcas5p3c037713c8e6229d0e8726a6bb418f76d~WTG3LYZix1189811898epcas5p3j;
	Fri, 18 Sep 2026 03:25:36 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.91]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4hmJ0v2SLNz6B9m5; Fri, 18 Sep
	2026 03:25:35 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20260918032534epcas5p1db19e612e5a173ae5f2eed6e817b6c37~WTG1XPfwn1605516055epcas5p1B;
	Fri, 18 Sep 2026 03:25:34 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20260918032531epsmtip134ab7e6ab681d7dddb7c7d095e9d4d06~WTGymFoR50136701367epsmtip14;
	Fri, 18 Sep 2026 03:25:31 +0000 (GMT)
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
In-Reply-To: <20260916122229.2604003-3-selvarasu.g@samsung.com>
Subject: RE: [PATCH v2 2/3] dt-bindings: usb: Introduce samsung,snps-dwc3
Date: Fri, 18 Sep 2026 08:55:30 +0530
Message-ID: <058301dd471d$5d985170$18c8f450$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGcfDqIrCW7OKewQ35ZfbAvR1onfQHu4CTLAhM/jCu3NS/WcA==
Content-Language: en-us
X-CMS-MailID: 20260918032534epcas5p1db19e612e5a173ae5f2eed6e817b6c37
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260916122354epcas5p401fd6470d6cef75951af732b03aa5970
References: <20260916122229.2604003-1-selvarasu.g@samsung.com>
	<CGME20260916122354epcas5p401fd6470d6cef75951af732b03aa5970@epcas5p4.samsung.com>
	<20260916122229.2604003-3-selvarasu.g@samsung.com>



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
> Subject: =5BPATCH v2 2/3=5D dt-bindings: usb: Introduce samsung,snps-dwc3
>=20
> Add the Samsung Exynos8855 DWC3 binding using a flattened node
> representation, where the DWC3 controller is directly addressable rather
> than nested as a child node of a glue layer.
>=20
> This is the first Samsung Exynos binding using the flattened representati=
on.
> The existing samsung,exynos-dwc3 binding describes the parent and child
> representation used by existing Exynos SoCs, which can be migrated to the
> flattened model.
>=20
> Samsung Exynos SoCs sharing the same flattened model can be added by
> using the samsung,snps-dwc3 fallback compatible and extending the
> compatible enum with per SoC clock and property constraints.
>=20
> Co-developed-by: Muhammed Ali <muhammed.ali=40samsung.com>
> Signed-off-by: Muhammed Ali <muhammed.ali=40samsung.com>
> Signed-off-by: Selvarasu Ganesan <selvarasu.g=40samsung.com>
> ---
Thanks for using flattened node representation. Are you planning to migrate=
 other existing SoC as well?

Reviewed-by: Alim Akhtar <alim.akhtar=40samsung.com>

