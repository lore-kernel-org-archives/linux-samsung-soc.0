Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0349F22309
	for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Sep 2024 04:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726807452; cv=none; b=lkDsGlA91Ovs55ESEjxdL2U/lYi2828R/zRhwxlDRHuNlCsVJD1ccwBfUZRnBQS0iyjRfeEMFXoFfrShP0q22x5XU5plp8tW/49hVfI0FgRzir1RDRmS9rMLFJEs9ywkqllnA5gGw9ar7j5SwQbHOXAdXwoJA8e1B3gz2QJydjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726807452; c=relaxed/simple;
	bh=dXQ4KZEjnb/YAaEmi62WIa7KI4i7ms8EM3iQe0mTNyY=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=VX5L2rxcqEiV+BtCkrryYIT6Kl+cTjMoDgwyO1pIUmmwQExXAynH1jIWzcX5//sqoovqxfv1Wkt/4AroPrCbQUTxQa214Yq6tLpNFyFV7gmG3Y0yj9fK4pBQqb89dHv2DgGmlS6etD2DuRt1j9n+ndCE/sWaBfboiUZh22ZpyDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Gr7i9BhJ; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Gr7i9BhJ"
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20240920044407epoutp01d6d093926e5cf202e3a4f1b74c034288~22jlgmGD90475704757epoutp01g
	for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Sep 2024 04:44:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20240920044407epoutp01d6d093926e5cf202e3a4f1b74c034288~22jlgmGD90475704757epoutp01g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1726807447;
	bh=KrrZvreUocZnG1ZsUMTCFrbAlt2M8tG4240a84PDK/A=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=Gr7i9BhJgKE4HLpxxxBMPt1M/tWez5MZrjDMtH/kR5IFLmnXfA5iSLp6qwAOYxWQi
	 WuaOV6ZEIBh4/dxqJb/XM2Cn6FyhdcF6w6wOz2gsDJmJMjAYihNxB39vrhCfxEYMUm
	 RL4NlTSN4vVgpCY3V+bIEGh1E6969lNC54eMc7WA=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTP id
	20240920044406epcas5p34e75d9b0445e4bd42179653e26df6c3f~22jlFLVMB1233612336epcas5p3q;
	Fri, 20 Sep 2024 04:44:06 +0000 (GMT)
