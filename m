Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D641E3786
	for <linux-samsung-soc@vger.kernel.org>; Thu,  7 Nov 2024 10:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730973934; cv=none; b=SNsdFsAipOXUIWoMKlrGGcATYg2gD+4dTHYQBB5uEuZ+SDBpPvEmq4dHTAbdxEa4fjrJEDKTGiOHbYiATUaObrcitBclUEztaTjsj5w6i1xrR0WAOD3pX9djgWbZ9TKMJA1493e/jUuAUa2izGBQ/i5xVWzhImlH7sdombhBCjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730973934; c=relaxed/simple;
	bh=/Oi+ZpLjDDIKP6c6WPCN/pjgWH3Suhag4PLGK+XUWTQ=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=GxqC3Pp3iZeFkDureopAYvaJH90Jcty7N49VXIh0j29aKGUi49DWwNcSjGnRUsAzH+Mlz9xOXLRVaXwr+pSxIr31EFk93ciLzwcSwpW6qEfpMu310xrwjAgVGzz3QEl4tQTmsJs6q2ULVc3WXdjzCNZHN72NVbitatvtBU/v9h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=ZRFq/DPh; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="ZRFq/DPh"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20241107100529epoutp042976ec238b7a3a0a1ec154afa1291579~Fp541SWRu2701027010epoutp04O
	for <linux-samsung-soc@vger.kernel.org>; Thu,  7 Nov 2024 10:05:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20241107100529epoutp042976ec238b7a3a0a1ec154afa1291579~Fp541SWRu2701027010epoutp04O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1730973929;
	bh=rIYoLFZYuoPP1o8+17Lvz8oGaDU+NOnh7XW8LvAKeCs=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=ZRFq/DPhPENO7rHMR6o7nQzq2JTKGiCEMPqOKco+g8l8/odCRtJywFrTpKs9ZbUBH
	 GMFzXGJ/qKIp5/t5sKdiiUowb07MsDXmPmON2Z1OH5Mi3MoJmWvzMFP4k4Iud9VCpF
	 lO3jihFhpY6TKjod3Xh97LuuYIiec1opfDMPJOa4=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTP id
	20241107100529epcas5p1f8643986d4beddd22074b8365a79013d~Fp54QB47h2004820048epcas5p1K;
	Thu,  7 Nov 2024 10:05:29 +0000 (GMT)
