Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A6023ED60
	for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Aug 2026 04:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787025932; cv=none; b=AM5P6j8U0ID/ePxzmBo/rPeDUsE5fk6TI2iCdM3OVGiVVqC4bOEwvyqDNtdEdFhkep2lUw3r6X+b1O9reVbsTi6rEaE3kMZCUOVZJooA7lvNJHuZfIAZVNRvifiS7FSTdC1COo/stuaSCGOX9qLH2Yg2Fy2QpFF5vWaPi6WN0Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787025932; c=relaxed/simple;
	bh=cVTG8lZVqP7tC4R+lkdLz1X5btO3fFP6MkuCINexyak=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=UAAhynPXegIfD4WrE7nLVdT8fZmSAuBjCBgbgx2eg4eOOaFexZzx8uPNkN+owIW+eFWNEyMh6rP6B+RuQGjDGdAyP6nyg7kBqaO8D4ufJEdLxzjawSABeogw1N9NmnKDWUkynQ3SWrrR1tvjtuJeQNgve7uxX4gzXorhLYhCP5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=ARb/Ro/T; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="ARb/Ro/T"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20260818035950epoutp03c48af5a8af5566dafd1f005b3e84904f~Myk5bELnE3050230502epoutp03I
	for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Aug 2026 03:59:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20260818035950epoutp03c48af5a8af5566dafd1f005b3e84904f~Myk5bELnE3050230502epoutp03I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1787025590;
	bh=H2J8nu4Hey8UwWctf5x81wbobgR75wzg5QI2g8k9cZU=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=ARb/Ro/TwncksfAOQBGcfN2kJJm8RfgzdKEhlOcvqrX9Zi3zbh4a/ajDxkN0CjY06
	 EUrDsSuqcvvirWmYqbOs7AP9xvCPuqGfjpUvIa4nRmUOy2jQo/SL8MNaOkhmn3VfJT
	 8hmVM5ioXBfq94L3AZ0e8xYCcNDFKtiJF7G7LR1E=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20260818035949epcas5p44be5b57e72841931cfbaa3fef7d96f32~Myk41pdgw2027520275epcas5p4e;
	Tue, 18 Aug 2026 03:59:49 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.94]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4hPGDg5jK6z6B9m5; Tue, 18 Aug
	2026 03:59:47 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20260818035947epcas5p16adfc8c5f942956df7310bf76fc82e86~Myk2tWgjK1737017370epcas5p1j;
	Tue, 18 Aug 2026 03:59:47 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20260818035944epsmtip24102c5d9b3cde735c82d29b9288e0537~Myk0MRq1f1699416994epsmtip2C;
	Tue, 18 Aug 2026 03:59:44 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: <aidenisik@member.fsf.org>, "'Krzysztof Kozlowski'" <krzk@kernel.org>,
	"'Sylwester Nawrocki'" <s.nawrocki@samsung.com>, "'Chanwoo Choi'"
	<cw00.choi@samsung.com>, "'Peter	Griffin'" <peter.griffin@linaro.org>,
	"'Michael Turquette'" <mturquette@baylibre.com>, "'Stephen Boyd'"
	<sboyd@kernel.org>, "'Brian Masney'" <bmasney@redhat.com>, "'Rob Herring'"
	<robh@kernel.org>, "'Conor Dooley'" <conor+dt@kernel.org>, "'Kees Cook'"
	<kees@kernel.org>, "'Gustavo A. R. Silva'" <gustavoars@kernel.org>
Cc: <linux-samsung-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-hardening@vger.kernel.org>, "'Aiden
 Isik'" <aidenisik+git@member.fsf.org>
In-Reply-To: <20260817-for-next-lucky7-clock-v1-2-032e4b229c76@member.fsf.org>
Subject: RE: [PATCH 2/3] clk: samsung: clk-pll: Add support for pll_309
Date: Tue, 18 Aug 2026 09:29:42 +0530
Message-ID: <025901dd2ec6$0245bcf0$06d136d0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHOeIyOJ24EK7guGNA1AUHFAM/4yAG4p0XDAgM/Jlq2orpDUA==
Content-Language: en-us
X-CMS-MailID: 20260818035947epcas5p16adfc8c5f942956df7310bf76fc82e86
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260817101721epcas5p228e56fa915717b7a547df144ff801c8c
References: <20260817-for-next-lucky7-clock-v1-0-032e4b229c76@member.fsf.org>
	<CGME20260817101721epcas5p228e56fa915717b7a547df144ff801c8c@epcas5p2.samsung.com>
	<20260817-for-next-lucky7-clock-v1-2-032e4b229c76@member.fsf.org>



> -----Original Message-----
> From: Aiden Isik via B4 Relay
> <devnull+aidenisik.member.fsf.org=40kernel.org>
> Sent: Monday, August 17, 2026 3:47 PM
> To: Krzysztof Kozlowski <krzk=40kernel.org>; Sylwester Nawrocki
> <s.nawrocki=40samsung.com>; Chanwoo Choi <cw00.choi=40samsung.com>;
> Peter Griffin <peter.griffin=40linaro.org>; Alim Akhtar
> <alim.akhtar=40samsung.com>; Michael Turquette
> <mturquette=40baylibre.com>; Stephen Boyd <sboyd=40kernel.org>; Brian
> Masney <bmasney=40redhat.com>; Rob Herring <robh=40kernel.org>; Conor
> Dooley <conor+dt=40kernel.org>; Kees Cook <kees=40kernel.org>; Gustavo A.
> R. Silva <gustavoars=40kernel.org>
> Cc: linux-samsung-soc=40vger.kernel.org; linux-clk=40vger.kernel.org;
> devicetree=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org; lin=
ux-
> kernel=40vger.kernel.org; linux-hardening=40vger.kernel.org; Aiden Isik
> <aidenisik+git=40member.fsf.org>
> Subject: =5BPATCH 2/3=5D clk: samsung: clk-pll: Add support for pll_309
>=20
> From: Aiden Isik <aidenisik=40member.fsf.org>
>=20
> pll_309 (referred to in the downstream kernel sources as frd_309_rpll) is=
 one
> of two PLLs used in the Exynos5515 SoC. It is an integer/fractional PLL w=
ith an
> FVCO of 600-2400MHz.
>=20
> It has the same locktime (500), and kdiv/mdiv/pdiv/sdiv masks and shifts =
as
> pll_531x, so it can be handled in exactly the same way.
>=20
> When defining a PLL, the =22con=22 parameter should be set to the CON3 re=
gister,
> like this:
>=20
> PLL(pll_309, CLK_FOUT_AUD_PLL, =22fout_aud_pll=22, =22oscclk=22,
>     PLL_LOCKTIME_PLL_AUD, PLL_CON3_PLL_AUD, NULL),
>=20
This patch does more then what is described above; please explain all chang=
es in the commit.=20
If needed, split this into common and pll_309 specific changes. Thanks=21

Regards,
Alim

