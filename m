Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CBD21DB344
	for <linux-samsung-soc@vger.kernel.org>; Mon,  6 Jan 2025 10:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736160256; cv=none; b=XPuSWXp/YduhtO9kMiuORRN1OY/QIFPuRunGidcsKHhABbv2DzheyoCPqeqn4UzVc2AR3RO8rFyEw1OaOoNwkEcZfGMcibfMVt8/HM4qjyC2AjjqHVTzKz3joKKwwWYKb5nBsEQlJitN+WXYleb/6vtSiDjJsk/djVPb42TS5Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736160256; c=relaxed/simple;
	bh=6J5ikzh+H3UyKO6zXkSNOAUoY1MAsvhu8zrJP0ax9Oo=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=FLgIKwXZhPQgx1h8F4o7v8myA/QLuxFDRf6CyhywRHPl7aijCQqlMTr9beq32jmSa4kB0Qg5xJuJC65VbK3pAm81iHn9RfHeA9H87b95SXHwVf4jbpZ1H99xOESt//YsQc/EKXMHrwWaZu3tS3HLfNPt9fyf+xmN+3LyTUtzOzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=c5Zr7ANf; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="c5Zr7ANf"
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250106104411epoutp02f0fcbd8b2b34315399d32712116c8391~YFIy_0Ul71235712357epoutp02S
	for <linux-samsung-soc@vger.kernel.org>; Mon,  6 Jan 2025 10:44:11 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250106104411epoutp02f0fcbd8b2b34315399d32712116c8391~YFIy_0Ul71235712357epoutp02S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1736160251;
	bh=e4BWUIt3a4alaSoTXNXzqXSXLt8Vt2F6N6a2ZBMyhV4=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=c5Zr7ANfj1yOU1qeS/TduXEP7vPJFL35/F/8/KtFVjOSrrnCA7eukptdb54s6po9m
	 3fHstAS7cBCCfvVryOhLln+ZlS7BvbDERENLnVxtJwD+vU4A/JdHCNZdAcLjMiFDtZ
	 xgGcfWG/u9wFMsLIwlzq5vDKZ6af3l34ckjn8tA4=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTP id
	20250106104410epcas5p4cfe0087b625560f80848be4a3d93de15~YFIyjaeep0853608536epcas5p4D;
	Mon,  6 Jan 2025 10:44:10 +0000 (GMT)
