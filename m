Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE0514A098
	for <linux-samsung-soc@vger.kernel.org>; Fri,  1 Nov 2024 05:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730437719; cv=none; b=jyjaDtWxuVzqF5EnlAW+CfWPq3mrI6Rd0qgofGjwCJ562ivyv1pxVk1QHK9h2r7bjeoGHvKOQUGQsEwTP/nFsbC2zWBdpGVeQqZYFRtbCyFl4XSYM4F4TFKW9Hw2fkCIRW/8OpcJhBeweQ9s+YTceUAzo4SRvWHh8ydl7i4fo9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730437719; c=relaxed/simple;
	bh=aE5/kRev+YPNg1qf+MQNdziHtczo4IwBVDu/BTgHClI=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=eGmo3eE5oJumOcXLowq94I8m1wA3nMay3gLi8JamAm1Q9rl8vTAM/KcNia7Sqs7i+/Jmqm9dhEq7+tnFL7S9rdWaAAacprSsMVFusvmFkNcWK0qSPvVrBThwZIf9AFaiGngmctO1OvrINicO9iKL8XnizHxsyRW4RSxovjQqJlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=TZfu+KSD; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="TZfu+KSD"
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20241101050825epoutp0237f51fdf0491124db490d3ec9811ff2c~Dv_yztHif1580715807epoutp02u
	for <linux-samsung-soc@vger.kernel.org>; Fri,  1 Nov 2024 05:08:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20241101050825epoutp0237f51fdf0491124db490d3ec9811ff2c~Dv_yztHif1580715807epoutp02u
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1730437705;
	bh=w0xXnNy5pWx74xjHIAlIzJHAEUIQhIYpEbF5vLLmF/Y=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=TZfu+KSDXbpbv99Glus3jh+SXuBy0AnQYkwfMKUtWzr0ylTFNHqMfIvWjFyhvjUAn
	 dDxsIMlMi11c8zhPnD+NYgZ9UiS5K42nZvF8eiSHF9F5q24U278GCB9Z66qI24uqm2
	 yW9yA99FHOOt0sQLo6RyBerA+TuhXTKIZjA+zw7Q=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas1p1.samsung.com (KnoxPortal) with ESMTP id
	20241101050824epcas1p1168b5d209a9132be9c9b44194e690e1d~Dv_yXcSSh2980329803epcas1p1r;
	Fri,  1 Nov 2024 05:08:24 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.36.135]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4Xfpm74wZwz4x9QL; Fri,  1 Nov
	2024 05:08:23 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
	epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
	D9.AC.09398.74264276; Fri,  1 Nov 2024 14:08:23 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
	20241101050823epcas1p3425f5d8aad0c95efa16dff93ca103d68~Dv_w9DW932140221402epcas1p3Z;
	Fri,  1 Nov 2024 05:08:23 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20241101050823epsmtrp12f59d2924577461d5e278752c4f7fdc5~Dv_w8KvRd3107431074epsmtrp1P;
	Fri,  1 Nov 2024 05:08:23 +0000 (GMT)
