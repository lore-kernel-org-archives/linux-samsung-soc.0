Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A811A4F3C
	for <linux-samsung-soc@vger.kernel.org>; Sun, 26 Apr 2026 17:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777223899; cv=none; b=Ccx6ucNbqw2KujMmSCVAKtQ7zdd8l+Zd5Y0DlVH7ukwSRV7O5a1wJIkuMXatvuYPQro9kNPw2Pg4RA+TYn3shaXu5++D+2hJN4UhP0OTPCG+XVZ7y/hOKakypVWTCgUl0aU259O/OJ+gTOFtTrZJwZfH0OkJ00SLosIJZh1Mp8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777223899; c=relaxed/simple;
	bh=1I0y4aYwf6Qb2fZ5USEX9HIcWwgsd6HyiI3kIOpRTcM=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=OfxFM5PiqAwsLjQz9rJYwBAvS5TyRwNVD3IrxX5E2RDJzj+Rq3Yjaxlvi/O0o5KjCpJ0IU/waWDZtNN3lWZ2HeyWkcgFpZeV+pNMOXnbsJmSAArAXoNoUF8IujSBlfO4fHXsnBNeXOLXh75uRpvfvgiDlibNLCAa6Y5jFlrMu/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=NCgMWOik; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="NCgMWOik"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20260426171808epoutp01159942bb430415a5adf4da9407d64529~p97Xi_2h32753127531epoutp01h
	for <linux-samsung-soc@vger.kernel.org>; Sun, 26 Apr 2026 17:18:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20260426171808epoutp01159942bb430415a5adf4da9407d64529~p97Xi_2h32753127531epoutp01h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1777223888;
	bh=1I0y4aYwf6Qb2fZ5USEX9HIcWwgsd6HyiI3kIOpRTcM=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=NCgMWOikhlmZctZTVcgEi6g+LMuBnRzr9UwUSSiBcK+FrflcsEgdMQWhoydZV+xQp
	 D0Y3idOzcIZFkbw3O1ZBTsg+Lunojz33MhjEYMMfGP0EpqMQym+5xrL5vWdhsXdg2y
	 rqD4ns/2OB6Px3xiTg/hRYOQfXScfEYhRANnAmdc=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20260426171808epcas5p1678ed9e51047c7db69b1f7c2a8952f59~p97XD6IuP2570725707epcas5p1c;
	Sun, 26 Apr 2026 17:18:08 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.90]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4g3YLR2GSWz3hhT3; Sun, 26 Apr
	2026 17:18:07 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20260426171806epcas5p28b819a6f30dcbd5f2ed3adc9756dc5b5~p97VNrL4d3212432124epcas5p2X;
	Sun, 26 Apr 2026 17:18:06 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20260426171804epsmtip1a62b13b47da590425bad92e3e22baed9~p97T9Nw4O2464024640epsmtip1j;
	Sun, 26 Apr 2026 17:18:04 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, <gregkh@linuxfoundation.org>,
	<jirislaby@kernel.org>
Cc: <linux-serial@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <6916bf87-4c40-42c5-988f-92a57a6fc658@kernel.org>
Subject: RE: [PATCH] tty: serial: samsung: add dedicated compatible for
 exynosauto SoCs
Date: Sun, 26 Apr 2026 22:48:02 +0530
Message-ID: <324e01dcd5a0$a53d3d90$efb7b8b0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQLHQDzJr9CcZPOPaqlFuI7tkfQ2vwEe/VafAdmTEHS0BPpcAA==
Content-Language: en-us
X-CMS-MailID: 20260426171806epcas5p28b819a6f30dcbd5f2ed3adc9756dc5b5
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260424100201epcas5p371dd69955076938ee41ed0d823433056
References: <CGME20260424100201epcas5p371dd69955076938ee41ed0d823433056@epcas5p3.samsung.com>
	<20260424101835.2125970-1-alim.akhtar@samsung.com>
	<6916bf87-4c40-42c5-988f-92a57a6fc658@kernel.org>

Hi Krzysztof

> -----Original Message-----
> From: Krzysztof Kozlowski <krzk=40kernel.org>
> Sent: Friday, April 24, 2026 9:42 PM
> To: Alim Akhtar <alim.akhtar=40samsung.com>; gregkh=40linuxfoundation.org=
;
> jirislaby=40kernel.org
> Cc: linux-serial=40vger.kernel.org; linux-samsung-soc=40vger.kernel.org; =
linux-
> kernel=40vger.kernel.org
> Subject: Re: =5BPATCH=5D tty: serial: samsung: add dedicated compatible f=
or
> exynosauto SoCs
>=20
> On 24/04/2026 12:18, Alim Akhtar wrote:
> > Currently Exynosautov-=7B9,920=7D getting probed based on exynos850
> > fallback. It is recommended to have a dedicated compatible for proper
> > driver binding.
>=20
> Unfortunately it is not. Dedicated compatible you have. However you are n=
ot
> adding dedicated compatible. You added dedicated driver match entry and
> we, and especially me, gave reviews many times that it is *not
> recommended* to have dedicated driver match entry.
>=20
Ok, I might have missed your earlier comments on *not* having a dedicated d=
river match entry, fair enough.

> Entire reasoning for doing this patch is wrong. And patch itself is NOOP =
(at
> least by quick look).
Thanks for a quick review, Can you please check the part of the patch which=
 adds OF_EARLYCON_DECLARE
to add earlycon support?

>=20
> Best regards,
> Krzysztof

