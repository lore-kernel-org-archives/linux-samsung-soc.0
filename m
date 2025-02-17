Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BBBC8BE8
	for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Feb 2025 09:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739783170; cv=none; b=N7JHyVY4LuoUwcTBv3/EutQIF47de7JKdsPx2NLrfHBxH3AFGCZ8i2afw9O338SBZz9IGOVQlgkyLmXCJV5H+IZOQaPYwiyriNjfFniPDXLFOq/OHi05bwOMe4DCn/yGCIUoKXj4pgAvZV7vT0s/IHkKB4F7oCi4h7RW+ZrBCHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739783170; c=relaxed/simple;
	bh=z+jOT3KnOyuyQLtXdXvs9ukIJTH9c7/mfJh18NhxH3w=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=Gay8Bss2rXxI4GpLEB/mqdFyDyYrSmRE4lhELET1voCMbkCIGrK1skkfNkSc/zp686vNFvp5Z1i1uteWn6MROXGAR387WVKS7pDxN1U+jV5VswUhGM6fJkQSo/gpeDW3dcM7x5V0c6Oa9d/M+PqnfsD2g4t1gh3vD6NTMhDf68k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=GMj51zHn; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="GMj51zHn"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250217090606epoutp04b4204ee70d35cb730aec73244f600ccd~k85J0Gcrv1548215482epoutp04o
	for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Feb 2025 09:06:06 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250217090606epoutp04b4204ee70d35cb730aec73244f600ccd~k85J0Gcrv1548215482epoutp04o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1739783166;
	bh=LkoIlSlbFbZKur9FYZM7E+hrZCKs8pOzN18/eFwUD0w=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=GMj51zHn31Z1pR9xo4OPdp+ZyMWitv/5T1cq9IelIN3Zfnsq8k5z9YmNzxENZFRUp
	 7QMHKRWE/Oe/slz5vuPsid5D/Vc6XZPaXd1zrg06TSz1YeewSMK10lJn/8qfjDr8W7
	 +PFBxbY8WgYDAZK53m+0rOkynPVKQDsLybjEmScA=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTP id
	20250217090605epcas5p1de0b9304a08d1fcec20ff434ea01dda9~k85JUgni12059520595epcas5p1E;
	Mon, 17 Feb 2025 09:06:05 +0000 (GMT)
