Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06FA3CA4B9
	for <linux-samsung-soc@vger.kernel.org>; Fri,  3 Jul 2026 12:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783080954; cv=none; b=Y7ZQQZ/pPsv6zNnu/JqXfMX+Anxy97hGZXS+Prxh+vG7uozlyMJ+0w+z9jeyOwyYQGqXa+TvW7mRXog3YR5pbuXAVCMgmVwerJzD4Z8tYZ0zluSB+gbSpDG2GK6dfNeXvrz0F5tv6hWJi6Vut58YHd7+OZqZxryEvhWj/7UqH9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783080954; c=relaxed/simple;
	bh=AuHHrWb27znCGcC0QzmYEgTh0U7JHklL+01GaPyAJTg=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=cen7zTLxUsKc/cNbCsPXRmEVLUXjelDy8v4viCpwHDJIdzp0fVoAJdGVN07EIXewiEtDhkoevz1tDQ7OU5v13w2jGjEwU4siy9XuhMKdmLqTXlYkBlODSP8VUtXhxM6kZAodpGBh3fPg/YMhK/8g7Yhwap0YD6FB69jHJ/B3aHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=TkPcDkgC; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="TkPcDkgC"
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20260703121542epoutp0384798b624df3472e97ef4ab07e4b806a~_xquWiBeO1971319713epoutp03I
	for <linux-samsung-soc@vger.kernel.org>; Fri,  3 Jul 2026 12:15:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20260703121542epoutp0384798b624df3472e97ef4ab07e4b806a~_xquWiBeO1971319713epoutp03I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1783080942;
	bh=qm11f/zR4qtblmEb9WqIxklnSmRd5ntPO4IgWl784nc=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=TkPcDkgCOY2B6XOPzI5ryVssnTiJHrpBeVjczbrd3NyYY1J790URp72ZOsSyF03Nf
	 NwV9KWIof+h6Q9yfZmknZXy7T77bwK3lt0ZJaZiHyFdDJ1ipWctulCeyy48Y4clget
	 rNauQ09ZqrmhrS6lH9ByYIBQdw/dK3t76rOrWesA=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20260703121541epcas2p2b791d0a882a31a404f0259e2df2e1138~_xqtpTVl21760017600epcas2p2F;
	Fri,  3 Jul 2026 12:15:41 +0000 (GMT)
