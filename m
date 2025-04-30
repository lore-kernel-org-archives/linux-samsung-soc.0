Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583DC23A99F
	for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Apr 2025 10:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746008736; cv=none; b=VsHGpKlo9NEmZV87lS4ikFbdvz46/9jym+t1ESbXseeXKKzi9pC7VESn/U5gpyKVof4YneCokuvf000bvdd4l0Wo3xj7VsBQcFRFIZ5nCMi01jIcCvjk+lORc7OhdhnnZsCKUgLu1fbLD7GnqGw+lecdMYVk0wz6CRWFjJvH7CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746008736; c=relaxed/simple;
	bh=UyRogJQCKF4dzNdKeUnXZgi87K+PLm5TUetHnPxcySQ=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=Jpxncn4WlBTfWSqUpw6C+nnbjlW3CPUoGaI62RcgiayxMVuIzOKXm9ci3VwMqk7r2pruGqVe9x6o5mEEB7I2TIq71wcpDUYAYWIlO6goqEgBd6w2uy5jqZ4DZJXfekQ8UiknhwtZUXhrSDK9bIswXDnBp1/3iWtHVb4wLxOY7NE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=KhsoNhpX; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="KhsoNhpX"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250430102531epoutp01819e59df9870fa3bea51a3c423af76db~7EbDkOtSc1070810708epoutp01B
	for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Apr 2025 10:25:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250430102531epoutp01819e59df9870fa3bea51a3c423af76db~7EbDkOtSc1070810708epoutp01B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1746008732;
	bh=UyRogJQCKF4dzNdKeUnXZgi87K+PLm5TUetHnPxcySQ=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=KhsoNhpX8FdZd1Zp+syN1TSiScguoqd/YK6aVQZH/yuwxDfhDGvP5NeKYK4IrxnU7
	 uAr0Gj4vYJxRKlkzqUNn194gvVo4OYj1Ibtu2Ju/xECmR7SSbFFn5nfM3mJvpdy3Rq
	 6q6uiMHfV5SFkFPUM3UPK0cMhkd1L9tkM3cOWdzw=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250430102531epcas5p159f5edae7b9d6649b91ba016fd8580cf~7EbDDY--c1745817458epcas5p1B;
	Wed, 30 Apr 2025 10:25:31 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.180]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4ZnYGy28rYz6B9m9; Wed, 30 Apr
	2025 10:25:30 +0000 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250430092538epcas5p1b6aee888ecfa27c04e01ca16a0a93d19~7DmwiV8Qt0647906479epcas5p1S;
	Wed, 30 Apr 2025 09:25:38 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250430092538epsmtrp1e08dff0c1eac600a72115669d75dc488~7Dmwhcsq62304923049epsmtrp1Z;
	Wed, 30 Apr 2025 09:25:38 +0000 (GMT)