Received: from epsmgec5p1-new.samsung.com (unknown [182.195.38.175]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4YRW544gb5z4x9Pr; Mon,  6 Jan
	2025 10:44:08 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
	epsmgec5p1-new.samsung.com (Symantec Messaging Gateway) with SMTP id
	1D.E1.29212.8F3BB776; Mon,  6 Jan 2025 19:44:08 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250106083954epcas5p302dfe186ca6cba248c4cfe1f8d5d4d7c~YDcSYVt7A2557925579epcas5p3G;
	Mon,  6 Jan 2025 08:39:54 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250106083954epsmtrp187144d38e5066499442d46dc618cc7e9~YDcSXqtOH2380823808epsmtrp11;
	Mon,  6 Jan 2025 08:39:54 +0000 (GMT)
X-AuditID: b6c32a50-7ebff7000000721c-f1-677bb3f8f03d
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	BD.05.18729.AD69B776; Mon,  6 Jan 2025 17:39:54 +0900 (KST)
Received: from INBRO002520 (unknown [107.122.1.191]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250106083952epsmtip20e19c1ee60d6524a417d87cd4c7e7184~YDcQ7MF982695726957epsmtip2O;
	Mon,  6 Jan 2025 08:39:52 +0000 (GMT)
From: "Devang Tailor" <dev.tailor@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, <alim.akhtar@samsung.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
Cc: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "'Faraz
 Ata'" <faraz.ata@samsung.com>
In-Reply-To: <743d9eb4-a7ee-4ce7-91a8-52ddcd353bb2@kernel.org>
Subject: RE: [PATCH] arm64: dts: add cpu cache information to
 ExynosAuto-v920
Date: Mon, 6 Jan 2025 14:09:51 +0530
Message-ID: <022701db6016$8ef576c0$ace06440$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-in
Thread-Index: AQI/83o4x5VwoT348NLsA2YEs8clgwJT+GhSAnZHXs+yGfJmkA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKJsWRmVeSWpSXmKPExsWy7bCmpu6PzdXpBmcnKFo8mLeNzWLN3nNM
	FvOPnGO1uHZjIbvFy1n32CzOn9/AbrHp8TVWi8u75rBZzDi/j8ni/54d7A5cHptWdbJ5bF5S
	79G3ZRWjx+dNcgEsUdk2GamJKalFCql5yfkpmXnptkrewfHO8aZmBoa6hpYW5koKeYm5qbZK
	Lj4Bum6ZOUD3KCmUJeaUAoUCEouLlfTtbIryS0tSFTLyi0tslVILUnIKTAr0ihNzi0vz0vXy
	UkusDA0MjEyBChOyM1YfmchWcJmzYvG/M2wNjK/Zuxg5OSQETCSeT5gIZHNxCAnsYZQ4vaWZ
	FcL5xChxbspGNgjnG6NE29n7rDAt7xacgkrsZZS4tvQYM0hCSOAlo8TP4xwgNpuAnsT6WadZ
	QIpEBLoYJXY+mAw2l1lgB6PE0z0v2ECqOAXsJLqbPzF1MXJwCAv4S2xaow4SZhFQkXiw9S0j
	iM0rYClx5sl1ZghbUOLkzCcsIDazgLbEsoWvmSEuUpD4+XQZK0RcXOLozx6wuIiAk8T9+UvA
	LpUQWMohsfz6QzaIBheJQy9mQUNAWOLV8S1QtpTEy/42KDtf4suhXVALciTWv5oBFbeXWL3g
	DCvIzcwCmhLrd+lDhGUlpp5axwRxA59E7+8nTBBxXokd856AvSgB9Nf775Ywm17c28M0gVFp
	FpLPZiH5bBaSb2YhLFvAyLKKUSq1oDg3PTXZtMBQNy+1HB7jyfm5mxjB6VUrYAfj6g1/9Q4x
	MnEwHmKU4GBWEuHN0qhMF+JNSaysSi3Kjy8qzUktPsRoCgzvicxSosn5wASfVxJvaGJpYGJm
	ZmZiaWxmqCTO+7p1boqQQHpiSWp2ampBahFMHxMHp1QDE0dq/d9j3xXy/d1k18xYxL3d9KBy
	5e1YplPGf48dPvNWPTxd7s2FxskTL78ze3fj7uEL2qtfMa9Ot9x4dmWW+szJ+1TEQuYxH2pc
	803SJTLC/f/XNhbr1Z8m7vkkPWMx+2Ltkg6dF+UC/9tnCdyZHpzy5n/VWhn59lXa8yMc+DdM
	3W72rPukRu3HrR4efTO0H87feX2FNx/Hwcn3hVkfxXiedvwjx+xxLNt3u8mVz2ZzawWWKEe9
	SvHuKJA1Eq0qf549gy9/x2mmy6/j5/JbvDOpSqk4nb30idp3qcOlutzyP7dyCMo6/LSKqwqu
	2nLgI1+/5sxVcVqH/pw6fcdD+l3/uvYbjN8i+ILtHGpCTyqxFGckGmoxFxUnAgD3FRG9OAQA
	AA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupnkeLIzCtJLcpLzFFi42LZdlhJXvfWtOp0g78/BC0ezNvGZrFm7zkm
	i/lHzrFaXLuxkN3i5ax7bBbnz29gt9j0+BqrxeVdc9gsZpzfx2Txf88Odgcuj02rOtk8Ni+p
	9+jbsorR4/MmuQCWKC6blNSczLLUIn27BK6Mjj/TmAvmc1ZMPbWWtYFxO3sXIyeHhICJxLsF
	p9i6GLk4hAR2M0osP3iaBSIhJdHRsoEJwhaWWPnvOTtE0XNGiftL9zCCJNgE9CTWzwJp4OIQ
	EZjAKDFly0YmEIdZYA+jxInjd5ghWg4wSlyefZYVpIVTwE6iu/kT2FxhAV+Jr10NYDaLgIrE
	g61vwcbyClhKnHlynRnCFpQ4OfMJ2E3MAtoSvQ9bGWHsZQtfM0PcpyDx8+kyVoi4uMTRnz1g
	cREBJ4n785ewTWAUnoVk1Cwko2YhGTULSfsCRpZVjJKpBcW56bnFhgWGeanlesWJucWleel6
	yfm5mxjBcaaluYNx+6oPeocYmTgYDzFKcDArifBmaVSmC/GmJFZWpRblxxeV5qQWH2KU5mBR
	EucVf9GbIiSQnliSmp2aWpBaBJNl4uCUamDaNa22UW9a5paslU4drw+WaibPf3RS9wqriOFH
	pidtSbNfXrB4enZnyNqOf11iApbGKx45TU7QVPtxUkT6jfIh7198rZOjJzQtPVTT/PlJ6xUX
	znnXnh2x0Z73dNGdH//FnzxZnljmLvNguwPb2yS7R0feX9JfsH6Ow/G06p18npoi2bwcTfOv
	yf+NLvaNXqMh/rBiivuNKUv5V3/yKBCy1ZrgvHwLg+5HKcU3Wwsd46WMU82ar8/5ffxFuPaK
	4n/SL4s1762ZrH/q3q5Jq9O9P8rUyLw7mnVWoOfLtrPBx/fq9YYvPaZrZ1F3Zu8cgTCjp4zv
	TJWO2YT0dz1wtf748GDbz0Rpp5UvWUOd7mdaK7EUZyQaajEXFScCACvltpQiAwAA
X-CMS-MailID: 20250106083954epcas5p302dfe186ca6cba248c4cfe1f8d5d4d7c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241231063730epcas5p4137cc2e3d805cb08e1675b056ef186dc
References: <CGME20241231063730epcas5p4137cc2e3d805cb08e1675b056ef186dc@epcas5p4.samsung.com>
	<20241231064350.523713-1-dev.tailor@samsung.com>
	<743d9eb4-a7ee-4ce7-91a8-52ddcd353bb2@kernel.org>

Hi krzysztof,


-----Original Message-----
From: Krzysztof Kozlowski <krzk=40kernel.org>=20
Sent: 31 December 2024 13:13
To: Devang Tailor <dev.tailor=40samsung.com>; alim.akhtar=40samsung.com; ro=
bh=40kernel.org; krzk+dt=40kernel.org; conor+dt=40kernel.org
Cc: devicetree=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org; l=
inux-samsung-soc=40vger.kernel.org; linux-kernel=40vger.kernel.org
Subject: Re: =5BPATCH=5D arm64: dts: add cpu cache information to ExynosAut=
o-v920

On 31/12/2024 07:43, Devang Tailor wrote:
> =20
>  		cpu9: cpu=4020100 =7B
> =40=40 -152,6 +215,22 =40=40 cpu9: cpu=4020100 =7B
>  			compatible =3D =22arm,cortex-a78ae=22;
>  			reg =3D <0x0 0x20100>;
>  			enable-method =3D =22psci=22;
> +			i-cache-size =3D <0x10000>;
> +			i-cache-line-size =3D <64>;
> +			i-cache-sets =3D <256>;
> +			d-cache-size =3D <0x10000>;
> +			d-cache-line-size =3D <64>;
> +			d-cache-sets =3D <256>;
> +			next-level-cache =3D <&cpu_l2>;
> +		=7D;
> +
> +		cpu_l2: l2-cache0 =7B

Are there more l2-caches? '0' suggests that, so please add nodes for all of=
 them.
>
Thank you Krzysztof for your review. I will update other caches in v2 patch=
.


Best regards,
Krzysztof

