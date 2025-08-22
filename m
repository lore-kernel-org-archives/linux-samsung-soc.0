Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813EE2FB633
	for <linux-samsung-soc@vger.kernel.org>; Fri, 22 Aug 2025 12:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755864543; cv=none; b=nl4MLL7J141ZAvuq3Un7Vn+b0lFR+ujDf0+j1Eq9I48AUUkHbmHI6LgXU1APpzqlAdWUjO+3n9PQsHGoliHE8DlvZ5PbsFfiOxrzq0UaylQP5dF3oMeW54CkEpLVE4msEEQujq7O0K5/KnDWIxlNj9mPXvJ94UltfczdiJ/+TJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755864543; c=relaxed/simple;
	bh=nLOyAWpzOxcLbnq6AYRm7XRxX4QswK3V/TLTzyzGOjs=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=dzr72lCnYwCVk2YA4WLOz18VO5Gybx/zE8BIOrFVf1msZVtpoOYy7j1LBjQSCHftUKKt2xVTJd8Q1VDs0S7hahojIaJAQmclAxP+v8bNnXI15GxdYX9lGgxyIpGimwA9vyRrbI94Wt0xHpGA/DCpCoN5HoMzpSJhJim+//Psnuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=WolNuskl; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="WolNuskl"
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250822120856epoutp030592498a11d5c18e8ffe1b763865060b~eFX4cu6-92032720327epoutp03P
	for <linux-samsung-soc@vger.kernel.org>; Fri, 22 Aug 2025 12:08:56 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250822120856epoutp030592498a11d5c18e8ffe1b763865060b~eFX4cu6-92032720327epoutp03P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755864536;
	bh=lET1kWbDLqrIbol+G/CIjHWw2OZjsq9g7OfEHWdvLhI=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=WolNusklP2tPVeQsUUFTpoi76gsovm194InhNOSHq7mcJKNAWfjDLXOI/ZsAGcYVx
	 FMiMVYEDvjWIBDc3I9lvLlQ6817/HP1S6GCI6+jAncykr9Tp110dKjjfk5pGP/k7dk
	 G22xA6VX6fFjKHMwEuh0mG4d5NRCJcB2N1L+nvMA=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250822120855epcas5p396d2099360b9ba11aa5a33fc9502af6a~eFX3h5JrT2585025850epcas5p3L;
	Fri, 22 Aug 2025 12:08:55 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.87]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4c7f9f16r4z2SSKb; Fri, 22 Aug
	2025 12:08:54 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250822120853epcas5p15497652f90d08bf64646bac341be80e8~eFX1qy8Mg2210422104epcas5p1D;
	Fri, 22 Aug 2025 12:08:53 +0000 (GMT)
Received: from FDSFTE411 (unknown [107.122.81.184]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250822120848epsmtip184aef53aafea6c576ae0dbebc5b6f376~eFXxPWsKW0871608716epsmtip1j;
	Fri, 22 Aug 2025 12:08:48 +0000 (GMT)
From: "Ravi Patel" <ravi.patel@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, <jesper.nilsson@axis.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <s.nawrocki@samsung.com>,
	<cw00.choi@samsung.com>, <alim.akhtar@samsung.com>,
	<linus.walleij@linaro.org>, <tomasz.figa@gmail.com>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <arnd@arndb.de>
Cc: <ksk4725@coasia.com>, <kenkim@coasia.com>, <pjsin865@coasia.com>,
	<gwk1013@coasia.com>, <hgkim05@coasia.com>, <mingyoungbo@coasia.com>,
	<smn1196@coasia.com>, <pankaj.dubey@samsung.com>, <shradha.t@samsung.com>,
	<inbaraj.e@samsung.com>, <swathi.ks@samsung.com>,
	<hrishikesh.d@samsung.com>, <dj76.yang@samsung.com>,
	<hypmean.kim@samsung.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-arm-kernel@axis.com>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<soc@lists.linux.dev>
In-Reply-To: <ceb20624-7405-40c5-9c29-1a7339e0cca4@kernel.org>
Subject: RE: [PATCH v2 02/10] clk: samsung: Add clock PLL support for
 ARTPEC-8 SoC
Date: Fri, 22 Aug 2025 17:38:47 +0530
Message-ID: <000301dc135d$86ed30d0$94c79270$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGJY/8wx4BImu0YLFPVfwpfqUmFNgKGrjAaAcRz3scCHvrcAQFBK/RJtNaTkzA=
Content-Language: en-in
X-CMS-MailID: 20250822120853epcas5p15497652f90d08bf64646bac341be80e8
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250821124024epcas5p349dda3c9e0523cc07acf2889476beeb1
References: <20250710002047.1573841-1-ksk4725@coasia.com>
	<20250821123310.94089-1-ravi.patel@samsung.com>
	<CGME20250821124024epcas5p349dda3c9e0523cc07acf2889476beeb1@epcas5p3.samsung.com>
	<20250821123310.94089-3-ravi.patel@samsung.com>
	<ceb20624-7405-40c5-9c29-1a7339e0cca4@kernel.org>



> -----Original Message-----
> From: Krzysztof Kozlowski <krzk@kernel.org>
> Sent: 22 August 2025 12:02
> To: Ravi Patel <ravi.patel@samsung.com>; jesper.nilsson@axis.com; mturquette@baylibre.com; sboyd@kernel.org;
> robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org; s.nawrocki@samsung.com; cw00.choi@samsung.com;
> alim.akhtar@samsung.com; linus.walleij@linaro.org; tomasz.figa@gmail.com; catalin.marinas@arm.com; will@kernel.org;
> arnd@arndb.de
> Cc: ksk4725@coasia.com; kenkim@coasia.com; pjsin865@coasia.com; gwk1013@coasia.com; hgkim05@coasia.com;
> mingyoungbo@coasia.com; smn1196@coasia.com; pankaj.dubey@samsung.com; shradha.t@samsung.com;
> inbaraj.e@samsung.com; swathi.ks@samsung.com; hrishikesh.d@samsung.com; dj76.yang@samsung.com;
> hypmean.kim@samsung.com; linux-kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-samsung-
> soc@vger.kernel.org; linux-arm-kernel@axis.com; linux-clk@vger.kernel.org; devicetree@vger.kernel.org; linux-
> gpio@vger.kernel.org; soc@lists.linux.dev
> Subject: Re: [PATCH v2 02/10] clk: samsung: Add clock PLL support for ARTPEC-8 SoC
> 
> On 21/08/2025 14:32, Ravi Patel wrote:
> > +
> > +static const struct clk_ops samsung_pll1031x_clk_ops = {
> > +	.recalc_rate = samsung_pll1031x_recalc_rate,
> > +	.round_rate = samsung_pll_round_rate,
> 
> 
> This will conflict with round_rate drop, so might need rebasing. Please
> follow up discussion or decisions in the round rate patchset.

Thanks for review. Yes, I can see conflicts with below patch 
https://lore.kernel.org/linux-samsung-soc/20250811-clk-for-stephen-round-rate-v1-99-b3bf97b038dc@redhat.com/

Since merging strategy of round_rate patches are not clear as of now, will wait for couple of days before posting v3.
Request to review other patches also.

Thanks,
Ravi

> 
> Best regards,
> Krzysztof