X-AuditID: b6c32a2a-d57fe70000002265-56-6811ec9127c4
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	C5.75.08805.19CE1186; Wed, 30 Apr 2025 18:25:37 +0900 (KST)
Received: from INBRO002053 (unknown [107.122.2.234]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250430092535epsmtip23755164dfc0ad1aef32e04bca5476327~7DmueEaSD2671426714epsmtip25;
	Wed, 30 Apr 2025 09:25:35 +0000 (GMT)
From: "Yashwant Varur" <yashwant.v@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <alim.akhtar@samsung.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Cc: <cs0617.lee@samsung.com>, <g.naidu@samsung.com>,
	<niyas.ahmed@samsung.com>
In-Reply-To: <b00514f2-55ca-49f0-aefb-ec1e784545d6@kernel.org>
Subject: RE: [PATCH] arm64: dts: exynos: Added the ethernet pin
 configuration
Date: Wed, 30 Apr 2025 14:55:34 +0530
Message-ID: <0f6e01dbb9b1$d52519d0$7f6f4d70$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQI+tP5AvR0g22A5T67WLyfPVk3CYgKkYErqAxsAxq0DRO6qzAIlGw2ospyhojA=
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprKIsWRmVeSWpSXmKPExsWy7bCSvO7EN4IZBt1vrCwezNvGZrFm7zkm
	i1XveC3mHznHarFl5mVmi5ez7rFZnD+/gd1i0+NrrBaXd81hs5hxfh+TxZMpj1gt/u/Zwe7A
	47FpVSebx+Yl9R59W1YxenzeJBfAEsVlk5Kak1mWWqRvl8CV8bWpm7lgHX/F1EuzGRsYd/J0
	MXJySAiYSFz9v4eli5GLQ0hgN6PEnkdL2LsYOYASUhINb8IhaoQlVv57zg5R85xRYvOuY6wg
	CTYBfYnnm68xgSREBBYzSXxpOsgG0swsECTxZXcgRMNcJon9xzewgTRwCthJfOp+CNYsLOAr
	sbvjDDuIzSKgKjH71HFmEJtXwFJi9+p+KFtQ4uTMJywgNrOAtsTTm0/h7GULXzNDXKcg8fPp
	MrCZIgJ+Epf+zmeFqBGXeHn0CPsERuFZSEbNQjJqFpJRs5C0LGBkWcUomVpQnJueW2xYYJSX
	Wq5XnJhbXJqXrpecn7uJERxzWlo7GPes+qB3iJGJg/EQowQHs5II76RbghlCvCmJlVWpRfnx
	RaU5qcWHGKU5WJTEeb+97k0REkhPLEnNTk0tSC2CyTJxcEo1MHHvsVtVs3H+JFVlKfE9cezl
	UiffhOy5+PfKqTmeuuyWB/N4yrhT3tzL4i3PPdm6L8v/q+7+a2wfTW2q9kpvYzz+qDjCSiJr
	elDSXW3mjdyW278/vbVsa627kQXDgifWcr8fxu9YOmP+Y9O3ko/uRzj4HJ8gt0lQPsT80AWT
	vo9bHHae3uS0pjC3/I+Z5ypOeRNtrX7O4wZP+aX0P9+/x1JRVvCMr1VV9FC09nXdbclfu9NO
	OEenB2qtidm3XfBJ4LlusxNMjsIrXPo1shWyNcJucUs1Td2ztf7azZczbpz75fPfd9fdv60C
	hYvY/kdm/5eUFOGVfpIuKCn07UmgQeCz0wudVnw84aQ27x+LvBJLcUaioRZzUXEiAE0w33oo
	AwAA
X-CMS-MailID: 20250430092538epcas5p1b6aee888ecfa27c04e01ca16a0a93d19
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250423060042epcas5p2c04be779e21089f33b8a9a7785bb151a
References: <CGME20250423060042epcas5p2c04be779e21089f33b8a9a7785bb151a@epcas5p2.samsung.com>
	<20250423060034.973-1-yashwant.v@samsung.com>
	<73a5d0a6-ceb0-4c47-9992-260828f074d0@kernel.org>
	<0ed501dbb8e9$45aa96e0$d0ffc4a0$@samsung.com>
	<b00514f2-55ca-49f0-aefb-ec1e784545d6@kernel.org>

Hi Krzysztof

> -----Original Message-----
> From: Krzysztof Kozlowski <krzk=40kernel.org>
> Sent: Tuesday, April 29, 2025 6:37 PM
> To: Yashwant Varur <yashwant.v=40samsung.com>; robh=40kernel.org;
> krzk+dt=40kernel.org; conor+dt=40kernel.org; alim.akhtar=40samsung.com;
> devicetree=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org; lin=
ux-
> samsung-soc=40vger.kernel.org; linux-kernel=40vger.kernel.org
> Cc: cs0617.lee=40samsung.com; g.naidu=40samsung.com;
> niyas.ahmed=40samsung.com
> Subject: Re: =5BPATCH=5D arm64: dts: exynos: Added the ethernet pin confi=
guration
>=20
> On 29/04/2025 11:29, Yashwant Varur wrote:
> >
> > Please follow DTS coding style carefully. This applies to all commits y=
ou try to
> send from your downstream/vendor code.
>=20
>=20
> hm?
>=20
Got the issue, coding style says
Node and property names can use only the following characters:
Lowercase characters: =5Ba-z=5D
Digits: =5B0-9=5D
Dash: -
I was using underscore for node name.
> >>
> > Sure, thanks
> >
> > What is more important, I don't really understand why you are doing
> > this
> > - there is no user of these entries - and commit msg does not help here=
.
> >>
> > Understood, in v2 will add the Ethernet node as well.
>=20
> I don't understand what is your reply here and what is quote. Use standar=
d email
> style, not some mySingle or Outlook output. I suggest reading typical gui=
delines
> how to use email based workflows (kernel also has one).
>=20

Looks like mailer was not configured properly, hope this time it is fine.
I am working on upstreaming Ethernet driver for exynosauto (which has a var=
iant of STMMAC controller)
What I wanted to reply previously was, will add pin control, along with Eth=
ernet node(which will consume the pincontrol) and
I realize that first dt-binding should go for this IP.
My plan is to send Ethernet driver along with Ethernet dtsi node as well.

>=20
> Best regards,
> Krzysztof