Received: from epsmges5p3new.samsung.com (unknown [182.195.38.183]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4Xkd47660cz4x9Q3; Thu,  7 Nov
	2024 10:05:27 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
	epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
	14.5B.09800.7E09C276; Thu,  7 Nov 2024 19:05:27 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20241107100527epcas5p1c4463accd68ba14fc7daf7acfa863251~Fp52ayVmU2004820048epcas5p1H;
	Thu,  7 Nov 2024 10:05:27 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20241107100527epsmtrp26e1b4c96b77e636b2ee4d2907f24ecc3~Fp52aDYXX1004610046epsmtrp2f;
	Thu,  7 Nov 2024 10:05:27 +0000 (GMT)
X-AuditID: b6c32a4b-4a7fa70000002648-88-672c90e78566
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	68.0C.35203.6E09C276; Thu,  7 Nov 2024 19:05:27 +0900 (KST)
Received: from INBRO002756 (unknown [107.122.12.5]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20241107100525epsmtip2f74e3889b8649206816ee0c5f54173ad~Fp505Z2J30297002970epsmtip2-;
	Thu,  7 Nov 2024 10:05:25 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Sowon Na'" <sowon.na@samsung.com>, <robh@kernel.org>,
	<krzk@kernel.org>, <conor+dt@kernel.org>, <vkoul@kernel.org>,
	<kishon@kernel.org>
Cc: <krzk+dt@kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>
In-Reply-To: <20241107041509.824457-4-sowon.na@samsung.com>
Subject: RE: [PATCH 2/3] phy: samsung-ufs: support exynosauto ufs phy driver
Date: Thu, 7 Nov 2024 15:35:23 +0530
Message-ID: <03e501db30fc$916cf390$b446dab0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIBMTEpWuihsUcp3o3pzj8nZnl7oAJHeVhLAkPeu1SyOy89cA==
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprHJsWRmVeSWpSXmKPExsWy7bCmlu7zCTrpBk+malus2XuOyWL+kXOs
	Fkdb/zNbvJx1j83i/PkN7BaXd81hs5hxfh+Txf89O9gtfv88xGSx884JZgcuj02rOtk8+ras
	YvT4vEkugDkq2yYjNTEltUghNS85PyUzL91WyTs43jne1MzAUNfQ0sJcSSEvMTfVVsnFJ0DX
	LTMH6BYlhbLEnFKgUEBicbGSvp1NUX5pSapCRn5xia1SakFKToFJgV5xYm5xaV66Xl5qiZWh
	gYGRKVBhQnbG+pczGQvWRVU8nHmCvYFxjm8XIyeHhICJxKxpt5i7GLk4hAR2M0rMXr6XDcL5
	xCjx7NYeKOcbo8Tvx3fYuxg5wFrmv3QF6RYS2Mso8ba/HKLmBaNE/xyQbk4ONgFdiR2L28Ca
	RQQmMkpsf/6XCaSZWaBWYn+nCUgNp4C1xJEztxhBbGEBH4m9T/YygdgsAioSPftOsYPYvAKW
	Es0nDrFA2IISJ2c+AbOZBbQlli18zQzxgoLEz6fLWEFsEQEniUmHvjBC1IhLvDx6hB3kBgmB
	qRwSDRubWCAaXCQWt79jhbCFJV4d38IOYUtJfH4H8YCEQLbE8YuzoOwKie7Wj1A19hI7H91k
	gfhFU2L9Ln2IXXwSvb+fMEHCh1eio00IolpVovndVait0hITu7uhtnpIHJxwl3kCo+IsJJ/N
	QvLZLCQfzEJYtoCRZRWjZGpBcW56arFpgXFeajk8upPzczcxghOqlvcOxkcPPugdYmTiYDzE
	KMHBrCTC6x+lnS7Em5JYWZValB9fVJqTWnyI0RQY3BOZpUST84EpPa8k3tDE0sDEzMzMxNLY
	zFBJnPd169wUIYH0xJLU7NTUgtQimD4mDk6pBiaRlxm27v65v9ss/S3K7B6ef364ex3PhccT
	Zs3dmX5E5hH7yofeiZleYT0z59TYB/oJJC7csJ4xYUJtBlPRfF/HXatZZVo22mZtKDyV+Dfo
	74fUl53ieqpaUdt7HfQPJ760S7nPc2zyYmcb200haqfv8E7ctOrt6k1ns9q4b2W3y1v+/HPk
	kcqL36zFqwUXPNtR9NvJNerSrAKJXaxM36VvV12VLsjwjSj4PVtdW7bk7cyeBYuE4/dzeLx3
	1JK7ei/34GVN2aL4/tMJ7icUs+LiPKftXFfsWmZxwezH8/jXa6Yv8PnWfGOt9mbWs185Oq58
	mVjrUrxQ8Mrf/cefirX8OBu/PjzoulNHbWHoul9KLMUZiYZazEXFiQDqs6eRMQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpjkeLIzCtJLcpLzFFi42LZdlhJXvf5BJ10gzlLGC3W7D3HZDH/yDlW
	i6Ot/5ktXs66x2Zx/vwGdovLu+awWcw4v4/J4v+eHewWv38eYrLYeecEswOXx6ZVnWwefVtW
	MXp83iQXwBzFZZOSmpNZllqkb5fAlbHv9y3WggMRFb++OTYwrvLuYuTgkBAwkZj/0rWLkZND
	SGA3o0T/dA4QW0JAWuL6xgnsELawxMp/z4FsLqCaZ4wSXee2MIEk2AR0JXYsbmMDSYgITGeU
	2LfmBzNIglmgkVHiYgcb3NQbT0pAbE4Ba4kjZ24xgtjCAj4Se5/sBRvEIqAi0bPvFNg2XgFL
	ieYTh1ggbEGJkzOfsEDM1JZ4evMpnL1s4WtmiOsUJH4+XcYKYosIOElMOvSFEaJGXOLl0SPs
	ExiFZyEZNQvJqFlIRs1C0rKAkWUVo2RqQXFuem6xYYFhXmq5XnFibnFpXrpecn7uJkZwVGlp
	7mDcvuqD3iFGJg7GQ4wSHMxKIrz+UdrpQrwpiZVVqUX58UWlOanFhxilOViUxHnFX/SmCAmk
	J5akZqemFqQWwWSZODilGpj8d8U4z9tZvv+D1ZZPFZnyZt6X2TatU4x4oHXleE/E5BV9VQpO
	bVEfuVa9bFdU728NTGH975paKZxhXiF67aPjmtdf29QfLQ822VMq/i99Z5ajRIuKq19lSHyG
	u/kDmYIFSz4Ub6o9IRz8OrFx75YHC56dWhbEXT/LINBSVyjvjO6On/KVR68ffsdzudFypUh0
	VPHCCQWqHKe8crj+eD9bsfJwotoEnXgtF/bavlsSO/xVTfreX87MOFzzY2HF249mEvPMa6p6
	GM7/djwqeDq08lLIKuk/H1+pCM5oiH18edmGG43psns0gvSn90VcSGzQ6N/HkVweMmXOmfCq
	Z0vfKe2sORPY4H5q64qLm5RYijMSDbWYi4oTAfbdo4MZAwAA
X-CMS-MailID: 20241107100527epcas5p1c4463accd68ba14fc7daf7acfa863251
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241107041511epcas2p295c24724f736363ef8a765a165979bca
References: <20241107041509.824457-1-sowon.na@samsung.com>
	<CGME20241107041511epcas2p295c24724f736363ef8a765a165979bca@epcas2p2.samsung.com>
	<20241107041509.824457-4-sowon.na@samsung.com>

Hello Sowon

> -----Original Message-----
> From: Sowon Na <sowon.na=40samsung.com>
> Sent: Thursday, November 7, 2024 9:45 AM
> To: robh=40kernel.org; krzk=40kernel.org; conor+dt=40kernel.org;
> vkoul=40kernel.org; alim.akhtar=40samsung.com; kishon=40kernel.org
> Cc: krzk+dt=40kernel.org; linux-kernel=40vger.kernel.org;
> devicetree=40vger.kernel.org; linux-samsung-soc=40vger.kernel.org;
> sowon.na=40samsung.com
> Subject: =5BPATCH 2/3=5D phy: samsung-ufs: support exynosauto ufs phy dri=
ver
>=20
s/exynosauto/ exynosautov920
let's be specific as we have v9 variant as well.

> Support phy-exynosautov920-ufs driver for ExynosAutov920 series SoCs,
> using =22samsung,exynosautov920-ufs-phy=22 compatible.
>=20
s/ ExynosAutov920/ exynosautov920
May be just: Add support for exynosautov920 ufs phy driver

using =22samsung,exynosautov920-ufs-phy=22 compatible is obvious

> Signed-off-by: Sowon Na <sowon.na=40samsung.com>
> ---
>  drivers/phy/samsung/Makefile                 =7C   1 +
>  drivers/phy/samsung/phy-exynosautov920-ufs.c =7C 159
> +++++++++++++++++++
>  drivers/phy/samsung/phy-samsung-ufs.c        =7C   9 +-
>  drivers/phy/samsung/phy-samsung-ufs.h        =7C   4 +
>  4 files changed, 170 insertions(+), 3 deletions(-)  create mode 100644
> drivers/phy/samsung/phy-exynosautov920-ufs.c
>=20
> diff --git a/drivers/phy/samsung/Makefile b/drivers/phy/samsung/Makefile
> index fea1f96d0e43..342682638a87 100644
> --- a/drivers/phy/samsung/Makefile
> +++ b/drivers/phy/samsung/Makefile
> =40=40 -7,6 +7,7 =40=40 phy-exynos-ufs-y			+=3D phy-gs101-ufs.o
>  phy-exynos-ufs-y			+=3D phy-samsung-ufs.o
>  phy-exynos-ufs-y			+=3D phy-exynos7-ufs.o
>  phy-exynos-ufs-y			+=3D phy-exynosautov9-ufs.o
> +phy-exynos-ufs-y			+=3D phy-exynosautov920-ufs.o
>  phy-exynos-ufs-y			+=3D phy-fsd-ufs.o
>  obj-=24(CONFIG_PHY_SAMSUNG_USB2)		+=3D phy-exynos-
> usb2.o
>  phy-exynos-usb2-y			+=3D phy-samsung-usb2.o
> diff --git a/drivers/phy/samsung/phy-exynosautov920-ufs.c
> b/drivers/phy/samsung/phy-exynosautov920-ufs.c
> new file mode 100644
> index 000000000000..8f4a94e13781
> --- /dev/null
> +++ b/drivers/phy/samsung/phy-exynosautov920-ufs.c
> =40=40 -0,0 +1,159 =40=40
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * UFS PHY driver data for Samsung EXYNOSAUTO v920 SoC
Let be consistent with the naming, may be EXYNOSAUTOV920

> + *
> + * Copyright (C) 2024 Samsung Electronics Co., Ltd.
> + */
> +
> +=23include =22phy-samsung-ufs.h=22
> +
> +=23define EXYNOSAUTOV920_EMBEDDED_COMBO_PHY_CTRL
> 	0x708
> +=23define EXYNOSAUTOV920_EMBEDDED_COMBO_PHY_CTRL_MASK
> 	0x1
> +=23define EXYNOSAUTOV920_EMBEDDED_COMBO_PHY_CTRL_EN
> 	BIT(0)
> +=23define EXYNOSAUTOV920_EMBEDDED_COMBO_PHY_CDR_LOCK_STATUS
> 	0x5e
> +
> +=23define PHY_TRSV_REG_CFG_AUTOV920(o, v, d) =5C
> +	PHY_TRSV_REG_CFG_OFFSET(o, v, d, 0x200)
No magic number please, add a macro for 0x200
May be PHY_EXYNOSAUTOV920_LANE_OFFSET

> +
> +/* Calibration for phy initialization */ static const struct
> +samsung_ufs_phy_cfg exynosautov920_pre_init_cfg=5B=5D =3D =7B
> +	PHY_COMN_REG_CFG(0x29, 0x22, PWR_MODE_ANY),
> +	PHY_COMN_REG_CFG(0x43, 0x10, PWR_MODE_ANY),
> +	PHY_COMN_REG_CFG(0x3C, 0x14, PWR_MODE_ANY),
> +	PHY_COMN_REG_CFG(0x46, 0x48, PWR_MODE_ANY),
> +	PHY_COMN_REG_CFG(0x04, 0x95, PWR_MODE_ANY),
> +	PHY_COMN_REG_CFG(0x06, 0x30, PWR_MODE_ANY),
> +
> +	PHY_TRSV_REG_CFG_AUTOV920(0x200, 0x00, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x201, 0x06, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x202, 0x06, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x203, 0x0A, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x204, 0x00, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x205, 0x10, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x207, 0x0C, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x2E1, 0xC0, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x22D, 0xF8, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x234, 0x60, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x238, 0x13, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x239, 0x48, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x23A, 0x01, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x23B, 0x29, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x23C, 0x2A, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x23D, 0x01, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x23E, 0x14, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x23F, 0x13, PWR_MODE_ANY),
> +
> +	PHY_TRSV_REG_CFG_AUTOV920(0x240, 0x4A, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x243, 0x40, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x244, 0x02, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x25D, 0x00, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x25E, 0x3F, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x25F, 0xFF, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x26F, 0xF0, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x273, 0x33, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x274, 0x50, PWR_MODE_ANY),
> +
> +	PHY_TRSV_REG_CFG_AUTOV920(0x284, 0x02, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x285, 0x02, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x2A2, 0x04, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x27D, 0x01, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x2FA, 0x01, PWR_MODE_ANY),
> +
> +	PHY_TRSV_REG_CFG_AUTOV920(0x286, 0x03, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x287, 0x03, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x288, 0x03, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x289, 0x03, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x2B3, 0x04, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x2B6, 0x0B, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x2B7, 0x0B, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x2B8, 0x0B, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x2B9, 0x0B, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x2BA, 0x0B, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x2BB, 0x06, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x2BC, 0x06, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x2BD, 0x06, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x2BE, 0x06, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x34B, 0x01, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x34C, 0x24, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x34D, 0x23, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x34E, 0x45, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x34F, 0x00, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x350, 0x31, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x351, 0x00, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x352, 0x02, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x353, 0x00, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x354, 0x01, PWR_MODE_ANY),
> +
> +	PHY_COMN_REG_CFG(0x43, 0x18, PWR_MODE_ANY),
> +	PHY_COMN_REG_CFG(0x43, 0x00, PWR_MODE_ANY),
> +
> +	END_UFS_PHY_CFG,
> +=7D;
> +
> +/* Calibration for HS mode series A/B */ static const struct
> +samsung_ufs_phy_cfg exynosautov920_pre_pwr_hs_cfg=5B=5D =3D =7B
> +	PHY_TRSV_REG_CFG_AUTOV920(0x369, 0x11, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x246, 0x03, PWR_MODE_ANY),
> +
> +	END_UFS_PHY_CFG,
> +=7D;
> +
> +static const struct samsung_ufs_phy_cfg
> exynosautov920_post_pwr_hs_cfg=5B=5D =3D =7B
> +	END_UFS_PHY_CFG,
> +=7D;
> +
> +=23define DELAY_IN_US	40
> +=23define RETRY_CNT	100
> +=23define MASK		0x8
> +int samsung_ufs_phy_wait_cdr_lock(struct phy *phy, u8 lane) =7B
This is specific to v920, so rename the function as exynosautov920_ufs_*

> +	struct samsung_ufs_phy *ufs_phy =3D get_samsung_ufs_phy(phy);
> +	u32 reg, i;
> +
> +	struct samsung_ufs_phy_cfg cfg=5B4=5D =3D =7B
> +		PHY_TRSV_REG_CFG_AUTOV920(0x222, 0x10,
> PWR_MODE_ANY),
> +		PHY_TRSV_REG_CFG_AUTOV920(0x222, 0x18,
> PWR_MODE_ANY),
> +		PHY_TRSV_REG_CFG_AUTOV920(0x246, 0x01,
> PWR_MODE_ANY),
> +		END_UFS_PHY_CFG,
> +	=7D;
> +
> +	for (i =3D 0; i < RETRY_CNT; i++) =7B
> +		udelay(DELAY_IN_US);
> +
> +		reg =3D readl(ufs_phy->reg_pma + 0xCE4 + (0x800 * lane));
Please have macro for the offsets

> +		if ((reg & MASK) =3D=3D MASK)
MASK is very generic, can we have some meaningful name for better readabili=
ty and understanding

> +			break;

How you are handling error here, what will happen if CDR lock fails?

> +
> +		udelay(DELAY_IN_US);
> +
> +		samsung_ufs_phy_config(ufs_phy, &cfg=5B0=5D, lane);
> +		samsung_ufs_phy_config(ufs_phy, &cfg=5B1=5D, lane);
> +	=7D
> +
> +	samsung_ufs_phy_config(ufs_phy, &cfg=5B2=5D, lane);
> +
> +	return 0;
> +=7D
> +
> +static const struct samsung_ufs_phy_cfg
> *exynosautov920_ufs_phy_cfgs=5BCFG_TAG_MAX=5D =3D =7B
> +	=5BCFG_PRE_INIT=5D          =3D exynosautov920_pre_init_cfg,
> +	=5BCFG_PRE_PWR_HS=5D        =3D exynosautov920_pre_pwr_hs_cfg,
> +	=5BCFG_POST_PWR_HS=5D       =3D exynosautov920_post_pwr_hs_cfg,
> +=7D;
> +
> +static const char * const exynosautov920_ufs_phy_clks=5B=5D =3D =7B
> +	=22ref_clk=22,
> +=7D;
> +
> +const struct samsung_ufs_phy_drvdata exynosautov920_ufs_phy =3D =7B
> +	.cfgs =3D exynosautov920_ufs_phy_cfgs,
> +	.isol =3D =7B
> +		.offset =3D EXYNOSAUTOV920_EMBEDDED_COMBO_PHY_CTRL,
> +		.mask =3D
> EXYNOSAUTOV920_EMBEDDED_COMBO_PHY_CTRL_MASK,
> +		.en =3D
> EXYNOSAUTOV920_EMBEDDED_COMBO_PHY_CTRL_EN,
> +	=7D,
> +	.clk_list =3D exynosautov920_ufs_phy_clks,
> +	.num_clks =3D ARRAY_SIZE(exynosautov920_ufs_phy_clks),
> +	.cdr_lock_status_offset =3D
> EXYNOSAUTOV920_EMBEDDED_COMBO_PHY_CDR_LOCK_STATUS,
> +	.wait_for_cdr =3D samsung_ufs_phy_wait_cdr_lock, =7D;
> diff --git a/drivers/phy/samsung/phy-samsung-ufs.c
> b/drivers/phy/samsung/phy-samsung-ufs.c
> index 6c5d41552649..c13fe149bc75 100644
> --- a/drivers/phy/samsung/phy-samsung-ufs.c
> +++ b/drivers/phy/samsung/phy-samsung-ufs.c
> =40=40 -28,9 +28,9 =40=40
>=20
>  =23define PHY_DEF_LANE_CNT	1
>=20
> -static void samsung_ufs_phy_config(struct samsung_ufs_phy *phy,
> -				   const struct samsung_ufs_phy_cfg *cfg,
> -				   u8 lane)
> +void samsung_ufs_phy_config(struct samsung_ufs_phy *phy,
> +			    const struct samsung_ufs_phy_cfg *cfg,
> +			    u8 lane)
>  =7B
>  	enum =7BLANE_0, LANE_1=7D; /* lane index */
>=20
> =40=40 -323,6 +323,9 =40=40 static const struct of_device_id
> samsung_ufs_phy_match=5B=5D =3D =7B
>  	=7D, =7B
>  		.compatible =3D =22samsung,exynosautov9-ufs-phy=22,
>  		.data =3D &exynosautov9_ufs_phy,
> +	=7D, =7B
> +		.compatible =3D =22samsung,exynosautov920-ufs-phy=22,
> +		.data =3D &exynosautov920_ufs_phy,
>  	=7D, =7B
>  		.compatible =3D =22tesla,fsd-ufs-phy=22,
>  		.data =3D &fsd_ufs_phy,
> diff --git a/drivers/phy/samsung/phy-samsung-ufs.h
> b/drivers/phy/samsung/phy-samsung-ufs.h
> index 9b7deef6e10f..b7a8ec6bcafa 100644
> --- a/drivers/phy/samsung/phy-samsung-ufs.h
> +++ b/drivers/phy/samsung/phy-samsung-ufs.h
> =40=40 -143,9 +143,13 =40=40 static inline void samsung_ufs_phy_ctrl_isol=
(  =7D
>=20
>  int samsung_ufs_phy_wait_for_lock_acq(struct phy *phy, u8 lane);
> +int samsung_ufs_phy_wait_cdr_lock(struct phy *phy, u8 lane); void
> +samsung_ufs_phy_config(struct samsung_ufs_phy *phy,
> +			    const struct samsung_ufs_phy_cfg *cfg, u8 lane);
>=20
>  extern const struct samsung_ufs_phy_drvdata exynos7_ufs_phy;  extern
> const struct samsung_ufs_phy_drvdata exynosautov9_ufs_phy;
> +extern const struct samsung_ufs_phy_drvdata exynosautov920_ufs_phy;
>  extern const struct samsung_ufs_phy_drvdata fsd_ufs_phy;  extern const
> struct samsung_ufs_phy_drvdata tensor_gs101_ufs_phy;
>=20
> --
> 2.45.2


