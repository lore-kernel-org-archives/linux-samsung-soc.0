Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D416188734
	for <linux-samsung-soc@vger.kernel.org>; Thu, 18 Sep 2025 04:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758168337; cv=none; b=axVpSPoutpS6d1weWax+UqLlIpTH+c+7p1ZgWTC5lxp5kjP0mRAFT8JdNaxPugJoIRq3hr4uXfJOQFl6TLD37dI86V+dpkGNYdonlPsxA0dzYahAttElFaINpL5ghvys25KOSTZgXeld3Vyjws3YP9mqq1EJdfCj57dUgxSTmnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758168337; c=relaxed/simple;
	bh=p0Q70RU0uYBQg/+uwi+5X/TGP+8jGSJKZRgQ/tzfc9g=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=dCWXnmgYXFlNNseccaK4BDcqJwTB6hKHFVxIj/ncKs6phAY8+U1bb7BSFqscBW3U6lb0l663OKpOgb3CpxuTmtFPo5BmJ4/VNCP0jVkMAiSqBdqkOezZFlHIJjGnkXMg0OI8Ad23hEG4AMgUidext1VpBabPO8n6E/Mxn1VX0wU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=hmoZb8R3; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="hmoZb8R3"
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250918040533epoutp03cde81376a9d380a893b6449f447df9af~mRMinxmUF0883208832epoutp03w
	for <linux-samsung-soc@vger.kernel.org>; Thu, 18 Sep 2025 04:05:33 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250918040533epoutp03cde81376a9d380a893b6449f447df9af~mRMinxmUF0883208832epoutp03w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1758168333;
	bh=p0Q70RU0uYBQg/+uwi+5X/TGP+8jGSJKZRgQ/tzfc9g=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=hmoZb8R3LCuvedKPi8BAYXPwXrQp4Dmpnse+4b0fBJskmhiDMrnfXnh4nFclZr+Qg
	 PHbPegNliEDVzRJtutk0DK6HO0ToQoRH2U3KumdThwlX5RT3OXZEZOXEdQSWtn31Fl
	 pBer+JDuvsSy5S4V6jB5BvgxPCyKi+lp/QqMrzhc=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250918040532epcas5p324a33bd2cab43d0b1c2c12d15a5a9eec~mRMh2fg3m2562225622epcas5p3H;
	Thu, 18 Sep 2025 04:05:32 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.86]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4cS29R48JLz2SSKX; Thu, 18 Sep
	2025 04:05:31 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250918040531epcas5p35526c46a3c0390d6066ade0bd6a90505~mRMgvFOYJ2562225622epcas5p3D;
	Thu, 18 Sep 2025 04:05:31 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250918040528epsmtip14e0f3f931fc7e6f7edac39c9ef268c95~mRMerpD-V1171211712epsmtip14;
	Thu, 18 Sep 2025 04:05:28 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Sangwook Shin'" <sw617.shin@samsung.com>, <krzk@kernel.org>,
	<wim@linux-watchdog.org>, <linux@roeck-us.net>,
	<semen.protsenko@linaro.org>, <dongil01.park@samsung.com>,
	<khwan.seo@samsung.com>
Cc: <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <20250818021826.623830-6-sw617.shin@samsung.com>
Subject: RE: [PATCH v6 5/5] watchdog: s3c2410_wdt: exynosautov9: Enable
 supported features
Date: Thu, 18 Sep 2025 09:35:27 +0530
Message-ID: <06c701dc2851$796b7620$6c426260$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQMf0cCJ9LyTM0wh7cHpv36iTCHVmgDSjL23AYLihPex/lPgkA==
Content-Language: en-us
X-CMS-MailID: 20250918040531epcas5p35526c46a3c0390d6066ade0bd6a90505
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250818022433epcas2p15ec2e45f26f6ff5fb69f0b1e377616f4
References: <20250818021826.623830-1-sw617.shin@samsung.com>
	<CGME20250818022433epcas2p15ec2e45f26f6ff5fb69f0b1e377616f4@epcas2p1.samsung.com>
	<20250818021826.623830-6-sw617.shin@samsung.com>

Hi Sangwook

> -----Original Message-----
> From: Sangwook Shin <sw617.shin=40samsung.com>
> Sent: Monday, August 18, 2025 7:48 AM
> To: krzk=40kernel.org; alim.akhtar=40samsung.com; wim=40linux-watchdog.or=
g;
> linux=40roeck-us.net; semen.protsenko=40linaro.org;
> dongil01.park=40samsung.com; khwan.seo=40samsung.com
> Cc: linux-arm-kernel=40lists.infradead.org; linux-samsung-soc=40vger.kern=
el.org;
> linux-watchdog=40vger.kernel.org; linux-kernel=40vger.kernel.org; Sangwoo=
k Shin
> <sw617.shin=40samsung.com>
> Subject: =5BPATCH v6 5/5=5D watchdog: s3c2410_wdt: exynosautov9: Enable
> supported features
>=20
> Enable supported features for ExynosAutov9 SoC.
> - QUIRK_HAS_DBGACK_BIT
> - QUIRK_HAS_32BIT_CNT
>=20
> Reviewed-by: Sam Protsenko <semen.protsenko=40linaro.org>
> Signed-off-by: Sangwook Shin <sw617.shin=40samsung.com>
> ---
Reviewed-by: Alim Akhtar <alim.akhtar=40samsung.com>

