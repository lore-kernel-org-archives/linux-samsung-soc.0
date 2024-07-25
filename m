Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 203CBD2FA
	for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jul 2024 03:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721877006; cv=none; b=e5aGEqfi927w9FNeMp7iGXIO4nmT/J9POJCugqrfDWYtYXkjFaiZsM+wOV8lplrEXMapJ8h9xWMNBKqZaZQATRnOCMGCYqoe7fce86UmQ9MKO4mFjBKL52BVFrxZkUwl4sjcO/7+H7yGsZgt6YGpM3mUrFx03BTQqhou5I4sVGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721877006; c=relaxed/simple;
	bh=pGLxh6CLwHVaoNIwDYSyOLlH2HsN2OG/vAY4nx5lc44=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=cRVSZ4x5GQzxMJms6W+iZoWPHEVZ96w8Iup1JxXcnYvJg5CLFBGSqH9GVeWcKTbp2ZuTQ5RiUD3/wmy1OvpLFQExlAmCN7tldArtdDwvC16W2MOCBlsoX9IGvBi8IEiKvfg92rmw07G3/Xo5lUuGf1iNswVr2527G6Iz54gAuWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=bDmNSCu1; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="bDmNSCu1"
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20240725031000epoutp036a4fa6d493f48d2f5cabab1e68b51166~lVgJMLqN11741717417epoutp03C
	for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jul 2024 03:10:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20240725031000epoutp036a4fa6d493f48d2f5cabab1e68b51166~lVgJMLqN11741717417epoutp03C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1721877000;
	bh=m5NxvZWMl8omJrwXU+L4GIDDgVxSLnFTnlpKu+EK/MQ=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=bDmNSCu1adIDnrDyF9WblIYvx7Hqzv6JeHm7ykfEECse4mjwVTTR06KghNB6Sy4NR
	 XoVaJvwd4dk0IiHaZjFl6UwSjoLSVv3yIRoitN9YnMFuzn2M4FzXRe+p0f+0QPQafA
	 KcR2+2NS8yOO6er38to5SUXQ5QPHtuXWepiw4EXg=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTP id
	20240725030959epcas2p408f3419ace7d8a4ce20b4e3371582867~lVgIqrr5l3268932689epcas2p4C;
	Thu, 25 Jul 2024 03:09:59 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.98]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4WTwqC1qkxz4x9Q2; Thu, 25 Jul
	2024 03:09:59 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
	epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
	C0.C1.10066.702C1A66; Thu, 25 Jul 2024 12:09:59 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20240725030958epcas2p39b03ed56bee304ef8129bbf648c87015~lVgHrDTqN2166821668epcas2p3F;
	Thu, 25 Jul 2024 03:09:58 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20240725030958epsmtrp16a5da0238f2734a159832c1c82232ae7~lVgHqQpkS0827608276epsmtrp1w;
	Thu, 25 Jul 2024 03:09:58 +0000 (GMT)
