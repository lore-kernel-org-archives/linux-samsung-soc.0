Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F0833F8B9
	for <linux-samsung-soc@vger.kernel.org>; Mon,  5 Jan 2026 11:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767611787; cv=none; b=WBBkrPVhZ7HD2N39Ro00l+3BIscACxF47faNWAVgrRPtFfBVhWZ72gbYR2L16bfZV1u3DGuPdsY2O94iaURH56bSPAdcXXZ69Vbq3O730AsytoY87cZM/oYfVQ4ESRAB7MXpvGuHK5dGIZ1yUhZEP67DIkdTIKybbmc7oN/5pHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767611787; c=relaxed/simple;
	bh=jIYdpOYohHpzOw2rr8oL4LfsXYMgfwWHy4yrWd5JEfM=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=EaTx0NK+bxC1+ecYd8yxtxVoaMVpqaX5kJAN5sQwdHzij9UQK9Jw1l250AKTZh6fOqG86SF3qPJUSyz3MtooAH046JUT9CujCgNB9cY5K7h/fUNtTm6jV7hhk4U5+NeLFUxK7qqv8VCy4PDSWUuoJqjmgeqDjf3BNK2OpWOQkuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=eqMlEBR8; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="eqMlEBR8"
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20260105111623epoutp013c4bb6a7db176ed188bdaece753660b1~H0Y07h3FA1817718177epoutp01a
	for <linux-samsung-soc@vger.kernel.org>; Mon,  5 Jan 2026 11:16:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20260105111623epoutp013c4bb6a7db176ed188bdaece753660b1~H0Y07h3FA1817718177epoutp01a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1767611783;
	bh=exmRwuE3H60PBAfP7giHoY+OJrbqno0dZ6dVxdCiUeg=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=eqMlEBR8yOXbCkHJAZlAEv+nUMIPi+dMNilurU0uR9Z4bZPUWHfjcvPlAO0EjVrUg
	 dpl0D3EFU+PJGY4kAJ+gwhyXVeuip0TEPdhoK6LebLP1D8G4nM+ywyrQXofLShPl12
	 zbtfUn3rvi4BzLKTO9vsh9Q4Vp3/mtjEmebc0iVk=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20260105111622epcas5p1383de210931da80ab45999c9261978ed~H0Y0VivxP3117331173epcas5p1x;
	Mon,  5 Jan 2026 11:16:22 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.92]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4dlBZF4XcBz6B9m9; Mon,  5 Jan
	2026 11:16:21 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20260105111620epcas5p4b639a27284272dd7432cb4b957d5e523~H0YydzdWK1918219182epcas5p4w;
	Mon,  5 Jan 2026 11:16:20 +0000 (GMT)
