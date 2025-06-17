Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF0713C3CD
	for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Jun 2025 01:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750209471; cv=none; b=LWOskQ6Hqi52Djb2T6TPlxKOo0lt47ns1YXaeU+cv2xmutRL/8HKpsaBDbouZLlzlCX/H1TO/wIZN5mdqKH37Rh//KXmhc6jLdsaua74AEQgwWkrUdprT1eNLcE7xBugIqziV4oo1MLCBwQUNyBKzMKxdx65SexcPjl8kRJjS3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750209471; c=relaxed/simple;
	bh=gxzNrUQXun47NafySwTPFjagzu3csIZdI9QtNWOklUY=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=kpma8BHebFQZu8aFj2TjEIBV6sOgW5PbgP9PwuOiWnBs8Hem8e5PLrlF9uBZJ+k+Ep2aHJf9hPsPDv7gHkwenFmIIKvVZs0ro4VpfFISw0TsR3Lc5DX9KctcN+ueCzwiJeRVs+kfaZ/8llrFemWwXlqPsCCDSbHxu94UkBXLIvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=CgCyrWBN; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="CgCyrWBN"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250618011747epoutp01cfeb09fa64a136e9c86bc68c3a7872bf~J-jzqDTk30038700387epoutp01j
	for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Jun 2025 01:17:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250618011747epoutp01cfeb09fa64a136e9c86bc68c3a7872bf~J-jzqDTk30038700387epoutp01j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1750209467;
	bh=B7lcd7QwCqVVz+1MsL2E136+jJ3dujGQV0XbaXLkoYM=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=CgCyrWBNFTIzy7mBstR4eidWO4lD/HELni9e1+3wI8Co/mJVl+RwYNxilO0vAqIwe
	 oszi0AG66KO03lVfrzpW9mtuEYdtmBVzGsRwvf+D7Oc4c/2hKO9ZOwSIxpU5iQojSz
	 7VVshvNwhUxsXLzaHtuY0T4s6byBpmpNDroFkufI=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250618011746epcas5p393312e74614088b0f2bbabd36423233a~J-jyzlkZI1283912839epcas5p36;
	Wed, 18 Jun 2025 01:17:46 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.177]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4bMQpJ54Cbz3hhTD; Wed, 18 Jun
	2025 01:17:44 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250617174937epcas5p202e625e46a92fba4f4ab08fdbf1063ae~J5cgNQ94f0706807068epcas5p2i;
	Tue, 17 Jun 2025 17:49:37 +0000 (GMT)
