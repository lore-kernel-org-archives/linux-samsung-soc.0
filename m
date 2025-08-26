Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9123002DC
	for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Aug 2025 10:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756202918; cv=none; b=S/+ABm84WzHf2g28jutVALAJfOaUQtD7lb5NN6JC/DU8lkYV4Q04YdgtQBHpVAZm0IfA8V3j3BOYqL13rmet9bDNrA8QZJS4dEJ8hbLl0n/Ie2PofzoxGzTp2+gUCVjuXLh/FHf9LN9lNs5WVV+vz9Kj35+qexmwQKqJRI3dax8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756202918; c=relaxed/simple;
	bh=gygMN3gMSxZ6Evr4Nrnpma342Igh7n4myrgw/1fPWg4=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=W9NpuSk6OBSt2WkHDztfIUWddqD9XlvWW0MzC4mlL1yjaQbGKVFgSV3iTWKQlX7QubC9BDHfpfW6lVk04gMuDr3BDhT6JQyax4VZEhIN3KcvQGH4H9VXxWDqEoEd+mDmlYOMtdyUp5OUOTC/EdNp1x9GLKThPjP2r7r0TGDbMJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=r7NlZ/4t; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="r7NlZ/4t"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250826100829epoutp01455d1cfc3fe71232ec21e1d780f0eb16~fST23fg_N1260712607epoutp01l
	for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Aug 2025 10:08:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250826100829epoutp01455d1cfc3fe71232ec21e1d780f0eb16~fST23fg_N1260712607epoutp01l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756202909;
	bh=gygMN3gMSxZ6Evr4Nrnpma342Igh7n4myrgw/1fPWg4=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=r7NlZ/4tAu+9H/3P7ZWUKTeFXtGPrnNGXPVGjg+FnDizdhhY2CcucA6jZY56cem/W
	 +67efryuTeLX78KEo8RXX7wyJn+cGCSiHzt5hSkaHeJF9GbnTAncXUgfih65s/Ru86
	 AnYJnsVxc+pynbElLONt0wHfZZL3yl6125+xZmlE=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250826100827epcas5p1193525accefc68efcd36c224d01ca9fc~fST10omlf3119231192epcas5p1b;
	Tue, 26 Aug 2025 10:08:27 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.91]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4cB3Jq08MPz6B9mF; Tue, 26 Aug
	2025 10:08:27 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250826100826epcas5p24abdd08b355b1a7c1064b086bb9c11ac~fST0MRrip0241602416epcas5p2f;
	Tue, 26 Aug 2025 10:08:26 +0000 (GMT)
Received: from FDSFTE196 (unknown [107.116.189.214]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250826100822epsmtip1d21b4e23ad85bcf46748f0d59cda39b5~fSTwTkU862841628416epsmtip1X;
	Tue, 26 Aug 2025 10:08:21 +0000 (GMT)
From: "Inbaraj E" <inbaraj.e@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, <mturquette@baylibre.com>,
	<sboyd@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <s.nawrocki@samsung.com>, <s.hauer@pengutronix.de>,
	<shawnguo@kernel.org>, <cw00.choi@samsung.com>, <rmfrfs@gmail.com>,
	<laurent.pinchart@ideasonboard.com>, <martink@posteo.de>,
	<mchehab@kernel.org>, <linux-fsd@tesla.com>, <will@kernel.org>,
	<catalin.marinas@arm.com>, <pankaj.dubey@samsung.com>,
	<shradha.t@samsung.com>, <ravi.patel@samsung.com>
Cc: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <alim.akhtar@samsung.com>,
	<linux-samsung-soc@vger.kernel.org>, <kernel@puri.sm>,
	<kernel@pengutronix.de>, <festevam@gmail.com>,
	<linux-media@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>
In-Reply-To: <1dfaedc8-88e6-4749-8726-e8f66878e57e@kernel.org>
Subject: RE: [PATCH v2 04/12] arm64: dts: fsd: Add CSI nodes
Date: Tue, 26 Aug 2025 15:38:19 +0530
Message-ID: <019c01dc1671$5c8f6850$15ae38f0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQK5oFMD+tt4mLQU5V9KgVyIDaUIUQE9OnCOAxwEstACXXiXxwGMECOMAYbqfFkCHlK3ygEZONEMslGN25A=
Content-Language: en-in
X-CMS-MailID: 20250826100826epcas5p24abdd08b355b1a7c1064b086bb9c11ac
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250814141019epcas5p2f957b934d5b60d4649cf9c6abd6969d5
References: <20250814140943.22531-1-inbaraj.e@samsung.com>
	<CGME20250814141019epcas5p2f957b934d5b60d4649cf9c6abd6969d5@epcas5p2.samsung.com>
	<20250814140943.22531-5-inbaraj.e@samsung.com>
	<1919de68-99ea-47f7-b3d2-cae4611f9c52@kernel.org>
	<00d101dc136c$aa037020$fe0a5060$@samsung.com>
	<41434afa-fecd-4507-bcca-735d358ac925@kernel.org>
	<016401dc15c0$fc0dcfe0$f4296fa0$@samsung.com>
	<1dfaedc8-88e6-4749-8726-e8f66878e57e@kernel.org>

Hi Krzysztof,


 >> Googling for =22MIPI CSIS=22 gives me 0 results, so I still claim this =
is
> >> not a generic name.
> >
> > I checked other vendors (e.g: freescale), and they are using mipi-csi.
> > I'll adopt for the same.
> >
> >
>=20
> Then it is just =22csi=22?=20

For the CSIS MIPI CSI-2 Rx handled by imx-mipi-csis driver, I'll keep node =
name as =22csi=22

>Except that you have some other different nodes called
> =22csi=22 as well, so two different devices are =22csi=22?

For CSIS video capture interface which is handled by fsd-csis driver I'll k=
eep node
name as =22csis=22.
 If =22csis =22 and =22csi=22 is kind of confusing in the same dt, then I'l=
l keep
as =22video=22.

is it fine?

Regards,
Inbaraj E

