Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C72514B06C
	for <linux-samsung-soc@vger.kernel.org>; Thu, 18 Sep 2025 03:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758166920; cv=none; b=kzfdlqQ8RUyRNvlfwOr/kjLZzLMe9fPd+SyangSI49eRtGVNvcfTIUqtK62lSIYnLljZqI4IkAcIiGhhHbhHf7Q/7Zo4WaRCxEsl17GMoBzeGOtfKoXUvKU04q9yJKp7uPEiE6b96ACuffHAwgfFo4wIA+5KynRhw/7ztWZDec4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758166920; c=relaxed/simple;
	bh=Y0IujvRvkNRRrQi1nYXL9ScFAz9W9/2gPqXwVoql+Gg=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=A8OVhzHklbri8RJWRIq/SewEQi7mULUtRiyeAoL8lWliuD7M2lrHQxWyTZ2J6b52Q/X6I03H2DxLUSgbjnkCiH7H3g1SR7cvlxQoLoFeQ9o/JZuravgqfD5XBTiz43VXpMcwcht9q4UymwTEk6lsEkROygl7rfXk9+sGQSP02/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=qA2YIUHW; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="qA2YIUHW"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250918034154epoutp02fcffb7ccda590564d51a495bbedc4ad4~mQ35cJCDd2398523985epoutp02_
	for <linux-samsung-soc@vger.kernel.org>; Thu, 18 Sep 2025 03:41:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250918034154epoutp02fcffb7ccda590564d51a495bbedc4ad4~mQ35cJCDd2398523985epoutp02_
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1758166914;
	bh=Y0IujvRvkNRRrQi1nYXL9ScFAz9W9/2gPqXwVoql+Gg=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=qA2YIUHWbfr25lMKWKtQ8K1Zjv0JgVJjYlnvdUGfivIoUm982qwRkBLKIXe/iLGge
	 +NqgWHvjyWWDHL53DKtCbbEYhkr1C0OE0kCIxu4Pc53poxizUuATgJQN8LSdXFBy3D
	 NcAqLTxScBf6IkH0n1CJPl69hvj0pkyMwVIYpuRo=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250918034153epcas5p2178818bfb332b0581f9746026ef7f45c~mQ348VSpN0288702887epcas5p23;
	Thu, 18 Sep 2025 03:41:53 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.95]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4cS1f90Vxmz2SSKg; Thu, 18 Sep
	2025 03:41:53 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250918034152epcas5p3d165b46374d5f8f95c14e7e1d3090841~mQ33o4mpy2935529355epcas5p3G;
	Thu, 18 Sep 2025 03:41:52 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250918034149epsmtip2b8fa50045b991065e8c1a0b516cb3682~mQ30-CFna2486924869epsmtip2g;
	Thu, 18 Sep 2025 03:41:49 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Sangwook Shin'" <sw617.shin@samsung.com>, <krzk@kernel.org>,
	<wim@linux-watchdog.org>, <linux@roeck-us.net>,
	<semen.protsenko@linaro.org>, <dongil01.park@samsung.com>,
	<khwan.seo@samsung.com>
Cc: <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <20250818021826.623830-3-sw617.shin@samsung.com>
Subject: RE: [PATCH v6 2/5] watchdog: s3c2410_wdt: Fix max_timeout being
 calculated larger
Date: Thu, 18 Sep 2025 09:11:47 +0530
Message-ID: <06c401dc284e$2bec2a50$83c47ef0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQMf0cCJ9LyTM0wh7cHpv36iTCHVmgFR01/4ASSqlWCx/USksA==
Content-Language: en-us
X-CMS-MailID: 20250918034152epcas5p3d165b46374d5f8f95c14e7e1d3090841
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250818022433epcas2p3fc48febfa6729645af6ebd088937c80c
References: <20250818021826.623830-1-sw617.shin@samsung.com>
	<CGME20250818022433epcas2p3fc48febfa6729645af6ebd088937c80c@epcas2p3.samsung.com>
	<20250818021826.623830-3-sw617.shin@samsung.com>

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
> Subject: =5BPATCH v6 2/5=5D watchdog: s3c2410_wdt: Fix max_timeout being
> calculated larger
>=20
> Fix the issue of max_timeout being calculated larger than actual value.
> The calculation result of freq / (S3C2410_WTCON_PRESCALE_MAX + 1) /
> S3C2410_WTCON_MAXDIV is smaller than the actual value because the
> remainder is discarded during the calculation process. This leads to a la=
rger
> calculated value for max_timeout compared to the actual settable value.
> To resolve this issue, the order of calculations in the computation proce=
ss has
> been adjusted.
>=20
> Reviewed-by: Sam Protsenko <semen.protsenko=40linaro.org>
> Signed-off-by: Sangwook Shin <sw617.shin=40samsung.com>
> ---
Reviewed-by: Alim Akhtar <alim.akhtar=40samsung.com>



