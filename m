Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE3E23C4E0
	for <linux-samsung-soc@vger.kernel.org>; Thu, 18 Sep 2025 03:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758167861; cv=none; b=CJEI93EMYy6f6fd4aFu1Y3IiKIB+RpWYTorr4GLiqNZWXAv/YuUY/8s2IDbG/O2tx+Hol0DWntTajbTIYH5qwkg4Hz412ineirPLSDujzRQqZwztJ+ZLGCmTf5CxpZCRtQv7MprR5hdfyPpyC3h4ASmyTyg3uCheGGBO3Sq4VAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758167861; c=relaxed/simple;
	bh=i8Edn55nxOCIaa5niYXYX/DJyG/lkCcCzwegzlb6vR0=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=U3OeK4UxcJAhsTrIr0d8Fsg5cKRZjHg4Fjr2OS7r39E/GA/XDfOnfVlJ9p/AUhCtCm5uxr90EJHAUgx+VDNbEOxxykA6JCHmJMZOjp4iRPZEP7AyH11KVwJvEe2xE2iX5c6fAxqn7XeOZhnr3zeZ7WtK3ifnneHL9N/sHLXY6sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=vIM4io04; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="vIM4io04"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250918035736epoutp02c7443384702e6b32b427bf65d2983a0d~mRFmlEi3i0600106001epoutp025
	for <linux-samsung-soc@vger.kernel.org>; Thu, 18 Sep 2025 03:57:36 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250918035736epoutp02c7443384702e6b32b427bf65d2983a0d~mRFmlEi3i0600106001epoutp025
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1758167856;
	bh=i8Edn55nxOCIaa5niYXYX/DJyG/lkCcCzwegzlb6vR0=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=vIM4io042qiS1VxZYJO5P8rIaKDn9L5RLy9ABqzW7hFt+YhAOUgdzhnvzYOWoy20t
	 d8pC2Nbdu3paBi9jfAeBDi+q+58VL82WhxFvXH/CZPHuYimZ2JL8Cd9lSqvmZky8tS
	 LrvBiDJdtgKcpKy9yKFwZI0kWYHse4Ve/9Ll5gYQ=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250918035735epcas5p359effac4573f80c385f34c8c8af7d744~mRFmKc6vW1282212822epcas5p3T;
	Thu, 18 Sep 2025 03:57:35 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.92]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4cS20G6L6wz2SSKh; Thu, 18 Sep
	2025 03:57:34 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250918035734epcas5p21939d1d9ee21776be24f0b4c2ad16706~mRFkwGRrd1421714217epcas5p2h;
	Thu, 18 Sep 2025 03:57:34 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250918035729epsmtip1295610fe0f8feed24b94091dfc046bf7~mRFgXzEB50435304353epsmtip1Y;
	Thu, 18 Sep 2025 03:57:29 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Sangwook Shin'" <sw617.shin@samsung.com>, <krzk@kernel.org>,
	<wim@linux-watchdog.org>, <linux@roeck-us.net>,
	<semen.protsenko@linaro.org>, <dongil01.park@samsung.com>,
	<khwan.seo@samsung.com>
Cc: <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <20250818021826.623830-5-sw617.shin@samsung.com>
Subject: RE: [PATCH v6 4/5] watchdog: s3c2410_wdt: exynosautov920: Enable
 QUIRK_HAS_32BIT_CNT
Date: Thu, 18 Sep 2025 09:27:24 +0530
Message-ID: <06c601dc2850$5d468670$17d39350$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQMf0cCJ9LyTM0wh7cHpv36iTCHVmgJ1QaGFAgkrzD2x7QmjoA==
Content-Language: en-us
X-CMS-MailID: 20250918035734epcas5p21939d1d9ee21776be24f0b4c2ad16706
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250818022433epcas2p4fec1cccd280fc73dccc5b00e2236f836
References: <20250818021826.623830-1-sw617.shin@samsung.com>
	<CGME20250818022433epcas2p4fec1cccd280fc73dccc5b00e2236f836@epcas2p4.samsung.com>
	<20250818021826.623830-5-sw617.shin@samsung.com>

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
> Subject: =5BPATCH v6 4/5=5D watchdog: s3c2410_wdt: exynosautov920: Enable
> QUIRK_HAS_32BIT_CNT
>=20
> Enable QUIRK_HAS_32BIT_CNT to ExynosAutov920 SoC which has 32-bit
> WTCNT.
>=20
> Reviewed-by: Sam Protsenko <semen.protsenko=40linaro.org>
> Signed-off-by: Sangwook Shin <sw617.shin=40samsung.com>
> ---
Reviewed-by: Alim Akhtar <alim.akhtar=40samsung.com>

