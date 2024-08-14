Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992D06BFB5
	for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Aug 2024 07:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723621379; cv=none; b=cmfrlPiimqETR8WpJaOmxsAYaMd0k1srxvUathGs5nhdVLLN75I7Up7TB3s237rYyRxNVy40mGT77eGb9vAr19khQyhYCXV2og6jgkjEzw6dBdAlUrkyEkQm4/nMj+4GtQ6r26aNSCRbOgOnTuoeNPtQ7BgjJ+P3kwPhgdY/UYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723621379; c=relaxed/simple;
	bh=gqmxEcUMOsois9EFRjr9fV8qCd5R/O5T5M1rf4+okcc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:MIME-Version:
	 Content-Type:References; b=UAgtHvq6FM0b3iEH4JbwTUeUqwqI7IRsE+Inz6uvJrWriS1VYwNCGnUlIVVDoaIfnRUkvIJBMmgbCJkGWBNU2/TO1F5kHJbVldT/55ZcZDXuTG4Am3/RNfmmTEEklpG34QWzjH8s1fYJNkbD0b0/aF1JwVO6OsJZjXxsgEwCdns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=rcO4NZSn; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="rcO4NZSn"
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20240814074248epoutp045ee578ac0acf5a9d72d3b9ea247811c5~riIC4bbmE1990619906epoutp04h
	for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Aug 2024 07:42:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20240814074248epoutp045ee578ac0acf5a9d72d3b9ea247811c5~riIC4bbmE1990619906epoutp04h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1723621368;
	bh=XRrSZrKYhO1Jt5/oeubOXU865fR8qNCCy0GNGhbI0lU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=rcO4NZSndFqPqmqwjPUPbVf+TFwH2WvuHq2AI2oS0PB4oJJoXAMt51W4eoRKaZ8kY
	 XxzlP98chqmDTimHSe+26WDz1Ayt40v2ZWJ5GLsBKkO2qrtRE36e4fqNtpZ1U9o+LH
	 szv9FBFkH96hgDRNgFAt6VuGqzyZgRZLLwEm0doU=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas1p4.samsung.com (KnoxPortal) with ESMTP id
	20240814074248epcas1p48bb65801bb98f164c91fb151b9946b73~riICa-zYd1226912269epcas1p4o;
	Wed, 14 Aug 2024 07:42:48 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.38.232]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4WkKwl5vZ9z4x9Q0; Wed, 14 Aug
	2024 07:42:47 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
	epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	DC.6F.09734.7FF5CB66; Wed, 14 Aug 2024 16:42:47 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20240814074247epcas1p23e178263d8534eabaf9af0718f32a532~riIBanF5F0620406204epcas1p2F;
	Wed, 14 Aug 2024 07:42:47 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240814074247epsmtrp217e051cb6c63384ed06cb6d5dc4ac91e~riIBZv5941759317593epsmtrp2C;
	Wed, 14 Aug 2024 07:42:47 +0000 (GMT)
