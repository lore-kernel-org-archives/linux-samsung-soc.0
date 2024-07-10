Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979631B86FF
	for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Jul 2024 07:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720594837; cv=none; b=CYprBa4yOa7XUj11CG67htmQR1m7EuhG3f2sFOc8S91N6PTcJs5ILlMpYtOSLN+82MttyR4eMlRj2rNOW4MNljisvWlT1+NRT1/sWOm+cj9/jBqli7HfHjQ1YjoXOXRRXeZalRRc44k6VCYmdjMn7BXaW9HSuSQ11vfiW+QOAEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720594837; c=relaxed/simple;
	bh=lmWnavcWYNnA9w4yaiLxKtCBf+Hmy3W5TqDesqm4LIs=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=JEQWosQMvYbROJiBDgekJCwsYjuL9VFsRGQl68hV/AR+A+/XT+wphYFFgcaB2CANzFoBbsf60L4PihKPQHGzikg1FThO0wn+srLPdgzjigekx7fsZ/4cbFZTFBsz4MAbrqOZ/UK92FLR4s648YO3rE2o0CAja6noPtEMX+Fiw34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=VoNctXk7; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="VoNctXk7"
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20240710070033epoutp04ce9510a581ed6e7ce4cf50f6205d34e3~gx_KgPOcd3123231232epoutp04h
	for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Jul 2024 07:00:33 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20240710070033epoutp04ce9510a581ed6e7ce4cf50f6205d34e3~gx_KgPOcd3123231232epoutp04h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1720594833;
	bh=AMGGSEWVpLUcxbg6opPMlbCGNJ7+oLViCeJNNcptUEw=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=VoNctXk7eTQHVFtbmseDz9LJVWMhYpY/YHLsd92ejkz7XIhoSP+3JFzP9UOH9fC6D
	 F10eGnS5kD7+pCHb56OijR/FT4QoSwgS/raXVqYzEdBQOlUxYlxmP/F7BJ0bOhTDJQ
	 Zr6CS0LBHKEfELuFDVKpbkgGCiSGFfybEh/PAjWc=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTP id
	20240710070033epcas2p2c958ef7a829e1bb5ca05322eeeea8828~gx_J6kxJs0932209322epcas2p2l;
	Wed, 10 Jul 2024 07:00:33 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.70]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4WJpf85b6xz4x9Q0; Wed, 10 Jul
	2024 07:00:32 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
	epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	14.17.09848.0913E866; Wed, 10 Jul 2024 16:00:32 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20240710070032epcas2p11c0695b1f82f4aa0629f9fb687e4423c~gx_JDoMWk0753507535epcas2p1C;
	Wed, 10 Jul 2024 07:00:32 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240710070032epsmtrp2c7d6010654185bd3dad5b7e15ec9016c~gx_JBlmXT0387703877epsmtrp2S;
	Wed, 10 Jul 2024 07:00:32 +0000 (GMT)
