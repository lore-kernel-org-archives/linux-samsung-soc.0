Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E98D156F5D
	for <linux-samsung-soc@vger.kernel.org>; Sat, 10 May 2025 02:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746843728; cv=none; b=kGMf6wnm2dcrzN8horZMn+slpOy4t+nOzbWYYwalIopyllSIcrXPEalY0Y9P8FQX5SyDnQx5ptoVfLNp0pEjOWUB1NL3cpVH3Pc7nxl/4J2gcyay/E2B8m802HN/33dq+ocEJodTk5sRBS+ctKUHXspwEadEgr2iI/+5WnM/naQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746843728; c=relaxed/simple;
	bh=AJWm5NflpN0cmYppv5aiEqionmNqZLJJVF4S64fuxdw=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=gZxScUa7S+zojZce9yan096ciWPe9ox4X5RO5U4v7zSTF68jhl7zGJuKmVh2Gtjq0NXtS5HIIGF5AcUox8y+vaXdKFZEubER/hBo/T/GWlmHxnGWNFLqoymyUVeu9HRdmMBcqyW+q0hbU1LOOEULp7iCgY1bwkY3EWMA9dzHOjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=QR2qHFb/; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="QR2qHFb/"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250510022203epoutp044c4e5a6ee87a9862c7f3c668670eb767~_CRx1nZDa3094330943epoutp04c
	for <linux-samsung-soc@vger.kernel.org>; Sat, 10 May 2025 02:22:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250510022203epoutp044c4e5a6ee87a9862c7f3c668670eb767~_CRx1nZDa3094330943epoutp04c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1746843723;
	bh=6fvB2w7pntC+re0S0bjBBtAy6pYze67QvcaIBSYlhrs=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=QR2qHFb/OOGP4sjNHL27gnNpR9YTG+35QpZNHIQ0jFzRAZK9aBYskzEtOe/srIkl/
	 oTLwGH+0wbtHnqRhQcBoAfWpm9DD/DA4mR+Vm+aKBvr7BesFXZSJlXjVxYyeGx5Xv+
	 fYPv0lqOMDW4y2cNIvJzVSahJ/Ln/HeG3SB9qFgQ=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250510022202epcas5p160136d1a90dfba1044701aef0fc4c7ca~_CRxVC3Pj0493104931epcas5p1o;
	Sat, 10 May 2025 02:22:02 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.179]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4ZvV4S4xm8z3hhT7; Sat, 10 May
	2025 02:22:00 +0000 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250510022159epcas5p17fc37a384a4fc1dead464127dae045cb~_CRud99EZ1388513885epcas5p1H;
	Sat, 10 May 2025 02:21:59 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250510022159epsmtrp1b414b94448e409179f62883fb5230168~_CRudQHyy0294502945epsmtrp1N;
	Sat, 10 May 2025 02:21:59 +0000 (GMT)
X-AuditID: b6c32a52-40bff70000004c16-2e-681eb8475743
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	D5.60.19478.748BE186; Sat, 10 May 2025 11:21:59 +0900 (KST)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250510022157epsmtip1cd776d297a219c4adce69d5d2c5d912e~_CRsXlj_u1125011250epsmtip1Q;
	Sat, 10 May 2025 02:21:57 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Raghav Sharma'" <raghav.s@samsung.com>, <krzk@kernel.org>,
	<s.nawrocki@samsung.com>, <cw00.choi@samsung.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
	<conor+dt@kernel.org>, <sunyeal.hong@samsung.com>, <shin.son@samsung.com>
Cc: <linux-samsung-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <20250509132414.3752159-1-raghav.s@samsung.com>
Subject: RE: [PATCH v1] dt-bindings: clock: exynosautov920: add hsi2 clock
 definitions
