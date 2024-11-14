Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7279F183088
	for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Nov 2024 16:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731602932; cv=none; b=Tw25qxnkiGeUjvm4bsVcv43RxYACEg2sN8nfBXcg4i78M9t84uRdLm82oMLXXp+jTnIrRAjd7zqtACs8q5ASCm0PMStVu7yK0wDyapN7ziTzOhVyqBT6+RJgE2hjuJC/kg+CogbEIr0lB0ItN+dQZZgIV+R6muI5r0l7V5HqSpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731602932; c=relaxed/simple;
	bh=iVAuHwEvYHRGFLq6UP/6fBhgK61F16r81OYfcswiy5Q=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=gZ582UhtirB/Gv0petoYMVlqzj0bZBJMd+z8ejE5npt4kb9f6rkzDwRB5M4ulO4ouoBSnFF1yrYrHelNrXHHGUmeVJM1s65XnAUdk83r85Ns9RlHR7jxwFgJowbxTJf4r2apuj24Mb8W2ADYII2muhqybRblKdy64BvbQqssAwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=WeTCr9fS; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="WeTCr9fS"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20241114164845epoutp04e24ed11e3c01b60db3d796dae9e0d1d7~H46_0dTGS3125231252epoutp04t
	for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Nov 2024 16:48:45 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20241114164845epoutp04e24ed11e3c01b60db3d796dae9e0d1d7~H46_0dTGS3125231252epoutp04t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1731602925;
	bh=kWXB9oKDYsUpW6lyQBH9mmUNxbs0n3Y2nAdUkH4HK/w=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=WeTCr9fSjASyQX0cAtku0nUWcf7yx6DuZXwcYEs/R8R0VpdKzEyUxfn+EioBFSSPs
	 kjO0O2UeAUYQXGGuCNZl2vckQk09L3B2+wuUhMyDVLqgspzGkmnT7t85Fvu2W2GPIK
	 6InX9tlOU24YNb1vNSJNl7VxewbRNJBQLcgOiD68=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTP id
	20241114164844epcas5p32d85501d68a2b5af8264223ee1d4519c~H4695RSJL2244822448epcas5p3C;
	Thu, 14 Nov 2024 16:48:44 +0000 (GMT)