Received: from INBRO001840 (unknown [107.122.3.105]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250617174934epsmtip2b285fba314cc0e9470a26d9b747b9cb4~J5cdcycjC0696206962epsmtip2H;
	Tue, 17 Jun 2025 17:49:34 +0000 (GMT)
From: "Pritam Manohar Sutar" <pritam.sutar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>
Cc: <vkoul@kernel.org>, <kishon@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <alim.akhtar@samsung.com>,
	<andre.draszik@linaro.org>, <peter.griffin@linaro.org>,
	<kauschluss@disroot.org>, <ivo.ivanov.ivanov1@gmail.com>,
	<m.szyprowski@samsung.com>, <s.nawrocki@samsung.com>,
	<linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <rosa.pila@samsung.com>,
	<dev.tailor@samsung.com>, <faraz.ata@samsung.com>,
	<muhammed.ali@samsung.com>, <selvarasu.g@samsung.com>
In-Reply-To: <20250616-remarkable-zealous-orangutan-7ace78@kuoka>
Subject: RE: [PATCH v3 3/9] arm64: dts: exynos: ExynosAutov920: add USB and
 USB-phy nodes
Date: Tue, 17 Jun 2025 23:19:33 +0530
Message-ID: <000301dbdfb0$3168ee00$943aca00$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQNTkACKxnsdZBPuyPiYuNftoBZF1gGoxAPYAeRpXwgBWhb/9LDxAqUA
Content-Language: en-in
X-CMS-MailID: 20250617174937epcas5p202e625e46a92fba4f4ab08fdbf1063ae
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250613055047epcas5p220b1cd1e9b2819997a3d4747c395d13d
References: <20250613055613.866909-1-pritam.sutar@samsung.com>
	<CGME20250613055047epcas5p220b1cd1e9b2819997a3d4747c395d13d@epcas5p2.samsung.com>
	<20250613055613.866909-4-pritam.sutar@samsung.com>
	<20250616-remarkable-zealous-orangutan-7ace78@kuoka>

Hi Krzysztof,

> -----Original Message-----
> From: Krzysztof Kozlowski <krzk=40kernel.org>
> Sent: 16 June 2025 01:43 PM
> To: Pritam Manohar Sutar <pritam.sutar=40samsung.com>
> Cc: vkoul=40kernel.org; kishon=40kernel.org; robh=40kernel.org;
> krzk+dt=40kernel.org; conor+dt=40kernel.org; alim.akhtar=40samsung.com;
> andre.draszik=40linaro.org; peter.griffin=40linaro.org; kauschluss=40disr=
oot.org;
> ivo.ivanov.ivanov1=40gmail.com; m.szyprowski=40samsung.com;
> s.nawrocki=40samsung.com; linux-phy=40lists.infradead.org;
> devicetree=40vger.kernel.org; linux-kernel=40vger.kernel.org; linux-arm-
> kernel=40lists.infradead.org; linux-samsung-soc=40vger.kernel.org;
> rosa.pila=40samsung.com; dev.tailor=40samsung.com;
> faraz.ata=40samsung.com; muhammed.ali=40samsung.com;
> selvarasu.g=40samsung.com
> Subject: Re: =5BPATCH v3 3/9=5D arm64: dts: exynos: ExynosAutov920: add U=
SB
> and USB-phy nodes
>=20
> On Fri, Jun 13, 2025 at 11:26:07AM GMT, Pritam Manohar Sutar wrote:
> > Add USB controller and USB PHY controller nodes for this SoC.
> >
> > The USB controller has following features:
> > * Dual Role Device (DRD) controller
> > * DWC3 compatible
> > * Supports USB 3.0 host and USB 3.0 device interfaces but phy
> >   controller capability is limited to USB 2.0.
> > * Supports  full-speed (12 Mbps) and high-speed (480 Mbps) modes with
> >   USB device 2.0 interface
> > * Supports on-chip USB PHY transceiver
> > * Supports up to 16 bi-directional endpoints (that includes control
> >   endpoint 0)
> > * Complies with xHCI 1.1 specification
> >
> > Signed-off-by: Pritam Manohar Sutar <pritam.sutar=40samsung.com>
> > ---
> >  .../boot/dts/exynos/exynosautov920-sadk.dts   =7C  37 ++++++
> >  .../arm64/boot/dts/exynos/exynosautov920.dtsi =7C 108
> > ++++++++++++++++++
> >  2 files changed, 145 insertions(+)
>=20
> DTS cannot be a dependency for driver changes. Organize your patchset
> correctly or fix the dependency.
>=20

ExynosAutov920 has three types of the phy controllers (please check block d=
iagram mentioned in cover-letter https://lore.kernel.org/linux-phy/20250613=
055613.866909-1-pritam.sutar=40samsung.com/)
1. HS phy (synopsys phy version v303), similar as existing exynos850.
2. SS phy in combo that that suppors only SS+, SS
3. HS phy (synopsys phy version v400) in 'Add-on' HS phy in combo phy (with=
 2nd phy). Different from 1st phy in case of  reg offsets and bits.

This implementation follows below sequence to post patches for above phys
1. schema=20
2. driver changes
3. DTS changes=20

Please elaborate your comment. Do you want these DTS related patches in sep=
arate patch-set series (not with this patch-set)?

> Best regards,
> Krzysztof


Thank you.

Regards,
Pritam