Received: from INBRO000519 (unknown [107.122.1.150]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20260105111618epsmtip25fda3d6ff52d0d1f8ab4b76a122827d4~H0YwpBgK00868908689epsmtip2N;
	Mon,  5 Jan 2026 11:16:18 +0000 (GMT)
From: "Faraz Ata" <faraz.ata@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, "'Andi Shyti'"
	<andi.shyti@kernel.org>
Cc: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<alim.akhtar@samsung.com>, <linux-i2c@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<rosa.pila@samsung.com>, <dev.tailor@samsung.com>,
	<pritam.sutar@samsung.com>
In-Reply-To: 
Subject: RE: [PATCH v2] arm64: dts: exynosautov920: Add DT node for all I2C
 ports
Date: Mon, 5 Jan 2026 16:46:09 +0530
Message-ID: <000001dc7e34$b809a030$281ce090$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQFOiGH9IZBP/MALtVgmdgdp0NuXDgFMvpOsAcCx1FYC93HaobXRSjbAgF3h61A=
Content-Language: en-us
X-CMS-MailID: 20260105111620epcas5p4b639a27284272dd7432cb4b957d5e523
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251014111455epcas5p30731028365023e101dad3b9ba1f90bec
References: <CGME20251014111455epcas5p30731028365023e101dad3b9ba1f90bec@epcas5p3.samsung.com>
	<20251014112338.2023223-1-faraz.ata@samsung.com>
	<2knbzksxobg2kl3aexuiwluctgafgzxblsqc5q5rcikuruuegr@cqlizryhhx4s>
	<7ba31fb7-8f1b-4277-a3cf-649a76c7dda5@kernel.org> 

HI Krzysztof

I want to follow up on my I2C patches submitted.
Please let me know if anything else needs to be done or do I have to resend=
 the patches



> -----Original Message-----
> From: Faraz Ata <faraz.ata=40samsung.com>
> Sent: Thursday, November 6, 2025 10:49 PM
> To: 'Krzysztof Kozlowski' <krzk=40kernel.org>; 'Andi Shyti'
> <andi.shyti=40kernel.org>
> Cc: 'robh=40kernel.org' <robh=40kernel.org>; 'krzk+dt=40kernel.org'
> <krzk+dt=40kernel.org>; 'conor+dt=40kernel.org' <conor+dt=40kernel.org>;
> 'alim.akhtar=40samsung.com' <alim.akhtar=40samsung.com>; 'linux-
> i2c=40vger.kernel.org' <linux-i2c=40vger.kernel.org>;
> 'devicetree=40vger.kernel.org' <devicetree=40vger.kernel.org>; 'linux-arm=
-
> kernel=40lists.infradead.org' <linux-arm-kernel=40lists.infradead.org>; '=
linux-
> samsung-soc=40vger.kernel.org' <linux-samsung-soc=40vger.kernel.org>;
> 'linux-kernel=40vger.kernel.org' <linux-kernel=40vger.kernel.org>;
> 'rosa.pila=40samsung.com' <rosa.pila=40samsung.com>;
> 'dev.tailor=40samsung.com' <dev.tailor=40samsung.com>;
> 'pritam.sutar=40samsung.com' <pritam.sutar=40samsung.com>
> Subject: RE: =5BPATCH v2=5D arm64: dts: exynosautov920: Add DT node for a=
ll I2C
> ports
>=20
> HI  Krzysztof
>=20
> > -----Original Message-----
> > From: Krzysztof Kozlowski <krzk=40kernel.org>
> > Sent: Thursday, October 30, 2025 9:11 PM
> > To: Andi Shyti <andi.shyti=40kernel.org>; Faraz Ata
> > <faraz.ata=40samsung.com>
> > Cc: robh=40kernel.org; krzk+dt=40kernel.org; conor+dt=40kernel.org;
> > alim.akhtar=40samsung.com; linux-i2c=40vger.kernel.org;
> > devicetree=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org;
> > linux- samsung-soc=40vger.kernel.org; linux-kernel=40vger.kernel.org;
> > rosa.pila=40samsung.com; dev.tailor=40samsung.com;
> > pritam.sutar=40samsung.com
> > Subject: Re: =5BPATCH v2=5D arm64: dts: exynosautov920: Add DT node for
> > all I2C ports
> >
> > On 30/10/2025 16:34, Andi Shyti wrote:
> > > Hi Faraz,
> > >
> > > On Tue, Oct 14, 2025 at 04:53:38PM +0530, Faraz Ata wrote:
> > >> Universal Serial Interface (USI) supports three serial protocol
> > >> like uart, i2c and spi. ExynosAutov920 has 18 instances of USI.
> > >> Add i2c nodes for all the instances.
> > >>
> > >> Signed-off-by: Faraz Ata <faraz.ata=40samsung.com>
> > >
> > > what happened to patch 1/1?
> >
> > Different patchset, no?
>=20
> In order to address your below comment
> https://lore.kernel.org/all/000001dc39a2=242cf5e570=2486e1b050=24=40samsu=
ng.co
> m/
>=20
> I added the lore link to dt binding in v2
> https://lore.kernel.org/all/176044840242.3094524.6549941972513295895.rob
> h=40kernel.org/
>=20
> Please suggest if anything else need to be done  and via which tree this =
patch
> set will go
> >
> > Best regards,
> > Krzysztof

