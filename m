Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B20125776
	for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Dec 2025 04:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765946796; cv=none; b=PP1U+yUwEZ5/HQGJTY4bed5FrCtOI8Iord3+2uiqqIC+xon8yE1U+SbuLDcQ8KiAT6EJ/70osG7+P6NLAKa6z8D57wNkRY+7zQYmZEiqji9Dq0qEn0m1YqhHJk4K1dB8IWgHs7AVKxXu7ONawqKjwWHm/IIsUz/BFE4gUtA44w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765946796; c=relaxed/simple;
	bh=LBOfXzRl68MR97e7fSVSglH4nrct3LY7W001vA5V0Cw=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=T+OJyqI+LdTdGMHlB9z3472ktrH0y4YrxE+sM1ijc1N4sboax5gxFmHGPLVbHOjJD0ZRbf2qbC83ntZz0tsYkLkm/+TRZi/5jRyLnaBRDjgtzljEVuDihlHJ7NMEGmUg0G/m0pA5zvUHOR8sdPxzjxFEHLVZyyEZYDEIl1TxUrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=BK4bpc5j; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="BK4bpc5j"
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20251217044626epoutp038153635ef11565f61fab9eaa3652bf9f~B5z7tWoCv1014810148epoutp03Q
	for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Dec 2025 04:46:26 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20251217044626epoutp038153635ef11565f61fab9eaa3652bf9f~B5z7tWoCv1014810148epoutp03Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1765946786;
	bh=F2JiDYg/fKnOFAo+S9SfpGr9ZWUTUAMaugsKPX8yXzo=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=BK4bpc5jD7cb14hY6vi6fzOCCxTocxtAXAm3U6K6UZV/saIuqnbzgYICzBJUK/pY0
	 XqFKVXMX6zQYjo6tYmjxjce6EsFsBmng65sEp2ivcJ8BVm2o/WMYpMsyd5GvXc5znd
	 FfIRnTTVqxpLeU/yR4786j4w8cDzVTJro8CVmrnE=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20251217044625epcas5p4e2c71527719a25c7376517ea5b03e893~B5z7N9BB80334503345epcas5p4H;
	Wed, 17 Dec 2025 04:46:25 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.94]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4dWLq453bMz2SSKZ; Wed, 17 Dec
	2025 04:46:24 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20251217044624epcas5p2cec2c5dd5d25f253367b50767de8abac~B5z5j4oFz1778917789epcas5p2C;
	Wed, 17 Dec 2025 04:46:24 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20251217044621epsmtip2010fa4cce471f309c52c14fcfbf62615~B5z3f8bZK1417614176epsmtip2L;
	Wed, 17 Dec 2025 04:46:21 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Youngmin Nam'" <youngmin.nam@samsung.com>, <krzk@kernel.org>,
	<s.nawrocki@samsung.com>, <linus.walleij@linaro.org>,
	<peter.griffin@linaro.org>, <semen.protsenko@linaro.org>,
	<ivo.ivanov.ivanov1@gmail.com>
Cc: <ryu.real@samsung.com>, <d7271.choe@samsung.com>,
	<shin.son@samsung.com>, <jaewon02.kim@samsung.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
In-Reply-To: <20251202093613.852109-4-youngmin.nam@samsung.com>
Subject: RE: [PATCH v3 3/5] pinctrl: samsung: add per-bank FLTCON offset to
 EXYNOS9_PIN_BANK_* and fix tables
Date: Wed, 17 Dec 2025 10:16:19 +0530
Message-ID: <12a601dc6f10$18b46e30$4a1d4a90$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQF3wuMlGH6lOpjjwF0q/fgc3qftgQJFQ5zzAUFeOde10mSJ8A==
Content-Language: en-us
X-CMS-MailID: 20251217044624epcas5p2cec2c5dd5d25f253367b50767de8abac
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251202093028epcas2p456b6a2bfebfc76384f706a9962266fcf
References: <20251202093613.852109-1-youngmin.nam@samsung.com>
	<CGME20251202093028epcas2p456b6a2bfebfc76384f706a9962266fcf@epcas2p4.samsung.com>
	<20251202093613.852109-4-youngmin.nam@samsung.com>

Hi Youngmin

> -----Original Message-----
> From: Youngmin Nam <youngmin.nam@samsung.com>
> Sent: Tuesday, December 2, 2025 3:06 PM
> To: krzk@kernel.org; s.nawrocki@samsung.com; alim.akhtar@samsung.com;
> linus.walleij@linaro.org; peter.griffin@linaro.org;
> semen.protsenko@linaro.org; ivo.ivanov.ivanov1@gmail.com
> Cc: ryu.real@samsung.com; d7271.choe@samsung.com;
> shin.son@samsung.com; jaewon02.kim@samsung.com; linux-arm-
> kernel@lists.infradead.org; linux-samsung-soc@vger.kernel.org; linux-
> gpio@vger.kernel.org; linux-kernel@vger.kernel.org; Youngmin Nam
> <youngmin.nam@samsung.com>
> Subject: [PATCH v3 3/5] pinctrl: samsung: add per-bank FLTCON offset to
> EXYNOS9_PIN_BANK_* and fix tables
> 
> Several Exynos9-era pin-bank tables were implicitly assuming that the
> filter control (FLTCON) registers are laid out contiguously from the
> EINT base offset. Per the TRMs this is not always true. FLTCON can live
> at a separate per-bank offset, and the current tables cause the driver
> to program the wrong FLTCON addresses for some banks.
> 
> - Extends EXYNOS9_PIN_BANK_EINTG()/EINTW() to take an explicit
>   .eint_fltcon_offset parameter.
> - Updates pin-bank tables with the correct FLTCON offsets for:
>   Exynos2200 (ALIVE/CMGP/HSI1/UFS/HSI1UFS/PERIC0/1/2/VTS),
>   Exynos7870 (ALIVE/DISPAUD/ESE/FSYS/MIF/NFC/TOP/TOUCH),
>   Exynos7885 (ALIVE/DISPAUD/FSYS/TOP),
>   Exynos850  (ALIVE/CMGP/AUD/HSI/CORE/PERI),
>   Exynos990  (ALIVE/CMGP/HSI1/HSI2/PERIC0/1/VTS),
>   Exynos9810 (ALIVE/AUD/CHUB/CMGP/FSYS0/FSYS1/PERIC0/1/VTS),
>   ExynosAuto v9 (ALIVE/AUD/FSYS0/1/2/PERIC0/1),
>   Exynos8890 (ALIVE/AUD/CCORE/ESE/FP/FSYS0/1/NFC/PERIC0/1/TOUCH),
>   Exynos8895 (ALIVE/ABOX/VTS/FSYS0/1/BUSC/PERIC0/1),
>   and FSD (FSYS/PERIC).
> 
> Notes:
> - GS101 already programs per-bank filter control registers. This change
>   aligns the Exynos9 path with that model.
> - Banks without filters (EINTN) are unaffected.
> 
> Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> Tested-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>

Tested this series on Exynosautov920 sadk

Tested-by: Alim Akhtar <alim.akhtar@samsung.com>