X-AuditID: b6c32a45-447fe70000002678-9b-668e31905ca6
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	C2.C7.29940.0913E866; Wed, 10 Jul 2024 16:00:32 +0900 (KST)
Received: from KORCO118965 (unknown [10.229.18.201]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20240710070031epsmtip1d0862aed5457d3421775ea20d535338d~gx_IyP7jl2654326543epsmtip1Q;
	Wed, 10 Jul 2024 07:00:31 +0000 (GMT)
From: "sunyeal.hong" <sunyeal.hong@samsung.com>
To: "'Alim Akhtar'" <alim.akhtar@samsung.com>, "'Krzysztof Kozlowski'"
	<krzk@kernel.org>, "'Sylwester Nawrocki'" <s.nawrocki@samsung.com>,
	"'Chanwoo Choi'" <cw00.choi@samsung.com>, "'Michael Turquette'"
	<mturquette@baylibre.com>, "'Stephen Boyd'" <sboyd@kernel.org>, "'Rob
 Herring'" <robh@kernel.org>, "'Conor Dooley'" <conor+dt@kernel.org>
Cc: <linux-samsung-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <015601dad271$bcd53e00$367fba00$@samsung.com>
Subject: RE: [PATCH v2 3/4] clk: samsung: clk-pll: Add support for pll_531x
Date: Wed, 10 Jul 2024 16:00:31 +0900
Message-ID: <008301dad296$dadd6240$909826c0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJHtUpDsgLCeLIQdS8546uqgvLWdQHhk3nlAbaaqcQDPX93AAGcPnKhAnj/odSwvmtrcA==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMJsWRmVeSWpSXmKPExsWy7bCmqe4Ew740gz/ztS0ezNvGZrFm7zkm
	i+tfnrNazD9yjtXi/PkN7BabHl9jtfjYc4/V4vKuOWwWM87vY7K4eMrV4v+eHewWh9+0s1r8
	u7aRxYHX4/2NVnaPTas62Tw2L6n36NuyitHj8ya5ANaobJuM1MSU1CKF1Lzk/JTMvHRbJe/g
	eOd4UzMDQ11DSwtzJYW8xNxUWyUXnwBdt8wcoBOVFMoSc0qBQgGJxcVK+nY2RfmlJakKGfnF
	JbZKqQUpOQXmBXrFibnFpXnpenmpJVaGBgZGpkCFCdkZF/dPYyvYJ1ux9vlJ5gbGoxJdjJwc
	EgImEv1tSxi7GLk4hAR2MErs/gTjfGKUeLS2mwXC+cYo0bBiKTtMy+ZPt6Gq9jJKHFvaxwqS
	EBJ4ySgxo60cxGYT0JdY3X2bDaRIROAOk8TtdQ9ZQRxmgXWMEptnHgEbxSlgJbHlyVPmLkYO
	DmEBb4n3rTkgJouAqkTnnUSQCl4BS4knZ3tYIGxBiZMzn4DZzALyEtvfzmGGOEhB4ufTZWA3
	iAiESfzc+QeqRkRidmcbM8haCYETHBITNu5ghWhwkTg+fTkThC0s8er4FqjPpCQ+v9vLBmHn
	S0y+/pYJormBUeLav26obfYSi878ZAc5lFlAU2L9Ln0QU0JAWeLILai9fBIdh/+yQ4R5JTra
	hCAa1SQ+XbkMNURG4tiJZ8wTGJVmIflsFpLPZiH5YBbCrgWMLKsYxVILinPTU4uNCgzhkZ2c
	n7uJEZx6tVx3ME5++0HvECMTB+MhRgkOZiUR3vk3utOEeFMSK6tSi/Lji0pzUosPMZoCg3oi
	s5Rocj4w+eeVxBuaWBqYmJkZmhuZGpgrifPea52bIiSQnliSmp2aWpBaBNPHxMEp1cA01dr/
	zt1t3yw+Xy7b8UpkxvSv2tx2X6xPFj2ykZO/n6Vtr1/z9cxF374od8XMoh+X9xZ3X1444eFt
	P8347+ub/dme+UVY/6lriZpe5VhgtuDfro/6TJfeaHBM2Tplq7DFLM5kma/cW60CV/TmXD60
	xdz1/PPbpy6VKj+wknFRvbPqclWovfWrzbf9nO+cUYl+4jHPZRb/rxgTvpyw3ev0+OLO1H1f
	9MPRtjTnYD3fsjs/pnnZO/kuFuzzZHPozg0RvNKce5uh5tYSTut9+fe+qbAdPDuHaSnjdc6W
	y8bMvpVVa6w3r+SXefP2R5ZP577c5ptHhW5abCv4uigyM/uBZt9yln15nvbrV8WxGKxTYinO
	SDTUYi4qTgQAMDuDgkYEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprPIsWRmVeSWpSXmKPExsWy7bCSnO4Ew740g8/7WS0ezNvGZrFm7zkm
	i+tfnrNazD9yjtXi/PkN7BabHl9jtfjYc4/V4vKuOWwWM87vY7K4eMrV4v+eHewWh9+0s1r8
	u7aRxYHX4/2NVnaPTas62Tw2L6n36NuyitHj8ya5ANYoLpuU1JzMstQifbsEroyL+6exFeyT
	rVj7/CRzA+NRiS5GTg4JAROJzZ9uM3YxcnEICexmlOg/dZoVIiEjsbHhPzuELSxxv+UIK0TR
	c0aJ3w2/GEESbAL6Equ7b7OBJEQEHjFJfP65ix3EYRbYxChxbvdNNpAqIYHzTBIL16mB2JwC
	VhJbnjxl7mLk4BAW8JZ435oDYrIIqEp03kkEqeAVsJR4craHBcIWlDg58wmYzSygLfH05lMo
	W15i+9s5zBDHKUj8fLoM7GgRgTCJnzv/QNWISMzubGOewCg8C8moWUhGzUIyahaSlgWMLKsY
	JVMLinPTc4sNCwzzUsv1ihNzi0vz0vWS83M3MYLjUEtzB+P2VR/0DjEycTAeYpTgYFYS4Z1/
	oztNiDclsbIqtSg/vqg0J7X4EKM0B4uSOK/4i94UIYH0xJLU7NTUgtQimCwTB6dUA1PXq8a9
	F8+fK00ImnrL8YtOUDbL9msqmb41oSxTTFzeLPiw8NwH/tr5cYerHTu1bST69uw2ZHP6KVZq
	2P1Yhvl15Of8mYH3JO2Zee+KLS/TmlBhzr6oIdhabJ40n+jcF0zJX5bGpogGf93U0rl43cdi
	8VZG4YdHLurUe1QejpumMSnkvMGepIJc+8rQy7bO04xNNmw9e2P1jZ8cd7/0rZA7PWEuU7Q9
	r6jSGrVlRYmxwpMbe5t27uLfMOeByR+pduP4gut2s7eU/PBbzP5g7rwjK/5ZnOromxmUdmll
	1+uXaQskXjmEJV6+6MI6//cyN5mMJQbfco73fZIKnXiGW3d6Z29f84Zb0sxim6yv1CixFGck
	GmoxFxUnAgCmqFJkMgMAAA==
X-CMS-MailID: 20240710070032epcas2p11c0695b1f82f4aa0629f9fb687e4423c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240707231445epcas2p18815fee7d176f63619d244d836ab64fc
References: <20240707231331.3433340-1-sunyeal.hong@samsung.com>
	<CGME20240707231445epcas2p18815fee7d176f63619d244d836ab64fc@epcas2p1.samsung.com>
	<20240707231331.3433340-4-sunyeal.hong@samsung.com>
	<000601dad12e$19ff3f30$4dfdbd90$@samsung.com>
	<000201dad26f$b18c3690$14a4a3b0$@samsung.com>
	<015601dad271$bcd53e00$367fba00$@samsung.com>

Hello Alim,

> -----Original Message-----
> From: Alim Akhtar <alim.akhtar@samsung.com>
> Sent: Wednesday, July 10, 2024 11:35 AM
> To: 'sunyeal.hong' <sunyeal.hong@samsung.com>; 'Krzysztof Kozlowski'
> <krzk@kernel.org>; 'Sylwester Nawrocki' <s.nawrocki@samsung.com>; 'Chanwoo
> Choi' <cw00.choi@samsung.com>; 'Michael Turquette'
> <mturquette@baylibre.com>; 'Stephen Boyd' <sboyd@kernel.org>; 'Rob
> Herring' <robh@kernel.org>; 'Conor Dooley' <conor+dt@kernel.org>
> Cc: linux-samsung-soc@vger.kernel.org; linux-clk@vger.kernel.org;
> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> kernel@vger.kernel.org
> Subject: RE: [PATCH v2 3/4] clk: samsung: clk-pll: Add support for
> pll_531x
> 
> Hello Sunyeal,
> 
> > -----Original Message-----
> > From: sunyeal.hong <sunyeal.hong@samsung.com>
> > Sent: Wednesday, July 10, 2024 7:50 AM
> > To: 'Alim Akhtar' <alim.akhtar@samsung.com>; 'Krzysztof Kozlowski'
> > <krzk@kernel.org>; 'Sylwester Nawrocki' <s.nawrocki@samsung.com>;
> > 'Chanwoo Choi' <cw00.choi@samsung.com>; 'Michael Turquette'
> > <mturquette@baylibre.com>; 'Stephen Boyd' <sboyd@kernel.org>; 'Rob
> > Herring' <robh@kernel.org>; 'Conor Dooley' <conor+dt@kernel.org>
> > Cc: linux-samsung-soc@vger.kernel.org; linux-clk@vger.kernel.org;
> > devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> > linux- kernel@vger.kernel.org
> > Subject: RE: [PATCH v2 3/4] clk: samsung: clk-pll: Add support for
> > pll_531x
> >
> > Hello Alim,
> >
> > > -----Original Message-----
> > > From: Alim Akhtar <alim.akhtar@samsung.com>
> > > Sent: Monday, July 8, 2024 8:58 PM
> > > To: 'Sunyeal Hong' <sunyeal.hong@samsung.com>; 'Krzysztof Kozlowski'
> > > <krzk@kernel.org>; 'Sylwester Nawrocki' <s.nawrocki@samsung.com>;
> > > 'Chanwoo Choi' <cw00.choi@samsung.com>; 'Michael Turquette'
> > > <mturquette@baylibre.com>; 'Stephen Boyd' <sboyd@kernel.org>; 'Rob
> > > Herring' <robh@kernel.org>; 'Conor Dooley' <conor+dt@kernel.org>
> > > Cc: linux-samsung-soc@vger.kernel.org; linux-clk@vger.kernel.org;
> > > devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> > > linux- kernel@vger.kernel.org
> > > Subject: RE: [PATCH v2 3/4] clk: samsung: clk-pll: Add support for
> > > pll_531x
> > >
> > > Hello Sunyeal,
> > >
> > > > -----Original Message-----
> > > > From: Sunyeal Hong <sunyeal.hong@samsung.com>
> > > > Sent: Monday, July 8, 2024 4:44 AM
> > > > To: Krzysztof Kozlowski <krzk@kernel.org>; Sylwester Nawrocki
> > > > <s.nawrocki@samsung.com>; Chanwoo Choi
> > <cw00.choi@samsung.com>; Alim
> > > > Akhtar <alim.akhtar@samsung.com>; Michael Turquette
> > > > <mturquette@baylibre.com>; Stephen Boyd <sboyd@kernel.org>; Rob
> > > > Herring <robh@kernel.org>; Conor Dooley <conor+dt@kernel.org>
> > > > Cc: linux-samsung-soc@vger.kernel.org; linux-clk@vger.kernel.org;
> > > > devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> > > > linux- kernel@vger.kernel.org; Sunyeal Hong
> > > > <sunyeal.hong@samsung.com>
> > > > Subject: [PATCH v2 3/4] clk: samsung: clk-pll: Add support for
> > > > pll_531x
> > > >
> > > > pll531x PLL is used in Exynos Auto v920 SoC for shared pll.
> > > > pll531x: Integer/fractional PLL with mid frequency FVCO (800 to
> > > > 3120
> > > > MHz)
> > > >
> > > > PLL531x
> > > > FOUT = (MDIV + F/2^32-F[31]) * FIN/(PDIV x 2^SDIV)
> > > >
> > > Any reason for not mentioning equation for integer PLL?
> > >
> > If the F value is 0, it operates as an integer PLL.
> Thanks for clarification, it is good to mention the same in the commit
> message.
> 
Okay. I will update comment for integer PLL description.
> [snip]
> > > > --
> > > > 2.45.2
> > >
> >
> 

Thanks,
Sunyeal Hong

