Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F9BC33FD
	for <linux-samsung-soc@vger.kernel.org>; Thu, 17 Apr 2025 09:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744881456; cv=none; b=H4KctTJP1rIr76Ah11A/C1bS69QAE9jO9LaFYhXUrq5pqdGWM348Y8EJfr3mTKPaGuploQERpjB+zSA9GWjzVFODbodla70dz0Pi4NiCmq/5BXHGnDG56dNsbgPslkdX2Kds5zj5kqdhzlpdrpBgYvk0k1sq07JtQQQjwkMfq6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744881456; c=relaxed/simple;
	bh=xJIneGHQFK1SKyGaskC9aNAvjinoc3j1fHHRtqNl3Sw=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=ZODxlS/1BN56RlRdXkKLy5RcdW8dd3HW+QBLZmqb5HtTn0Ane/3em1QsS7I4bM8lIR0Tbof5xBSC/8fNQbENYnN1YAuv60Iuqyce6PXGmp7QRc+AsFHcaZdpf/ZqdAyCr7ugodRf8U2jPyV9AAdqq52AtK1PUfD7cynTigAhxpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=tXvJB1hL; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="tXvJB1hL"
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250417091732epoutp0403eaecce553ed17006d6f909e9cbc0e6~3EG_ZGAPv3196331963epoutp04f
	for <linux-samsung-soc@vger.kernel.org>; Thu, 17 Apr 2025 09:17:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250417091732epoutp0403eaecce553ed17006d6f909e9cbc0e6~3EG_ZGAPv3196331963epoutp04f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1744881452;
	bh=vTGzoo+jwwIa4vhDbzzqp28Av2O/B79ZMnl3txb9+EI=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=tXvJB1hL+77XVy6X4oCeju6K2EfekGSn/Bqg5dh5W4I74VERLz3kwrCmlDeme2wn7
	 bSTHRJu2ebzLk0nG/Cb1PjR0xKGAoOhBBsIDrfzMIwgsBM/9zrrksrK2urA/wvh+pn
	 chijUJzsMMo6+01WoKKN3yc+5kVeuRrF7rmh/EAY=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250417091731epcas5p30f62b25725ddc0e7d1bb574d56365a6a~3EG9_eMkR2653126531epcas5p3-;
	Thu, 17 Apr 2025 09:17:31 +0000 (GMT)