Received: from epsmgec5p1new.samsung.com (unknown [182.195.38.183]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4YxGwX0S6cz4x9Q1; Mon, 17 Feb
	2025 09:06:04 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
	epsmgec5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	74.E0.19710.BFBF2B76; Mon, 17 Feb 2025 18:06:03 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250217084602epcas5p14cfaa9303424d8d7b16d468192e0e61f~k8novCxTD2683026830epcas5p1C;
	Mon, 17 Feb 2025 08:46:02 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250217084602epsmtrp1252bb3e19198f0fb8e614c0f117393e3~k8nouQUo72624326243epsmtrp1x;
	Mon, 17 Feb 2025 08:46:02 +0000 (GMT)
X-AuditID: b6c32a44-36bdd70000004cfe-4b-67b2fbfb8ac5
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	BC.A9.18949.A47F2B76; Mon, 17 Feb 2025 17:46:02 +0900 (KST)
Received: from INBRO002520 (unknown [107.122.1.191]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250217084600epsmtip1d0307c141b7a3655b7c6451bf050a9fe~k8nnJuikb0615406154epsmtip1p;
	Mon, 17 Feb 2025 08:46:00 +0000 (GMT)
From: "Devang Tailor" <dev.tailor@samsung.com>
To: "'Alim Akhtar'" <alim.akhtar@samsung.com>, "'Krzysztof Kozlowski'"
	<krzk@kernel.org>, "'Sudeep Holla'" <sudeep.holla@arm.com>
Cc: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<faraz.ata@samsung.com>
In-Reply-To: <090d01db77e8$8687db10$93979130$@samsung.com>
Subject: RE: [PATCH v2] arm64: dts: add cpu cache information to
 ExynosAuto-v920
Date: Mon, 17 Feb 2025 14:15:56 +0530
Message-ID: <02c401db8118$5fcd7460$1f685d20$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJnCMNmj1amGSmPwLixER7WDeLbQALDHLFMAzsAx8ICGgWRGwKIqjkLAgYNgZWxzufgoA==
Content-Language: en-in
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfUxbVRjGc3r7BUvXOz7GoRHT3GAikHYttPUWYS4RSQO4QDUYNRWv7bUw
	+pW2bLDEiEE3xQlMVmSdhc6UTroyoBJSkUqs4Fg19A8iqzobydAVREkYbjDCZtsLyn+/9znP
	e57znnPYSNoIk8duMFhJs4HQYcxU+vi3eU8Ktrd9WtHWVTn+W984E/cG5mh4//QcA1+IXGbh
	y/YoEw+HR1i47/YCA5+f+JSJ94a/puGPJv0s/ErITz92QOHt8wKFz/MBU/GF621Fx5gHKO76
	Hq9mvNJYUk8SGtLMJw1qo6bBoC3FKl+oe7ZOKhOJBWI5/hTGNxB6shQrq6oWlDfo4ifD+CcJ
	XVNcqiYsFuzI0RKzsclK8uuNFmspRpo0OpPEJLQQekuTQSs0kNZisUhUKI0bX2+sd9zuYpou
	pTeHFm+xWsEctx2ksCEqgbG1H+ntIJWdhn4F4Nm/I0yqWAdwZmgQUMU9AEe/CTP2Wi7d+YRG
	LQQA7HkQYVHFMoB3Fm1JFxMVwmH798mNM9A2AL0doWSBoKsAfvieM+lKQYvh/IW/QILTUSV0
	2qZZCaajT8AH/eGkzkHl0P5dlEHxIXjj4hI9wQhaAN2X/0SoM/Hh1u/upCcDrYUz0SsMypMF
	Z7bOIYlgiE6yoXfQTacayuCtKQegOB2uXB9jUcyDy51ndtkIN4ITuwE6OLzSu6s/A686f4gH
	sOMBeXB44ggl50Bb6BqNyj0IP9peolE6B/r7EsyOcy5cuy/fS4pFJ2ldALPvm8y+bzL7vgns
	/4c5Ad0DskmTRa8l1VKT2ECe+u/J1Ua9DyS/bn6ZH0T6HwqDgMYGQQDZCJbBCbaPaNM4GqLl
	NGk21pmbdKQlCKTx6z6P8DLVxvjfN1jrxBK5SCKTySTyIpkYy+K0ffmuNg3VElaykSRNpHmv
	j8ZO4bXShIU757oPTAmKUoQSLP95hbO4qvNw1w2sYpVIbSk8ml987THzH8/dVZ1oDq1Oa8tV
	sWhsJuCp6Rau07inXtYN3S+JHc9T9WSVIa2dC/6fw5+P3ZzlTa0xj+V0cHs0nyEqd8V8YN5d
	7r6+abi3WMU//fDmgE6wilcUnB0Y3fy4WRl4bXLT45BmugpefeNF7k/KGHTrhk+8YyvIE2/0
	vp/dQiy1ui7kgiKXsvItae2jX1cYoKdmpyTX69lBXY6Iar0ms7vxl6dfGlAeHFxzXNRhlcT4
	xpnB2do+xSj3UO+bNtPxkQA/p63iH7WZXNC7s+mH5dj52RpkYMixeZLE6JZ6QpyPmC3Ev8oc
	cWBDBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBIsWRmVeSWpSXmKPExsWy7bCSnK7X903pBtfXqVg8mLeNzWLN3nNM
	FvOPnGO1uHZjIbvFy1n32CzOn9/AbrHp8TVWi8u75rBZzDi/j8ni/54d7BbLT+1gceD2WDNv
	DaPHplWdbB6bl9R79G1ZxejxeZNcAGsUl01Kak5mWWqRvl0CV8a7TXcYC64JVXw6P5ulgbGd
	v4uRk0NCwERi9vPpTF2MXBxCArsZJU7vmckOkZCS6GjZwARhC0us/PecHaLoOaPElRfTwIrY
	BPQk1s86zQKSEBFoZZTYvWUyI4jDLPCFUaK1fTULRMs2JomHE7ewgLRwClhJXJ7yFqiKg0NY
	IEDiwB5pkDCLgKrEr/nnGUFsXgFLiVnH7rFC2IISJ2c+AWtlFtCW6H3YyghjL1v4mhniPAWJ
	n0+XgdWLCIRJHL23nBWiRlzi6M8e5gmMwrOQjJqFZNQsJKNmIWlZwMiyilEytaA4Nz232LDA
	KC+1XK84Mbe4NC9dLzk/dxMjOPK0tHYw7ln1Qe8QIxMH4yFGCQ5mJRHeQ10b0oV4UxIrq1KL
	8uOLSnNSiw8xSnOwKInzfnvdmyIkkJ5YkpqdmlqQWgSTZeLglGpgWlH685T9jffvn3A/Xv53
	s6uux95jvNa+oflzTP8fuytwI+dx2P+rTRueqCV8265cdKFq/814lZQAQ++a1f+LLv877FSx
	nHViQPSyn3sMLx+YNtfs2Z+Wu9XyyelL/viXc6wVDv+yevdnPtkn/JPFlk3eE7WnxXpG6g2e
	Fg/rsrCHljmbdVv1Dkj7PNGdMcOe22CKSb7c5d6g/mtvdr5KyVZ0M+xYLxDE5V7+Xuh97YGN
	fJOSwx+9vX7Pb930fwcWm1vePlHD4rzD5guzfa/n/AOLjirGNZacmpl8JT1vuuuh0s1/+vRs
	Wabc6vvlcSCs6/UBc4EFe352+FlOTDrxb4rR9d0sxZLsfFUnuRVnr1diKc5INNRiLipOBADT
	gpp+KwMAAA==
X-CMS-MailID: 20250217084602epcas5p14cfaa9303424d8d7b16d468192e0e61f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250108054224epcas5p399f3d734f8d9f82e5ae75d183d1a5344
References: <CGME20250108054224epcas5p399f3d734f8d9f82e5ae75d183d1a5344@epcas5p3.samsung.com>
	<20250108055012.1938530-1-dev.tailor@samsung.com>
	<006401db73d6$2af35fb0$80da1f10$@samsung.com> <Z5zPpz6WAbPJX701@bogus>
	<6d4d93a5-9a03-4cc3-9ef4-ab64562560f3@kernel.org>
	<090d01db77e8$8687db10$93979130$@samsung.com>

Hi Krzysztof,


> -----Original Message-----
> From: Alim Akhtar <alim.akhtar=40samsung.com>
> Sent: 05 February 2025 21:41
> To: 'Krzysztof Kozlowski' <krzk=40kernel.org>; 'Sudeep Holla'
> <sudeep.holla=40arm.com>
> Cc: 'Devang Tailor' <dev.tailor=40samsung.com>; robh=40kernel.org;
> krzk+dt=40kernel.org; conor+dt=40kernel.org; devicetree=40vger.kernel.org=
; linux-
> arm-kernel=40lists.infradead.org; linux-samsung-soc=40vger.kernel.org; li=
nux-
> kernel=40vger.kernel.org; faraz.ata=40samsung.com
> Subject: RE: =5BPATCH v2=5D arm64: dts: add cpu cache information to Exyn=
osAuto-
> v920
>=20
> Hi Krzysztof
>=20
> > -----Original Message-----
> > From: Krzysztof Kozlowski <krzk=40kernel.org>
> > Sent: Wednesday, February 5, 2025 9:22 PM
> > To: Sudeep Holla <sudeep.holla=40arm.com>; Alim Akhtar
> > <alim.akhtar=40samsung.com>
> > Cc: 'Devang Tailor' <dev.tailor=40samsung.com>; robh=40kernel.org;
> > krzk+dt=40kernel.org; conor+dt=40kernel.org; devicetree=40vger.kernel.o=
rg;
> > linux-arm-kernel=40lists.infradead.org;
> > linux-samsung-soc=40vger.kernel.org;
> > linux-kernel=40vger.kernel.org; faraz.ata=40samsung.com
> > Subject: Re: =5BPATCH v2=5D arm64: dts: add cpu cache information to
> > ExynosAuto-v920
> >
> > On 31/01/2025 14:27, Sudeep Holla wrote:
> > >>>
> > >> =5Bsnip=5D
> > >>  > +		l3_cache_cl0: l3-cache0 =7B
> > >> You can add one node for cl0 and cl1, say =22l3_cache_cl0_cl1=22 and
> > >> Remove the specific node for CL1, because both are same.
> > >>
> > >
> > > What do you mean by =22both are same=22 ?
> > > Do you mean both have exact same properties but are physically
> > > different caches ? OR Do you mean it is just one shared cache ?
> > >
> > > If former, we still need distinct node to get the cacheinfo about
> > > shareability correct. If this is about avoiding duplication of
> > > errors, you can probably define some macro and avoid it, but we need
> > > 2 nodes in the devicetree.
> > >
> > > If latter, you suggestion is correct.
> >
> > No answers here, so I drop this patch from my queue.
> >
> It took sometime to get the confirmation internally (because of new year
> holiday) Just replied to Sudeep. It will be great if you can consider thi=
s patch
> for this cycle.
> Thanks=21
>=20
Is there anything else need to be done for this patch or do you suggest me =
to re-send this patch again?

> > Best regards,
> > Krzysztof