X-AuditID: b6c32a39-39fff700000024b6-67-67246247b65e
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	55.91.35203.64264276; Fri,  1 Nov 2024 14:08:23 +0900 (KST)
Received: from inkidae001 (unknown [10.113.221.213]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20241101050822epsmtip1d651b39b965b52490c26226570692c4d~Dv_wecxdZ1966119661epsmtip1H;
	Fri,  1 Nov 2024 05:08:22 +0000 (GMT)
From: =?utf-8?B?64yA7J246riwL1RpemVuIFBsYXRmb3JtIExhYihTUikv7IK87ISx7KCE7J6Q?=
	<inki.dae@samsung.com>
To: "'Kaustabh Chakraborty'" <kauschluss@disroot.org>, "'Seung-Woo Kim'"
	<sw0312.kim@samsung.com>, "'Kyungmin Park'" <kyungmin.park@samsung.com>,
	"'David Airlie'" <airlied@gmail.com>, "'Simona Vetter'" <simona@ffwll.ch>,
	"'Krzysztof Kozlowski'" <krzk@kernel.org>, "'Alim Akhtar'"
	<alim.akhtar@samsung.com>, "'Maarten Lankhorst'"
	<maarten.lankhorst@linux.intel.com>, "'Maxime Ripard'" <mripard@kernel.org>,
	"'Thomas Zimmermann'" <tzimmermann@suse.de>, "'Rob Herring'"
	<robh@kernel.org>, "'Conor Dooley'" <conor@kernel.org>
Cc: <dri-devel@lists.freedesktop.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
In-Reply-To: <20240919-exynosdrm-decon-v1-0-6c5861c1cb04@disroot.org>
Subject: RE: [PATCH 0/6] Samsung Exynos 7870 DECON driver support
Date: Fri, 1 Nov 2024 14:08:22 +0900
Message-ID: <000001db2c1c$12e86c50$38b944f0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQETcOy7JkGSF7VbGFg+ao1ZCztJewFhWZRKtCZJGMA=
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA01Tf0wTdxTft73eXUlKjoLbd2Rx7CAkMCmtUDwYuInoLtmiLCaMLSTsgEtb
	gbbptUxdtoEsVRAnFTdKZQgiTOoYplQHTEesKDKG1SjgHCjRjQUFCg6RDsLWcrjx3/u89/m8
	z3vfH7hQ+hANxTVaI2vQMgUkGoCcvxwli3k7J0IlP/ErSV0bPimgxurOo1TLV3aUOtFzXUTd
	fupBqaVlN0q53WcxamD/JEY5Hg6JqFtdtShldf8koBpmzyGUuaxZRP1zoQOjjk93Y5S1agKl
	nJMW0VtBdN/37QL64nw9QnfaRjHaYS9D6bq+9+j7h3oFdPupz+kvnXZAt/d/Qv/lWJ8e8GF+
	sppl8lhDGKvN1eVptKoU8p1d2VuzlQlyRYwikdpEhmmZQjaFTHs3PWa7psC3DhlWxBSYfKl0
	huPI2M3JBp3JyIapdZwxhWT1eQV6pV7GMYWcSauSaVljkkIu36j0ET/KV1d8MYvpz67bM9pT
	hxSD8aByIMYhEQ8ba1qwchCAS4kOAFuHqlbBEwDLPJ0iHswDODhjRZ9LnKO1gC9cBHC2qQTl
	wQSAS4v9Aj8LJVRwovwW4i+EENUInOvvFfqBkHACOPpgbKWXmNgGzQs3VhTBxBa43OnvK8YR
	IgI2LC+t5CVEInQdOgr4OAj21fyO+GMh8Tpsbngs5GcKg94/mkX+OIRIggd+mxLxnBB4vMy8
	YgyJUjGcvfkNxgvS4JPaMoSPg+GjXudqPhROHDFjvKAKwJHh0wgPrABe9g4DnhUHu5uqfOPh
	Poso2NYVy7sFwumnFSJ/GhISeNAs5dkkvHrzzqoSwhunLChPoeHhGlMleM22ZjXbmtVsa1aw
	/e9VDxA7eJHVc4UqllPolf9deK6u0AFWXnt0YgeonpqRuYAABy4AcSEZIpnRh6ukkjxm7z7W
	oMs2mApYzgWUvsO2CEPX5ep830VrzFbEJ8rjEzbGxVOKBAX5kuSX20WslFAxRjafZfWs4blO
	gItDiwVWD67stsLrXNqZxe92R0ztM+qimxzOJk1OeIVbYW9d3jra1HMtMzzvytGfq3LGzeqM
	HxotH6S+kPWtx3msJNUw1PpyyY9vNr5xdXHZaXo0i96xnmtN3burMqOYMcXGOTyWk8Gbns3L
	uAVvRuTjzJAN947ZS9h7bSkcWQ/WTxO6lrmBobsBg3AoDndFBo9cOmNBMI+sMqHySuD+LMfB
	xvK5uKTT5iNO88L8VCaxG19CEusM29qS/i7SvsocHh8IyLn/p/qV6NBnYy3ukjbvjo/7sWFJ
	tFgXnqUZRN4/sCWi1HEhcNr76Z7Pui49GNl8d8P2pMjIqJ3JLf2lk97qrxkS4dSMIlpo4Jh/
	AYReaON2BAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRmVeSWpSXmKPExsWy7bCSnK57kkq6wYZOZosT1xcxWTyYt43N
	YuXUVWwW84+cY7W48vU9m8Wff+fZLM6f38BucbbpDbvFpsfXWC0u75rDZjHj/D4mi4Uft7JY
	tHUuY7X4v2cHu8Xsd/vZLWZMfslmseXNRFYHQY+T6zYzeez9toDFY+esu+wem1Z1snnMOxno
	cb/7OJPH5iX1Hn1bVjF6bD5d7fF5k1wAVxSXTUpqTmZZapG+XQJXxv55B1kLGkQrFhx1aGBc
	J9jFyMkhIWAiseXuHMYuRi4OIYHdjBKrFnexdzFyACUkJLZs5YAwhSUOHy6GKHnOKPFrxw02
	kDibQKrE69V1IHERgfksEk8nbWMDcZgFdjBKHG3aygzRMY1R4u/FD4wg2zgFXCXaflxgArGF
	BRwl/u2cAxZnEVCRWPjvD1icV8BS4lD3JEYIW1Di5MwnLCA2s4C2xNObT+HsZQtfM0N8oCDx
	8+kyVhBbRMBKov32W1aIGhGJ2Z1tzBMYhWchGTULyahZSEbNQtKygJFlFaNkakFxbnpusWGB
	YV5quV5xYm5xaV66XnJ+7iZGcHRrae5g3L7qg94hRiYOxkOMEhzMSiK8HwqU04V4UxIrq1KL
	8uOLSnNSiw8xSnOwKInzir/oTRESSE8sSc1OTS1ILYLJMnFwSjUwtRfceD7l99fKJUs8q+96
	Lg/rOZJ/tUNO6uz9lpPTGHZ+4haMvPIz7mFIiuAO7jc8t6w97/Jorb4rWx31rK1liad72lxZ
	+x8nC1528bhm/Ao7Wlf74iw//0bWCWdctzGEv7i5RY07QIUnOXij4/sKmzqOd0qhff9n2z7c
	7HPoewWnmHrozgbOhCJNhue1ocs42zM+1O9qu3vg7/7zYT8b17ROPF10/b3K0qykH3Fbzwa5
	CscZVCQt/6E409kgeZ910cHttz/XcGZ69/Q9tdq0P+D/PSndx/+Zb5/e/XZJja7R+0I5HzG2
	ovzS4wd5Xrjw/Yk4/SSudc3ahhLda61b6nZKv9sWov9huvyK98yzlFiKMxINtZiLihMB0+pD
	qF0DAAA=
X-CMS-MailID: 20241101050823epcas1p3425f5d8aad0c95efa16dff93ca103d68
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240919151130epcas1p10a885b3364250f5ff4e06975cfef13e4
References: <CGME20240919151130epcas1p10a885b3364250f5ff4e06975cfef13e4@epcas1p1.samsung.com>
	<20240919-exynosdrm-decon-v1-0-6c5861c1cb04@disroot.org>

Hi Kaustabh Chakraborty,

Sorry for late.

> -----Original Message-----
> From: Kaustabh Chakraborty <kauschluss=40disroot.org>
> Sent: Friday, September 20, 2024 12:11 AM
> To: Inki Dae <inki.dae=40samsung.com>; Seung-Woo Kim
> <sw0312.kim=40samsung.com>; Kyungmin Park <kyungmin.park=40samsung.com>; =
David
> Airlie <airlied=40gmail.com>; Simona Vetter <simona=40ffwll.ch>; Krzyszto=
f
> Kozlowski <krzk=40kernel.org>; Alim Akhtar <alim.akhtar=40samsung.com>;
> Maarten Lankhorst <maarten.lankhorst=40linux.intel.com>; Maxime Ripard
> <mripard=40kernel.org>; Thomas Zimmermann <tzimmermann=40suse.de>; Rob He=
rring
> <robh=40kernel.org>; Conor Dooley <conor=40kernel.org>
> Cc: dri-devel=40lists.freedesktop.org; linux-arm-kernel=40lists.infradead=
.org;
> linux-samsung-soc=40vger.kernel.org; linux-kernel=40vger.kernel.org;
> devicetree=40vger.kernel.org; Kaustabh Chakraborty <kauschluss=40disroot.=
org>
> Subject: =5BPATCH 0/6=5D Samsung Exynos 7870 DECON driver support
>=20
> This patch series aims at adding support for Exynos7870's DECON in the
> Exynos7 DECON driver. It introduces a driver data struct so that support
> for DECON on other SoCs can be added to it in the future.
>=20
> It also fixes a few bugs in the driver, such as functions recieving bad
> pointers.
>=20
> Tested on Samsung Galaxy J7 Prime and Samsung Galaxy A2 Core.
>=20
> Signed-off-by: Kaustabh Chakraborty <kauschluss=40disroot.org>
> ---
> Kaustabh Chakraborty (6):
>       drm/exynos: exynos7_drm_decon: fix uninitialized crtc reference in
> functions
>       drm/exynos: exynos7_drm_decon: fix suspended condition in
> decon_commit()
>       drm/exynos: exynos7_drm_decon: fix ideal_clk by converting it to Hz
>       drm/exynos: exynos7_drm_decon: properly clear channels during bind
>       drm/exynos: exynos7_drm_decon: add driver data and support for
> Exynos7870
>       dt-bindings: display: samsung,exynos7-decon: add exynos7870
> compatible

I will apply all except for the two patches below,
=5BPATCH 2/6=5D drm/exynos: exynos7_drm_decon: fix suspended condition in d=
econ_commit()
=5BPATCH 6/6=5D dt-bindings: display: samsung,exynos7-decon: add exynos7870=
 compatible

Thanks,
Inki Dae

>=20
>  .../display/samsung/samsung,exynos7-decon.yaml     =7C   4 +-
>  drivers/gpu/drm/exynos/exynos7_drm_decon.c         =7C 124 +++++++++++++=
-----
> ---
>  drivers/gpu/drm/exynos/regs-decon7.h               =7C  15 ++-
>  3 files changed, 90 insertions(+), 53 deletions(-)
> ---
> base-commit: 4f3e012d4cfd1d9bf837870c961f462ca9f23ebe
> change-id: 20240917-exynosdrm-decon-4c228dd1d2bf
>=20
> Best regards,
> --
> Kaustabh Chakraborty <kauschluss=40disroot.org>


