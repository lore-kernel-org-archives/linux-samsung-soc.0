Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF304D8D0
	for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Sep 2024 04:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726805563; cv=none; b=tKAOWaDsl0s+EmRCXqbr4vQtlcSEiLYLegHvq7hNsevrwpjMuVAtOUx+BsbV60UGNLiMqZ7OEdLTgqFKupo6143OTP9T0maEMRhKSPohOJUMfBk/T0h4e6Q9IGouNjF/Eiy9pGQre8pX1pdAaKgx8FtRYpErQnl/hi+yyuKevpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726805563; c=relaxed/simple;
	bh=v/JP9+dnSPQ/EzDmys6ognVMWUo7kv+BV4Dmyx0DlF0=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=Mkzj0SdqbGaMbtq/tVYw9xUSKxavS8bkPU7Wz90/5YW6kexUd6c6ckx7hie1y3F51+jNDL8KjURXe5g0Xqnf5sLmxmZ5YzBcWOwKF3ulutHMCPsXlQbr6utwPdTC2EQPj/doVl9mBE2vlAWw+TMsklvNweEX60KIjRUEzEsWwgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=FxDHTec9; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="FxDHTec9"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20240920041238epoutp036f2083a7bbf234517b1bb5a254254cf5~22IGbnosG2330023300epoutp03f
	for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Sep 2024 04:12:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20240920041238epoutp036f2083a7bbf234517b1bb5a254254cf5~22IGbnosG2330023300epoutp03f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1726805558;
	bh=aBM3hbgXChryLwT6K57OXYPNbI0aIxRu0X2/9XMYaJI=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=FxDHTec9yj2ZZGn2dZOGPeHAHmEYDya7ADLOi8hAEcywN53TjC07rj7GHM2DK3AtM
	 1DTXJ3xjd9+qQjJeJ7Yva7vAC/MGx8rnoYHV2Uq7/cpFtWZHE8u8oLEQNT53vHUJDD
	 gDHR33Xo6hV4GxbWpXL9wkU7ZNqhe+nEQ8FWLi3I=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTP id
	20240920041237epcas5p11a04bf5cd4d28dd4d318c503ffa93c3b~22IF-IkVg1270012700epcas5p1t;
	Fri, 20 Sep 2024 04:12:37 +0000 (GMT)