X-AuditID: b6c32a46-4b7fa70000002752-79-66a1c2070e94
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	67.86.07567.602C1A66; Thu, 25 Jul 2024 12:09:58 +0900 (KST)
Received: from KORCO118965 (unknown [10.229.18.201]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20240725030958epsmtip2bea6acf3789061ae1805d8efd7c3a836~lVgHbdiKd2314823148epsmtip2N;
	Thu, 25 Jul 2024 03:09:58 +0000 (GMT)
From: "sunyeal.hong" <sunyeal.hong@samsung.com>
To: "'Tudor Ambarus'" <tudor.ambarus@linaro.org>, "'Krzysztof Kozlowski'"
	<krzk@kernel.org>, "'Sylwester Nawrocki'" <s.nawrocki@samsung.com>,
	"'Chanwoo Choi'" <cw00.choi@samsung.com>, "'Alim Akhtar'"
	<alim.akhtar@samsung.com>, "'Michael	Turquette'" <mturquette@baylibre.com>,
	"'Stephen Boyd'" <sboyd@kernel.org>, "'Rob	Herring'" <robh@kernel.org>,
	"'Conor Dooley'" <conor+dt@kernel.org>
Cc: <linux-samsung-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <dd0449bc-f02a-4879-a7cd-e01fbea01d9f@linaro.org>
Subject: RE: [PATCH v4 2/4] arm64: dts: exynos: add initial CMU clock nodes
 in ExynosAuto v920
Date: Thu, 25 Jul 2024 12:09:58 +0900
Message-ID: <03bd01dade40$218e7b70$64ab7250$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQKlY5hu3bVCnsOExtpi/jJA6pOgwAIK48nRASeT9zcCJWZqrLBG+IOA
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNJsWRmVeSWpSXmKPExsWy7bCmmS77oYVpBu++cFo8mLeNzWLN3nNM
	Fte/PGe1mH/kHKvF+fMb2C02Pb7GavGx5x6rxeVdc9gsZpzfx2Rx8ZSrxf89O9gtDr9pZ7X4
	d20ji8WnW3EOfB7vb7Sye2xa1cnmcefaHjaPzUvqPfq2rGL0+LxJLoAtKtsmIzUxJbVIITUv
	OT8lMy/dVsk7ON453tTMwFDX0NLCXEkhLzE31VbJxSdA1y0zB+hWJYWyxJxSoFBAYnGxkr6d
	TVF+aUmqQkZ+cYmtUmpBSk6BeYFecWJucWleul5eaomVoYGBkSlQYUJ2xqcFZgVXRCv6t/aw
	NzCeE+pi5OSQEDCR6Lj1jrGLkYtDSGAHo0TrsW1sEM4nRokvh1vZIZxvjBL/z+1jhmnZuWIB
	VMteRolrnzZAVb1klNiwt5cFpIpNQF9idfdtsFkiAj3MEhvaLjCBOMwC6xglNs88wg5SxSlg
	J9F/8ByYLSyQIPHi+1OwbhYBVYl1d46A7eMVsJS49Xw9C4QtKHFy5hMwm1lAW2LZwtdQNylI
	/Hy6jLWLkQNom5vE/E1lECUiErM725hBwhICVzgkPlpBVLtIbHt5kxXCFpZ4dXwLO4QtJfGy
	vw3KzpeYfP0t2MkSAg1AX/7rhlplL7HozE92kJnMApoS63fpQ4xXljhyC+owPomOw3/ZIcK8
	Eh1t0KBWk/h05TLUEBmJYyeeMU9gVJqF5K1ZSN6aheT+WQi7FjCyrGIUSy0ozk1PLTYqMILH
	dXJ+7iZGcCrWctvBOOXtB71DjEwcjIcYJTiYlUR4n7yamybEm5JYWZValB9fVJqTWnyI0RQY
	0BOZpUST84HZIK8k3tDE0sDEzMzQ3MjUwFxJnPde69wUIYH0xJLU7NTUgtQimD4mDk6pBqYG
	7n/114/wn/8l7LFY9smrWRFnDe7WXG/lYmT6tyNJv71eeMsFYeFLa+62LjrF/GtdXk3A7vbJ
	yovzGpzfdzYf2HJrQVzS2qKZOx3WL8qxiWs+URvwl71k47Kkk2LNjjHPX952LvITeviIrSo7
	akWWzYOVys1Xf/9f/iP2s1Nsx5L1qXqNd/bfLqqvbOne3BOdbmVR+nRjUUjC/M7HL2bI89bs
	bleMT12/mNGG4Z7Qumkv8iMuXxf5/Dj7WUa/zQ++4w+qFVWftPoYLf69x4YlZOmqvxYnFnw5
	7HwnbqJypezEnLr7ZlyL1D9+nRTe9D+6b/W2z24TejfY3Zly//L6r/E9RcXGtSm24bdb715W
	YinOSDTUYi4qTgQAcs+ywk4EAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrJIsWRmVeSWpSXmKPExsWy7bCSvC7boYVpBosOqVs8mLeNzWLN3nNM
	Fte/PGe1mH/kHKvF+fMb2C02Pb7GavGx5x6rxeVdc9gsZpzfx2Rx8ZSrxf89O9gtDr9pZ7X4
	d20ji8WnW3EOfB7vb7Sye2xa1cnmcefaHjaPzUvqPfq2rGL0+LxJLoAtissmJTUnsyy1SN8u
	gStj8fcNrAXfhCv2PH/K2MC4RqCLkZNDQsBEYueKBYwgtpDAbkaJSdMtIOIyEhsb/rND2MIS
	91uOsHYxcgHVPGeUWHShmQkkwSagL7G6+zYbSEJEYBKzxLtHN5hBHGaBTYwS53bfZINo+c4o
	seDOBTaQFk4BO4n+g+fA5goLxElcXXCVFcRmEVCVWHfnCDOIzStgKXHr+XoWCFtQ4uTMJ2A2
	s4C2RO/DVkYYe9nC18wQ9ylI/Hy6DGgOB9AZbhLzN5VBlIhIzO5sY57AKDwLyaRZSCbNQjJp
	FpKWBYwsqxglUwuKc9Nzkw0LDPNSy/WKE3OLS/PS9ZLzczcxgmNTS2MH4735//QOMTJxMB5i
	lOBgVhLhffJqbpoQb0piZVVqUX58UWlOavEhRmkOFiVxXsMZs1OEBNITS1KzU1MLUotgskwc
	nFINTHeKrKcvf37v8XvT50euOkUHbJ98/5SAm/ui3+Ihm7ZNClu0T6J12mOVDVtlAzg8D5Q8
	mh99ade9H17GYRfTA442Pf33TPppsYDgiTZG5rd3L/Trfn7vZDPV7UliReQGmfXflr/onVRo
	X7dZ+QtfeN6J1siDyw9VzJ/x3KR5VzL/J5XeqXsvCGlxlx16ZnxlygNOG6vpT3kL/Py28vJO
	FTK4O4Vvh4jvSel9LwvijPMdmptq2D6Z67pcedF60ChGw2dWa3LAA0Gpvb2fhXbU3XS8knL1
	3fkVdv+mdSVf+x3Bv+R27I0Zt6uf3tBSOpBzcc+BvxPiNK9E+gQ1zBI5l99tzRHGNTXjTzt/
	yYJ0i1tKLMUZiYZazEXFiQBjd79NPAMAAA==
X-CMS-MailID: 20240725030958epcas2p39b03ed56bee304ef8129bbf648c87015
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240722223341epcas2p1b08b47cfefa981a2b31aad7878e3db64
References: <20240722223333.1137947-1-sunyeal.hong@samsung.com>
	<CGME20240722223341epcas2p1b08b47cfefa981a2b31aad7878e3db64@epcas2p1.samsung.com>
	<20240722223333.1137947-3-sunyeal.hong@samsung.com>
	<dd0449bc-f02a-4879-a7cd-e01fbea01d9f@linaro.org>

Hello Tudor,

> -----Original Message-----
> From: Tudor Ambarus <tudor.ambarus=40linaro.org>
> Sent: Wednesday, July 24, 2024 8:18 PM
> To: Sunyeal Hong <sunyeal.hong=40samsung.com>; Krzysztof Kozlowski
> <krzk=40kernel.org>; Sylwester Nawrocki <s.nawrocki=40samsung.com>; Chanw=
oo
> Choi <cw00.choi=40samsung.com>; Alim Akhtar <alim.akhtar=40samsung.com>;
> Michael Turquette <mturquette=40baylibre.com>; Stephen Boyd
> <sboyd=40kernel.org>; Rob Herring <robh=40kernel.org>; Conor Dooley
> <conor+dt=40kernel.org>
> Cc: linux-samsung-soc=40vger.kernel.org; linux-clk=40vger.kernel.org;
> devicetree=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org; lin=
ux-
> kernel=40vger.kernel.org
> Subject: Re: =5BPATCH v4 2/4=5D arm64: dts: exynos: add initial CMU clock
> nodes in ExynosAuto v920
>=20
> Hi, Sunyeal,
>=20
> I quickly skimmed over the series and I fail to see where/how the HW auto
> clock gating is enabled/configured. Would you please add more details on
> how this works?
>
The HW auto clock gating function is activated in the bootloader stage. So =
we don't have to control it in the kernel.

> On 7/22/24 11:33 PM, Sunyeal Hong wrote:
> > Add cmu_top, cmu_peric0 clock nodes and switch USI clocks instead of
> > dummy fixed-rate-clock.
> >
> > Signed-off-by: Sunyeal Hong <sunyeal.hong=40samsung.com>
> > ---
> >  .../arm64/boot/dts/exynos/exynosautov920.dtsi =7C 40
> > +++++++++++++------
> >  1 file changed, 27 insertions(+), 13 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
> > b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
> > index c1c8566d74f5..54fc32074379 100644
> > --- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
> > +++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
>=20
>=20
> cut
>=20
> > =40=40 -224,7 +237,8 =40=40 serial_0: serial=4010880000 =7B
> >  				interrupts =3D <GIC_SPI 764 IRQ_TYPE_LEVEL_HIGH>;
> >  				pinctrl-names =3D =22default=22;
> >  				pinctrl-0 =3D <&uart0_bus>;
> > -				clocks =3D <&clock_usi>, <&clock_usi>;
> > +				clocks =3D <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
>=20
> isn't this MUX common to multiple GATEs? Wouldn't turning it off affect
> other users than the serial?
>=20
> Thanks,
> ta
>=20
I don=E2=80=99t=20think=20there=20will=20be=20any=20problems=20you=20are=20=
worried=20about=20through=20the=20enable=20count=20of=20CCF.=0D=0A=0D=0ATha=
nks,=0D=0ASunyeal=20Hong.=0D=0A>=20>=20+=09=09=09=09=09=20<&cmu_peric0=20CL=
K_DOUT_PERIC0_USI00_USI>;=0D=0A>=20>=20=20=09=09=09=09clock-names=20=3D=20=
=22uart=22,=20=22clk_uart_baud0=22;=0D=0A>=20>=20=20=09=09=09=09samsung,uar=
t-fifosize=20=3D=20<256>;=0D=0A>=20>=20=20=09=09=09=09status=20=3D=20=22dis=
abled=22;=0D=0A=0D=0A=0D=0A
