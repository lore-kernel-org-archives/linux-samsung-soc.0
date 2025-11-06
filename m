Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A773734F46A
	for <linux-samsung-soc@vger.kernel.org>; Thu,  6 Nov 2025 17:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762449611; cv=none; b=TUE4xsC3BH3aQqzdvMug2LCPqXGThmulGb9oWFMqO8t0grI/5GfnMuHDU49KqleTTXx+9x1ZDcIv4OD+MXm931W0Hs2SpN/LbSTUjs+ry6ySIvt0cEC0gh4xhKAN0v+6+mVbDBYVedCsnkEU5VwqtKbDNdtEHdPHAA0tN3TdfXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762449611; c=relaxed/simple;
	bh=sngSJFzH0gflKDa+8Iim+lbvqosTBty+UDJw/IjLKlk=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=oMGioHKAq1U/OsAFIQG0EIdwN1GdOr8QZ2fsu9Mh6P1ZHKp31u//+t85LUDzjRSMmihuj9/8P5UGcLaNzebMLbQzOKGgr8FNrSUgomPkQuHSxj4zMH8fTGBrZLe3HKiFTymlM/KhVWviJls+XRNFiGr6/Vmh1OTKt8TovHJtwgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=OYJ1GXgf; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="OYJ1GXgf"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20251106172002epoutp02e287083215a10b653f764ca234b19c7e~1epNDWom02619926199epoutp02T
	for <linux-samsung-soc@vger.kernel.org>; Thu,  6 Nov 2025 17:20:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20251106172002epoutp02e287083215a10b653f764ca234b19c7e~1epNDWom02619926199epoutp02T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1762449602;
	bh=GMxbGaHTegvxzjmrCuxMyXkM1amJUDVoE5ZIXTzbZNE=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=OYJ1GXgfV/XZM6ojtZSaI/3vG020gvqa7gJISvsW8Z2xJwsaN2nIoU2D582IRZA0o
	 3qlBInMo1MbRvN7mEJspmxW45nJxNVQQCjtRRybuZ+DgyuLKQjGTEuzDqqyzhse9sJ
	 utOjWzduvIZmewRbGl1E3fbsDQo3vqYzXkyHR8RY=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20251106172001epcas5p1dda439ff0736d2ad8b7b1fe79939d39c~1epMgioyt1461914619epcas5p1R;
	Thu,  6 Nov 2025 17:20:01 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.91]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4d2TTX3cTNz6B9m4; Thu,  6 Nov
	2025 17:20:00 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20251106171959epcas5p1bfa773e26cfc783e69ddcb7ffca54190~1epLEgwkF1620916209epcas5p10;
	Thu,  6 Nov 2025 17:19:59 +0000 (GMT)
Received: from INBRO000519 (unknown [107.122.1.150]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20251106171954epsmtip2bfb46d347a900a171b074f453dd1a3cf~1epFsVcSg0814108141epsmtip2f;
	Thu,  6 Nov 2025 17:19:54 +0000 (GMT)
From: "Faraz Ata" <faraz.ata@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, "'Andi Shyti'"
	<andi.shyti@kernel.org>
Cc: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<alim.akhtar@samsung.com>, <linux-i2c@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<rosa.pila@samsung.com>, <dev.tailor@samsung.com>,
	<pritam.sutar@samsung.com>
In-Reply-To: <7ba31fb7-8f1b-4277-a3cf-649a76c7dda5@kernel.org>
Subject: RE: [PATCH v2] arm64: dts: exynosautov920: Add DT node for all I2C
 ports
Date: Thu, 6 Nov 2025 22:49:03 +0530
Message-ID: <000001dc4f41$948cb470$bda61d50$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQFOiGH9IZBP/MALtVgmdgdp0NuXDgFMvpOsAcCx1FYC93HaobXRSjbA
Content-Language: en-us
X-CMS-MailID: 20251106171959epcas5p1bfa773e26cfc783e69ddcb7ffca54190
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

HI  Krzysztof

> -----Original Message-----
> From: Krzysztof Kozlowski <krzk=40kernel.org>
> Sent: Thursday, October 30, 2025 9:11 PM
> To: Andi Shyti <andi.shyti=40kernel.org>; Faraz Ata <faraz.ata=40samsung.=
com>
> Cc: robh=40kernel.org; krzk+dt=40kernel.org; conor+dt=40kernel.org;
> alim.akhtar=40samsung.com; linux-i2c=40vger.kernel.org;
> devicetree=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org; lin=
ux-
> samsung-soc=40vger.kernel.org; linux-kernel=40vger.kernel.org;
> rosa.pila=40samsung.com; dev.tailor=40samsung.com;
> pritam.sutar=40samsung.com
> Subject: Re: =5BPATCH v2=5D arm64: dts: exynosautov920: Add DT node for a=
ll I2C
> ports
>=20
> On 30/10/2025 16:34, Andi Shyti wrote:
> > Hi Faraz,
> >
> > On Tue, Oct 14, 2025 at 04:53:38PM +0530, Faraz Ata wrote:
> >> Universal Serial Interface (USI) supports three serial protocol like
> >> uart, i2c and spi. ExynosAutov920 has 18 instances of USI.
> >> Add i2c nodes for all the instances.
> >>
> >> Signed-off-by: Faraz Ata <faraz.ata=40samsung.com>
> >
> > what happened to patch 1/1?
>=20
> Different patchset, no?

In order to address your below comment=20
https://lore.kernel.org/all/000001dc39a2=242cf5e570=2486e1b050=24=40samsung=
.com/

I added the lore link to dt binding in v2=20
https://lore.kernel.org/all/176044840242.3094524.6549941972513295895.robh=
=40kernel.org/

Please suggest if anything else need to be done  and via which tree this pa=
tch set will go
>=20
> Best regards,
> Krzysztof

