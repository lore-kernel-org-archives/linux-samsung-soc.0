Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF77C2727E5
	for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Nov 2025 08:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763109032; cv=none; b=XlYMGkNYUhNCvmNsNp4Xtn1vG6DN4E87D+7m0xC7lILPwHuoYN4c9zcBQRY/GHhl0Vbk16ZZW00jYobd4a5XNLa7hW41eYvLip8KlFNrB/rYXSD4VsdrwtlebAqw01JKe5k1Zt/lu5e1v+S7LXfKc1uwH9D+uE6SJUpX2IABeVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763109032; c=relaxed/simple;
	bh=pDRzcTiVhh+S8uzs9dsZ1gW4Ty7MEmxFv3VPjMCdUCg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=blJ64GRg2y3xQPjRGNUjpSFOjSAj135297AvYMMO4LD578RepyYqRA31QGIpfEAXx7Jh9TBkvfTkF8vZlM8KpeAGtfLoPyRovjaZYJSfQP2QHoNJKxrbXLYcoqofb/z08zeOROCyj53cZc3qba4UOaFw6qtKwJYRre6vJrWbxPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=PAD4hy62; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="PAD4hy62"
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20251114083027epoutp01b0a75ba70f717eabc6ccbefb026f4179~30lHFDjlj2281222812epoutp01R
	for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Nov 2025 08:30:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20251114083027epoutp01b0a75ba70f717eabc6ccbefb026f4179~30lHFDjlj2281222812epoutp01R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1763109027;
	bh=I9pvcD/YJ0XiTAnF8DiPikfg8bjgfz67gTnQlpoSkUI=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=PAD4hy62ZADevl9e0bRG0AwHcGDec96kyeEWhUMZ68wljAWnETq4ZgWC327QtI20P
	 WIF5OyxCLclF8yBlUb/jvttRiR8UdfVr1qgiCjsQBW7rhR7mvWBTRLCZsD7lMqyGgh
	 ISa+cQPmeOta/vhMtcZHaXr0OPlV0ykqrJKUVQLQ=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPS id
	20251114083027epcas2p182ff34cae6b1f987dcdd8ef03a478fb2~30lGYu-h32496524965epcas2p1i;
	Fri, 14 Nov 2025 08:30:27 +0000 (GMT)
Received: from epcas2p1.samsung.com (unknown [182.195.38.209]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4d79Lp50Vpz2SSKg; Fri, 14 Nov
	2025 08:30:26 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20251114083026epcas2p44329381dca32185522674806eee7f97c~30lFinLh62507925079epcas2p4b;
	Fri, 14 Nov 2025 08:30:26 +0000 (GMT)
Received: from [12.36.160.98] (unknown [12.36.160.98]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20251114083026epsmtip278051f24b4887a647696fcb492f01cd1~30lFe_9Qd2902229022epsmtip26;
	Fri, 14 Nov 2025 08:30:26 +0000 (GMT)
Message-ID: <7f1fc293-0db6-4387-9f4b-e05110203c82@samsung.com>
Date: Fri, 14 Nov 2025 17:31:41 +0900
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFT PATCH v1 5/5] pinctrl: samsung: rename gs101_pinctrl_* to
 exynos9_pinctrl_*
To: Sam Protsenko <semen.protsenko@linaro.org>
Cc: krzk@kernel.org, s.nawrocki@samsung.com, alim.akhtar@samsung.com,
	linus.walleij@linaro.org, peter.griffin@linaro.org, ryu.real@samsung.com,
	d7271.choe@samsung.com, linux-samsung-soc@vger.kernel.org
Content-Language: en-US
From: Youngmin Nam <youngmin.nam@samsung.com>
In-Reply-To: <CAPLW+4m3=-957mqPC_Gb=2MjHCsQf7sSiBY-k-S=B14yq5bggA@mail.gmail.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251114083026epcas2p44329381dca32185522674806eee7f97c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251110082145epcas2p1e56790e7aa72d7d3bcad4cc1faae07ef
References: <CGME20251110082145epcas2p1e56790e7aa72d7d3bcad4cc1faae07ef@epcas2p1.samsung.com>
	<20251110082649.3109858-1-youngmin.nam@samsung.com>
	<20251110082649.3109858-6-youngmin.nam@samsung.com>
	<CAPLW+4m3=-957mqPC_Gb=2MjHCsQf7sSiBY-k-S=B14yq5bggA@mail.gmail.com>

On 11/13/25 11:35, Sam Protsenko wrote:
> On Mon, Nov 10, 2025 at 2:21 AM Youngmin Nam <youngmin.nam@samsung.com> wrote:
>>
>> The suspend/resume helpers named gs101_pinctrl_{suspend,resume} are not
>> GS101-specific. They implement the generic save/restore sequence used by
>> Exynos9-style controllers that have EINT filter configuration (eint_fltcon)
>> to preserve.
>>
>> Rename them to exynos9_pinctrl_{suspend,resume} and update all users:
>>   - exynos2200, exynos9810, exynos8895, exynos7885, exynos7870,
>>     exynosautov9, fsd, and gs101 controller tables
> 
> Not strictly related to this patch, but I wonder if we should also
> enable suspend/resume operations for exynos850_pin_ctrl[] later.
> 
There should be no problems enabling these operations on Exynos850.


>>   - prototypes in pinctrl-exynos.h
>>   - definitions in pinctrl-exynos.c
>>
>> This aligns naming with the earlier macro/doc cleanups (e.g. using
>> EXYNOS9_PIN_BANK_* and describing eint_fltcon as Exynos9-specific) and
>> makes the helpers clearly reusable by other Exynos9-like SoCs.
>>
>> Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
> 
> It looks to me as this patch actually fixes handling pinctrl during
> suspend/resume for some chips. If it's the case, suggest adding
> "Fixes:" tag here.
> 
>> ---
> 
> LGTM:
> 
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> 
> (Not sure how to test it on my E850-96, as suspend/resume is not
> enabled there yet, and this patch doesn't really affect Exynos850
> anyway; so only R-b tag for this one.)
> 
Thank you.