Received: from epsmges5p2new.samsung.com (unknown [182.195.38.181]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4Xq5hB6xcZz4x9Pr; Thu, 14 Nov
	2024 16:48:42 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
	epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	79.13.09770.AE926376; Fri, 15 Nov 2024 01:48:42 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20241114164841epcas5p2e2151f7dc7af4dc76bac51cd32b871ce~H467RCHhW2928029280epcas5p29;
	Thu, 14 Nov 2024 16:48:41 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20241114164841epsmtrp1e459c560ca32a682360093042bd9b2bf~H467QOJpU3065230652epsmtrp1S;
	Thu, 14 Nov 2024 16:48:41 +0000 (GMT)
X-AuditID: b6c32a4a-e25fa7000000262a-d3-673629ea9ca5
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	7C.90.19220.9E926376; Fri, 15 Nov 2024 01:48:41 +0900 (KST)
Received: from INBRO002756 (unknown [107.122.12.5]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20241114164840epsmtip23b71f70a4ec4e7b339188fcbf234ac77~H465vHhEE0030800308epsmtip2c;
	Thu, 14 Nov 2024 16:48:39 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Sowon Na'" <sowon.na@samsung.com>, <robh@kernel.org>,
	<krzk@kernel.org>, <conor+dt@kernel.org>, <vkoul@kernel.org>,
	<kishon@kernel.org>
Cc: <krzk+dt@kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>
In-Reply-To: <20241111043306.1250488-3-sowon.na@samsung.com>
Subject: RE: [PATCH v2 2/3] phy: samsung-ufs: support ExynosAutov920 ufs phy
 driver
Date: Thu, 14 Nov 2024 22:18:38 +0530
Message-ID: <000001db36b5$0f6ca340$2e45e9c0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQFF3ELnMdop3R8tRxDPdVSUDoSdOAHrvEIhAhaBQVqzwZ1GIA==
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprPJsWRmVeSWpSXmKPExsWy7bCmhu4rTbN0gzMXTCzW7D3HZDH/yDlW
	i6Ot/5ktXs66x2Zx/vwGdovLu+awWcw4v4/J4v+eHewWv38eYrLYeecEswOXx6ZVnWwefVtW
	MXp83iQXwByVbZORmpiSWqSQmpecn5KZl26r5B0c7xxvamZgqGtoaWGupJCXmJtqq+TiE6Dr
	lpkDdIuSQlliTilQKCCxuFhJ386mKL+0JFUhI7+4xFYptSAlp8CkQK84Mbe4NC9dLy+1xMrQ
	wMDIFKgwITtj98+TLAVLoioWHv3B0sA417eLkZNDQsBE4tu0H2wgtpDAbkaJzm0cXYxcQPYn
	Roltc+cwQjjfGCU27F/ODNPx+e5NNojEXkaJk3/eQjkvGCXO/57ADlLFJqArsWNxG1hCRGAi
	o8T253+Zuhg5OJgFaiX2d5qA1HAK2Ej8PrkIrF5YIFTi+5L/TCA2i4CqxJ9HB1lAbF4BS4kf
	E44zQdiCEidnPgGLMwtoSyxb+BrqIgWJn0+XsYLYIgJOEqumroOqEZd4efQIO8gNEgJzOSQO
	ftvPCtHgIvF/4hGoZmGJV8e3sEPYUhIv+9ug7GyJ4xdnsUHYFRLdrR+h4vYSOx/dZIH4RVNi
	/S59iF18Er2/n4C9KCHAK9HRJgRRrSrR/O4qC4QtLTGxuxvqAg+Jk5/OsU9gVJyF5LNZSD6b
	heSDWQjLFjCyrGKUTC0ozk1PLTYtMMpLLYfHd3J+7iZGcErV8trB+PDBB71DjEwcjIcYJTiY
	lUR4TzkbpwvxpiRWVqUW5ccXleakFh9iNAUG90RmKdHkfGBSzyuJNzSxNDAxMzMzsTQ2M1QS
	533dOjdFSCA9sSQ1OzW1ILUIpo+Jg1OqgSlv946JYW1+7QxHfHe7Xz870yVoQa7uRp8UHdGK
	mZs4ldZu+OD9+sSuFwn3OaLNa98+mmVbrMXjrFF/K1v7rsqTHt/bpywnBDiol75f8jp/mb9e
	xho3nTNVyzKWTPUoaA5trNzO+F/Rwb15rpPvav6PPWd4H8fMVZJdnjen72qO55dreWEdLtM6
	tvap/nefVS4jsInjiKUjV6NlXEDh8shHZ49U8N5caG9mdspX+I+o53NZDquNuRVVmuo9Agtb
	Uj/cXd96fYplZrLQPBeriXOjHoS8KeWN35atz5fwXG5dfPuPUP6CXesZDOzrTr4Jnnhi6bpF
	57pP5fu3HuCb8H1yjOHa1fO+P59lsTXAT4mlOCPRUIu5qDgRACewPu4yBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkkeLIzCtJLcpLzFFi42LZdlhJXvelplm6wY75ihZr9p5jsph/5Byr
	xdHW/8wWL2fdY7M4f34Du8XlXXPYLGac38dk8X/PDnaL3z8PMVnsvHOC2YHLY9OqTjaPvi2r
	GD0+b5ILYI7isklJzcksSy3St0vgyrhydTJLwZqIiqt7HjM1MC707mLk5JAQMJH4fPcmWxcj
	F4eQwG5GiePLTzJCJKQlrm+cwA5hC0us/PecHaLoGaPE/fO/wYrYBHQldixuA+sWEZjOKLFv
	zQ9mkASzQCOjxMUOqLF7GSXOv3oL1sEpYCPx++QioFEcHMICwRLP3zqChFkEVCX+PDrIAmLz
	ClhK/JhwnAnCFpQ4OfMJC8RMbYmnN5/C2csWvmaGuE5B4ufTZawgtoiAk8SqqeugasQlXh49
	wj6BUXgWklGzkIyahWTULCQtCxhZVjFKphYU56bnFhsWGOWllusVJ+YWl+al6yXn525iBMeW
	ltYOxj2rPugdYmTiYDzEKMHBrCTCe8rZOF2INyWxsiq1KD++qDQntfgQozQHi5I477fXvSlC
	AumJJanZqakFqUUwWSYOTqkGJosGEw/bZRPOq1zeX1ttkvO05UnszYkHtdxnXZ+ZJ2ovOGOT
	whX7c+9CP3ALFC2fuNNvTstR9fWm/a9bji2vUeVVDY7mm73urUrlDIbnb2+9u8uTk8a5k1ls
	gf48S56u0iuhGaYx8/Z82an6YqKt+smPC1OOuhtcK4+U+KenXJ5w97DKlnYrxXusJRftnr2z
	ObLx9rwj2vayyfOacrj7284X7LgoPWf69XLljxcT3/duNd8Roj5N6+61ib4NVq7vHYXmRDuv
	PfPSuKrMsqXswvZNH8VZsqU+/WHxL7zFvkuT4djOPbElBtUiZz5v+BZb2XjtuMjXylM7azfP
	EH+nOkv431Xjpj/RDiHFz128JiqxFGckGmoxFxUnAgAWts28HAMAAA==
X-CMS-MailID: 20241114164841epcas5p2e2151f7dc7af4dc76bac51cd32b871ce
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241111043317epcas2p1fbabc25054bd345de15565982325c400
References: <20241111043306.1250488-1-sowon.na@samsung.com>
	<CGME20241111043317epcas2p1fbabc25054bd345de15565982325c400@epcas2p1.samsung.com>
	<20241111043306.1250488-3-sowon.na@samsung.com>



> -----Original Message-----
> From: Sowon Na <sowon.na=40samsung.com>
> Sent: Monday, November 11, 2024 10:03 AM
> To: robh=40kernel.org; krzk=40kernel.org; conor+dt=40kernel.org;
> vkoul=40kernel.org; alim.akhtar=40samsung.com; kishon=40kernel.org
> Cc: krzk+dt=40kernel.org; linux-kernel=40vger.kernel.org;
> devicetree=40vger.kernel.org; linux-samsung-soc=40vger.kernel.org;
> sowon.na=40samsung.com
> Subject: =5BPATCH v2 2/3=5D phy: samsung-ufs: support ExynosAutov920 ufs =
phy
> driver
>=20
> Add support for ExynosAutov920 ufs phy driver.
>=20
> Signed-off-by: Sowon Na <sowon.na=40samsung.com>
> ---
>  drivers/phy/samsung/Makefile                 =7C   1 +
>  drivers/phy/samsung/phy-exynosautov920-ufs.c =7C 170 +++++++++++++++++++
>  drivers/phy/samsung/phy-samsung-ufs.c        =7C   9 +-
>  drivers/phy/samsung/phy-samsung-ufs.h        =7C   4 +
>  4 files changed, 181 insertions(+), 3 deletions(-)  create mode 100644
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
>  obj-=24(CONFIG_PHY_SAMSUNG_USB2)		+=3D phy-exynos-usb2.o
>  phy-exynos-usb2-y			+=3D phy-samsung-usb2.o
> diff --git a/drivers/phy/samsung/phy-exynosautov920-ufs.c
> b/drivers/phy/samsung/phy-exynosautov920-ufs.c
> new file mode 100644
> index 000000000000..f00f82132921
> --- /dev/null
> +++ b/drivers/phy/samsung/phy-exynosautov920-ufs.c
> =40=40 -0,0 +1,170 =40=40
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * UFS PHY driver data for Samsung ExynosAuto v920 SoC
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
> +=23define EXYNOSAUTOV920_CDR_LOCK_OFFSET				0xCE4
> +
> +=23define PHY_EXYNOSAUTOV920_LANE_OFFSET				0x200
> +=23define PHY_TRSV_REG_CFG_AUTOV920(o, v, d) =5C
> +	PHY_TRSV_REG_CFG_OFFSET(o, v, d,
> PHY_EXYNOSAUTOV920_LANE_OFFSET)
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
> +static const struct samsung_ufs_phy_cfg exynosautov920_post_pwr_hs_cfg=
=5B=5D
> =3D =7B
> +	END_UFS_PHY_CFG,
> +=7D;
> +
> +=23define DELAY_IN_US	40
> +=23define RETRY_CNT	100
> +=23define EXYNOSAUTOV920_CDR_LOCK_MASK	0x8
> +int samsung_exynosautov920_ufs_phy_wait_cdr_lock(struct phy *phy, u8
Just =22exynosautov920_ufs_phy_wait_cdr_lock=22, without samsung_

> +lane) =7B
> +	struct samsung_ufs_phy *ufs_phy =3D get_samsung_ufs_phy(phy);
> +	int ret =3D 0;
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
> +		reg =3D readl(ufs_phy->reg_pma +
> EXYNOSAUTOV920_CDR_LOCK_OFFSET +
> +
> 	(PHY_APB_ADDR(PHY_EXYNOSAUTOV920_LANE_OFFSET) * lane));
> +		if ((reg & EXYNOSAUTOV920_CDR_LOCK_MASK)
> +					=3D=3D
> EXYNOSAUTOV920_CDR_LOCK_MASK)
> +			break;=20
Probably you can just return success from here.

> +
> +		udelay(DELAY_IN_US);
> +
> +		samsung_ufs_phy_config(ufs_phy, &cfg=5B0=5D, lane);
> +		samsung_ufs_phy_config(ufs_phy, &cfg=5B1=5D, lane);
> +	=7D
> +
> +	samsung_ufs_phy_config(ufs_phy, &cfg=5B2=5D, lane);
Why this is needed? Please write a line or two about this.

> +
> +	if (i >=3D RETRY_CNT) =7B
This become reductant, once you return from for loop above.

> +		dev_err(ufs_phy->dev, =22failed to get phy cdr lock=5Cn=22);
> +		ret =3D -ETIMEDOUT;
> +	=7D
> +
> +	return ret;
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
> +		.en =3D EXYNOSAUTOV920_EMBEDDED_COMBO_PHY_CTRL_EN,
> +	=7D,
> +	.clk_list =3D exynosautov920_ufs_phy_clks,
> +	.num_clks =3D ARRAY_SIZE(exynosautov920_ufs_phy_clks),
> +	.cdr_lock_status_offset =3D
> EXYNOSAUTOV920_EMBEDDED_COMBO_PHY_CDR_LOCK_STATUS,
> +	.wait_for_cdr =3D samsung_exynosautov920_ufs_phy_wait_cdr_lock,
> +=7D;
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
> index 9b7deef6e10f..7f759141ee87 100644
> --- a/drivers/phy/samsung/phy-samsung-ufs.h
> +++ b/drivers/phy/samsung/phy-samsung-ufs.h
> =40=40 -143,9 +143,13 =40=40 static inline void samsung_ufs_phy_ctrl_isol=
(  =7D
>=20
>  int samsung_ufs_phy_wait_for_lock_acq(struct phy *phy, u8 lane);
> +int samsung_exynosautov920_ufs_phy_wait_cdr_lock(struct phy *phy, u8
> +lane); void samsung_ufs_phy_config(struct samsung_ufs_phy *phy,
> +			    const struct samsung_ufs_phy_cfg *cfg, u8 lane);
>=20
>  extern const struct samsung_ufs_phy_drvdata exynos7_ufs_phy;  extern con=
st
> struct samsung_ufs_phy_drvdata exynosautov9_ufs_phy;
> +extern const struct samsung_ufs_phy_drvdata exynosautov920_ufs_phy;
>  extern const struct samsung_ufs_phy_drvdata fsd_ufs_phy;  extern const s=
truct
> samsung_ufs_phy_drvdata tensor_gs101_ufs_phy;
>=20
> --
> 2.45.2


