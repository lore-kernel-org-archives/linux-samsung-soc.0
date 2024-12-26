Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB2243AB9
	for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Dec 2024 02:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735179168; cv=none; b=OA0t7w+9CuNTpMmCFwrJsVq95sIAvZ9+nA0R5ooNvVF6JCiaCLo8WGRvkCvxQTdHFHg9KxvI+83rZJ7VZG7Z5Krm9xGXAi830DcHtuQkRrUupe6fw6AQzuPjmhNljkGjXUiDcsHVxthZC7GfKfmCmu0i8j6ir23kXFL6PrlSnfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735179168; c=relaxed/simple;
	bh=OEGBSbZrbOSiaQrSKAnXou93pwWs9DFBFw5DLOHm3Ko=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=Ez6zhuqTSHIvxZ3URE3TLw54b7dhzBTE9+4mz3uyxkLh7SX9oc1jJt2k0+Jh1ON2D5COWAlLdsAX1aat+uMoIWc+YwMamqaqCUq3DE3zHxcYgFUGhlXAWuwXqd4oOM5l2tlUCnaZM2wZFLlttDxILruStD5YdkiiNq3LTws8Nfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=gWz8m/hp; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="gWz8m/hp"
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20241226021238epoutp03f2a4e4de610a44f20e07b51c9bd056b6~UmEA6wOhc0651306513epoutp03p
	for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Dec 2024 02:12:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20241226021238epoutp03f2a4e4de610a44f20e07b51c9bd056b6~UmEA6wOhc0651306513epoutp03p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1735179158;
	bh=mCLBX3yYlQUjcy6D9IYd/cYmF0DduU4vDG1fd6q4kGw=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=gWz8m/hp6MhphuVx5o6w1v8+RLeB51TgemibRT/KTgrNuaAFY1+y09z6VV+cKWyxk
	 DrPAmQUWGcHK7nOgQbqEnQR+E2Uyr42hA08RWTyu32AUEPbcY7S1tNPdoHGH/0m/gY
	 0scHOaPmcb1g2NmdtVyICWAqmA5hoyXal2MHGLWE=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTP id
	20241226021237epcas2p3e75c8166f4a38ba5b7b4f5dc2405188e~UmEAabAmT1507915079epcas2p3W;
	Thu, 26 Dec 2024 02:12:37 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.102]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4YJXFw4vQwz4x9QK; Thu, 26 Dec
	2024 02:12:36 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
	epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	44.E2.23368.49BBC676; Thu, 26 Dec 2024 11:12:36 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20241226021236epcas2p443c80bf439b6d3a7bd2ce774301c92b7~UmD-OBL6Q1936919369epcas2p44;
	Thu, 26 Dec 2024 02:12:36 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20241226021236epsmtrp232287a47b44aa9c5d3c84a1908a6fad9~UmD-NLfoD1953319533epsmtrp2f;
	Thu, 26 Dec 2024 02:12:36 +0000 (GMT)
