Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6603523F41F
	for <linux-samsung-soc@vger.kernel.org>; Sat, 23 Aug 2025 13:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755955757; cv=none; b=nd+oVCeFjZcTZ9aK8Uik5E6Qnyqb+nI04RaI6gW4uagsbNqU1+WTv9/0t/1INrQNoHi/wvX3fHC0NpO9Qu1od+4JmMbkegZJdcXYet2w5WX2MTDnzcuJp9z56287L2s3W/WLgTxrx1NwkV8IRIDRPFTtIbR3am7poT1bkOArMZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755955757; c=relaxed/simple;
	bh=u9ena2NoTo+QRILuA8K2q9d32H1jKJNa+yMQOMkNRmI=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=FU7C/49zWYr3xdPACEGjKehnpOEfTFiv9gFrc5GYC4s0evXVDNOXJGnlL6d0HsvV9KwfmBMIVxLWsQYz3jJeU05K7qYxFskP2iQPR/sXNejlDD00aBmCSZPNM1D2NkfjqtUXe6ADAhQ58QMXV9Jjg8NRcMhfm9lcVRnrMvRruvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Zqa+aqgr; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Zqa+aqgr"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250823132913epoutp025092e48bf7d2ef858338510cf238ec36~eaHQ8XPOp1530815308epoutp02F
	for <linux-samsung-soc@vger.kernel.org>; Sat, 23 Aug 2025 13:29:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250823132913epoutp025092e48bf7d2ef858338510cf238ec36~eaHQ8XPOp1530815308epoutp02F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755955753;
	bh=K4VL47xU6rx+wQ2n08ewDHtYA71u+fcU72PN1XkjcTs=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=Zqa+aqgr+imSZZBsT0bru0TYwGa3siMcTSBKFYiQRw1tY0/xf/ttoe/blfrq3zWlS
	 rFNoK07Bixo0dElM8YQBmB1iH4NGBcVOUfGO+eOEqRHKK6HTRMt1KXT5ET0okw+YfN
	 JhbQoLO3BE0Jrl66CtRrSkrusVcz6d+NyuU9b1HY=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250823132912epcas5p19b424584ce8c9b39ceccc4844559ed31~eaHP6t6MI2896228962epcas5p1Y;
	Sat, 23 Aug 2025 13:29:12 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.88]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4c8Hvq0wd1z3hhT3; Sat, 23 Aug
	2025 13:29:11 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250823132909epcas5p2b2f12a18b157c75d531c218373385b91~eaHN0izn-1748017480epcas5p2l;
	Sat, 23 Aug 2025 13:29:09 +0000 (GMT)
Received: from FDSFTE196 (unknown [107.116.189.214]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250823132905epsmtip1ffcc6e00eb7cee72387b6cd5521b3ed0~eaHKHyQoL2663526635epsmtip1z;
	Sat, 23 Aug 2025 13:29:05 +0000 (GMT)
From: "Inbaraj E" <inbaraj.e@samsung.com>
To: "'Laurent Pinchart'" <laurent.pinchart@ideasonboard.com>
Cc: <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <krzk@kernel.org>,
	<s.nawrocki@samsung.com>, <s.hauer@pengutronix.de>, <shawnguo@kernel.org>,
	<cw00.choi@samsung.com>, <rmfrfs@gmail.com>, <martink@posteo.de>,
	<mchehab@kernel.org>, <linux-fsd@tesla.com>, <will@kernel.org>,
	<catalin.marinas@arm.com>, <pankaj.dubey@samsung.com>,
	<shradha.t@samsung.com>, <ravi.patel@samsung.com>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <alim.akhtar@samsung.com>,
	<linux-samsung-soc@vger.kernel.org>, <kernel@puri.sm>,
	<kernel@pengutronix.de>, <festevam@gmail.com>,
	<linux-media@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>
In-Reply-To: <20250818093349.GC5862@pendragon.ideasonboard.com>
Subject: RE: [PATCH v2 07/12] media: imx-mipi-csis: Add support to configure
 specific vc
Date: Sat, 23 Aug 2025 18:59:04 +0530
Message-ID: <00e701dc1431$e839d710$b8ad8530$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQK5oFMD+tt4mLQU5V9KgVyIDaUIUQFnLuCBAPSEv1UBKchLdbKY9dyw
Content-Language: en-in
X-CMS-MailID: 20250823132909epcas5p2b2f12a18b157c75d531c218373385b91
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250814141036epcas5p1fc02cea3f97534303673eb8453b6a18f
References: <20250814140943.22531-1-inbaraj.e@samsung.com>
	<CGME20250814141036epcas5p1fc02cea3f97534303673eb8453b6a18f@epcas5p1.samsung.com>
	<20250814140943.22531-8-inbaraj.e@samsung.com>
	<20250818093349.GC5862@pendragon.ideasonboard.com>


Hi Laurent,

Thanks for the review.

>=20
> Hi Inbaraj,
>=20
> On Thu, Aug 14, 2025 at 07:39:38PM +0530, Inbaraj E wrote:
> > MIPI_CSIS_V3_3 and MIPI_CSIS_V3_6_3 support streaming only on VC0.
>=20
> That doesn't appear to be true, at least for MIPI_CSIS_V3_6_3. I have a p=
atch
> series that adds VC support for v3.6.3 in the i.MX8MP, and it has been
> susccessfully tested.
>=20

Thanks for the patches. I'll add Tesla FSD CSIS support on top of
Your patch.

> >
> > +	csis->vc =3D 0;
> > +
>=20
> Dynamic VC selection belongs to this patch, not patch 09/12. 09/12 does t=
oo
> many different things, it has to be split into one patch per feature.
>=20

I'll break down the patches by feature.=20

Regards,
Inbaraj E