Received: from epcas2p4.samsung.com (unknown [182.195.38.209]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4gsCQ54kxqz6B9m6; Fri,  3 Jul
	2026 12:15:41 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20260703121541epcas2p4408a3bbc4a2f9ff6d018cf9a2f5298d2~_xqs3tG1Y1460114601epcas2p4o;
	Fri,  3 Jul 2026 12:15:41 +0000 (GMT)
Received: from KORCO090186 (unknown [12.80.211.165]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20260703121541epsmtip14e82d433e2e957a41fbddb55aa76c1ba~_xqsxJ7j_2740427404epsmtip1U;
	Fri,  3 Jul 2026 12:15:41 +0000 (GMT)
From: =?utf-8?B?64Ko7JiB66+8?= <youngmin.nam@samsung.com>
To: "'Alim Akhtar'" <alim.akhtar@samsung.com>, "'Peter Griffin'"
	<peter.griffin@linaro.org>
Cc: <krzk@kernel.org>, <s.nawrocki@samsung.com>, <linus.walleij@linaro.org>,
	<semen.protsenko@linaro.org>, <ivo.ivanov.ivanov1@gmail.com>,
	<ryu.real@samsung.com>, <d7271.choe@samsung.com>, <shin.son@samsung.com>,
	<jaewon02.kim@samsung.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <youngmin.nam@samsung.com>
In-Reply-To: <0e6201dd07a8$eb5884d0$c2098e70$@samsung.com>
Subject: RE: [PATCH v3 2/5] pinctrl: samsung: fix incorrect pin-bank entries
 on Exynos2200/7885/8890/8895
Date: Fri, 3 Jul 2026 21:15:40 +0900
Message-ID: <000001dd0ae5$aa491e10$fedb5a30$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIr5xjB9BZkcy1LV54fp2FD5N/QnAF3wuMlAatK81MBmh+d8gGktICKtYrtzGA=
Content-Language: ko
X-CMS-MailID: 20260703121541epcas2p4408a3bbc4a2f9ff6d018cf9a2f5298d2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251202093027epcas2p24adbd3226dd50b2780baceee6588f3ba
References: <CGME20251202093027epcas2p24adbd3226dd50b2780baceee6588f3ba@epcas2p2.samsung.com>
	<20251202093613.852109-1-youngmin.nam@samsung.com>
	<20251202093613.852109-3-youngmin.nam@samsung.com>
	<CADrjBPqYT9h_UJKSxBJ_KMQ4yQv4yyTuHaPYjC+K1-6TZj+PXg@mail.gmail.com>
	<0e6201dd07a8$eb5884d0$c2098e70$@samsung.com>

Hi Alim

> -----Original Message-----
> From: Alim Akhtar <alim.akhtar@samsung.com>
> Sent: Monday, June 29, 2026 6:23 PM
> To: 'Peter Griffin' <peter.griffin@linaro.org>; 'Youngmin Nam'
> <youngmin.nam@samsung.com>
> Cc: krzk@kernel.org; s.nawrocki@samsung.com; linus.walleij@linaro.org;
> semen.protsenko@linaro.org; ivo.ivanov.ivanov1@gmail.com;
> ryu.real@samsung.com; d7271.choe@samsung.com; shin.son@samsung.com;
> jaewon02.kim@samsung.com; linux-arm-kernel@lists.infradead.org; linux-
> samsung-soc@vger.kernel.org; linux-gpio@vger.kernel.org; linux-
> kernel@vger.kernel.org
> Subject: RE: [PATCH v3 2/5] pinctrl: samsung: fix incorrect pin-bank
> entries on Exynos2200/7885/8890/8895
> 
> Hi Krzysztof, Peter
> 
> > -----Original Message-----
> > From: Peter Griffin <peter.griffin@linaro.org>
> > Sent: Saturday, March 7, 2026 2:47 AM
> > To: Youngmin Nam <youngmin.nam@samsung.com>
> > Cc: krzk@kernel.org; s.nawrocki@samsung.com; alim.akhtar@samsung.com;
> > linus.walleij@linaro.org; semen.protsenko@linaro.org;
> > ivo.ivanov.ivanov1@gmail.com; ryu.real@samsung.com;
> > d7271.choe@samsung.com; shin.son@samsung.com;
> > jaewon02.kim@samsung.com; linux-arm-kernel@lists.infradead.org; linux-
> > samsung-soc@vger.kernel.org; linux-gpio@vger.kernel.org; linux-
> > kernel@vger.kernel.org
> > Subject: Re: [PATCH v3 2/5] pinctrl: samsung: fix incorrect pin-bank
> > entries on
> > Exynos2200/7885/8890/8895
> >
> > Hi Youngmin,
> >
> > On Tue, 2 Dec 2025 at 09:30, Youngmin Nam <youngmin.nam@samsung.com>
> > wrote:
> > >
> > > This patch corrects wrong pin bank table definitions for 4 SoCs
> > > based on their TRMs.
> > >
> > > Exynos2200
> > > - gpq0/1/2 were using EXYNOS_PIN_BANK_EINTN(), which implies a
> > >   'bank_type_off' layout (.fld_width = {4,1,2,2,2,2}).
> > > - Per the SoC TRM these banks must use the 'alive' layout
> > >   (.fld_width = {4,1,4,4}).
> > > - Switch them to
> > EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, ...).
> > >
> > > Exynos7885
> > > - etc0, etc1: update bank type to match the SoC TRM.
> > > - gpq0 is a non-wakeup interrupt bank; change EINTW -> EINTN
> accordingly.
> > >
> > > Exynos8890
> > > - Per the SoC TRM, rename bank ect0 to gpb3 and mark it as
> > >   a non-external interrupt bank.
> > > - gpi1, gpi2: update bank type to match the SoC TRM.
> > >   exynos8895_bank_type_off (.fld_width = {4,1,2,3,2,2}) ->
> > >   exynos5433_bank_type_off (.fld_width = {4,1,2,4,2,2})
> > > - Per the SoC TRM, mark etc1 as a non-external interrupt bank.
> > > - apply lower case style for hex numbers.
> > >
> > > Exynos8895
> > > - gpa4 is a non-wakeup interrupt bank per the SoC TRM.
> > >   change EINTW -> EINTN. (The bank_type itself was correct and is kept
> > >   unchanged.)
> > > - apply lower case style for hex numbers.
> > >
> > > This aligns the pin-bank tables with the documented bitfield layouts
> > > and wakeup domains. No DT/ABI change.
> > >
> > > Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
> > > Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> > > Reviewed-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> > > Tested-by: Sam Protsenko <semen.protsenko@linaro.org>
> > > ---
> >
> > This patch contains some worthwhile fixes for multiple Exynos SoCs. Do
> > you plan to re-send it? I think it would be good to get this merged
> > (even if there isn't broad agreement around renaming the pinctrl
> > macros to EXYNOS9_)
> >
> Can we relook into this series?
> AFA EXYNOS9_ macro is concern, Exynos990, Exynos9810 etc already support
> available upstream.
> Of course it does not justify why Exynos9, but we can consider all SoCs
> which has come after 2020 have this newer architecture.
> Or Just have SAMSUNG_ prefix for all such newer SoC.
> 
> A unified Macro help in adding new SoC support without much confusion(like
> I am trying with Exynos8855)
> 
> @Youngmin, will you have some time to re-spin these series?
> 

Sure. Let me re visit my patches and will try.


> > Thanks,
> >
> > Peter
> 