Received: from epsmgec5p1-new.samsung.com (unknown [182.195.38.180]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4X8zW8244Wz4x9Q0; Fri, 20 Sep
	2024 04:12:36 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
	epsmgec5p1-new.samsung.com (Symantec Messaging Gateway) with SMTP id
	E5.C5.19863.236FCE66; Fri, 20 Sep 2024 13:12:34 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20240920040449epcas5p196b268539c2dabd69045a45af241ebcc~22BRjN6bu2174021740epcas5p1l;
	Fri, 20 Sep 2024 04:04:49 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240920040449epsmtrp2d3c54926f2f4f80f95fe32eb8f921242~22BRihgkX2326523265epsmtrp2G;
	Fri, 20 Sep 2024 04:04:49 +0000 (GMT)
X-AuditID: b6c32a50-ef5fe70000004d97-3c-66ecf6325074
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	8E.D9.19367.164FCE66; Fri, 20 Sep 2024 13:04:49 +0900 (KST)
Received: from FDSFTE196 (unknown [107.116.189.214]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20240920040447epsmtip12931110a4a3846ee98848d5ba8423091~22BP9Q0Yl2097220972epsmtip1V;
	Fri, 20 Sep 2024 04:04:47 +0000 (GMT)
From: "Inbaraj E" <inbaraj.e@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, "'Stephen Boyd'"
	<sboyd@kernel.org>, <alim.akhtar@samsung.com>, <cw00.choi@samsung.com>,
	<linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-samsung-soc@vger.kernel.org>, <mturquette@baylibre.com>,
	<s.nawrocki@samsung.com>
Cc: <pankaj.dubey@samsung.com>, <gost.dev@samsung.com>
In-Reply-To: <633ff284-101d-4651-833e-a6b01626c9a1@kernel.org>
Subject: RE: [PATCH] clk: samsung: fsd: Mark PLL_CAM_CSI as critical
Date: Fri, 20 Sep 2024 09:34:46 +0530
Message-ID: <011101db0b12$3c75edc0$b561c940$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQMYu0UT7KgXFJ9p8WqzYl/+4ytJPAKVNCMjAc9ECZkCVSVjTgGurbUsr6Fq/7A=
Content-Language: en-in
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrFJsWRmVeSWpSXmKPExsWy7bCmpq7RtzdpBvfXilo8mLeNzeL6l+es
	FjcP7GSyOH9+A7vFx557rBaXd81hs5hxfh+TxcVTrhaLtn5htzj8pp3V4t+1jSwO3B7vb7Sy
	e2xa1cnm0bdlFaPH501yASxR2TYZqYkpqUUKqXnJ+SmZeem2St7B8c7xpmYGhrqGlhbmSgp5
	ibmptkouPgG6bpk5QEcpKZQl5pQChQISi4uV9O1sivJLS1IVMvKLS2yVUgtScgpMCvSKE3OL
	S/PS9fJSS6wMDQyMTIEKE7Izznxbz1TwW7jiw9setgbGfQJdjJwcEgImErPvf2PsYuTiEBLY
	wyhx5egMRpCEkMAnRomth2ohEkD2h5utbDAd108fZodI7GSUeDtzFhOE85JRYmHjS1aQKjYB
	TYmbR/+BzRURWMok0XnvBztIglnATGLL3ftgRZwCdhJLju0GiwsLuEjM+HeJGcRmEVCVmDLv
	JBOIzStgKXGw6xozhC0ocXLmExaIOfIS29/OYYY4SUHi59NlYDNFBPwkjq97zQxRIy5x9GcP
	VM1SDoljreEQtovE/JNToN4Rlnh1fAs7hC0l8fndXqi4j8T+Ob8YIewMiWPbl7NC2PYSB67M
	AbqBA2i+psT6XfoQYVmJqafWMUGs5ZPo/f2ECSLOK7FjHoytLDHzyH2o8ZISOy/vZJnAqDQL
	yWezkHw2C8kHsxC2LWBkWcUolVpQnJuemmxaYKibl1oOj/Hk/NxNjOBEqxWwg3H1hr96hxiZ
	OBgPMUpwMCuJ8Ip/eJkmxJuSWFmVWpQfX1Sak1p8iNEUGN4TmaVEk/OBqT6vJN7QxNLAxMzM
	zMTS2MxQSZz3devcFCGB9MSS1OzU1ILUIpg+Jg5OqQamhWp8c267T+rzDL4+7b6ZocvvaTK2
	+5+xau3ftihar2HCohb+By5S3ku8BZ+ZT5xTLi2TqX5E/IYf695DkR+9vmUvPHY7YJV8ao7K
	Bmap0rIAwbdcn6eczPluEPS9dv4HqfKbph/25ZicyzW51PZv4hrHgHztizN3RNyeMzF/p/LJ
	JAMnY03zO4c4ynfMLb7vvDpx9ne99Oqj6WcXzSm7x3WutTVAvcCAe32JfeicrGfaMb9tkmOM
	St2i8//otqrNnciUpaYzzz9h7qYbaZziM2eV3W5wnvz2Sx7Hlb1rV1+RKVC8yyiywOn7lI3F
	e3QOxr5a1DPlY9PE/8y2E3az3inQX3+2e2n+gphJ5048UmIpzkg01GIuKk4EAONOJwk9BAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupnkeLIzCtJLcpLzFFi42LZdlhJTjfxy5s0g4MTOSwezNvGZnH9y3NW
	i5sHdjJZnD+/gd3iY889VovLu+awWcw4v4/J4uIpV4tFW7+wWxx+085q8e/aRhYHbo/3N1rZ
	PTat6mTz6NuyitHj8ya5AJYoLpuU1JzMstQifbsErowz39YzFfwWrvjwtoetgXGfQBcjJ4eE
	gInE9dOH2bsYuTiEBLYzSrQ0dTBBJCQlZv+ezg5hC0us/Pccqug5o8S8A4tYQBJsApoSN4/+
	YwRJiAisZZLo2L6SESTBLGAhsfzPdTaIjgVMErenzwcbxSlgJ7Hk2G4wW1jARWLGv0vMIDaL
	gKrElHknwVbzClhKHOy6xgxhC0qcnPmEBWKotkTvw1aoBfIS29/OYYY4T0Hi59NlrCC2iICf
	xPF1r5khasQljv7sYZ7AKDwLyahZSEbNQjJqFpKWBYwsqxhFUwuKc9NzkwsM9YoTc4tL89L1
	kvNzNzGC40wraAfjsvV/9Q4xMnEwHmKU4GBWEuEV//AyTYg3JbGyKrUoP76oNCe1+BCjNAeL
	kjivck5nipBAemJJanZqakFqEUyWiYNTqoFJaJPKuvUX4xX4qw91qHTNy5dmmnvrdlDkhdTL
	08+Gfjm37G+GaVrTqknSpQE3Hv489W2P8fOeuqopX+Vy1jqFXW54+rnrvClvDdcyD93Ib9Pn
	NFspOwZM8HL+s6X44vsVCb1dt9il5bNnfBB89mq6psWE76seH6pbvv/z3d857FLva/O39Ry8
	LvaIWYvLOD+EkX+ly4OW2MYpTPW9PPxfmB4s0Ap5dvfvlUX37yz3uZ9rc7JXYt3j/5YNMVan
	3v5ep759hZTerH/l/y/5cvck95/ep844+/HO8xPTFIp+Vlk7Oi9rlc46djj/WZit0IKtzS9s
	wu7zJHTuPPK3aXLWzkucKm55/SJ37lzM3r5ISYmlOCPRUIu5qDgRAPzvJKYiAwAA
X-CMS-MailID: 20240920040449epcas5p196b268539c2dabd69045a45af241ebcc
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
> From: Krzysztof Kozlowski <krzk@kernel.org>
> Sent: 19 September 2024 17:33
> To: Inbaraj E <inbaraj.e@samsung.com>; 'Stephen Boyd'
> <sboyd@kernel.org>; alim.akhtar@samsung.com; cw00.choi@samsung.com;
> linux-clk@vger.kernel.org; linux-kernel@vger.kernel.org; linux-samsung-
> soc@vger.kernel.org; mturquette@baylibre.com; s.nawrocki@samsung.com
> Cc: pankaj.dubey@samsung.com; gost.dev@samsung.com
> Subject: Re: [PATCH] clk: samsung: fsd: Mark PLL_CAM_CSI as critical
> 
> On 19/09/2024 13:33, Inbaraj E wrote:
> >
> >
> >> -----Original Message-----
> >> From: Stephen Boyd <sboyd@kernel.org>
> >> Sent: 19 September 2024 15:51
> >> To: Inbaraj E <inbaraj.e@samsung.com>; alim.akhtar@samsung.com;
> >> cw00.choi@samsung.com; krzk@kernel.org; linux-clk@vger.kernel.org;
> >> linux- kernel@vger.kernel.org; linux-samsung-soc@vger.kernel.org;
> >> mturquette@baylibre.com; s.nawrocki@samsung.com
> >> Cc: pankaj.dubey@samsung.com; gost.dev@samsung.com; Inbaraj E
> >> <inbaraj.e@samsung.com>
> >> Subject: Re: [PATCH] clk: samsung: fsd: Mark PLL_CAM_CSI as critical
> >>
> >> Quoting Inbaraj E (2024-09-17 03:10:16)
> >>> PLL_CAM_CSI is the parent clock for the ACLK and PCLK in the
> >>> CMU_CAM_CSI block. When we gate ACLK or PCLK, the clock framework
> >> will
> >>> subsequently disables the parent clocks(PLL_CAM_CSI). Disabling
> >>> PLL_CAM_CSI is causing sytem level halt.
> >>>
> >>> It was observed on FSD SoC, when we gate the ACLK and PCLK during
> >>> CSI stop streaming through pm_runtime_put system is getting halted.
> >>> So marking PLL_CAM_CSI as critical to prevent disabling.
> >>>
> >>> Signed-off-by: Inbaraj E <inbaraj.e@samsung.com>
> >>> ---
> >>
> >> Please add a fixes tag. Although this is likely a band-aid fix
> >> because marking something critical leaves it enabled forever.
> >
> > Sure, will add fixes tag. As per HW manual, this PLL_CAM_CSI is
> > supplying clock even for CMU SFR access of CSI block, so we can't gate
> > this.
> 
> Hm, I am not so sure. The CMU driver should just take appropriate clock.
> Sprinkling CLK_CRITICAL looks as substitute of missing clock handling/

As per HW design, PLL_CAM_CSI is responsible for suppling clock to
CSI SFR, CMU SFR and some internal block of CAM_CSI. In this some of
the clock is not handled by any driver but it is required for CSI to
work properly. For example CSI NOC clock. So this is the reason we
are marking PLL_CAM_CSI as critical.

> 
> 
> Best regards,
> Krzysztof


