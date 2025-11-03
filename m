Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2842E7F0B
	for <linux-samsung-soc@vger.kernel.org>; Mon,  3 Nov 2025 08:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762160341; cv=none; b=slqVA66nzuLgTYR0ZwgmkInBvQ2zHXwKPeXVLk7l0zYkD6/KKymkOLQo8sHDJyIV1L1GW+YjdlYIl+Aed6sx3P51TNJbLU58rrkToQZnto5KhtvsG52+lPeoKKVgdObhM7W2Qjk9bmOd2l+8odLyvR0HU6+X4G6GsUoS5U9bFYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762160341; c=relaxed/simple;
	bh=GVk69UBEns6Ie0+2RlqPFg6p8JcoK9Chuxd6pApBJ1U=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type:
	 References; b=tG2LaXLo05jVhOyVVKMK2NLM+VyeiS/ItSz4jLp4EAgVNlF/qH4uQBS1LBKoo/dpoJdosdqsGgMT4mJbRrZ7U/hbT+Pvi72Y0TgIdYo8TKk3H6+G3QcMUFS0WcOUoWdaq7lgHHVusqf6JksRPXiqjWrkGwqtQJD4hVhQ2Fz5q1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=rvZkkq4s; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="rvZkkq4s"
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20251103085851epoutp02938a1153a23f7de1d4eba54f24f8883b~0c3wfAzTB1931919319epoutp02a
	for <linux-samsung-soc@vger.kernel.org>; Mon,  3 Nov 2025 08:58:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20251103085851epoutp02938a1153a23f7de1d4eba54f24f8883b~0c3wfAzTB1931919319epoutp02a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1762160331;
	bh=6fMD/AjwIISKuN8oFMxJTN08Tu9bmpimCJrNB1XLa5w=;
	h=Date:To:Cc:From:Subject:References:From;
	b=rvZkkq4sP3gD3ndRljSxuFPwQ+0sIddsyR/riRrb6x7FYBEZ8SkW8bILVZwUcCris
	 SlxLr6Y/P2m3b+BuxzBvY+/l9uUgPcXg8BRQPQHa6bKThjbOflVtpDyUPebsxynJY3
	 ZxdSF0j4/pZ1Aq3dG8/ODtHYI34I8sXuUpAKIWYs=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPS id
	20251103085850epcas2p16cf9e91b08f51d2ed7a86c86f1f6614c~0c3v8hBfl0547205472epcas2p1B;
	Mon,  3 Nov 2025 08:58:50 +0000 (GMT)
Received: from epcas2p4.samsung.com (unknown [182.195.38.204]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4d0QVf1Zfpz3hhTC; Mon,  3 Nov
	2025 08:58:50 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20251103085849epcas2p25cfc49959513dadc59aeaf166aba236f~0c3u8M3_G2953729537epcas2p23;
	Mon,  3 Nov 2025 08:58:49 +0000 (GMT)
Received: from [12.36.160.98] (unknown [12.36.160.98]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20251103085849epsmtip1fddcc0463f2e11525e730035a11f688d~0c3u3gGOu0266402664epsmtip1V;
	Mon,  3 Nov 2025 08:58:49 +0000 (GMT)
Message-ID: <b467a9dc-3953-48a8-88ed-c8a3361006c8@samsung.com>
Date: Mon, 3 Nov 2025 17:59:46 +0900
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: krzysztof.kozlowski@linaro.org, krzk@kernel.org,
	peter.griffin@linaro.org, alim.akhtar@samsung.com, Sam Protsenko
	<semen.protsenko@linaro.org>, youngmin.nam@samsung.com, ryu.real@samsung.com
Cc: linux-samsung-soc@vger.kernel.org
From: Youngmin Nam <youngmin.nam@samsung.com>
Subject: [RFC] pinctrl: samsung: Consolidate Exynos pinctrl macros (incl.
 GS101)
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251103085849epcas2p25cfc49959513dadc59aeaf166aba236f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251103085849epcas2p25cfc49959513dadc59aeaf166aba236f
References: <CGME20251103085849epcas2p25cfc49959513dadc59aeaf166aba236f@epcas2p2.samsung.com>

Hi Krzysztof and folks,


While looking at the current Exynos pinctrl macros, I think we can refactor and consolidate them.

Today, several macros are used across Exynos2200, Exynos7870, Exynos7885, Exynos850, Exynos990, Exynos9810, Exynos8895, exynosautov9, and Tesla FSD:

* EXYNOS7870_PIN_BANK_

* EXYNOS850_PIN_BANK_

* EXYNOS8895_PIN_BANK_

* GS101_PIN_BANK_

I propose introducing a new EXYNOS9_PIN_BANK_ macro to unify these into a single style. 
The GS101_PIN_BANK_ style seems appropriate for modern Exynos platforms, so the new macro would follow that approach.

The only functional difference between GS101_PIN_BANK_ and the existing macros is the presence/absence of the filter-control register offset. 
If we add this offset as a parameter to the unified macro, we can integrate all variants under one definition. 
I’ve checked the SoC user manuals listed above to confirm the filter-control offsets.

Planned patch series:

1. Introduce EXYNOS9_PIN_BANK_ and replace the macros above. Rename the exynos850_bank_type_ data structure to exynos9_ for general naming.

2. Fix any incorrect declarations in existing platforms (if any).

3. Add the filter-control register offset to all platforms mentioned above.

4. Replace GS101_PIN_BANK_ with EXYNOS9_PIN_BANK_.

5. Rename gs101_pinctrl_{suspend,resume} to exynos9_pinctrl_{suspend,resume} and use this on modern Exynos platforms, including GS101.


I believe this will make the Exynos pinctrl driver cleaner and more consistent.
Comments and suggestions would be appreciated.

Thanks,
Youngmin