X-AuditID: b6c32a45-db1ed70000005b48-f9-676cbb94ec33
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	75.85.18729.49BBC676; Thu, 26 Dec 2024 11:12:36 +0900 (KST)
Received: from KORCO078619 (unknown [10.229.8.183]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20241226021235epsmtip20c8bba929114b6aaffa8ae79b0cfde53~UmD_3z5Mz2579625796epsmtip2W;
	Thu, 26 Dec 2024 02:12:35 +0000 (GMT)
From: =?ks_c_5601-1987?B?s6q80r/4L1NPV09OIE5B?= <sowon.na@samsung.com>
To: "'Vinod Koul'" <vkoul@kernel.org>
Cc: <robh@kernel.org>, <krzk@kernel.org>, <conor+dt@kernel.org>,
	<alim.akhtar@samsung.com>, <kishon@kernel.org>, <krzk+dt@kernel.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-samsung-soc@vger.kernel.org>
In-Reply-To: <Z2rMI0RWvV5FAN+q@vaman>
Subject: RE: [PATCH v3 2/3] phy: samsung-ufs: support ExynosAutov920 ufs phy
 driver
Date: Thu, 26 Dec 2024 11:12:35 +0900
Message-ID: <000001db573b$a1632d40$e42987c0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="ks_c_5601-1987"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQKN54LK9wdlweRKh/1XLNX4aAwNFgJqmbyrAh6osHkB8ZeHD7Fe0F2w
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprDJsWRmVeSWpSXmKPExsWy7bCmme6U3TnpBoufKVs8mLeNzWLN3nNM
	FvOPnGO1ONr6n9ni5ax7bBbnz29gt7i8aw6bxYzz+5gs/u/ZwW6x884JZgcuj02rOtk8+ras
	YvT4vEkugDkq2yYjNTEltUghNS85PyUzL91WyTs43jne1MzAUNfQ0sJcSSEvMTfVVsnFJ0DX
	LTMH6BYlhbLEnFKgUEBicbGSvp1NUX5pSapCRn5xia1SakFKToF5gV5xYm5xaV66Xl5qiZWh
	gYGRKVBhQnZG36J7jAVHoyrevt/C3sB42buLkZNDQsBE4uHxb6xdjFwcQgI7GCVapq9mgnA+
	MUosPrGODcL5xijxZ+0axi5GDrCWt3OVIOJ7GSUajv+B6njBKPFj50ZmkLlsAm4Sv/9OYAWx
	RQRUJbY8eQA2iVngHaNE37lnjCAJTqBEz6xb7CBThQVCJRofmoGEWYDCtxZtA5vDK2ApcW1J
	BxOELShxcuYTFhCbWcBIYsnq+UwQtrzE9rdzmCH+UZD4+XQZK8hIEaAb5syrhSgRkZjd2cYM
	coKEwBYOibZJ31kg6l0k7rX8geoVlnh1fAs7hC0l8fndXjYIO19i/cO7UHaFxN1D/6F67SUW
	nfnJDgkUZYkjt6BO45PoOPwXKswr0dEmBFGtJNFxfg4ThC0hserFZLYJjEqzkDw2C8ljs5A8
	NgvJBwsYWVYxiqUWFOempxYbFRjCIzs5P3cTIziZarnuYJz89oPeIUYmDsZDjBIczEoivIeE
	MtOFeFMSK6tSi/Lji0pzUosPMZoCw3ois5Rocj4wneeVxBuaWBqYmJkZmhuZGpgrifPea52b
	IiSQnliSmp2aWpBaBNPHxMEp1cC0/uK3WSebO9d+23HoozHPMb7dC+dZH70hZ59rc3jt1hlF
	yxxC+1xjA3drdFzZEqNv5Nyv3cnpVlD/RWRye8LcFFON77O7z+rIP5ybWfKTa4nz7+6rXrd6
	3nJ/ZFikuPIDa57xdt2tmUv99vwVS+15WH3mZkm6cph8YujvUCXGPPcnuiF5O3zvvC7Ze6fp
	o/nNKbJlT0/8C7BivGfxMOfL+5OFu6I/P2L6slxPY6m27LX8SS8eCnC8EXrxLUpp4yPNQ6sm
	SMlYNzDLV3qs79kqG17hxpp33Lf68VulWzszBI1SU3pY1cykvU7Ni1BoP2klbnh4g+7x5wHn
	Hk8U/+nXfeud88J7LDypRfOOsF9XYinOSDTUYi4qTgQAJ5HJQC8EAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprPIsWRmVeSWpSXmKPExsWy7bCSvO6U3TnpBjMWclg8mLeNzWLN3nNM
	FvOPnGO1ONr6n9ni5ax7bBbnz29gt7i8aw6bxYzz+5gs/u/ZwW6x884JZgcuj02rOtk8+ras
	YvT4vEkugDmKyyYlNSezLLVI3y6BK6Nv0T3GgqNRFW/fb2FvYLzs3cXIwSEhYCLxdq5SFyMX
	h5DAbkaJOX//M3UxcgLFJSS+vdkDZQtL3G85wgpR9IxR4ujLbmaQBJuAm8TvvxNYQWwRAVWJ
	LU8esIEUMQv8YJQ48+8oVMc1Rol7B4+zg1RxAlX1zLrFDrJaWCBYYs7tMpAwC1D41qJtYEN5
	BSwlri3pYIKwBSVOznzCAmIzA13aeLgbypaX2P52DjPEdQoSP58uYwUZKQJ00Jx5tRAlIhKz
	O9ugSkwlnk7+xgbzzN0HL9knMIrOQrJhFpINs5BsmIVk1AJGllWMkqkFxbnpucWGBYZ5qeV6
	xYm5xaV56XrJ+bmbGMFxqKW5g3H7qg96hxiZOBgPMUpwMCuJ8B4SykwX4k1JrKxKLcqPLyrN
	SS0+xCjNwaIkziv+ojdFSCA9sSQ1OzW1ILUIJsvEwSnVwFTq9cC2MfVLwZnZXMKXpvGdZXD7
	9jSxznaPZ6bG83f32vN+OId/mvJ18faPH/aVmN/js+/RVZFhX3B1bffkxy6RWn/iTz8TbPrs
	5vPikzD33SmeQTvC3hfffPqWO4Lzz6ItJWIffhnbij+LFZu8y+URW/A0X2n+TYo7xT2i1V4Z
	OW0Ql979JY0jvP+oBe83u70VQYkTove+feW1YzbHjZoTwiUVzDdTXi27HnvxXJrZpnaBh/Ov
	1mR/CZ/dLV22sMvqaKDlhhOeppVbrbYsv2lu7Xv8p4Cv3+SUQ1f1rf+//L/spPpB84tsi5+9
	tt9mbPTmhGX94s/HHyy+w9c+J+/NdKYniduaim8k1e3Z8PWjEktxRqKhFnNRcSIAeHAAcDID
	AAA=
X-CMS-MailID: 20241226021236epcas2p443c80bf439b6d3a7bd2ce774301c92b7
X-Msg-Generator: CA
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241118021011epcas2p4b71dadce42a321213bdf8d445a312a8f
References: <20241118021009.2858849-1-sowon.na@samsung.com>
	<CGME20241118021011epcas2p4b71dadce42a321213bdf8d445a312a8f@epcas2p4.samsung.com>
	<20241118021009.2858849-3-sowon.na@samsung.com> <Z2rMI0RWvV5FAN+q@vaman>

Hi Vinod,

> -----Original Message-----
> From: Vinod Koul <vkoul@kernel.org>
> Sent: Tuesday, December 24, 2024 11:59 PM
> To: Sowon Na <sowon.na@samsung.com>
> Cc: robh@kernel.org; krzk@kernel.org; conor+dt@kernel.org;
> alim.akhtar@samsung.com; kishon@kernel.org; krzk+dt@kernel.org; linux-
> kernel@vger.kernel.org; devicetree@vger.kernel.org; linux-samsung-
> soc@vger.kernel.org
> Subject: Re: [PATCH v3 2/3] phy: samsung-ufs: support ExynosAutov920 ufs
> phy driver
> 
> On 18-11-24, 11:10, Sowon Na wrote:
> > Add support for ExynosAutov920 ufs phy driver.
> >
> > Signed-off-by: Sowon Na <sowon.na@samsung.com>
> > ---
> >  drivers/phy/samsung/Makefile                 |   1 +
> >  drivers/phy/samsung/phy-exynosautov920-ufs.c | 167 +++++++++++++++++++
> >  drivers/phy/samsung/phy-samsung-ufs.c        |   9 +-
> >  drivers/phy/samsung/phy-samsung-ufs.h        |   4 +
> >  4 files changed, 178 insertions(+), 3 deletions(-)  create mode
> > 100644 drivers/phy/samsung/phy-exynosautov920-ufs.c
> >
> > diff --git a/drivers/phy/samsung/Makefile
> > b/drivers/phy/samsung/Makefile index fea1f96d0e43..342682638a87 100644
> > --- a/drivers/phy/samsung/Makefile
> > +++ b/drivers/phy/samsung/Makefile
> > @@ -7,6 +7,7 @@ phy-exynos-ufs-y			+= phy-gs101-ufs.o
> >  phy-exynos-ufs-y			+= phy-samsung-ufs.o
> >  phy-exynos-ufs-y			+= phy-exynos7-ufs.o
> >  phy-exynos-ufs-y			+= phy-exynosautov9-ufs.o
> > +phy-exynos-ufs-y			+= phy-exynosautov920-ufs.o
> >  phy-exynos-ufs-y			+= phy-fsd-ufs.o
> >  obj-$(CONFIG_PHY_SAMSUNG_USB2)		+= phy-exynos-usb2.o
> >  phy-exynos-usb2-y			+= phy-samsung-usb2.o
> > diff --git a/drivers/phy/samsung/phy-exynosautov920-ufs.c
> > b/drivers/phy/samsung/phy-exynosautov920-ufs.c
> > new file mode 100644
> > index 000000000000..8a7ba159bbfe
> > --- /dev/null
> > +++ b/drivers/phy/samsung/phy-exynosautov920-ufs.c
> > @@ -0,0 +1,167 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * UFS PHY driver data for Samsung ExynosAuto v920 SoC
> > + *
> > + * Copyright (C) 2024 Samsung Electronics Co., Ltd.
> > + */
> > +
> > +#include "phy-samsung-ufs.h"
> > +
> > +#define
EXYNOSAUTOV920_EMBEDDED_COMBO_PHY_CTRL			0x708
> > +#define EXYNOSAUTOV920_EMBEDDED_COMBO_PHY_CTRL_MASK		0x1
> > +#define EXYNOSAUTOV920_EMBEDDED_COMBO_PHY_CTRL_EN		BIT(0)
> > +#define EXYNOSAUTOV920_EMBEDDED_COMBO_PHY_CDR_LOCK_STATUS	0x5e
> > +
> > +#define
EXYNOSAUTOV920_CDR_LOCK_OFFSET				0xCE4
> 
> Lower case please, here and everywhere else

Okay, I will fix.

> > +
> > +#define
PHY_EXYNOSAUTOV920_LANE_OFFSET				0x200
> > +#define PHY_TRSV_REG_CFG_AUTOV920(o, v, d) \
> > +	PHY_TRSV_REG_CFG_OFFSET(o, v, d, PHY_EXYNOSAUTOV920_LANE_OFFSET)
> > +
> > +/* Calibration for phy initialization */ static const struct
> > +samsung_ufs_phy_cfg exynosautov920_pre_init_cfg[] = {
> > +	PHY_COMN_REG_CFG(0x29, 0x22, PWR_MODE_ANY),
> > +	PHY_COMN_REG_CFG(0x43, 0x10, PWR_MODE_ANY),
> > +	PHY_COMN_REG_CFG(0x3C, 0x14, PWR_MODE_ANY),
> > +	PHY_COMN_REG_CFG(0x46, 0x48, PWR_MODE_ANY),
> > +	PHY_COMN_REG_CFG(0x04, 0x95, PWR_MODE_ANY),
> > +	PHY_COMN_REG_CFG(0x06, 0x30, PWR_MODE_ANY),
> > +
> > +	PHY_TRSV_REG_CFG_AUTOV920(0x200, 0x00, PWR_MODE_ANY),
> > +	PHY_TRSV_REG_CFG_AUTOV920(0x201, 0x06, PWR_MODE_ANY),
> > +	PHY_TRSV_REG_CFG_AUTOV920(0x202, 0x06, PWR_MODE_ANY),
> > +	PHY_TRSV_REG_CFG_AUTOV920(0x203, 0x0A, PWR_MODE_ANY),
> > +	PHY_TRSV_REG_CFG_AUTOV920(0x204, 0x00, PWR_MODE_ANY),
> > +	PHY_TRSV_REG_CFG_AUTOV920(0x205, 0x10, PWR_MODE_ANY),
> > +	PHY_TRSV_REG_CFG_AUTOV920(0x207, 0x0C, PWR_MODE_ANY),
> > +	PHY_TRSV_REG_CFG_AUTOV920(0x2E1, 0xC0, PWR_MODE_ANY),
> > +	PHY_TRSV_REG_CFG_AUTOV920(0x22D, 0xF8, PWR_MODE_ANY),
> > +	PHY_TRSV_REG_CFG_AUTOV920(0x234, 0x60, PWR_MODE_ANY),
> > +	PHY_TRSV_REG_CFG_AUTOV920(0x238, 0x13, PWR_MODE_ANY),
> > +	PHY_TRSV_REG_CFG_AUTOV920(0x239, 0x48, PWR_MODE_ANY),
> > +	PHY_TRSV_REG_CFG_AUTOV920(0x23A, 0x01, PWR_MODE_ANY),
> > +	PHY_TRSV_REG_CFG_AUTOV920(0x23B, 0x29, PWR_MODE_ANY),
> > +	PHY_TRSV_REG_CFG_AUTOV920(0x23C, 0x2A, PWR_MODE_ANY),
> > +	PHY_TRSV_REG_CFG_AUTOV920(0x23D, 0x01, PWR_MODE_ANY),
> > +	PHY_TRSV_REG_CFG_AUTOV920(0x23E, 0x14, PWR_MODE_ANY),
> > +	PHY_TRSV_REG_CFG_AUTOV920(0x23F, 0x13, PWR_MODE_ANY),
> > +
> > +	PHY_TRSV_REG_CFG_AUTOV920(0x240, 0x4A, PWR_MODE_ANY),
> > +	PHY_TRSV_REG_CFG_AUTOV920(0x243, 0x40, PWR_MODE_ANY),
> > +	PHY_TRSV_REG_CFG_AUTOV920(0x244, 0x02, PWR_MODE_ANY),
> > +	PHY_TRSV_REG_CFG_AUTOV920(0x25D, 0x00, PWR_MODE_ANY),
> > +	PHY_TRSV_REG_CFG_AUTOV920(0x25E, 0x3F, PWR_MODE_ANY),
> > +	PHY_TRSV_REG_CFG_AUTOV920(0x25F, 0xFF, PWR_MODE_ANY),
> > +	PHY_TRSV_REG_CFG_AUTOV920(0x26F, 0xF0, PWR_MODE_ANY),
> > +	PHY_TRSV_REG_CFG_AUTOV920(0x273, 0x33, PWR_MODE_ANY),
> > +	PHY_TRSV_REG_CFG_AUTOV920(0x274, 0x50, PWR_MODE_ANY),
> > +
> > +	PHY_TRSV_REG_CFG_AUTOV920(0x284, 0x02, PWR_MODE_ANY),
> > +	PHY_TRSV_REG_CFG_AUTOV920(0x285, 0x02, PWR_MODE_ANY),
> > +	PHY_TRSV_REG_CFG_AUTOV920(0x2A2, 0x04, PWR_MODE_ANY),
> > +	PHY_TRSV_REG_CFG_AUTOV920(0x27D, 0x01, PWR_MODE_ANY),
> > +	PHY_TRSV_REG_CFG_AUTOV920(0x2FA, 0x01, PWR_MODE_ANY),
> > +
> > +	PHY_TRSV_REG_CFG_AUTOV920(0x286, 0x03, PWR_MODE_ANY),
> > +	PHY_TRSV_REG_CFG_AUTOV920(0x287, 0x03, PWR_MODE_ANY),
> > +	PHY_TRSV_REG_CFG_AUTOV920(0x288, 0x03, PWR_MODE_ANY),
> > +	PHY_TRSV_REG_CFG_AUTOV920(0x289, 0x03, PWR_MODE_ANY),
> > +	PHY_TRSV_REG_CFG_AUTOV920(0x2B3, 0x04, PWR_MODE_ANY),
> > +	PHY_TRSV_REG_CFG_AUTOV920(0x2B6, 0x0B, PWR_MODE_ANY),
> > +	PHY_TRSV_REG_CFG_AUTOV920(0x2B7, 0x0B, PWR_MODE_ANY),
> > +	PHY_TRSV_REG_CFG_AUTOV920(0x2B8, 0x0B, PWR_MODE_ANY),
> > +	PHY_TRSV_REG_CFG_AUTOV920(0x2B9, 0x0B, PWR_MODE_ANY),
> > +	PHY_TRSV_REG_CFG_AUTOV920(0x2BA, 0x0B, PWR_MODE_ANY),
> > +	PHY_TRSV_REG_CFG_AUTOV920(0x2BB, 0x06, PWR_MODE_ANY),
> > +	PHY_TRSV_REG_CFG_AUTOV920(0x2BC, 0x06, PWR_MODE_ANY),
> > +	PHY_TRSV_REG_CFG_AUTOV920(0x2BD, 0x06, PWR_MODE_ANY),
> > +	PHY_TRSV_REG_CFG_AUTOV920(0x2BE, 0x06, PWR_MODE_ANY),
> > +	PHY_TRSV_REG_CFG_AUTOV920(0x34B, 0x01, PWR_MODE_ANY),
> > +	PHY_TRSV_REG_CFG_AUTOV920(0x34C, 0x24, PWR_MODE_ANY),
> > +	PHY_TRSV_REG_CFG_AUTOV920(0x34D, 0x23, PWR_MODE_ANY),
> > +	PHY_TRSV_REG_CFG_AUTOV920(0x34E, 0x45, PWR_MODE_ANY),
> > +	PHY_TRSV_REG_CFG_AUTOV920(0x34F, 0x00, PWR_MODE_ANY),
> > +	PHY_TRSV_REG_CFG_AUTOV920(0x350, 0x31, PWR_MODE_ANY),
> > +	PHY_TRSV_REG_CFG_AUTOV920(0x351, 0x00, PWR_MODE_ANY),
> > +	PHY_TRSV_REG_CFG_AUTOV920(0x352, 0x02, PWR_MODE_ANY),
> > +	PHY_TRSV_REG_CFG_AUTOV920(0x353, 0x00, PWR_MODE_ANY),
> > +	PHY_TRSV_REG_CFG_AUTOV920(0x354, 0x01, PWR_MODE_ANY),
> > +
> > +	PHY_COMN_REG_CFG(0x43, 0x18, PWR_MODE_ANY),
> > +	PHY_COMN_REG_CFG(0x43, 0x00, PWR_MODE_ANY),
> > +
> > +	END_UFS_PHY_CFG,
> > +};
> > +
> > +/* Calibration for HS mode series A/B */ static const struct
> > +samsung_ufs_phy_cfg exynosautov920_pre_pwr_hs_cfg[] = {
> > +	PHY_TRSV_REG_CFG_AUTOV920(0x369, 0x11, PWR_MODE_ANY),
> > +	PHY_TRSV_REG_CFG_AUTOV920(0x246, 0x03, PWR_MODE_ANY),
> > +
> > +	END_UFS_PHY_CFG,
> > +};
> > +
> > +static const struct samsung_ufs_phy_cfg
exynosautov920_post_pwr_hs_cfg[]
> = {
> > +	END_UFS_PHY_CFG,
> > +};
> > +
> > +#define DELAY_IN_US	40
> > +#define RETRY_CNT	100
> > +#define EXYNOSAUTOV920_CDR_LOCK_MASK	0x8
> 
> empty line here please

I will post v4 with modifications.
Thank you.

> > +int exynosautov920_ufs_phy_wait_cdr_lock(struct phy *phy, u8 lane) {
> > +	struct samsung_ufs_phy *ufs_phy = get_samsung_ufs_phy(phy);
> > +	u32 reg, i;
> > +
> > +	struct samsung_ufs_phy_cfg cfg[4] = {
> > +		PHY_TRSV_REG_CFG_AUTOV920(0x222, 0x10, PWR_MODE_ANY),
> > +		PHY_TRSV_REG_CFG_AUTOV920(0x222, 0x18, PWR_MODE_ANY),
> > +		PHY_TRSV_REG_CFG_AUTOV920(0x246, 0x01, PWR_MODE_ANY),
> > +		END_UFS_PHY_CFG,
> > +	};
> > +
> > +	for (i = 0; i < RETRY_CNT; i++) {
> > +		udelay(DELAY_IN_US);
> > +
> > +		reg = readl(ufs_phy->reg_pma +
> EXYNOSAUTOV920_CDR_LOCK_OFFSET +
> > +			(PHY_APB_ADDR(PHY_EXYNOSAUTOV920_LANE_OFFSET) *
lane));
> > +
> > +		if ((reg & EXYNOSAUTOV920_CDR_LOCK_MASK)
> > +					== EXYNOSAUTOV920_CDR_LOCK_MASK) {
> > +			samsung_ufs_phy_config(ufs_phy, &cfg[2], lane);
> > +			return 0;
> > +		}
> > +
> > +		udelay(DELAY_IN_US);
> > +
> > +		/* Disable and enable CDR */
> > +		samsung_ufs_phy_config(ufs_phy, &cfg[0], lane);
> > +		samsung_ufs_phy_config(ufs_phy, &cfg[1], lane);
> > +	}
> > +
> > +	dev_err(ufs_phy->dev, "failed to get phy cdr lock\n");
> > +	return -ETIMEDOUT;
> > +}
> > +
> > +static const struct samsung_ufs_phy_cfg
> *exynosautov920_ufs_phy_cfgs[CFG_TAG_MAX] = {
> > +	[CFG_PRE_INIT]          = exynosautov920_pre_init_cfg,
> > +	[CFG_PRE_PWR_HS]        = exynosautov920_pre_pwr_hs_cfg,
> > +	[CFG_POST_PWR_HS]       = exynosautov920_post_pwr_hs_cfg,
> > +};
> > +
> > +static const char * const exynosautov920_ufs_phy_clks[] = {
> > +	"ref_clk",
> > +};
> > +
> > +const struct samsung_ufs_phy_drvdata exynosautov920_ufs_phy = {
> > +	.cfgs = exynosautov920_ufs_phy_cfgs,
> > +	.isol = {
> > +		.offset = EXYNOSAUTOV920_EMBEDDED_COMBO_PHY_CTRL,
> > +		.mask = EXYNOSAUTOV920_EMBEDDED_COMBO_PHY_CTRL_MASK,
> > +		.en = EXYNOSAUTOV920_EMBEDDED_COMBO_PHY_CTRL_EN,
> > +	},
> > +	.clk_list = exynosautov920_ufs_phy_clks,
> > +	.num_clks = ARRAY_SIZE(exynosautov920_ufs_phy_clks),
> > +	.cdr_lock_status_offset =
> EXYNOSAUTOV920_EMBEDDED_COMBO_PHY_CDR_LOCK_STATUS,
> > +	.wait_for_cdr = exynosautov920_ufs_phy_wait_cdr_lock,
> > +};
> > diff --git a/drivers/phy/samsung/phy-samsung-ufs.c
> > b/drivers/phy/samsung/phy-samsung-ufs.c
> > index 6c5d41552649..c13fe149bc75 100644
> > --- a/drivers/phy/samsung/phy-samsung-ufs.c
> > +++ b/drivers/phy/samsung/phy-samsung-ufs.c
> > @@ -28,9 +28,9 @@
> >
> >  #define PHY_DEF_LANE_CNT	1
> >
> > -static void samsung_ufs_phy_config(struct samsung_ufs_phy *phy,
> > -				   const struct samsung_ufs_phy_cfg *cfg,
> > -				   u8 lane)
> > +void samsung_ufs_phy_config(struct samsung_ufs_phy *phy,
> > +			    const struct samsung_ufs_phy_cfg *cfg,
> > +			    u8 lane)
> >  {
> >  	enum {LANE_0, LANE_1}; /* lane index */
> >
> > @@ -323,6 +323,9 @@ static const struct of_device_id
> samsung_ufs_phy_match[] = {
> >  	}, {
> >  		.compatible = "samsung,exynosautov9-ufs-phy",
> >  		.data = &exynosautov9_ufs_phy,
> > +	}, {
> > +		.compatible = "samsung,exynosautov920-ufs-phy",
> > +		.data = &exynosautov920_ufs_phy,
> >  	}, {
> >  		.compatible = "tesla,fsd-ufs-phy",
> >  		.data = &fsd_ufs_phy,
> > diff --git a/drivers/phy/samsung/phy-samsung-ufs.h
> > b/drivers/phy/samsung/phy-samsung-ufs.h
> > index 9b7deef6e10f..a28f148081d1 100644
> > --- a/drivers/phy/samsung/phy-samsung-ufs.h
> > +++ b/drivers/phy/samsung/phy-samsung-ufs.h
> > @@ -143,9 +143,13 @@ static inline void samsung_ufs_phy_ctrl_isol(  }
> >
> >  int samsung_ufs_phy_wait_for_lock_acq(struct phy *phy, u8 lane);
> > +int exynosautov920_ufs_phy_wait_cdr_lock(struct phy *phy, u8 lane);
> > +void samsung_ufs_phy_config(struct samsung_ufs_phy *phy,
> > +			    const struct samsung_ufs_phy_cfg *cfg, u8 lane);
> >
> >  extern const struct samsung_ufs_phy_drvdata exynos7_ufs_phy;  extern
> > const struct samsung_ufs_phy_drvdata exynosautov9_ufs_phy;
> > +extern const struct samsung_ufs_phy_drvdata exynosautov920_ufs_phy;
> >  extern const struct samsung_ufs_phy_drvdata fsd_ufs_phy;  extern
> > const struct samsung_ufs_phy_drvdata tensor_gs101_ufs_phy;
> >
> > --
> > 2.45.2
> 
> --
> ~Vinod

Best regards,
Sowon

