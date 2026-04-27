Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B993B2F616B
	for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Apr 2026 10:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777285578; cv=none; b=h1nTzY/gWMOKtnLFA+wwd/cXe9FP2dLMN8vewLdBs+52zsCTi1eey7CHGHzUyN68Pp9nipWYeH8K+rYxoMLocQmtnP6LgwqWrBJyhwpZF2rWNWnlF9QzMHaUSKvr6YLtuWjWsFgj0t4vsfkm0X45Wma82xBLWKj9+6RKUyBl+TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777285578; c=relaxed/simple;
	bh=iTud6rbZRiYMN7C/gOGmepBtR1qCbp/1rgi19lH6y5g=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=ILumYwOKB9Bp4eRmby02MSKV4Qh1cOrW/v3jpTiOU2NbOeSyw7eGCivmz/QwNem20cEjkbS02+WHPOZ69Y7XwYStqlCAzrepf//un0EUcJ8XBdRyX98k9gCTLz/3QQVBKX0KdPoBJQntziS1FIVQdeASHLtqa+Rd5jCOgegqQro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=RNarizEX; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="RNarizEX"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20260427102614epoutp043792ec3b87f988902ebb5f6ed60dcb3b~qL9BMv0o20423904239epoutp04Q
	for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Apr 2026 10:26:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20260427102614epoutp043792ec3b87f988902ebb5f6ed60dcb3b~qL9BMv0o20423904239epoutp04Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1777285574;
	bh=iTud6rbZRiYMN7C/gOGmepBtR1qCbp/1rgi19lH6y5g=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=RNarizEXlRDSM1xC1OaAxLCkNe4fjr0wsXag4w/ybLUQfTZD3h8m/uHluoosPcDMi
	 lSRuE1IN1uniT/H1uQKfQ8UooqWwe9ffvhiOPKqFhdrWWw3SwKRlQKt6X7A/TOv5SF
	 XCPeYjvW2ubIytrd5fpp0cruolUziCs2rtPaLuLQ=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20260427102614epcas5p1df9060ac1e23c62dd0e39bd32f6d83d9~qL9A4gCCG2192521925epcas5p1o;
	Mon, 27 Apr 2026 10:26:14 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.93]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4g408j48JSz2SSKY; Mon, 27 Apr
	2026 10:26:13 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20260427102612epcas5p2b67143c0aac80ebfe60be6300ff13084~qL8-pP4PV1300213002epcas5p2x;
	Mon, 27 Apr 2026 10:26:12 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20260427102611epsmtip1e466f08485e54d02b55ee356a96e27b3~qL8_K_CD30337703377epsmtip1R;
	Mon, 27 Apr 2026 10:26:11 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, <gregkh@linuxfoundation.org>,
	<jirislaby@kernel.org>
Cc: <linux-serial@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <8998d2ae-cb6e-458d-8551-6b44f81b1c60@kernel.org>
Subject: RE: [PATCH] tty: serial: samsung: add dedicated compatible for
 exynosauto SoCs
Date: Mon, 27 Apr 2026 15:56:09 +0530
Message-ID: <33b901dcd630$4587bc50$d09734f0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQLHQDzJr9CcZPOPaqlFuI7tkfQ2vwEe/VafAdmTEHQDVS/cgQFFb5fTs+FE9RA=
Content-Language: en-us
X-CMS-MailID: 20260427102612epcas5p2b67143c0aac80ebfe60be6300ff13084
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260424100201epcas5p371dd69955076938ee41ed0d823433056
References: <CGME20260424100201epcas5p371dd69955076938ee41ed0d823433056@epcas5p3.samsung.com>
	<20260424101835.2125970-1-alim.akhtar@samsung.com>
	<6916bf87-4c40-42c5-988f-92a57a6fc658@kernel.org>
	<324e01dcd5a0$a53d3d90$efb7b8b0$@samsung.com>
	<8998d2ae-cb6e-458d-8551-6b44f81b1c60@kernel.org>

Hi Krzysztof,

> -----Original Message-----
> From: Krzysztof Kozlowski <krzk=40kernel.org>
> Sent: Monday, April 27, 2026 12:10 PM
> To: Alim Akhtar <alim.akhtar=40samsung.com>; gregkh=40linuxfoundation.org=
;
> jirislaby=40kernel.org
> Cc: linux-serial=40vger.kernel.org; linux-samsung-soc=40vger.kernel.org; =
linux-
> kernel=40vger.kernel.org
> Subject: Re: =5BPATCH=5D tty: serial: samsung: add dedicated compatible f=
or
> exynosauto SoCs
> >
=2E
=2E
=2E
> >> Entire reasoning for doing this patch is wrong. And patch itself is
> >> NOOP (at least by quick look).
> > Thanks for a quick review, Can you please check the part of the patch
> > which adds OF_EARLYCON_DECLARE to add earlycon support?
> >
>=20
> It also feels unnecessary - existing compatible will be used for earlycon=
, no?
> If matching by existing compatible does not work, commit msg should expla=
in
> that.
>
Yes, it fall back to exynos850 and earlycon does work with fallback compati=
ble, Thanks=21
=20
> Best regards,
> Krzysztof

