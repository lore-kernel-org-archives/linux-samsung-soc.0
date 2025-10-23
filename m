Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC01313E0F
	for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Oct 2025 14:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761229704; cv=none; b=i0TF/zKAchPU10fU0pmOc6X+VoE1in7ocYzLfoi/8SwZJnfjD7oukZIQlUwlAvSd+XBLgr3Xid+opc3Nb1kNaCCA3m3flFA3awCI/GWPNIUokbmKyv9rzu6jFVlqjbCiq9pvq1MvhkasalbZyHFgdmnAaZldWFTEtpyZHtjq6hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761229704; c=relaxed/simple;
	bh=8h2Y5tzs8lm8JSD+iNd3kT7mxqqZE3JVyKr5IzMkGqE=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=egvnidlnauH9TpysytXvu+pL3VbxAUYg490jyVbD8NFwofO0sBHfQu87sRhJCfooW2ZzWxAUZ8G44D2/1AUAorPXQ/PRfBGrpYSQgtOy4Bu43xauxO1OPSvFbZARI/ypjz5ECIwGfzVVTp05jeN2ks01W7FZExqE9DMnRrvHAx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=LMnlLslJ; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="LMnlLslJ"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20251023142820euoutp025f33fc792360a74e607eeaeacc73f22d~xJRTS3i5X2081720817euoutp02S
	for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Oct 2025 14:28:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20251023142820euoutp025f33fc792360a74e607eeaeacc73f22d~xJRTS3i5X2081720817euoutp02S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1761229700;
	bh=8h2Y5tzs8lm8JSD+iNd3kT7mxqqZE3JVyKr5IzMkGqE=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=LMnlLslJShQDEbu7UH6+A2n6+S//Wy/qg+Tt05XFlu9lR8w/nqM0eKaQsf1+oC9yl
	 x6ohSUqxMY325KVJLXwyVpfJ7Jo/KxR8Tqe2b3xCxudv3WblTUVx6Sii+JX5KXOyWL
	 5kKkqtehQHzJrve85JBwcc2ne2yVR9xwaGQE1g0g=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20251023142820eucas1p18c21cf74b55cc23af644218310ce7be7~xJRS0V26k1482414824eucas1p1h;
	Thu, 23 Oct 2025 14:28:20 +0000 (GMT)
Received: from AMDN5751 (unknown [106.210.134.141]) by eusmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20251023142819eusmtip2637d91e6f5c3c9d671fa9b396e5c4fd3~xJRSdmq-R0468304683eusmtip2d;
	Thu, 23 Oct 2025 14:28:19 +0000 (GMT)
From: "Sylwester Nawrocki" <s.nawrocki@samsung.com>
To: "'Marek Szyprowski'" <m.szyprowski@samsung.com>,
	<linux-media@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>
Cc: "'Hans Verkuil'" <hverkuil@xs4all.nl>, "'Mauro Carvalho	Chehab'"
	<mchehab@kernel.org>, "'Krzysztof Kozlowski'" <krzk@kernel.org>, "'Alim
 Akhtar'" <alim.akhtar@samsung.com>
In-Reply-To: <20251014104643.1884897-1-m.szyprowski@samsung.com>
Subject: RE: [PATCH] media: samsung: exynos4-is: fix potential ABBA deadlock
 on init
Date: Thu, 23 Oct 2025 16:28:19 +0200
Message-ID: <000001dc4429$479ea740$d6dbf5c0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQKxLUKFwsAvvR3nlKruHoza89U2fwI4JDD5sxQzxSA=
Content-Language: pl
X-CMS-MailID: 20251023142820eucas1p18c21cf74b55cc23af644218310ce7be7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20251014104654eucas1p19b0f4c8c17c0d5fca76ba1e12f74fbe4
X-EPHeader: CA
X-CMS-RootMailID: 20251014104654eucas1p19b0f4c8c17c0d5fca76ba1e12f74fbe4
References: <CGME20251014104654eucas1p19b0f4c8c17c0d5fca76ba1e12f74fbe4@eucas1p1.samsung.com>
	<20251014104643.1884897-1-m.szyprowski@samsung.com>

> -----Original Message-----
> From: Marek Szyprowski <m.szyprowski=40samsung.com>
> Sent: wtorek, 14 pa=C5=BAdziernika=202025=2012:47=0D=0A>=20To:=20linux-me=
dia=40vger.kernel.org;=20linux-samsung-soc=40vger.kernel.org=0D=0A>=20Cc:=
=20Marek=20Szyprowski=20<m.szyprowski=40samsung.com>;=20Sylwester=20Nawrock=
i=0D=0A>=20<s.nawrocki=40samsung.com>;=20Hans=20Verkuil=20<hverkuil=40xs4al=
l.nl>;=20Mauro=0D=0A>=20Carvalho=20Chehab=20<mchehab=40kernel.org>;=20Krzys=
ztof=20Kozlowski=0D=0A>=20<krzk=40kernel.org>;=20Alim=20Akhtar=20<alim.akht=
ar=40samsung.com>=0D=0A>=20Subject:=20=5BPATCH=5D=20media:=20samsung:=20exy=
nos4-is:=20fix=20potential=20ABBA=20deadlock=0D=0A>=20on=20init=0D=0A>=20=
=0D=0A>=20v4l2_device_register_subdev_nodes()=20must=20called=20without=20t=
aking=0D=0A>=20media_dev->graph_mutex=20to=20avoid=20potential=20AB-BA=20de=
adlock=20on=20further=0D=0A>=20subdevice=20driver=20initialization.=0D=0A>=
=20=0D=0A>=20Fixes:=20fa91f1056f17=20(=22=5Bmedia=5D=20exynos4-is:=20Add=20=
support=20for=20asynchronous=0D=0A>=20subdevices=20registration=22)=0D=0A>=
=20Signed-off-by:=20Marek=20Szyprowski=20<m.szyprowski=40samsung.com>=0D=0A=
=0D=0AAcked-by:=20Sylwester=20Nawrocki=20<s.nawrocki=40samsung.com>=0D=0A=
=0D=0A>=20This=20fixes=20a=20long=20standing=20bug=20that=20happens=20somet=
imes=20during=20driver=0D=0A>=20intialization.=20This=20issue=20has=20been=
=20finally=20captured=20by=20the=20lock=0D=0A>=20dependency=20tracker=20wit=
h=20the=20following=20log:=0D=0A=0D=0A=0D=0A