Received: from epsmgec5p1-new.samsung.com (unknown [182.195.38.182]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4X90CS6V65z4x9QL; Fri, 20 Sep
	2024 04:44:04 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
	epsmgec5p1-new.samsung.com (Symantec Messaging Gateway) with SMTP id
	BD.4B.19863.49DFCE66; Fri, 20 Sep 2024 13:44:04 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20240920041559epcas5p22b8f5ce6dd97df2c852fd4a04cf918ee~22LBji84I0647406474epcas5p2D;
	Fri, 20 Sep 2024 04:15:59 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240920041559epsmtrp28b5b36fc70a24e0eba301afd59a5309f~22LBi2H_K2949829498epsmtrp24;
	Fri, 20 Sep 2024 04:15:59 +0000 (GMT)
X-AuditID: b6c32a50-c73ff70000004d97-76-66ecfd946373
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	70.26.08456.FF6FCE66; Fri, 20 Sep 2024 13:15:59 +0900 (KST)
Received: from FDSFTE196 (unknown [107.116.189.214]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20240920041557epsmtip26fe6da3caf5963ad4bbb3afbcac3ae7d~22K-988FJ0323603236epsmtip2x;
	Fri, 20 Sep 2024 04:15:57 +0000 (GMT)
From: "Inbaraj E" <inbaraj.e@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, "'Stephen Boyd'"
	<sboyd@kernel.org>, <alim.akhtar@samsung.com>, <cw00.choi@samsung.com>,
	<linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-samsung-soc@vger.kernel.org>, <mturquette@baylibre.com>,
	<s.nawrocki@samsung.com>
Cc: <pankaj.dubey@samsung.com>, <gost.dev@samsung.com>
In-Reply-To: 
Subject: RE: [PATCH] clk: samsung: fsd: Mark PLL_CAM_CSI as critical
Date: Fri, 20 Sep 2024 09:45:56 +0530
Message-ID: <011401db0b13$cbd045f0$6370d1d0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQMYu0UT7KgXFJ9p8WqzYl/+4ytJPAKVNCMjAc9ECZkCVSVjTgGurbUsr6Fq/7CAAAL6cA==
Content-Language: en-in
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrOJsWRmVeSWpSXmKPExsWy7bCmpu6Uv2/SDHo+GFk8mLeNzeL6l+es
	FjcP7GSyOH9+A7vFx557rBaXd81hs5hxfh+TxcVTrhaLtn5htzj8pp3V4t+1jSwO3B7vb7Sy
	e2xa1cnm0bdlFaPH501yASxR2TYZqYkpqUUKqXnJ+SmZeem2St7B8c7xpmYGhrqGlhbmSgp5
	ibmptkouPgG6bpk5QEcpKZQl5pQChQISi4uV9O1sivJLS1IVMvKLS2yVUgtScgpMCvSKE3OL
	S/PS9fJSS6wMDQyMTIEKE7IzDh1sZyyYI1dxfdFStgbGZskuRk4OCQETid9TDrKD2EICexgl
	jhyog7A/MUpcWl/ZxcgFZH9jlJj3cRIbTMO0+UsZIRJ7GSVm3LrCDuG8ZJR4uW0NWBWbgKbE
	zaP/wKpEBJYySXTe+wG2g1nATGLL3fusXYwcHJwCvBIT/lmDhIUFXCRm/LvEDBJmEVCV+PHE
	GCTMK2ApcWLtfUYIW1Di5MwnLBBTtCWWLXzNDHGQgsTPp8tYQWwRgTCJZVMPMkPUiEsc/dnD
	DHKChMBKDomDs9aBrZUA2jXxlTFEr7DEq+Nb2CFsKYnP7/ZCPekjsX/OL0YIO0Pi2PblrBC2
	vcSBK3NYQMYwA724fpc+RFhWYuqpdUwQa/kken8/YYKI80rsmAdjK0vMPHIfarykxM7LO1km
	MCrNQvLZLCSfzULywSyEbQsYWVYxSqUWFOempyabFhjq5qWWw6M7OT93EyM4xWoF7GBcveGv
	3iFGJg7GQ4wSHMxKIrziH16mCfGmJFZWpRblxxeV5qQWH2I0BQb3RGYp0eR8YJLPK4k3NLE0
	MDEzMzOxNDYzVBLnfd06N0VIID2xJDU7NbUgtQimj4mDU6qBqTPjXv97q85VZ6ZP26p7xWl+
	w3/p4J028Xef7H8isG3769p19788+zv3iZPKRf6A+wfyt5/r2Sp/NuOr0QJhjeO160pkMxqk
	+qwvxgcm6r2XuuvGs5Tnhf2Dj/tfBu1e+TPBa0JjfnBVT0HCHZ9y1osLXFZ+sOGqYQ2QqDz5
	OSmb/1LT4oPfpmnWHROYfMt1qoaKndU5g/sTWfdpcNgUsOlkLfBlmmKz58XPx4nHj7PsefWq
	drJEhAB/XqRahPvdc7IXPk8qcdS99th47Q2eezJpZXfaHW+fV7jBuWXdE8V4+5Q3BR4fTq3z
	25uSZh7u0uwxvSV/ysvdimmbS8TDbS95+HCKTfZP5lnAO8PCUomlOCPRUIu5qDgRAKoVYL06
	BAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprAIsWRmVeSWpSXmKPExsWy7bCSvO7/b2/SDBZd47B4MG8bm8X1L89Z
	LW4e2Mlkcf78BnaLjz33WC0u75rDZjHj/D4mi4unXC0Wbf3CbnH4TTurxb9rG1kcuD3e32hl
	99i0qpPNo2/LKkaPz5vkAliiuGxSUnMyy1KL9O0SuDJWv17MXLBWtuLOeccGxkkSXYycHBIC
	JhLT5i9l7GLk4hAS2M0oMeH0TRaIhKTE7N/T2SFsYYmV/56zQxQ9Z5S4c3kOI0iCTUBT4ubR
	f2DdIgJrmSQ6tq8ESzALWEgs/3OdDaJjIZPEh+61QA4HB6cAr8SEf9YgNcICLhIz/l1iBgmz
	CKhK/HhiDBLmFbCUOLH2PiOELShxcuYTFoiR2hK9D1sZYexlC18zQxynIPHz6TJWEFtEIExi
	2dSDzBA14hJHf/YwT2AUnoVk1Cwko2YhGTULScsCRpZVjJKpBcW56bnFhgVGeanlesWJucWl
	eel6yfm5mxjBkaaltYNxz6oPeocYmTgYDzFKcDArifCKf3iZJsSbklhZlVqUH19UmpNafIhR
	moNFSZz32+veFCGB9MSS1OzU1ILUIpgsEwenVAPTiqBVj+3mF1YfVV5+Sk2uLVOx4TVniM5r
	9myd2F1b9oSJyWWLsonXt9xeXfD2hF+26YOKNw8l/M+fF7fenH97vqgShyX/wacS709obauW
	OlaSbhuee128szX7lM57yz9lojH+gQv+OvOm9S/gtZhZu0rW7cDajrn+Lefm3Dp/0mW359VE
	1coV12f2bdlk51VxbZpn8OKEjN2PL1+cbdvH/8zgiob1/B/+ap8tzBL6zxbU8i0vSVuqEVZf
	O6E559GEeJF3e15sMCt/0fs2Keh+X2X7C9Pyivc9O639488/6t3Q66F+p7vE8p5kewNLTYx2
	VZ6j2IppvNPNfNi3sS5Z6X9gSdSNDXUfreIUvimxFGckGmoxFxUnAgDPZTGxIwMAAA==
X-CMS-MailID: 20240920041559epcas5p22b8f5ce6dd97df2c852fd4a04cf918ee
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240917101102epcas5p3b17d2774cb74fd4cf61ea52fde85c300
References: <CGME20240917101102epcas5p3b17d2774cb74fd4cf61ea52fde85c300@epcas5p3.samsung.com>
	<20240917101016.23238-1-inbaraj.e@samsung.com>
	<0d43a00985a815c1869ebc6c441a2aed.sboyd@kernel.org>
	<00f001db0a87$cd9ddfa0$68d99ee0$@samsung.com>
	<633ff284-101d-4651-833e-a6b01626c9a1@kernel.org> 



> -----Original Message-----
> From: Inbaraj E <inbaraj.e=40samsung.com>
> Sent: 20 September 2024 09:35
> To: 'Krzysztof Kozlowski' <krzk=40kernel.org>; 'Stephen Boyd'
> <sboyd=40kernel.org>; 'alim.akhtar=40samsung.com'
> <alim.akhtar=40samsung.com>; 'cw00.choi=40samsung.com'
> <cw00.choi=40samsung.com>; 'linux-clk=40vger.kernel.org' <linux-
> clk=40vger.kernel.org>; 'linux-kernel=40vger.kernel.org' <linux-
> kernel=40vger.kernel.org>; 'linux-samsung-soc=40vger.kernel.org' <linux-
> samsung-soc=40vger.kernel.org>; 'mturquette=40baylibre.com'
> <mturquette=40baylibre.com>; 's.nawrocki=40samsung.com'
> <s.nawrocki=40samsung.com>
> Cc: 'pankaj.dubey=40samsung.com' <pankaj.dubey=40samsung.com>;
> 'gost.dev=40samsung.com' <gost.dev=40samsung.com>
> Subject: RE: =5BPATCH=5D clk: samsung: fsd: Mark PLL_CAM_CSI as critical
>=20
>=20
>=20
> > -----Original Message-----
> > From: Krzysztof Kozlowski <krzk=40kernel.org>
> > Sent: 19 September 2024 17:33
> > To: Inbaraj E <inbaraj.e=40samsung.com>; 'Stephen Boyd'
> > <sboyd=40kernel.org>; alim.akhtar=40samsung.com;
> cw00.choi=40samsung.com;
> > linux-clk=40vger.kernel.org; linux-kernel=40vger.kernel.org;
> > linux-samsung- soc=40vger.kernel.org; mturquette=40baylibre.com;
> > s.nawrocki=40samsung.com
> > Cc: pankaj.dubey=40samsung.com; gost.dev=40samsung.com
> > Subject: Re: =5BPATCH=5D clk: samsung: fsd: Mark PLL_CAM_CSI as critica=
l
> >
> > On 19/09/2024 13:33, Inbaraj E wrote:
> > >
> > >
> > >> -----Original Message-----
> > >> From: Stephen Boyd <sboyd=40kernel.org>
> > >> Sent: 19 September 2024 15:51
> > >> To: Inbaraj E <inbaraj.e=40samsung.com>; alim.akhtar=40samsung.com;
> > >> cw00.choi=40samsung.com; krzk=40kernel.org; linux-clk=40vger.kernel.=
org;
> > >> linux- kernel=40vger.kernel.org; linux-samsung-soc=40vger.kernel.org=
;
> > >> mturquette=40baylibre.com; s.nawrocki=40samsung.com
> > >> Cc: pankaj.dubey=40samsung.com; gost.dev=40samsung.com; Inbaraj E
> > >> <inbaraj.e=40samsung.com>
> > >> Subject: Re: =5BPATCH=5D clk: samsung: fsd: Mark PLL_CAM_CSI as
> > >> critical
> > >>
> > >> Quoting Inbaraj E (2024-09-17 03:10:16)
> > >>> PLL_CAM_CSI is the parent clock for the ACLK and PCLK in the
> > >>> CMU_CAM_CSI block. When we gate ACLK or PCLK, the clock
> framework
> > >> will
> > >>> subsequently disables the parent clocks(PLL_CAM_CSI). Disabling
> > >>> PLL_CAM_CSI is causing sytem level halt.
> > >>>
> > >>> It was observed on FSD SoC, when we gate the ACLK and PCLK during
> > >>> CSI stop streaming through pm_runtime_put system is getting halted.
> > >>> So marking PLL_CAM_CSI as critical to prevent disabling.
> > >>>
> > >>> Signed-off-by: Inbaraj E <inbaraj.e=40samsung.com>
> > >>> ---
> > >>
> > >> Please add a fixes tag. Although this is likely a band-aid fix
> > >> because marking something critical leaves it enabled forever.
> > >
> > > Sure, will add fixes tag. As per HW manual, this PLL_CAM_CSI is
> > > supplying clock even for CMU SFR access of CSI block, so we can't
> > > gate this.
> >
> > Hm, I am not so sure. The CMU driver should just take appropriate clock=
.
> > Sprinkling CLK_CRITICAL looks as substitute of missing clock handling/
>=20
> As per HW design, PLL_CAM_CSI is responsible for suppling clock to CSI SF=
R,
> CMU SFR and some internal block of CAM_CSI. In this some of the clock is =
not
> handled by any driver but it is required for CSI to work properly. For ex=
ample
> CSI NOC clock. So this is the reason we are marking PLL_CAM_CSI as critic=
al.
>

This is clock hierarchy for CMU_CAM_CSI block.

PLL_CAM_CSI -----> DIVIDER --------> CSI_SFR clock
			=7C
			=7C----> DIVIDER --------> CMU_SFR clock
			=7C
			=7C----> DIVIDER --------> CSI NOC clock.=20

Regards,
Inbaraj E
> >
> >
> > Best regards,
> > Krzysztof



