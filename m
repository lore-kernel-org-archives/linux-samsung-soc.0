Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76AD143231A
	for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Jul 2026 12:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785241429; cv=none; b=qM414o4DxSUaGv9ujwdYf3KB074itmZUNSe8qJ0gy/5wkRyosjp1YY1RSdAf525xEnb2E6Q/8BRv3mONhetA6D6+jyHlcbzzIn9j8V8dRAa3HCmyZ/TAopZYsS3beHTxzj6v/aMIvw0tP4du8BAv75Z+leIJuGtKnH+iS3weBdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785241429; c=relaxed/simple;
	bh=5YAF3xtqYtecZG8s+cN0GV8oJP5s2CO79APOkQaJx2E=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=cSYMVCXWMYMWmWW0lIuE6tnnIopZiMZ3SyBLsNZtV9ZG02ZK4afDrg1JRondbPMvV2D1N0027EDdGavpGq0enB21loerjvboMe/5Ln9eeLUXgNGDVLqlNtlzDDQMVdGsfFz3M/UntjWkQyjQaqeUEXmM7XQXT9gQY8W80WU9Gls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=lrM4uw/M; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="lrM4uw/M"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20260728122344epoutp049ca5bb3c25199f9e62118e53b4b09a25~Gc53l1XE62202822028epoutp043
	for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Jul 2026 12:23:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20260728122344epoutp049ca5bb3c25199f9e62118e53b4b09a25~Gc53l1XE62202822028epoutp043
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1785241424;
	bh=u18OpmMkdiCW14g1NwN+jnaY5zYme2aVS4kqFmp8n04=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=lrM4uw/MZPKOtLHZLr/bqAcpm1/GAH3Gk273zuubUIUuS8CSxM+2wHEKJ+2Mtx+qX
	 vqN80lfmnLxJclwHM27Kh1q7PekgnqOaFs0hLcZ7RDsh6GujY2v9737sl5glpBV/8v
	 2/RD5Bk1uHVzrUm8EDoiFm6xf3Pl+YdffYJcmz/I=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20260728122343epcas5p21644d762ad9601d5d8a2e9893b80774d~Gc52ev98B2625826258epcas5p2c;
	Tue, 28 Jul 2026 12:23:43 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.93]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4h8ZPp1Gs5z3hhT7; Tue, 28 Jul
	2026 12:23:42 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20260728122341epcas5p2208334e2a1e6bfd9217cb91d356c505e~Gc507Mp3y2212822128epcas5p2r;
	Tue, 28 Jul 2026 12:23:41 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20260728122338epsmtip2b0f2f4703e943b619c9d5c67dae1e357~Gc5ye5xAg2311323113epsmtip22;
	Tue, 28 Jul 2026 12:23:38 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, "'raghav.s'"
	<raghav.s@samsung.com>, <s.nawrocki@samsung.com>, <cw00.choi@samsung.com>,
	<peter.griffin@linaro.org>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<bmasney@redhat.com>, <robh@kernel.org>, <conor+dt@kernel.org>
Cc: <linux-samsung-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <hajun.sung@samsung.com>,
	<is.gandhi@samsung.com>, <ts.amit@samsung.com>, <pokala.reddy@samsung.com>
In-Reply-To: <8582d4f9-1a78-4f47-bab9-c52393dffbd1@kernel.org>
Subject: RE: [PATCH 04/13] arm64: dts: exynos8855: add cmu_top & cmu_peric
 clock DT nodes
Date: Tue, 28 Jul 2026 17:53:37 +0530
Message-ID: <079201dd1e8b$eca22680$c5e67380$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIRARWKMB8/axP+0I5R2y9G0OYjygMlHcTpAvLC774CITPxw7XZSnaQ
Content-Language: en-us
X-CMS-MailID: 20260728122341epcas5p2208334e2a1e6bfd9217cb91d356c505e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260728115256epcas5p38cbcfe68218d08301d237705388e6e62
References: <20260728121111.2077860-1-raghav.s@samsung.com>
	<CGME20260728115256epcas5p38cbcfe68218d08301d237705388e6e62@epcas5p3.samsung.com>
	<20260728121111.2077860-5-raghav.s@samsung.com>
	<8582d4f9-1a78-4f47-bab9-c52393dffbd1@kernel.org>

Hi Krzysztof,

> -----Original Message-----
> From: Krzysztof Kozlowski <krzk=40kernel.org>
> Sent: Tuesday, July 28, 2026 5:30 PM
> To: raghav.s <raghav.s=40samsung.com>; s.nawrocki=40samsung.com;
> cw00.choi=40samsung.com; peter.griffin=40linaro.org;
> alim.akhtar=40samsung.com; mturquette=40baylibre.com; sboyd=40kernel.org;
> bmasney=40redhat.com; robh=40kernel.org; conor+dt=40kernel.org
> Cc: linux-samsung-soc=40vger.kernel.org; linux-clk=40vger.kernel.org;
> devicetree=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org; lin=
ux-
> kernel=40vger.kernel.org; hajun.sung=40samsung.com;
> is.gandhi=40samsung.com; ts.amit=40samsung.com;
> pokala.reddy=40samsung.com
> Subject: Re: =5BPATCH 04/13=5D arm64: dts: exynos8855: add cmu_top &
> cmu_peric clock DT nodes
>=20
> On 28/07/2026 14:11, raghav.s wrote:
> > Add required dt node for cmu_top & cmu_peric block
> >
> > Signed-off-by: raghav.s <raghav.s=40samsung.com>
> > ---
> >  arch/arm64/boot/dts/exynos/exynos8855.dtsi =7C 24
> > ++++++++++++++++++++++
> >  1 file changed, 24 insertions(+)
>=20
> Please organize your patches in reasonable order. DTS is never in the mid=
dle,
> see submitting patches (both documents) and maintainer-soc profile.
>=20
The thought was to add clks block wise and hence we see DTS coming in betwe=
en but for the other blocks.=20
e.g. patch-2 and 3 adds binding and driver for TOP and PERIC and this patch=
-4 adds DTS.=20
And patch-5 and 6 adds binding and driver for PERIS and patch-7 adds DTS an=
d so on.

Cover-letter should have explained this.=20

Are you suggesting to re-order all the binding first followed by all blocks=
 driver and then add a single DTS for all clock controller?=20

Does current approach helps in review?=20

> Best regards,
> Krzysztof