Received: from epsmgec5p1-new.samsung.com (unknown [182.195.38.181]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4ZdXNT27w6z6B9m4; Thu, 17 Apr
	2025 09:17:29 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
	epsmgec5p1-new.samsung.com (Symantec Messaging Gateway) with SMTP id
	07.80.19608.927C0086; Thu, 17 Apr 2025 18:17:29 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250417050330epcas5p296757d6cf79352bfdbcd38695c6f8f3d~3ApLjNhDf2151521515epcas5p2V;
	Thu, 17 Apr 2025 05:03:30 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250417050330epsmtrp2bba4a97f42c7d4047c8ae4e36902ae5c~3ApLieM6h2966829668epsmtrp2J;
	Thu, 17 Apr 2025 05:03:30 +0000 (GMT)
X-AuditID: b6c32a50-225fa70000004c98-87-6800c7296980
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	23.F0.19478.2AB80086; Thu, 17 Apr 2025 14:03:30 +0900 (KST)
Received: from INBRO000519 (unknown [107.122.1.150]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250417050328epsmtip129419b78204c6004c161bfd7be41e3d4~3ApJ0Oo7E3037630376epsmtip1j;
	Thu, 17 Apr 2025 05:03:28 +0000 (GMT)
From: "Faraz Ata" <faraz.ata@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, <alim.akhtar@samsung.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
Cc: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<rosa.pila@samsung.com>, <dev.tailor@samsung.com>,
	<suyash.bitti@samsung.com>
In-Reply-To: <a52969f2-8ea2-41e5-b4c8-8a03220cbf51@kernel.org>
Subject: RE: [PATCH v2] arm64: dts: exynos: Add DT node for all UART ports
Date: Thu, 17 Apr 2025 10:33:12 +0530
Message-ID: <06b501dbaf56$0fab3b90$2f01b2b0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIiLJ9Qel8GAkpX5i6PIbvAaC3kAAM/bP3AAeJrQQMCHSEhZgHUtyXcstGu3fA=
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrFJsWRmVeSWpSXmKPExsWy7bCmuq7mcYYMg99TuC0ezNvGZrFm7zkm
	i3s7lrFbzD9yjtXi5ax7bBbnz29gt9j0+BqrxeVdc9gsZpzfx2Txf88OdosvPx8wW8yeX+PA
	47FpVSebx+Yl9R59W1YxenzeJBfAEpVtk5GamJJapJCal5yfkpmXbqvkHRzvHG9qZmCoa2hp
	Ya6kkJeYm2qr5OIToOuWmQN0mJJCWWJOKVAoILG4WEnfzqYov7QkVSEjv7jEVim1ICWnwKRA
	rzgxt7g0L10vL7XEytDAwMgUqDAhO2PhXe2CLv6KZ6tfMTcwLuPpYuTkkBAwkWhbeouti5GL
	Q0hgD6NEx/U9bCAJIYFPjBLd06ohEkD2lr17mGA6Jl/fyAxRtJNRYsblWIiil4wSx44cYAVJ
	sAloStz5/JQJJCEi0MUosfPBZFYQh1ngEaPEgU//WECqOAXsJH70/WIHsYUFvCT6mm4xdjFy
	cLAIqEq8644ECfMKWEpM27aPCcIWlDg58wlYK7OAtsSyha+ZIS5SkPj5dBkrSKuIgJ/Evc1u
	ECXiEi+PHmGHKFnLIXHqVCqE7SLxa8J9VghbWOLV8S1QNVISn9/tZYOwfSQmH/0Gdo2EQIbE
	nbUiEGF7idULzoBtYgZ6cf0ufYiwrMTUU+uYILbySfT+fgINKl6JHfNgbGWJk3v2QG2VlDh0
	+wXrBEalWUj+moXkr1lIHpiFsG0BI8sqRqnUguLc9NRk0wJD3bzUcnhsJ+fnbmIEJ1qtgB2M
	qzf81TvEyMTBeIhRgoNZSYT3nPm/dCHelMTKqtSi/Pii0pzU4kOMpsDAnsgsJZqcD0z1eSXx
	hiaWBiZmZmYmlsZmhkrivM07W9KFBNITS1KzU1MLUotg+pg4OKUamPJCq5Uc+os8XKL15J2m
	RxjfKlCrkDg656VmhMBl/YdBb0qtepNMQxy+LM89LWa99z5H69Lvv+utlod4Tk20ftmxcuPu
	C4/ez2ZeqtzcEnyYp0Jrs3r6S1kuW73yyM9T1rCV8UxTtF8vq9tqoTo/Z/1NsWkPVp184xl0
	S/HT7/ysmPz5WZxCUy+GR34U/Jcgvr4uSTJlblRN2rtpkfIq12zzFqwtbxXfYm40/fKRP7v8
	75lvb/C6WaGz/s7nDxm15jzWIiLPIr4u6ejgfLXBtGx2XsfutVOrOBd88G9T/c7mERvvufxk
	+EOR8xc1eFc//a3Vc3t2fFXslD9Lrv6QPlq1agnbipwawTNuNcFnlViKMxINtZiLihMBpqyx
	sj0EAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprEIsWRmVeSWpSXmKPExsWy7bCSnO6iboYMg7nTxS0ezNvGZrFm7zkm
	i3s7lrFbzD9yjtXi5ax7bBbnz29gt9j0+BqrxeVdc9gsZpzfx2Txf88OdosvPx8wW8yeX+PA
	47FpVSebx+Yl9R59W1YxenzeJBfAEsVlk5Kak1mWWqRvl8CVseLkKqaCD3wV079/Z25gbOHp
	YuTkkBAwkZh8fSNzFyMXh5DAdkaJpubrTBAJSYnDT++yQtjCEiv/PWeHKHrOKPH5xjJmkASb
	gKbEnc9PmUASIgITGCWmbNkI5jALvGCUeLLgBCtEywImiaWH1oLN5RSwk/jR94sdxBYW8JLo
	a7rF2MXIwcEioCrxrjsSJMwrYCkxbds+JghbUOLkzCcsIDazgLbE05tP4exlC18zQ5ynIPHz
	6TJWkDEiAn4S9za7QZSIS7w8eoR9AqPwLCSTZiGZNAvJpFlIWhYwsqxiFE0tKM5Nz00uMNQr
	TswtLs1L10vOz93ECI42raAdjMvW/9U7xMjEwXiIUYKDWUmE95z5v3Qh3pTEyqrUovz4otKc
	1OJDjNIcLErivMo5nSlCAumJJanZqakFqUUwWSYOTqkGJpeEmylPJjp/fr8+/qvY9qzX3m7e
	l1lDJGPaf7685/v2lcC3XXd/Hq/+NuFUtMti4xcrJ519+qOj5GWZxgGNpIVaRoFPjDtXbNaZ
	6lrUfdA66XKceqTGXZWSU8kC9eXbXprExBi4hBVkb5T0fCgvdCy3V3GG2Px2z/aEvTzy05sv
	buxfGXH2YKn9zDVK1fa8Pm7nt5QK/z9ZNStsX4bY89CP3DPfLF9Umfv/kFnQqzw2Z9njlpaB
	jKsYepd/+CjSrRSfslfjvPyxw4YngzgZRR3fR1Z/SZham+ry+Grk7No/xo63NmldcRZeJCTD
	E7D6SCnD6j03NdiTVfbteZZqLb0jYOLt6r1rFCYXZ9blK7EUZyQaajEXFScCALtXOuclAwAA
X-CMS-MailID: 20250417050330epcas5p296757d6cf79352bfdbcd38695c6f8f3d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250318074801epcas5p3de68627a3e64ebc2a95ed33a3f485e80
References: <CGME20250318074801epcas5p3de68627a3e64ebc2a95ed33a3f485e80@epcas5p3.samsung.com>
	<20250318075635.3372599-1-faraz.ata@samsung.com>
	<befe7d30-1727-4540-9072-f21ef96ea504@kernel.org>
	<03e501dbaab0$65bb47a0$3131d6e0$@samsung.com>
	<a52969f2-8ea2-41e5-b4c8-8a03220cbf51@kernel.org>

Hello Krzysztof

> -----Original Message-----
> From: Krzysztof Kozlowski <krzk=40kernel.org>
> Sent: Saturday, April 12, 2025 3:41 PM
> To: Faraz Ata <faraz.ata=40samsung.com>; alim.akhtar=40samsung.com;
> robh=40kernel.org; krzk+dt=40kernel.org; conor+dt=40kernel.org
> Cc: devicetree=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org;=
 linux-
> samsung-soc=40vger.kernel.org; linux-kernel=40vger.kernel.org;
> rosa.pila=40samsung.com; dev.tailor=40samsung.com;
> suyash.bitti=40samsung.com
> Subject: Re: =5BPATCH v2=5D arm64: dts: exynos: Add DT node for all UART =
ports
>=20
> On 11/04/2025 09:07, Faraz Ata wrote:
> > Hello Krzysztof
> >
> >> Subject: Re: =5BPATCH v2=5D arm64: dts: exynos: Add DT node for all UA=
RT
> >> ports
> >>
> >> On 18/03/2025 08:56, Faraz Ata wrote:
> >>> +
> >>> +		usi_17: usi=4010d800c0 =7B
> >>
> >> Messed order. Keep nodes sorted by unit address (see DTS coding style)=
.
> >>
> >>
> > Thanks for your review
> > Based on the DTS coding style, it is acceptable to group nodes of the
> > same type together, even if it breaks the unit address ordering.
>=20
> That's accepted alternative because some subsystems do that way. I don't
> think we ever applied such rule to Samsung? Do you have any prior
> reference about this? I accepted mess in the past, but that does not mean
> that mess is the rule.
>=20
> > https://docs.kernel.org/6.12/devicetree/bindings/dts-coding-style.html
> > Please let me know your opinion on this.
> > Do you mean I should move all the USI_ node after pwm node?
>=20
> Please it according to sorting by unit address.
>=20
USI is spread across two blocks BLK_PERIC0 and BLK_PERIC1,
USI00 to USI08 fall under BLK_PERIC0
USI09 to USI17 fall under BLK_PERIC1.
Will send another version with USI nodes sorted by unit address with respec=
t to BLK_PERIC0 and BLK_PERIC1.
>=20
> Best regards,
> Krzysztof

