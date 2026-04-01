Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641692D060B
	for <linux-samsung-soc@vger.kernel.org>; Wed,  1 Apr 2026 05:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775021417; cv=none; b=hmR9nRSQGy/LXEpU7otiOnILTtuGfGk14VxQykJwYyXDITP0a6YU6Cyxpv5ZGDlLL9BFDK1lqHc6dfNWS7lm9N5sL5jsOqIu7EZnu+/mXezK0r3kG/jw9ScnJ93wydnsBjx4i1l1Bg56+v8la2gvYmMULHScDprNyIA1NuDYUKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775021417; c=relaxed/simple;
	bh=dD5nd0d4Gbj7I4fC3dHsXHYgOEIMswsMTE+40KxvvCs=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=iUCHau2vycWdxG1RUjSATiU3KhlLJpV8l8J8fWjkGTAAUqBO01VDQM/xGK74tKonAERLv4akQkdbVCTijT838SkzCP3gw2zxO4Yrgi0Gs/d+PkmcqE19x0VVRIy5zNICmiQOORf9Tki0X5UU0deCpTMLk2GbmhvpMnUNJHjkGMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=blre3Y/i; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="blre3Y/i"
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20260401053012epoutp01d2f67b6c40011552fb27f409b716bc43~iJJHjbzyY0704007040epoutp01_
	for <linux-samsung-soc@vger.kernel.org>; Wed,  1 Apr 2026 05:30:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20260401053012epoutp01d2f67b6c40011552fb27f409b716bc43~iJJHjbzyY0704007040epoutp01_
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1775021412;
	bh=uKdDtQI8KakHQEuY6CG4RSy4Y2Gi8JuEVAxFGspB0bQ=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=blre3Y/iAOQXvQ8kolHhN84CRv7nYkcx4QVxIhqaAy5GFTf40QklAunJiqzG92mLf
	 5UaTPvDjO4UrOP9VFO2GFPoxvgyWwTxb+eU77CdPuUNt9L1ZH4ZzBDjdf8JcqEbyA1
	 xcX0Q38IDVDASsG6IqNeLP8cx0qlWniesC0gjpnU=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20260401053009epcas5p240746a97096d1859ecd0b1ad98847c8d~iJJEsgjRc0205702057epcas5p2V;
	Wed,  1 Apr 2026 05:30:09 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.91]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4fltq42lTwz6B9m4; Wed,  1 Apr
	2026 05:30:08 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20260401053007epcas5p3ab3f2ac6f1fa38a3c5656290a667eb43~iJJDWLSNx0177501775epcas5p3d;
	Wed,  1 Apr 2026 05:30:07 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20260401053001epsmtip13e5bdaf29ff691bcd40647a67a1a12cf~iJI96FlCJ0062200622epsmtip1d;
	Wed,  1 Apr 2026 05:30:01 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: <krzk+dt@kernel.org>, <robh@kernel.org>, <krzk@kernel.org>,
	<conor+dt@kernel.org>, <vkoul@kernel.org>, <kishon@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-samsung-soc@vger.kernel.org>, "'Sowon Na'" <sowon.na@samsung.com>
In-Reply-To: <20250702013316.2837427-1-sowon.na@samsung.com>
Subject: RE: [PATCH 0/5] ufs-exynos support for ExynosAutov920
Date: Wed, 1 Apr 2026 10:59:59 +0530
Message-ID: <0e2d01dcc198$99cef820$cd6ce860$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIbSwrI3mmHsM7vSFR0drFUtT3bnwKcRDJWtTe1yOA=
Content-Language: en-us
X-CMS-MailID: 20260401053007epcas5p3ab3f2ac6f1fa38a3c5656290a667eb43
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250702013332epcas2p168d0293f0b7385b0cca88c649fe9c813
References: <CGME20250702013332epcas2p168d0293f0b7385b0cca88c649fe9c813@epcas2p1.samsung.com>
	<20250702013316.2837427-1-sowon.na@samsung.com>

Hi All
> -----Original Message-----
> From: Sowon Na <sowon.na=40samsung.com>
> Sent: Wednesday, July 2, 2025 7:03 AM
> To: robh=40kernel.org; krzk=40kernel.org; conor+dt=40kernel.org;
> vkoul=40kernel.org; alim.akhtar=40samsung.com; kishon=40kernel.org
> Cc: krzk+dt=40kernel.org; linux-kernel=40vger.kernel.org;
> devicetree=40vger.kernel.org; linux-samsung-soc=40vger.kernel.org;
> sowon.na=40samsung.com
> Subject: =5BPATCH 0/5=5D ufs-exynos support for ExynosAutov920
>=20
> Hi,
>=20
> This series adds support to the ufs-exynos driver for ExynosAutov920,
> Samsung Automotive SoC series.
> ExynosAutov920 has the UFSHCI 3.1 compliant UFS controller.
>=20
> ExynosAutov920 has a different mask of UFS sharability from ExynosAutov9,
> so this series provide flexible parameter for the mask.
>=20
> With this series applied, UFS is functional. The Samsung KLUDG4UHYB is
> tested for enumeration and I/O.
>=20
> Sowon Na (5):
>   phy: samsung-ufs: update calibration settings for EVT2
>   dt-bindings: ufs: exynos: add ExynosAutov920 compatible string
>   dt-bindings: soc: samsung: exynos-sysreg: add hsi2 for ExynosAutov920
>   scsi: ufs: exynos: add support for ExynosAutov920 SoC
>   arm64: dts: exynosautov920: enable support for ufs device
>=20
Looks like Sowon will not be able to work on these patches anytime soon.
Have spoken to her offline on this and I will be posting V2 of these patche=
s to enable
UFS on ExynosAutov920 SoC.
Patch 3/5 (dt-bindings: soc: samsung: exynos-sysreg: add hsi2 for ExynosAut=
ov920) was already merged.=20
Will keep Krzysztof's Acked-by in patch 2/5 (dt-bindings: ufs: exynos: add =
ExynosAutov920 compatible string)
Will fix review comments on rest of the patches in V2

