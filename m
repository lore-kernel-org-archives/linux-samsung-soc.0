Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D64DF43DEBD
	for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Sep 2026 05:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789451650; cv=none; b=SnF2HdjM+1nMVT/GuW1pgBrhhCt1D1Tzgr1oujJkKFOtL2HdJGdTv/bTni3nSv92Vazo89akYe9i2FoQnlx9mQqzdFJu7RWGKWS0trPy79h+D9qffheLvIMMqWJ07c/hjZYJa7bc0qQdRD9KvTrJwF/uwOcNyh+/H7kY0RKJnKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789451650; c=relaxed/simple;
	bh=6pnARJWU8Hn/XLwXN42+gQ7sps7ZUuWfUhevWLlNNPg=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=obfIOfkNXSG5hLVGNCnq7FFdltdnOnM+/WZW9cTxqyNZ0Bbm2nl2oyiPelkhsO+enNNye+j9cjaZHgfaq+Pq3agUOS3NoahZFCMVR7tLonZwyx/cO2sORk0CxN+AOntEEAqkLg8JztuYITWyGvcYAM9HmF1jdoYYdVMf7TZTgY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=F3aR4IMx; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="F3aR4IMx"
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20260915055405epoutp035f617b3ffc53c608e9c0611a38ca63ea~VaMpXhb2e2221922219epoutp03b
	for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Sep 2026 05:54:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20260915055405epoutp035f617b3ffc53c608e9c0611a38ca63ea~VaMpXhb2e2221922219epoutp03b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1789451645;
	bh=6pnARJWU8Hn/XLwXN42+gQ7sps7ZUuWfUhevWLlNNPg=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=F3aR4IMx/qlMGya5Xr0xNdL4TM9u53nAUc3/581RY3B5kcT8G1qHipkiClM6AnGv9
	 qOfCc8mW1NW5RZ0VvZj41ThXyPaB5mMRVLZuFF5dSbe7E++tYWmK34Xt3labPalbKw
	 ZoD3NSLlD4SFVRbR7y+BOBtJmLe6xC3iA+o/TNzw=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20260915055404epcas5p27df422b565f6cdd3834007c781f48090~VaMoi1tW-1755617556epcas5p2R;
	Tue, 15 Sep 2026 05:54:04 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.94]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4hkWRb1vf6z2SSKn; Tue, 15 Sep
	2026 05:54:03 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20260915055402epcas5p1d4131ca25d791c6e4ba38ced99f1e29d~VaMnCxL-F1505315053epcas5p1m;
	Tue, 15 Sep 2026 05:54:02 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20260915055400epsmtip137fa43b73213458bcb593794a8e06add~VaMk7hdm70286302863epsmtip1j;
	Tue, 15 Sep 2026 05:54:00 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Selvarasu Ganesan'" <selvarasu.g@samsung.com>, <vkoul@kernel.org>,
	<neil.armstrong@linaro.org>, <krzk@kernel.org>, <peter.griffin@linaro.org>,
	<pritam.sutar@samsung.com>, <andre.draszik@linaro.org>, <kernel@lvkasz.us>,
	<linux-phy@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Cc: <jh0801.jung@samsung.com>, <dh10.jung@samsung.com>,
	<akash.m5@samsung.com>, <muhammed.ali@samsung.com>, <thiagu.r@samsung.com>
In-Reply-To: <20260831070309.158069-1-selvarasu.g@samsung.com>
Subject: RE: [PATCH] phy: exynos5-usbdrd: Use dynamic phy_cfg size to
 prevent OOB access
Date: Tue, 15 Sep 2026 11:23:58 +0530
Message-ID: <01e001dd44d6$9c203730$d460a590$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGKDVFXPtvwg5u1EEO2Agv0acLiRgJK+Mort2M6G0A=
Content-Language: en-us
X-CMS-MailID: 20260915055402epcas5p1d4131ca25d791c6e4ba38ced99f1e29d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260831070349epcas5p4c62a4e46592dffe95723ddd51a6068e0
References: <CGME20260831070349epcas5p4c62a4e46592dffe95723ddd51a6068e0@epcas5p4.samsung.com>
	<20260831070309.158069-1-selvarasu.g@samsung.com>

Hi Selvarasu

> -----Original Message-----
> From: Selvarasu Ganesan <selvarasu.g=40samsung.com>
> Sent: Monday, August 31, 2026 12:33 PM
> To: vkoul=40kernel.org; neil.armstrong=40linaro.org; krzk=40kernel.org;
> peter.griffin=40linaro.org; alim.akhtar=40samsung.com;
> pritam.sutar=40samsung.com; andre.draszik=40linaro.org; kernel=40lvkasz.u=
s;
> linux-phy=40lists.infradead.org; linux-arm-kernel=40lists.infradead.org; =
linux-
> samsung-soc=40vger.kernel.org; linux-kernel=40vger.kernel.org
> Cc: jh0801.jung=40samsung.com; dh10.jung=40samsung.com;
> akash.m5=40samsung.com; muhammed.ali=40samsung.com;
> thiagu.r=40samsung.com; Selvarasu Ganesan <selvarasu.g=40samsung.com>
> Subject: =5BPATCH=5D phy: exynos5-usbdrd: Use dynamic phy_cfg size to pre=
vent
> OOB access
>=20
> The probe loop currently iterates using EXYNOS5_DRDPHYS_NUM (2),
> creating both UTMI and PIPE3 PHY instances regardless of the SoC capabili=
ty.
> Several SoCs (Exynos2200, Exynos7870, Exynos850, Exynos990, and
> ExynosAutoV920) provide phy_cfg arrays containing only a single element.
>=20
> On these SoCs, when the loop reaches index 1, the driver reads past the e=
nd
> of the rodata array, populating the second PHY instance with garbage data=
.
> Since the configuration structure contains critical function pointers (ph=
y_isol,
> phy_init, set_refclk), any subsequent access to this PHY instance via
> exynos5_usbdrd_phy_xlate could result in a kernel oops.
>=20
> Fix this by adding 'n_phy_cfg' to struct exynos5_usbdrd_phy_drvdata to
> store the actual size of the phy_cfg array for each SoC. Update the probe
> loop and the xlate function to bound their access against this value inst=
ead of
> the hardcoded EXYNOS5_DRDPHYS_NUM.
>=20
> Assisted-by: Claude:claude-sonnet-5
> Signed-off-by: Selvarasu Ganesan <selvarasu.g=40samsung.com>
> ---
Reviewed-by: Alim Akhtar <alim.akhtar=40samsung.com>