Date: Sat, 10 May 2025 07:51:56 +0530
Message-ID: <044201dbc152$4ef5eb20$ece1c160$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJ0HEPcZwZ4sk03/CHUakVJHxOvxwGAJMZdso5kxzA=
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrOIsWRmVeSWpSXmKPExsWy7bCSnK77DrkMg/d7FSzW7D3HZHH9y3NW
	i/lHzrFanD+/gd1i0+NrrBYfe+6xWlzeNYfNYsb5fUwWF0+5WnxfeYfR4v+eHewWh9+0s1r8
	u7aRxWLy8bWsFk3L1jM58Hu8v9HK7rFpVSebx+Yl9R59W1YxenzeJBfAGsVlk5Kak1mWWqRv
	l8CVcfTyasaCZTwVfw7eZWxg3MPVxcjBISFgInHsfFgXIxeHkMB2RomZDX/Zuhg5geLSEtc3
	TmCHsIUlVv57zg5R9JxRYvLmSYwgCTYBXYkdi9vYQBIiAhOZJFq+HQGrYhbYxChxbvdNNoiW
	XkaJxRcbwFo4BWwk/uy+zARiCwuESazv3M8MYrMIqErMnP4HrIZXwFLizIo3rBC2oMTJmU9Y
	QGxmAW2J3oetjDD2soWvmSHuU5D4+XQZWL2IgJXEzPtr2SFqxCVeHj3CPoFReBaSUbOQjJqF
	ZNQsJC0LGFlWMYqmFhTnpucmFxjqFSfmFpfmpesl5+duYgTHpVbQDsZl6//qHWJk4mA8xCjB
	wawkwvu8UyZDiDclsbIqtSg/vqg0J7X4EKM0B4uSOK9yTmeKkEB6YklqdmpqQWoRTJaJg1Oq
	gWllodHUcy1MV+4/9JtoLLp8ntTNCOaLvtl7xHl/iRZffsRdMmGVLmNv6BvHNxf5eLg/5LBO
	uXT3K89LEy4Bmev/Q/g94k9fcJ9+ePt8bYUU48vxyy7t3fPszlVt8Sp/KcmsraXzDB3CWWqt
	973fvnySffGkc//87rlFvywUWMTzMWf/8inL9rP2yXipLE0oeqW2Y2k698zQ5Zu6Tq8uWlua
	FVH/dOqlFW45vwp+zypot9zz971l+NMnM/n02iP8j8tlGl3n+LFwjkfXGiNFPZvyb68Dd/0P
	vf7T41dapMiJC6u6lyx5KjHX07/XUaX5uJVqxYObCRWH/B8Xrvxw+NVy/ftWP/4sP+AaLtFj
	UqKgxFKckWioxVxUnAgAPdUGQToDAAA=
X-CMS-MailID: 20250510022159epcas5p17fc37a384a4fc1dead464127dae045cb
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250509131427epcas5p1fe29ea19cb7624dc828935d6ec47854b
References: <CGME20250509131427epcas5p1fe29ea19cb7624dc828935d6ec47854b@epcas5p1.samsung.com>
	<20250509132414.3752159-1-raghav.s@samsung.com>



> -----Original Message-----
> From: Raghav Sharma <raghav.s=40samsung.com>
> Sent: Friday, May 9, 2025 6:54 PM
> To: krzk=40kernel.org; s.nawrocki=40samsung.com; cw00.choi=40samsung.com;
> alim.akhtar=40samsung.com; mturquette=40baylibre.com; sboyd=40kernel.org;
> robh=40kernel.org; conor+dt=40kernel.org; sunyeal.hong=40samsung.com;
> shin.son=40samsung.com
> Cc: linux-samsung-soc=40vger.kernel.org; linux-clk=40vger.kernel.org;
> devicetree=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org; lin=
ux-
> kernel=40vger.kernel.org; Raghav Sharma <raghav.s=40samsung.com>
> Subject: =5BPATCH v1=5D dt-bindings: clock: exynosautov920: add hsi2 cloc=
k
> definitions
>=20
> Add device tree clock binding definitions for CMU_HSI2
>=20
> Signed-off-by: Raghav Sharma <raghav.s=40samsung.com>
> ---
>  .../clock/samsung,exynosautov920-clock.yaml   =7C 29 +++++++++++++++++--
>  .../clock/samsung,exynosautov920.h            =7C  9 ++++++
>  2 files changed, 36 insertions(+), 2 deletions(-)
>=20
Hmm, you sent three separate patches that are interdependent but did not me=
ntion their dependencies.
e.g.=20
The patch that adds the clock driver cannot be compiled without the one tha=
t adds the header file, which is part of this binding patch

Go through the below section of submitting-patches documentation
https://www.kernel.org/doc/html/latest/process/submitting-patches.html=23se=
parate-your-changes

Make sure that each patch is individually compilable (or dependencies are m=
entioned clearly) and bisectable
ask someone if you are unsure of what you are submitting.