X-AuditID: b6c32a35-c03b870000002606-ca-66bc5ff7eecd
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	56.CD.19367.7FF5CB66; Wed, 14 Aug 2024 16:42:47 +0900 (KST)
Received: from [10.113.111.204] (unknown [10.113.111.204]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20240814074246epsmtip245917554ca3cf653ca823b64f047870f~riIBKamyC2359123591epsmtip2f;
	Wed, 14 Aug 2024 07:42:46 +0000 (GMT)
Message-ID: <70586c17c515984c3e31506926be026ead9ea58b.camel@samsung.com>
Subject: Re: [PATCH] drm/exynos: cleanup header include
From: Kwanghoon Son <k.son@samsung.com>
To: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,  Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Wed, 14 Aug 2024 16:42:46 +0900
In-Reply-To: <20240813-clean_header-v1-1-6f950d09b877@samsung.com>
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprPJsWRmVeSWpSXmKPExsWy7bCmnu73+D1pBucu6VqcuL6IyeLBvG1s
	Fv+3TWS2uPL1PZvFpPsTWCzOn9/AbnG26Q27xabH11gtLu+aw2Yx4/w+JosZk1+yOXB77P22
	gMVj56y77B6bVnWyedzvPs7ksXlJvUffllWMHp83yQWwR2XbZKQmpqQWKaTmJeenZOal2yp5
	B8c7x5uaGRjqGlpamCsp5CXmptoqufgE6Lpl5gDdqKRQlphTChQKSCwuVtK3synKLy1JVcjI
	Ly6xVUotSMkpMC3QK07MLS7NS9fLSy2xMjQwMDIFKkzIzuhd/pil4CVXxdU/LWwNjDM5uxg5
	OSQETCRW3W1l7GLk4hAS2MEoMaVrChOE84lRYsP6vWxwzpLHF5hhWlbvO8MKkdjJKNG75C9U
	y3tGiYkte9lBqngFPCRef73MCGILC5hLnJ9xAizOJqAusaRtLTtIg4hAH5PE61uzWUAcZoEe
	RonzH5aAVbEIqEpsufeNDcTmFHCS2D/1NZjNLKAtsWzha7A7RAXkJRoenmCG2CYocXLmE7BB
	EgIrOSSebN3BDnGsi8T6Ka+gDheWeHV8C1RcSuLzu71sEHa2xNGPMHaJxPVZi1ghbGOJ/Usn
	A/3GAbRYU2L9Ln2IG/gk3n3tYQUJSwjwSnS0CUGY8hK3OsshGkUlzjz9CDXQQ+L/3ivMkACa
	yijxb8YulgmM8rOQfDMLyQezEJYtYGRexSiWWlCcm55abFhgCI/X5PzcTYzglKpluoNx4tsP
	eocYmTgYDzFKcDArifAGmuxKE+JNSaysSi3Kjy8qzUktPsRoCgzTicxSosn5wKSeVxJvaGJp
	YGJmZGxiYWhmqCTOe+ZKWaqQQHpiSWp2ampBahFMHxMHp1QD093DTf9XnLK6nHVF7uvllyye
	lVn8PbNUeROKXt67cTxlwZ5b18xDNI6lvjr75ZhI0SmnK7rVoR1VORf+NR6SLlt3Na/8KrdU
	ZemTox0rn/6Yu0PCSYd1xt8lu9kcVCdvMa6La+azPSL1bkZ9V+9UntUncy1jJW8qcfw+etP6
	fgavrr3A4+OLjdjP9XzfcNr8U5ONHl/4ntRFX38rps1tTFio6+Y3NZ9FwtvI5YC9n616i+6p
	qdv0fRXPnH4lvuHNhjVLr3z/ozll5ia336ttEv99sjrRIbEpatGj/i35G9hmTny4y4TbMqx4
	3gvTp4xft9Wzq1ltuha2Nnafceoak97W2uN3EnmPPGVhOSWc8lWJpTgj0VCLuag4EQAz/z+s
	MgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrFLMWRmVeSWpSXmKPExsWy7bCSvO73+D1pBtNOsVucuL6IyeLBvG1s
	Fv+3TWS2uPL1PZvFpPsTWCzOn9/AbnG26Q27xabH11gtLu+aw2Yx4/w+JosZk1+yOXB77P22
	gMVj56y77B6bVnWyedzvPs7ksXlJvUffllWMHp83yQWwR3HZpKTmZJalFunbJXBlbGo5xFaw
	lavi2v2jjA2MTzm6GDk5JARMJFbvO8PaxcjFISSwnVHib8sWFoiEqETH5UbGLkYOIFtY4vDh
	Yoiat4wSqw6eYAOp4RXwkHj99TIjiC0sYC5xfsYJdhCbTUBdYknbWnaQBhGBfiaJtn39bCAO
	s0AvUPeuN2BVLAKqElvufQObxCngJLF/6ms2iBUzGSXOfpgNdgazgKZE6/bf7BC2tsSyha+Z
	QWxRAXmJhocnmCHOEJQ4OfMJywRGwVlIWmYhaZmFpGwBI/MqRtHUguLc9NzkAkO94sTc4tK8
	dL3k/NxNjODo0Qrawbhs/V+9Q4xMHIyHGCU4mJVEeANNdqUJ8aYkVlalFuXHF5XmpBYfYpTm
	YFES51XO6UwREkhPLEnNTk0tSC2CyTJxcEo1ME27LOHM5P1Md+4C7mM/t204XR3nrTR5xbx7
	lo+vT/rZtdPz7zdz/p/KlyzvTzPd8mUFl1F82YzQ6VxtK35VWH3e+MR8x3vxmovTzum+Mesx
	2+e1mWFpzp8laxfOrtv+/CyToHmhQNHkgKVl3Ktz/7yKU0g8ILFoVtC0wmab4quCvM9fZHy2
	+aI687XYGy2BUEmLuNcS9bdXO/5Nfyw2uy/yz6UvR1zzVlYdnP2KdWP83kSjxSzP9EImLpDY
	sovVuyxn/UwR1r33hd6GW6rp5h1cWirmF2c5/5L4dta1JXNmdMa1yx3M5vl891SB7kl25XrB
	iimzFicGVnQee9dfqVR19cnxOS3Kscxvjjp9/lqtxFKckWioxVxUnAgARa9f6w0DAAA=
X-CMS-MailID: 20240814074247epcas1p23e178263d8534eabaf9af0718f32a532
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240813075621epcas1p13a114c471fa953a5038d1897994edca5
References: <CGME20240813075621epcas1p13a114c471fa953a5038d1897994edca5@epcas1p1.samsung.com>
	<20240813-clean_header-v1-1-6f950d09b877@samsung.com>

On Tue, 2024-08-13 at 16:55 +0900, Kwanghoon Son wrote:
> Cleanup header include
>=20
> Signed-off-by: Kwanghoon Son <k.son=40samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_fb.c =7C 5 -----
>  1 file changed, 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fb.c b/drivers/gpu/drm/exy=
nos/exynos_drm_fb.c
> index fc1c5608db96..b6139e179aa9 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fb.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fb.c
> =40=40 -10,17 +10,12 =40=40
> =20
>  =23include <drm/drm_atomic.h>
>  =23include <drm/drm_atomic_helper.h>
> -=23include <drm/drm_crtc.h>
>  =23include <drm/drm_framebuffer.h>
> -=23include <drm/drm_fourcc.h>
>  =23include <drm/drm_gem_framebuffer_helper.h>
> -=23include <drm/drm_probe_helper.h>
>  =23include <drm/exynos_drm.h>
> =20
> -=23include =22exynos_drm_crtc.h=22
>  =23include =22exynos_drm_drv.h=22
>  =23include =22exynos_drm_fb.h=22
> -=23include =22exynos_drm_fbdev.h=22

Please don't merge this.
This has compile error when add more devices (more than defconfig).
I'll fix and send v2.

kwang.

> =20
>  static int check_fb_gem_memory_type(struct drm_device *drm_dev,
>  				    struct exynos_drm_gem *exynos_gem)
>=20
> ---
> base-commit: 7c626ce4bae1ac14f60076d00eafe71af30450ba
> change-id: 20240813-clean_header-863930a8f82f
>=20
> Best regards,

